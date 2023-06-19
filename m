Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51007EB64D8
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.28.1687143357984722180
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=N89B6Ket;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5533c545786so1813125a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143357; x=1689735357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRpa0l8fAJ0/Vlva52VUGXuiXm0YySILavdT41b973M=;
        b=N89B6KetIQbDoT+NnY7fgq7+U5ke1F+RVJlz8rpZANpmKwatkZUa2ArmLalU53HP7P
         IJ2NyB1QfY2QS9otXwtkXaWk7ZHDFcU5ZLbA2HjGQpyoZpkObUaoA7EqvUSshgioA1zK
         GXsyOJrWyIPD/gyEBHiwkA1pvaz4RmxUBel2B75paWfMFo6m8Ud62eMA+c8xESzboGSK
         hg8CAj5+ljzoAJRoTxn8RY0X0NDJI+ZPpt9ky5iwFEbh1lqju5dLe9DGu9kLrVASqH7v
         xAZTKJHdi3ejN3q5T0qkxo5dnclfG2QE1iZt4jiyyHOylL5zXStihRUnKir2Sqmj8X8L
         0mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143357; x=1689735357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRpa0l8fAJ0/Vlva52VUGXuiXm0YySILavdT41b973M=;
        b=Q6sfvglzhog9Q1B6vRof+VWfHf58i2PB4IefD0qj/sZLB/kcAtQHetq+DqAd/DtfcF
         LLKveuf7Uf7t6zX5Zks9n8YiYNZjMkktXRerN53VkNOqIypPbQ610tiOPnYgfvhCExD+
         RGjz2ykN+KK39gX1DPou8lMIrTzfXBUwdHfVR/qqQq2IKnMvcRPfxgxytA3aA+LZ9W1+
         OzPB/SZC9ZgjOt+A7ULPwxeWpRi3My7DrEVkZSEnR6pFyWGHuZGLhBU3ithb2jdAHngp
         J8wyhL4vM56HaJpx+w0NH1f7IL/Qy9H8XrbwPHMOfpF77UFDLkTsfyarhZ7JQxhZhkbq
         //Dw==
X-Gm-Message-State: AC+VfDz5pIirx5OFJFe7lSfzmKasMhzUeVcx6ojSMrZXDAFa/bhYC4Ln
	fhJQwnVcfLIGpMtwhqx7jaMtB7iIL5jl6uztr2I=
X-Google-Smtp-Source: ACHHUZ4yVGfUDKXnMNAdPGxanqH0tES3xdD22bfKPvQ7QyF+5sIS3iihceZmhUu6HCefGhzgdZXFTw==
X-Received: by 2002:a05:6a20:442a:b0:100:ba96:e5e7 with SMTP id ce42-20020a056a20442a00b00100ba96e5e7mr12966670pzb.18.1687143356889;
        Sun, 18 Jun 2023 19:55:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/18] cve-update-nvd2-native: new CVE database fetcher
Date: Sun, 18 Jun 2023 16:55:27 -1000
Message-Id: <b8ae26aabe825c1bc8d84fd7e0ee197695f1dee7.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183074

From: Marta Rybczynska <rybczynska@gmail.com>

Add new fetcher for the NVD database using the 2.0 API [1].
The implementation changes as little as possible, keeping the current
database format (but using a different database file for the transition
period), with a notable exception of not using the META table.

Minor changes that could be visible:
- the database starts in 1999 instead of 2002
- the complete fetch is longer (30 minutes typically)

[1] https://nvd.nist.gov/developers/vulnerabilities

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fb62c4c3dbca4e58f7ce6cf29d4b630a06411a97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                |   4 +-
 .../meta/cve-update-nvd2-native.bb            | 333 ++++++++++++++++++
 2 files changed, 335 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3c922b27af..494fa03ec1 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -155,7 +155,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-db-native:do_fetch"
