Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC35C001DE
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 12:33:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40881.1687523577082449766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 05:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBCB61042;
	Fri, 23 Jun 2023 05:33:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78E9E3F59C;
	Fri, 23 Jun 2023 05:32:55 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com
Subject: [PATCH 1/4] cve-update-db-native: remove
Date: Fri, 23 Jun 2023 13:32:47 +0100
Message-Id: <20230623123250.726731-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 12:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183327

From: Ross Burton <ross.burton@arm.com>

The replacement cve-update-nvd2-native is working, so we can remove the
old recipe now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb | 288 ------------------
 3 files changed, 1 insertion(+), 290 deletions(-)
 delete mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9bb5c5205c2..e27295a7cf5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -127,7 +127,6 @@ RECIPE_MAINTAINER:pn-cryptodev-module =3D "Robert Yan=
g <liezhi.yang@windriver.com>
 RECIPE_MAINTAINER:pn-cryptodev-tests =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-cups =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl =3D "Robert Joslyn <robert.joslyn@redrectangle=
.org>"
-RECIPE_MAINTAINER:pn-cve-update-db-native =3D "Ross Burton <ross.burton@=
arm.com>"
 RECIPE_MAINTAINER:pn-cve-update-nvd2-native =3D "Ross Burton <ross.burto=
n@arm.com>"
 RECIPE_MAINTAINER:pn-cwautomacros =3D "Ross Burton <ross.burton@arm.com>=
"
 RECIPE_MAINTAINER:pn-db =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/s=
elftest/cases/distrodata.py
index c83a3a7bd67..111bd3c9beb 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -92,7 +92,7 @@ The following recipes do not have a DESCRIPTION. Please=
 add an entry for DESCRIP
