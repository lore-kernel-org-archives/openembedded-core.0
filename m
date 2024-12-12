Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1E6E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:54:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.14489.1733986496720062140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIxKpPe9;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso158227f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 22:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986494; x=1734591294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22MGEjVUnib3qBnu3OtOlTLrtmi4xoabRXyk8/fmWaw=;
        b=OIxKpPe92h4mSOQBlw/iIhVAKjHrcHwfT5M67c/bEXLyXExdGw6juqhVVdWORSDUMM
         DXz5xgfLu1esaZbIpcP7l6aSx6bUUKeRE4ET9HSJOQKvqEmEQNq2r30a6VIr0UHNv91G
         Y5ANgIRvinOf0EvIRnx5T1UrJOxgNkk8POWfN/73E/RPwG7K16NbbR6L4qW6/fCatkmt
         VBy4GxdkXfz4DpZUhPXsphN6uxK/uwUpwSSMoOCBdQgfNf92NpuIpHMlki/8Vlajs1PR
         dkYNuFHXLvMIgEldgRO1EI/p+JetqxgUzONiKuTQ8zr9FUF1IkYPzYI3IFqjiuAnfLeX
         TodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986494; x=1734591294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22MGEjVUnib3qBnu3OtOlTLrtmi4xoabRXyk8/fmWaw=;
        b=TrTFgxaSHxSgKjjqw6W2m7exZHebvsxdgy3+OZtspSOFDBr85zOx2o/nqMzWy+DKit
         Hm0zw2UcoEnsYiHo5WL7qEr1Sjt+rdY8Ly9wBUuIi3Pz6NQj4cbOvr4+37BuTSkQWVuR
         KOpLqGxb/MCayYQelK5zs5eMpMXrSmgpVNbWdeOW+uB/w4HCJgt4CdzmScTTSNkTzdJu
         UmtUEp3X7lsvhvGK7mBq/O/yA8Ov0SMAHJxLHN4MMlVZ68z1wwoFqG3NmS8+hD9c7Nbq
         ocU/ZxPM+tl3WGIsdj54r2sa3YMyr8CTu/C8erH5QEy5xxml0+28AVMGrkEMSiHGc9Sd
         oQSA==
X-Gm-Message-State: AOJu0Yw94eQIeirDrXBrcFIUhHC8ydmCs9PwoZx6fYSKhkT9xuDvSU/j
	0WvVhQATSqVKgU1RakdKZUqb27PWqF4Y+y0Wk7Wwm1KOuonn4HtdussPQA==
X-Gm-Gg: ASbGnctbplJxzkKIMpgu9L2obtky+ocUqcPfXLRTp49UXV7UbuHTwEQnYIM5PY3z/w+
	KIasdSQHem8PwkxS9RJvkLS/i6sP/jZGeyL/WCHMnf0n8I2TXIP1f5l+GOpxBxIJ2aal8dbWQG3
	TBIdkc1Xu5SCxykdI2mBgA7nMUehHLd/au75yKpawz1qePlTPHP5g3teJBufoY7lcRNcEovXtw/
	vuu7YfJbcaF0ZyK2iUnFPX9BBF+xd2RIUbjes0EpRf0PoHUnsDJ8oDBMJuLtSNE2L04nQ==
X-Google-Smtp-Source: AGHT+IHz43zLD6KEEChhmpp8iYjaeYQVgkXl19OAHXaZ97bTeDXqp1zAVOM/v8Ii8jCt9yYevAQyUg==
X-Received: by 2002:a5d:64e5:0:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-3864cec7614mr4972470f8f.46.1733986494069;
        Wed, 11 Dec 2024 22:54:54 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm3154021f8f.74.2024.12.11.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:54:51 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC v2 1/4] cve-update-db-native: restore
Date: Thu, 12 Dec 2024 07:54:19 +0100
Message-ID: <20241212065435.15582-2-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208622

Restore cve-update-db from kirkstone

Use cve-update-db-native.bb from OE 8c10f4a4dc12f65212576e6e568fa4369014aaa0

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 291 ++++++++++++++++++
 1 file changed, 291 insertions(+)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