+do_cve_check[depends] = "cve-update-nvd2-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
new file mode 100644
index 0000000000..1c14481c21
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -0,0 +1,333 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
+
+# Important note:
+# This product uses the NVD API but is not endorsed or certified by the NVD.
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit native
+
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+NVDCVE_URL ?= "https://services.nvd.nist.gov/rest/json/cves/2.0"
+
+# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# Use 0 to force the update
+# Use a negative value to skip the update
+CVE_DB_UPDATE_INTERVAL ?= "86400"
+
+# Timeout for blocking socket operations, such as the connection attempt.
+CVE_SOCKET_TIMEOUT ?= "60"
+
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
+
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
+
+python () {
+    if not bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+}
+
+python do_fetch() {
+    """
+    Update NVD database with API 2.0
+    """
+    import bb.utils
+    import bb.progress
+    import shutil
+
+    bb.utils.export_proxies(d)
+
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_dir = os.path.dirname(db_file)
+    db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
+
+    cleanup_db_download(db_file, db_tmp_file)
+    # By default let's update the whole database (since time 0)
+    database_time = 0
+
+    # The NVD database changes once a day, so no need to update more frequently
+    # Allow the user to force-update
+    try:
+        import time
+        update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+        if update_interval < 0:
+            bb.note("CVE database update skipped")
+            return
+        if time.time() - os.path.getmtime(db_file) < update_interval:
+            bb.note("CVE database recently updated, skipping")
+            return
+        database_time = os.path.getmtime(db_file)
+
+    except OSError:
+        pass
+
+    bb.utils.mkdirhier(db_dir)
+    if os.path.exists(db_file):
+        shutil.copy2(db_file, db_tmp_file)
+
+    if update_db_file(db_tmp_file, d, database_time) == True:
+        # Update downloaded correctly, can swap files
+        shutil.move(db_tmp_file, db_file)
+    else:
+        # Update failed, do not modify the database
+        bb.warn("CVE database update failed")
+        os.remove(db_tmp_file)
+}
+
+do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[file-checksums] = ""
+do_fetch[vardeps] = ""
+
+def cleanup_db_download(db_file, db_tmp_file):
+    """
+    Cleanup the download space from possible failed downloads
+    """
+
+    # Clean up the updates done on the main file
+    # Remove it only if a journal file exists - it means a complete re-download
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
+    # Clean-up the temporary file downloads, we can remove both journal
+    # and the temporary database
+    if os.path.exists("{0}-journal".format(db_tmp_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_tmp_file))
+
+    if os.path.exists(db_tmp_file):
+        os.remove(db_tmp_file)
+
+def nvd_request_next(url, api_key, args):
+    """
+    Request next part of the NVD dabase
+    """
+
+    import urllib.request
+    import urllib.parse
+    import gzip
+
+    headers = {}
+    if api_key:
+        headers['apiKey'] = api_key
+
+    data = urllib.parse.urlencode(args)
+
+    full_request = url + '?' + data
+
+    for attempt in range(3):
+        try:
+            r = urllib.request.urlopen(full_request)
+
+            if (r.headers['content-encoding'] == 'gzip'):
+                buf = r.read()
+                raw_data = gzip.decompress(buf)
+            else:
+                raw_data = r.read().decode("utf-8")
+
+            r.close()
+
+        except UnicodeDecodeError:
+            # Received garbage, retry
+            bb.debug(2, "CVE database: received malformed data, retrying (request: %s)" %(full_request))
+            pass
+        except http.client.IncompleteRead:
+            # Read incomplete, let's try again
+            bb.debug(2, "CVE database: received incomplete data, retrying (request: %s)" %(full_request))
+            pass
+        else:
+            return raw_data
+    else:
+        # We failed at all attempts
+        return None
+
+def update_db_file(db_tmp_file, d, database_time):
+    """
+    Update the given database file
+    """
+    import bb.utils, bb.progress
+    import datetime
+    import sqlite3
+    import json
+
+    # Connect to database
+    conn = sqlite3.connect(db_tmp_file)
+    initialize_db(conn)
+
+    req_args = {'startIndex' : 0}
+
+    # The maximum range for time is 120 days
+    # Force a complete update if our range is longer
+    if (database_time != 0):
+        database_date = datetime.datetime.combine(datetime.date.fromtimestamp(database_time), datetime.time())
+        today_date = datetime.datetime.combine(datetime.date.today(), datetime.time())
+        delta = today_date - database_date
+        if delta.days < 120:
+            bb.debug(2, "CVE database: performing partial update")
+            req_args['lastModStartDate'] = database_date.isoformat()
+            req_args['lastModEndDate'] = today_date.isoformat()
+        else:
+            bb.note("CVE database: file too old, forcing a full update")
+
+    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
+
+        bb.debug(2, "Updating entries")
+        index = 0
+        url = d.getVar("NVDCVE_URL")
+        while True:
+            req_args['startIndex'] = index
+            raw_data = nvd_request_next(url, None, req_args)
+            if raw_data is None:
+                # We haven't managed to download data
+                return False
+
+            data = json.loads(raw_data)
+
+            index = data["startIndex"]
+            total = data["totalResults"]
+            per_page = data["resultsPerPage"]
+
+            for cve in data["vulnerabilities"]:
+               update_db(conn, cve)
+
+            index += per_page
+            ph.update((float(index) / (total+1)) * 100)
+            if index >= total:
+               break
+
+            # Recommended by NVD
+            time.sleep(6)
+
+        # Update success, set the date to cve_check file.
+        cve_f.write('CVE database update : %s\n\n' % datetime.date.today())
+
+    conn.commit()
+    conn.close()
+    return True
+
+def initialize_db(conn):
+    with conn:
+        c = conn.cursor()
+
+        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
+            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
+            VERSION_END TEXT, OPERATOR_END TEXT)")
+        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID);")
+
+        c.close()
+
+def parse_node_and_insert(conn, node, cveId):
+
+    def cpe_generator():
+        for cpe in node.get('cpeMatch', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe.get('criteria')
+            if not cpe23:
+                return
+            cpe23 = cpe23.split(':')
+            if len(cpe23) < 6:
+                return
+            vendor = cpe23[3]
+            product = cpe23[4]
+            version = cpe23[5]
+
+            if cpe23[6] == '*' or cpe23[6] == '-':
+                version_suffix = ""
+            else:
+                version_suffix = "_" + cpe23[6]
+
+            if version != '*' and version != '-':
+                # Version is defined, this is a '=' match
+                yield [cveId, vendor, product, version + version_suffix, '=', '', '']
+            elif version == '-':
+                # no version information is available
+                yield [cveId, vendor, product, version, '', '', '']
+            else:
+                # Parse start version, end version and operators
+                op_start = ''
+                op_end = ''
+                v_start = ''
+                v_end = ''
+
+                if 'versionStartIncluding' in cpe:
+                    op_start = '>='
+                    v_start = cpe['versionStartIncluding']
+
+                if 'versionStartExcluding' in cpe:
+                    op_start = '>'
+                    v_start = cpe['versionStartExcluding']
+
+                if 'versionEndIncluding' in cpe:
+                    op_end = '<='
+                    v_end = cpe['versionEndIncluding']
+
+                if 'versionEndExcluding' in cpe:
+                    op_end = '<'
+                    v_end = cpe['versionEndExcluding']
+
+                if op_start or op_end or v_start or v_end:
+                    yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                else:
+                    # This is no version information, expressed differently.
+                    # Save processing by representing as -.
+                    yield [cveId, vendor, product, '-', '', '', '']
+
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator()).close()
+
+def update_db(conn, elt):
+    """
+    Update a single entry in the on-disk database
+    """
+
+    accessVector = None
+    cveId = elt['cve']['id']
+    if elt['cve']['vulnStatus'] ==  "Rejected":
+        return
+    cveDesc = ""
+    for desc in elt['cve']['descriptions']:
+        if desc['lang'] == 'en':
+            cveDesc = desc['value']
+    date = elt['cve']['lastModified']
+    try:
+        accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
+        cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
+    except KeyError:
+        cvssv2 = 0.0
+    try:
+        accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
+        cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+    except KeyError:
+        accessVector = accessVector or "UNKNOWN"
+        cvssv3 = 0.0
+
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+
+    try:
+        configurations = elt['cve']['configurations'][0]['nodes']
+        for config in configurations:
+            parse_node_and_insert(conn, config, cveId)
+    except KeyError:
+        bb.debug(2, "Entry without a configuration")
+
+do_fetch[nostamp] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.34.1


