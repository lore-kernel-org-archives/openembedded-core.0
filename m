Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD26FE77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:55:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.14493.1733986505960988066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NzU3ZQFF;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434f80457a4so8297905e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 22:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986503; x=1734591303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WueF30C+PWOTbexapza/hnoThXm3J6jt+zV9/jq2oqU=;
        b=NzU3ZQFF5cisc8+tMK9HV64YDtLP+94n90liCSWuwuLG8VHMCCC6i6WNwWTitvOyg/
         o99hL2casMvDMP1FGhH+MxXGDSkct+Gxr8+2RZlX5kLlKEA/M4hz/SSVsDZ+q8Hk3VKT
         oTZew9844TKXq67bD6HJvzXBLk/z8yNkzytnCDeYQTkKkkdjG0XMuo97lQUIfPbkE2Ij
         J8scm3SN0zeIkwY7LeDUrX6iJL9r3Yko2tODeW7/Jhi747cH3wJK6op0Cs5+GC3HiZ7w
         NZ9/UPl95fgRaU7aKZmDdDVsSoJ5ppq7BQfkCtMim0zO8uUCGgB5zWx385fHLio6xq5j
         TFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986503; x=1734591303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WueF30C+PWOTbexapza/hnoThXm3J6jt+zV9/jq2oqU=;
        b=u7rmmSnjP4IeEbHAYI4SsilL0imakTdet9OMHS1RsSEssTNCRE0wHz/odMpuXmtbKF
         ZcE/qK6C5CHTo9AdoFUukhxWJxiZPMuASg3oy3HcRvnVG+A/ujep/pXQRM4Z1DrN+l5l
         obZ/4zYM1XDAiiuSv+7nP/L7+kqqLhz4tR+7pMa6knEnijWjpTY6XFy1ZuLCCy7z9X9q
         tXLYJnJwK0IXtc2M3p1Jg14J9Xi9UFA1w3a+fDoh8sgj88Dz/Dl95CcQVRbHgYHLs0Qj
         VpUa848/CdcYshgrnI/m4QYWCmnzzua9S0JkHYzJZbJuyh9u8BaCvHD7ZtmCwpIm3k8Y
         in3w==
X-Gm-Message-State: AOJu0YyCtodGC7sdZGOGzjs960yMqScNp7SCCMNBwUGn5lmCF6irLY99
	8lhv+icr6cqGtxXx6iKCB0NkZ9JRtct3TWRS5krttYJ40Z3w1GX7Tx5O7w==
X-Gm-Gg: ASbGncvCu0CAvbJA5GQ9F8qIXv3vQAxzmLZ+vaH5O/QkTsGbUxc8sr2V9Wh40EaFDZe
	A3qNpucVAaqvA80DHOhyMHuJv5oda+rXF84kMyWhMjML0qW6V6aYKpyV9Pi2/rEHKd8jgXB8qJv
	UMFzxOrj42wht6+ESRhelD1gx7arTPTRADuBSUKMd1jyF1tgQz017wTqLhbNWhofaJGMiCNo5gE
	wBBviMwFmpWfQVFITvkh8ii1Sy3xBBFvPsFaB0aztQGaCEL9P5M+R5By0ShvTvYLkyPWA==
X-Google-Smtp-Source: AGHT+IEObK/7vU6XXRsuUSR8ILL9TEZiMGqQ806zzZ97z0G58rMeur6M6D+mcdYMH4R8vdoMgLS8qQ==
X-Received: by 2002:a05:600c:1c92:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-4362310cef1mr13670275e9.13.1733986503306;
        Wed, 11 Dec 2024 22:55:03 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm3154021f8f.74.2024.12.11.22.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:55:01 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC v2 3/4] cve-update-db-native: add the fkie source
Date: Thu, 12 Dec 2024 07:54:21 +0100
Message-ID: <20241212065435.15582-4-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208624

Add support for FKIE-CAD reconstruction of NVD feed from
https://github.com/fkie-cad/nvd-json-data-feeds

We download this feed directly from github releases.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 126 ++++++++++++++++--
 1 file changed, 113 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index f16e79ff58..b889c9e6a7 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -12,6 +12,8 @@ deltask do_install
 deltask do_populate_sysroot
 
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+FKIE_URL ?= "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download/CVE-"
+
 # CVE database update interval, in seconds. By default: once a day (24*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
