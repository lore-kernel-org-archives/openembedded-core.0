Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF149C021A7
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 05:58:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5172.1739426318330215830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 21:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bN5dcAAF;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dd93ace00so189034f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 21:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426316; x=1740031116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22MGEjVUnib3qBnu3OtOlTLrtmi4xoabRXyk8/fmWaw=;
        b=bN5dcAAFX6Fnx01XWsvEt66Bhzm2pEBm+pN8UPjXriCDZpfeaBXh+rCaqYro8YMjNb
         tzDnJr1rpjoRZc5E0fScxQrBRf4ZEH7d7Sc+Qj5HODQ+gvQa1LN922QaBcZwoTEhd1pY
         qDdwnMvda13/uzvUSYCBOYPhzKUyWLYZ/guZnClNT1jcVIOsSPiKUnlWh+4hJmCjyyWd
         46bL1FW3aZhYYBg4SshqDf8g+p1+ihJAf41g5aUdDA4EgMsNOycgFHFQ0YB5hgw+k6Vy
         oofOOjG3GZOV3R5MKuX8zB9nt489XuwDoFFkZ5D3SXl+kr5SauXqQXf2JCao/qEbQjAh
         9VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426316; x=1740031116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22MGEjVUnib3qBnu3OtOlTLrtmi4xoabRXyk8/fmWaw=;
        b=NneG+6tvUzhikMsbum5XJJKuTl5e6wm3QEUf+Evc2hKi73NL3f1/xxLEScJgrck9Oo
         LCyg5RcLBigLkoJP4WYp/AQ5LX52gDhoaM448aiNoJQRvWyvXPmkNcWGwdE+hQjojf62
         W/QoA1pbT1KeG1vtasrCrFITsXYCCm+Yj73EiwxU+LHQCfMFyG87yQuvPqkQIxszwIUG
         i1MQG7RzEhJ9EGkeORWdG6JBzi/KRIR1Pt4094talY9p77j92XifJdXQvfBVkeFb7MLK
         y1/5KAmwWOgf0K3Ae2SikxT46wUec1lT7JhjPxWetO6wb8UL0ozjYlR/u+yQy69PKK8H
         tgMg==
X-Gm-Message-State: AOJu0YwoOD4yS779Fek2AspDegNhlLp63EO43us2CDD7UknP0g+C3khk
	7l67ktDtG8qfE0YpD6jmzNJCAIj4QLU60VdB3v3at2i5JrIj6bAwJD8zpg==
X-Gm-Gg: ASbGncu1hkv8qcG6sqh3ziAhU93KehvZZJCoLIiLZExaA/UiUtNtLBvt6oQGZhmqkpb
	pYsApSHSdGzv0SeB3YFylx68JB3M9B4gep0iqTYyJuOqfShwe8RFby8/dKT7KIccVLS4V7EwWen
	/LpbkTbN3u9MT/GT85CSESwgg6GJkYDD307/XHnoqn0cSxhERUlq0gHHWoTNTYn9iOk1GUN4JCZ
	jw1D9F/di8O+uOEMPfZDIMh7EEq3RPAHqCFO/1ZT3tIPRL2zhZuazgqtaTNzLbfZgqIQRdbcD8M
	jU+hqUIAMywe6R8cObgBHn/6mVY=
X-Google-Smtp-Source: AGHT+IGOtgiMY0otmN5J1o+l8hKn1sXNFAnJ9SlRR1tm+GoyADobAzdE7c0Hnn1E8p7WwmFZNWyXHg==
X-Received: by 2002:a5d:47ca:0:b0:38f:23f9:b367 with SMTP id ffacd0b85a97d-38f23f9b430mr1878243f8f.23.1739426315861;
        Wed, 12 Feb 2025 21:58:35 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm7466515e9.9.2025.02.12.21.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:58:34 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v4][OE-core 1/4] cve-update-db-native: restore
Date: Thu, 13 Feb 2025 06:57:50 +0100
Message-ID: <20250213055811.6873-2-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
References: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211291

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


