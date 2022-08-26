Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A95BECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 17:35:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.39834.1661535352803858014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 10:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70EE223A;
	Fri, 26 Aug 2022 10:35:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D531E3F93E;
	Fri, 26 Aug 2022 10:35:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH] cve-check: close cursors as soon as possible
Date: Fri, 26 Aug 2022 18:35:47 +0100
Message-Id: <20220826173547.1096882-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 17:35:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169925

We can have multiple processes reading the database at the same time, and
cursors only release their locks when they're garbage collected.

This might be the cause of random sqlite errors on the autobuilder, so
explicitly close the cursors when we're done with them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass                | 13 +++--
 .../recipes-core/meta/cve-update-db-native.bb | 51 ++++++++++---------
 2 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index d95465775d2..980933adc43 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -296,7 +296,8 @@ def check_cves(d, patched_cves):
             vendor =3D "%"
=20
         # Find all relevant CVE IDs.
-        for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHE=
RE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
+        cve_cursor =3D conn.execute("SELECT DISTINCT ID FROM PRODUCTS WH=
ERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor))
+        for cverow in cve_cursor:
             cve =3D cverow[0]
=20
             if cve in cve_ignore:
@@ -315,7 +316,8 @@ def check_cves(d, patched_cves):
             vulnerable =3D False
             ignored =3D False
=20
-            for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS =
? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
+            product_cursor =3D conn.execute("SELECT * FROM PRODUCTS WHER=
E ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
+            for row in product_cursor:
                 (_, _, _, version_start, operator_start, version_end, op=
erator_end) =3D row
                 #bb.debug(2, "Evaluating row " + str(row))
                 if cve in cve_ignore:
@@ -359,10 +361,12 @@ def check_cves(d, patched_cves):
                         bb.note("%s-%s is vulnerable to %s" % (pn, real_=
pv, cve))
                         cves_unpatched.append(cve)
                     break
+            product_cursor.close()
=20
             if not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, =
cve))
                 patched_cves.add(cve)
+        cve_cursor.close()
=20
         if not cves_in_product:
             bb.note("No CVE records found for product %s, pn %s" % (prod=
uct, pn))
@@ -387,14 +391,15 @@ def get_cve_info(d, cves):
     conn =3D sqlite3.connect(db_file, uri=3DTrue)
=20
     for cve in cves:
-        for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
)):
+        cursor =3D conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
))
+        for row in cursor:
             cve_data[row[0]] =3D {}
             cve_data[row[0]]["summary"] =3D row[1]
             cve_data[row[0]]["scorev2"] =3D row[2]
             cve_data[row[0]]["scorev3"] =3D row[3]
             cve_data[row[0]]["modified"] =3D row[4]
             cve_data[row[0]]["vector"] =3D row[5]
-
+        cursor.close()
     conn.close()
     return cve_data
=20
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 18af89b53e0..944243fce97 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -66,9 +66,7 @@ python do_fetch() {
=20
     # Connect to database
     conn =3D sqlite3.connect(db_file)
-    c =3D conn.cursor()
-
-    initialize_db(c)
+    initialize_db(conn)
=20
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years =3D date.today().year + 1 - YEAR_START
@@ -98,19 +96,21 @@ python do_fetch() {
                     return
=20
             # Compare with current db last modified date
-            c.execute("select DATE from META where YEAR =3D ?", (year,))
-            meta =3D c.fetchone()
+            cursor =3D conn.execute("select DATE from META where YEAR =3D=
 ?", (year,))
+            meta =3D cursor.fetchone()
+            cursor.close()
+
             if not meta or meta[0] !=3D last_modified:
                 bb.debug(2, "Updating entries")
                 # Clear products table entries corresponding to current =
year
-                c.execute("delete from PRODUCTS where ID like ?", ('CVE-=
%d%%' % year,))
+                conn.execute("delete from PRODUCTS where ID like ?", ('C=
VE-%d%%' % year,)).close()
=20
                 # Update db with current year json file
                 try:
                     response =3D urllib.request.urlopen(json_url)
                     if response:
-                        update_db(c, gzip.decompress(response.read()).de=
code('utf-8'))
-                    c.execute("insert or replace into META values (?, ?)=
", [year, last_modified])
+                        update_db(conn, gzip.decompress(response.read())=
.decode('utf-8'))
+                    conn.execute("insert or replace into META values (?,=
 ?)", [year, last_modified]).close()
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data =
is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" =
% e.reason)
@@ -129,21 +129,26 @@ do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}=
"
 do_fetch[file-checksums] =3D ""
 do_fetch[vardeps] =3D ""
=20
-def initialize_db(c):
-    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DAT=
E TEXT)")
+def initialize_db(conn):
+    with conn:
+        c =3D conn.cursor()
+
+        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
=20
-    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY T=
EXT, \
-        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
+            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
+            VERSION_END TEXT, OPERATOR_END TEXT)")
+        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS=
(ID);")
=20
-    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TE=
XT, \
-        VERSION_END TEXT, OPERATOR_END TEXT)")
-    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID)=
;")
+        c.close()
=20
-def parse_node_and_insert(c, node, cveId):
+def parse_node_and_insert(conn, node, cveId):
     # Parse children node if needed
     for child in node.get('children', ()):
-        parse_node_and_insert(c, child, cveId)
+        parse_node_and_insert(conn, child, cveId)
=20
     def cpe_generator():
         for cpe in node.get('cpe_match', ()):
@@ -200,9 +205,9 @@ def parse_node_and_insert(c, node, cveId):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
=20
-    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", c=
pe_generator())
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
, cpe_generator()).close()
=20
-def update_db(c, jsondata):
+def update_db(conn, jsondata):
     import json
     root =3D json.loads(jsondata)
=20
@@ -226,12 +231,12 @@ def update_db(c, jsondata):
             accessVector =3D accessVector or "UNKNOWN"
             cvssv3 =3D 0.0
=20
-        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)"=
,
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, =
?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).cl=
ose()
=20
         configurations =3D elt['configurations']['nodes']
         for config in configurations:
-            parse_node_and_insert(c, config, cveId)
+            parse_node_and_insert(conn, config, cveId)
=20
=20
 do_fetch[nostamp] =3D "1"
--=20
2.34.1


