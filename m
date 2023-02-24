Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C56FC7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:17:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.21946.1677255420425817160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kmB0P/1A;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id bv17so1632046wrb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RecQsXOE8T3IscVkX+mdsi9KuBMRa+m/H+/sAWoe8M=;
        b=kmB0P/1AyW3ebc/ZOGSZGR5Llg6qxRn15W4V/oWS/E1EcdWAewMoFhKKTFPeyNvLbO
         n4caecIPH2jysCSJmdXFlXu+XEntKEG3dOzm4p4luAS3EhjuJBQmmDC3J4vWTOPZjNiS
         zPWrwB7pOjBLRDi4zWooLwlBh6aJlZW+kmBLnvKdGAyMDt6S9L948YNn4Pu7U/vj3Umm
         FIeTSIL9CgEaR9KFbPhAb26hRrWGBAqGFboUxyvSiKV7HoAsg+b3a16gOv3hhVrwDbBA
         JYqmEUpe4xEKBpVne5YP9y/wdf+4OXKifNvyb9qUfdEi+dJf/YUf608BkEtLnSB6Y7bD
         eNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RecQsXOE8T3IscVkX+mdsi9KuBMRa+m/H+/sAWoe8M=;
        b=11FJhy6ok0IG61UaMg3OR0ApO+a6ghelIl93Gx9feHElhjnqmT6vBK3VCAvmerE8kw
         rYqt33GArKy7wdKDG7ePavu/ruF/a1VQmaxU0GJ1jprB3rXe0+7/jcrwIc0dNom/NLvc
         Le4sJbqDwVyx7cv1ZW6qH6O1JuWeuuI9Ok8pwBcLWKraY/jvUtLRqnaIqsZHONtgDjEG
         cV8/C5eoHpG/HVovoOGOpmZKXjllg3mph6mqHyQjwZE9lwtnjZ2BEjgKUt22kh7tiZ8S
         Et4nSj4br7t0fhXnjD/oRozrhxXWMYkM5OJyBDa9fmNBnY834jgwrkyjv8agW9g1iMhk
         q1aA==
X-Gm-Message-State: AO0yUKXRsKr7+DtWG6+yZT+Ojuqrk9eC1LLyxiT7R+o/cXsTCFL6JqLL
	VhhBzAaxY8JnC4HGIiQSKsqpXBZWJyk=
X-Google-Smtp-Source: AK7set9S3SkGijVcpEZ63D4KDy3cWLtGKy3TLbuHe/qC0mMTFdrpOl2M61iV6wuLiFwEe3O2LDh0Jw==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id a14-20020a5d570e000000b002bfd94029b6mr14290252wrv.54.1677255418102;
        Fri, 24 Feb 2023 08:16:58 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id v15-20020adfedcf000000b002c70ce264bfsm7302057wro.76.2023.02.24.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:16:57 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC]] cve-update-nvd2-native: new CVE database fetcher
Date: Fri, 24 Feb 2023 17:16:43 +0100
Message-Id: <20230224161643.1596895-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177692

Add new fetcher for the NVD database using the 2.0 API [1].
The implementation changes as little as possible, keeping the current
database format (but using a different database file for the transition
period), with a notable exception of not using the META table.

Minor changes that could be visible:
- the database starts in 1999 instead of 2002
- the complete fetch is longer (30 minutes typically)

[1] https://nvd.nist.gov/developers/vulnerabilities

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/classes/cve-check.bbclass                |   4 +-
 .../meta/cve-update-nvd2-native.bb            | 300 ++++++++++++++++++
 2 files changed, 302 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 41fdf8363f..1f16683c32 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -161,7 +161,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-db-native:do_fetch"
+do_cve_check[depends] = "cve-update-nvd2-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
new file mode 100644
index 0000000000..5f2e962dc7
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -0,0 +1,300 @@
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
+        bb.note("CVE database update failed")
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
+def nvd_request_next(s, url, api_key, args):
+    """
+    Request next part of the NVD dabase
+    """
+
+    headers = {}
+    if api_key:
+        headers['apiKey'] = api_key
+
+    return s.get(url, headers=headers, params=args)
+
+def update_db_file(db_tmp_file, d, database_time):
+    """
+    Update the given database file
+    """
+    import bb.utils, bb.progress
+    import datetime
+    import gzip, sqlite3
+    import requests
+    import json
+
+    # Connect to database
+    conn = sqlite3.connect(db_tmp_file)
+    initialize_db(conn)
+
+    s = requests.Session()
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
+            r = nvd_request_next(s, url, None, req_args)
+            r.raise_for_status()
+            data = r.json()
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
2.35.1


