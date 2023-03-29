Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB56DC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:03:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.20633.1680084191637190926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+up1blZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d17so15023279wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 03:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680084189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dttKS1JzRa6sAdXxclwUKJ0lGayXZh5WvKNWg/Q60hE=;
        b=Y+up1blZYVF3mZxr+Ge5dffGRT5ZHwjzvTPmtSRfNUmGNuwPt9uqiaq63wVNG7RjU8
         ZA2ubI/CWIzdf1OzP5VfWtDh4gNGcSdzDIQevgys3rTlce8Q3N4CsAqruB4ygPc1HLAE
         zIocZnXQTRyo9xT20AkDAEZMsppyu22wXwn4fZw8w/fB2vUkPGnKrcktFwNOVNCXUw6u
         QgQkYwRoxQ9KCdWyfKExoUcXknc1/sv/AaJTMSSoihGJ6i260nkDGJTq4s5TF8z+Cr06
         5OGVFaEFE/uWurKp+R8SUB6oOQitTT75L2x3JvlFcVTp87Yy39CkKAhQwBpHHF9a6Uzj
         sEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680084189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dttKS1JzRa6sAdXxclwUKJ0lGayXZh5WvKNWg/Q60hE=;
        b=5lQgv8J4HbEK96BeMs/XOK9d2w4oCI80VUoXsPbE/2lS8ETTFm0orw2TdVQFq4RtdV
         VHvEjd6Xahd/zPbbgLhQ/GLM9aYlTlt2yOFqE0HDdFRop+AmU9vjOes8Zx4Ik68l5CC4
         uQPg+FSjYOqjPZHF2DrOm/K2qmI51aRmlFfprgdT4vufjKzBExbTU7+I1ff50q2DzTyR
         kNEdHCWQK/HZvl8ZkOyh3SN9M98VOf15e41KC5+Rft0vvDGjp4jmyloDypb2hkBTCqsD
         xpewRkjNMRXvyRpcTwcQ4FK/a0ukYYMC1tTJlHBzWGxXR2gPMn28RdbD3C16kX208IL7
         0jDA==
X-Gm-Message-State: AAQBX9eGdFYpUIDv8oLzLoD+PedmQlr6W8MmgMs1pldWm2RaqpsQzNUu
	rEnv/W9p6P4ewQ44kf1CY6QXsZcH5ac=
X-Google-Smtp-Source: AKy350ZfxtfB0wt33vNAl+CVZTBOYX+9AosJEHba4bqx0iAilEM5lPKBbSAwdc6mBFe+/8RJf42gYg==
X-Received: by 2002:adf:f350:0:b0:2c5:594b:10d5 with SMTP id e16-20020adff350000000b002c5594b10d5mr15257173wrp.1.1680084189384;
        Wed, 29 Mar 2023 03:03:09 -0700 (PDT)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b002d78a96cf5fsm22745721wrf.70.2023.03.29.03.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 03:03:08 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] cve-update-nvd2-native: new CVE database fetcher
Date: Wed, 29 Mar 2023 12:02:56 +0200
Message-Id: <20230329100257.1612928-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 10:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179272

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
 .../meta/cve-update-nvd2-native.bb            | 333 ++++++++++++++++++
 2 files changed, 335 insertions(+), 2 deletions(-)
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
2.35.1