new file mode 100644
index 0000000000..e042e67b09
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -0,0 +1,291 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
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
+NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# Use 0 to force the update
+# Use a negative value to skip the update
+CVE_DB_UPDATE_INTERVAL ?= "86400"
+
+# Timeout for blocking socket operations, such as the connection attempt.
+CVE_SOCKET_TIMEOUT ?= "60"
+
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
+
+python () {
+    if not bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+}
+
+python do_fetch() {
+    """
+    Update NVD database with json data feed
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
+            bb.debug(2, "Recently updated, skipping")
+            return
+
+    except OSError:
+        pass
+
+    bb.utils.mkdirhier(db_dir)
+    if os.path.exists(db_file):
+        shutil.copy2(db_file, db_tmp_file)
+
+    if update_db_file(db_tmp_file, d) == True:
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
+def update_db_file(db_tmp_file, d):
+    """
+    Update the given database file
+    """
+    import bb.utils, bb.progress
+    from datetime import date
+    import urllib, gzip, sqlite3
+
+    YEAR_START = 2002
+    cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
+
+    # Connect to database
+    conn = sqlite3.connect(db_tmp_file)
+    initialize_db(conn)
+
+    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
+        total_years = date.today().year + 1 - YEAR_START
+        for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
+            bb.debug(2, "Updating %d" % year)
+            ph.update((float(i + 1) / total_years) * 100)
+            year_url = (d.getVar('NVDCVE_URL')) + str(year)
+            meta_url = year_url + ".meta"
+            json_url = year_url + ".json.gz"
+
+            # Retrieve meta last modified date
+            try:
+                response = urllib.request.urlopen(meta_url, timeout=cve_socket_timeout)
+            except urllib.error.URLError as e:
+                cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
+                bb.warn("Failed to fetch CVE data (%s)" % e)
+                import socket
+                result = socket.getaddrinfo("nvd.nist.gov", 443, proto=socket.IPPROTO_TCP)
+                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in result)))
+                return False
+
+            if response:
+                for l in response.read().decode("utf-8").splitlines():
+                    key, value = l.split(":", 1)
+                    if key == "lastModifiedDate":
+                        last_modified = value
+                        break
+                else:
+                    bb.warn("Cannot parse CVE metadata, update failed")
+                    return False
+
+            # Compare with current db last modified date
+            cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
+            meta = cursor.fetchone()
+            cursor.close()
+
+            if not meta or meta[0] != last_modified:
+                bb.debug(2, "Updating entries")
+                # Clear products table entries corresponding to current year
+                conn.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,)).close()
+
+                # Update db with current year json file
+                try:
+                    response = urllib.request.urlopen(json_url, timeout=cve_socket_timeout)
+                    if response:
+                        update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
+                    conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
+                except urllib.error.URLError as e:
+                    cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+                    bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                    return False
+            else:
+                bb.debug(2, "Already up to date (last modified %s)" % last_modified)
+            # Update success, set the date to cve_check file.
+            if year == date.today().year:
+                cve_f.write('CVE database update : %s\n\n' % date.today())
+
+        conn.commit()
+        conn.close()
+        return True
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
+    # Parse children node if needed
+    for child in node.get('children', ()):
+        parse_node_and_insert(conn, child, cveId)
+
+    def cpe_generator():
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe.get('cpe23Uri')
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
+def update_db(conn, jsondata):
+    import json
+    root = json.loads(jsondata)
+
+    for elt in root['CVE_Items']:
+        if not elt['impact']:
+            continue
+
+        accessVector = None
+        cveId = elt['cve']['CVE_data_meta']['ID']
+        cveDesc = elt['cve']['description']['description_data'][0]['value']
+        date = elt['lastModifiedDate']
+        try:
+            accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+            cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+        except KeyError:
+            cvssv2 = 0.0
+        try:
+            accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
+            cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv3 = 0.0
+
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+
+        configurations = elt['configurations']['nodes']
+        for config in configurations:
+            parse_node_and_insert(conn, config, cveId)
+
+
+do_fetch[nostamp] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.45.2