@@ -109,6 +111,30 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
+def db_file_names(d, year, is_nvd):
+    if is_nvd:
+        year_url = d.getVar('NVDCVE_URL') + str(year)
+        meta_url = year_url + ".meta"
+        json_url = year_url + ".json.gz"
+        return json_url, meta_url
+    year_url = d.getVar('FKIE_URL') + str(year)
+    meta_url = year_url + ".meta"
+    json_url = year_url + ".json.xz"
+    return json_url, meta_url
+
+def host_db_name(d, is_nvd):
+    if is_nvd:
+        return "nvd.nist.gov"
+    return "github.com"
+
+def db_decompress(d, data, is_nvd):
+    import gzip, lzma
+
+    if is_nvd:
+        return gzip.decompress(data).decode('utf-8')
+    # otherwise
+    return lzma.decompress(data)
+
 def update_db_file(db_tmp_file, d):
     """
     Update the given database file
@@ -119,6 +145,7 @@ def update_db_file(db_tmp_file, d):
 
     YEAR_START = 2002
     cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
+    is_nvd = d.getVar("NVD_DB_VERSION") == "NVD1"
 
     # Connect to database
     conn = sqlite3.connect(db_tmp_file)
@@ -129,9 +156,7 @@ def update_db_file(db_tmp_file, d):
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             bb.debug(2, "Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
-            year_url = (d.getVar('NVDCVE_URL')) + str(year)
-            meta_url = year_url + ".meta"
-            json_url = year_url + ".json.gz"
+            json_url, meta_url = db_file_names(d, year, is_nvd)
 
             # Retrieve meta last modified date
             try:
@@ -140,7 +165,7 @@ def update_db_file(db_tmp_file, d):
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e)
                 import socket
-                result = socket.getaddrinfo("nvd.nist.gov", 443, proto=socket.IPPROTO_TCP)
+                result = socket.getaddrinfo(host_db_name(d, is_nvd), 443, proto=socket.IPPROTO_TCP)
                 bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in result)))
                 return False
 
@@ -168,7 +193,7 @@ def update_db_file(db_tmp_file, d):
                 try:
                     response = urllib.request.urlopen(json_url, timeout=cve_socket_timeout)
                     if response:
-                        update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
+                        update_db(d, conn, db_decompress(d, response.read(), is_nvd))
                     conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
@@ -200,16 +225,22 @@ def initialize_db(conn):
 
         c.close()
 
-def parse_node_and_insert(conn, node, cveId):
+def parse_node_and_insert(conn, node, cveId, is_nvd):
     # Parse children node if needed
     for child in node.get('children', ()):
-        parse_node_and_insert(conn, child, cveId)
+        parse_node_and_insert(conn, child, cveId, is_nvd)
+
+    def cpe_generator(is_nvd):
+        match_string = "cpeMatch"
+        cpe_string = 'criteria'
+        if is_nvd:
+            match_string = "cpe_match"
+            cpe_string = 'cpe23Uri'
 
-    def cpe_generator():
-        for cpe in node.get('cpe_match', ()):
+        for cpe in node.get(match_string, ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 = cpe.get('cpe23Uri')
+            cpe23 = cpe.get(cpe_string)
             if not cpe23:
                 return
             cpe23 = cpe23.split(':')
@@ -260,9 +291,9 @@ def parse_node_and_insert(conn, node, cveId):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
 
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator()).close()
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator(is_nvd)).close()
 
-def update_db(conn, jsondata):
+def update_db_nvdjson(conn, jsondata):
     import json
     root = json.loads(jsondata)
 
@@ -297,8 +328,77 @@ def update_db(conn, jsondata):
 
         configurations = elt['configurations']['nodes']
         for config in configurations:
-            parse_node_and_insert(conn, config, cveId)
+            parse_node_and_insert(conn, config, cveId, True)
+
+def update_db_fkie(conn, jsondata):
+    import json
+    root = json.loads(jsondata)
+
+    for elt in root['cve_items']:
+        if not 'vulnStatus' in elt or elt['vulnStatus'] == 'Rejected':
+            continue
+
+        if not 'configurations' in elt:
+            continue
+
+        accessVector = None
+        vectorString = None
+        cvssv2 = 0.0
+        cvssv3 = 0.0
+        cvssv4 = 0.0
+        cveId = elt['id']
+        cveDesc = elt['descriptions'][0]['value']
+        date = elt['lastModified']
+        try:
+            for m in elt['metrics']['cvssMetricV2']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv2 = m['cvssData']['baseScore']
+        except KeyError:
+            cvssv2 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV30']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv3 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv3 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV31']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv3 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv3 = 0.0
+        try:
+            for m in elt['metrics']['cvssMetricV40']:
+                if m['type'] == 'Primary':
+                    accessVector = m['cvssData']['accessVector']
+                    vectorString = m['cvssData']['vectorString']
+                    cvssv4 = m['cvssData']['baseScore']
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
+            cvssv4 = 0.0
 
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
+
+        for config in elt['configurations']:
+            # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
+            for node in config["nodes"]:
+                parse_node_and_insert(conn, node, cveId, False)
+
+
+def update_db(d, conn, jsondata):
+    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
+        return update_db_fkie(conn, jsondata)
+    else:
+        return update_db_nvdjson(conn, jsondata)
 
 do_fetch[nostamp] = "1"
 
-- 
2.45.2