=20
         def is_maintainer_exception(entry):
             exceptions =3D ["musl", "newlib", "linux-yocto", "linux-dumm=
y", "mesa-gl", "libgfortran", "libx11-compose-data",
-                          "cve-update-db-native","cve-update-nvd2-native=
",]
+                          "cve-update-nvd2-native",]
             for i in exceptions:
                  if i in entry:
                      return True
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
deleted file mode 100644
index 079f062f79b..00000000000
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ /dev/null
@@ -1,288 +0,0 @@
-SUMMARY =3D "Updates the NVD CVE database"
-LICENSE =3D "MIT"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit native
-
-deltask do_unpack
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-
-NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
-# CVE database update interval, in seconds. By default: once a day (24*6=
0*60).
-# Use 0 to force the update
-# Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?=3D "86400"
-
-# Timeout for blocking socket operations, such as the connection attempt=
.
-CVE_SOCKET_TIMEOUT ?=3D "60"
-
-CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
-
-python () {
-    if not bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is n=
ot loaded.")
-}
-
-python do_fetch() {
-    """
-    Update NVD database with json data feed
-    """
-    import bb.utils
-    import bb.progress
-    import shutil
-
-    bb.utils.export_proxies(d)
-
-    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
-    db_dir =3D os.path.dirname(db_file)
-    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
-
-    cleanup_db_download(db_file, db_tmp_file)
-
-    # The NVD database changes once a day, so no need to update more fre=
quently
-    # Allow the user to force-update
-    try:
-        import time
-        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if update_interval < 0:
-            bb.note("CVE database update skipped")
-            return
-        if time.time() - os.path.getmtime(db_file) < update_interval:
-            bb.debug(2, "Recently updated, skipping")
-            return
-
-    except OSError:
-        pass
-
-    bb.utils.mkdirhier(db_dir)
-    if os.path.exists(db_file):
-        shutil.copy2(db_file, db_tmp_file)
-
-    if update_db_file(db_tmp_file, d) =3D=3D True:
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
-    else:
-        # Update failed, do not modify the database
-        bb.note("CVE database update failed")
-        os.remove(db_tmp_file)
-}
-
-do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
-do_fetch[file-checksums] =3D ""
-do_fetch[vardeps] =3D ""
-
-def cleanup_db_download(db_file, db_tmp_file):
-    """
-    Cleanup the download space from possible failed downloads
-    """
-
-    # Clean up the updates done on the main file
-    # Remove it only if a journal file exists - it means a complete re-d=
ownload
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interr=
upted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
-
-    # Clean-up the temporary file downloads, we can remove both journal
-    # and the temporary database
-    if os.path.exists("{0}-journal".format(db_tmp_file)):
-        # If a journal is present the last update might have been interr=
upted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_tmp_file))
-
-    if os.path.exists(db_tmp_file):
-        os.remove(db_tmp_file)
-
-def update_db_file(db_tmp_file, d):
-    """
-    Update the given database file
-    """
-    import bb.utils, bb.progress
-    from datetime import date
-    import urllib, gzip, sqlite3
-
-    YEAR_START =3D 2002
-    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
-
-    # Connect to database
-    conn =3D sqlite3.connect(db_tmp_file)
-    initialize_db(conn)
-
-    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
-        total_years =3D date.today().year + 1 - YEAR_START
-        for i, year in enumerate(range(YEAR_START, date.today().year + 1=
)):
-            bb.debug(2, "Updating %d" % year)
-            ph.update((float(i + 1) / total_years) * 100)
-            year_url =3D (d.getVar('NVDCVE_URL')) + str(year)
-            meta_url =3D year_url + ".meta"
-            json_url =3D year_url + ".json.gz"
-
-            # Retrieve meta last modified date
-            try:
-                response =3D urllib.request.urlopen(meta_url, timeout=3D=
cve_socket_timeout)
-            except urllib.error.URLError as e:
-                cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE data.\n\n')
-                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-                return False
-
-            if response:
-                for l in response.read().decode("utf-8").splitlines():
-                    key, value =3D l.split(":", 1)
-                    if key =3D=3D "lastModifiedDate":
-                        last_modified =3D value
-                        break
-                else:
-                    bb.warn("Cannot parse CVE metadata, update failed")
-                    return False
-
-            # Compare with current db last modified date
-            cursor =3D conn.execute("select DATE from META where YEAR =3D=
 ?", (year,))
-            meta =3D cursor.fetchone()
-            cursor.close()
-
-            if not meta or meta[0] !=3D last_modified:
-                bb.debug(2, "Updating entries")
-                # Clear products table entries corresponding to current =
year
-                conn.execute("delete from PRODUCTS where ID like ?", ('C=
VE-%d%%' % year,)).close()
-
-                # Update db with current year json file
-                try:
-                    response =3D urllib.request.urlopen(json_url, timeou=
t=3Dcve_socket_timeout)
-                    if response:
-                        update_db(conn, gzip.decompress(response.read())=
.decode('utf-8'))
-                    conn.execute("insert or replace into META values (?,=
 ?)", [year, last_modified]).close()
-                except urllib.error.URLError as e:
-                    cve_f.write('Warning: CVE db update error, CVE data =
is outdated.\n\n')
-                    bb.warn("Cannot parse CVE data (%s), update failed" =
% e.reason)
-                    return False
-            else:
-                bb.debug(2, "Already up to date (last modified %s)" % la=
st_modified)
-            # Update success, set the date to cve_check file.
-            if year =3D=3D date.today().year:
-                cve_f.write('CVE database update : %s\n\n' % date.today(=
))
-
-        conn.commit()
-        conn.close()
-        return True
-
-def initialize_db(conn):
-    with conn:
-        c =3D conn.cursor()
-
-        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
-        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS=
(ID);")
-
-        c.close()
-
-def parse_node_and_insert(conn, node, cveId):
-    # Parse children node if needed
-    for child in node.get('children', ()):
-        parse_node_and_insert(conn, child, cveId)
-
-    def cpe_generator():
-        for cpe in node.get('cpe_match', ()):
-            if not cpe['vulnerable']:
-                return
-            cpe23 =3D cpe.get('cpe23Uri')
-            if not cpe23:
-                return
-            cpe23 =3D cpe23.split(':')
-            if len(cpe23) < 6:
-                return
-            vendor =3D cpe23[3]
-            product =3D cpe23[4]
-            version =3D cpe23[5]
-
-            if cpe23[6] =3D=3D '*' or cpe23[6] =3D=3D '-':
-                version_suffix =3D ""
-            else:
-                version_suffix =3D "_" + cpe23[6]
-
-            if version !=3D '*' and version !=3D '-':
-                # Version is defined, this is a '=3D' match
-                yield [cveId, vendor, product, version + version_suffix,=
 '=3D', '', '']
-            elif version =3D=3D '-':
-                # no version information is available
-                yield [cveId, vendor, product, version, '', '', '']
-            else:
-                # Parse start version, end version and operators
-                op_start =3D ''
-                op_end =3D ''
-                v_start =3D ''
-                v_end =3D ''
-
-                if 'versionStartIncluding' in cpe:
-                    op_start =3D '>=3D'
-                    v_start =3D cpe['versionStartIncluding']
-
-                if 'versionStartExcluding' in cpe:
-                    op_start =3D '>'
-                    v_start =3D cpe['versionStartExcluding']
-
-                if 'versionEndIncluding' in cpe:
-                    op_end =3D '<=3D'
-                    v_end =3D cpe['versionEndIncluding']
-
-                if 'versionEndExcluding' in cpe:
-                    op_end =3D '<'
-                    v_end =3D cpe['versionEndExcluding']
-
-                if op_start or op_end or v_start or v_end:
-                    yield [cveId, vendor, product, v_start, op_start, v_=
end, op_end]
-                else:
-                    # This is no version information, expressed differen=
tly.
-                    # Save processing by representing as -.
-                    yield [cveId, vendor, product, '-', '', '', '']
-
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
, cpe_generator()).close()
-
-def update_db(conn, jsondata):
-    import json
-    root =3D json.loads(jsondata)
-
-    for elt in root['CVE_Items']:
-        if not elt['impact']:
-            continue
-
-        accessVector =3D None
-        cveId =3D elt['cve']['CVE_data_meta']['ID']
-        cveDesc =3D elt['cve']['description']['description_data'][0]['va=
lue']
-        date =3D elt['lastModifiedDate']
-        try:
-            accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['ac=
cessVector']
-            cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScor=
e']
-        except KeyError:
-            cvssv2 =3D 0.0
-        try:
-            accessVector =3D accessVector or elt['impact']['baseMetricV3=
']['cvssV3']['attackVector']
-            cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScor=
e']
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv3 =3D 0.0
-
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, =
?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).cl=
ose()
-
-        configurations =3D elt['configurations']['nodes']
-        for config in configurations:
-            parse_node_and_insert(conn, config, cveId)
-
-
-do_fetch[nostamp] =3D "1"
-
-EXCLUDE_FROM_WORLD =3D "1"
--=20
2.34.1


