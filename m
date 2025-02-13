Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1775C021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 05:58:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4980.1739426329993198788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 21:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bPg3PSHy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439554db49dso5277185e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 21:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426328; x=1740031128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImzEIZMVYsw73I8woBiZAyXCzlhVSqvB5yaZOPjjxDY=;
        b=bPg3PSHyhMioJH30/qQrb+TGrlLaa1OHKwMw4LdoIxdA45eav8hah2q5Ls/DwP7azZ
         NOb695I5AQWlA5ysIuHxpI+UFSO1090cNVcDic4put+apcVxwyFgC4nOq6W1erJ+I1tj
         pt+NxmJ69By45Qktv2hHST88YuGxGAZgo9fDd91xjG1g9sKjwvE1htEkiV+vw+gsgLYh
         NuRmNiCr05qge1ZYlmKQllNtaPrPWFaQrlz+ZZJ9aNSBbGRhvnJCBh/mzEpVclzxcF6k
         vsyw47or+5g745TWmWxvGOSDaflBf+YJ3mK62RzIfx/Hq5s3Ozw4ta/u46NvY+Ql5+eo
         I2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426328; x=1740031128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImzEIZMVYsw73I8woBiZAyXCzlhVSqvB5yaZOPjjxDY=;
        b=ocQLyKkOOFalLmEIj407PrZgRPUe7VBdcFoHtg2UlZE89IfZy53ukAcwxu7TWUW8WV
         qxrLTgWm8mNERSFQx8KYnw0KkA0Hzame0PFxEXZb+4y0RZvOzUzQz88r+pfCrJO1ph7a
         jC+JiwaTfqrYGSIYaO7SWXYg5scsxHL7cZX23xWbsmvY4gOO55itIJUDXsvWtuy3+bvN
         l9tbLEZaMsrkUbidLC3tqxCUAdfEzzh1L5lKhlnLPhbg44EODChAfvrjUYLReCjNfNCx
         1U0UsgiBUlxlVdZe9TL+TICMmtdc5cmzGUdizFU7l6voAMH2Y5aBAmZPPX/R09XjvG6A
         sp2Q==
X-Gm-Message-State: AOJu0YxszkU3KRj02Kp4ki3c0d0iBWp3A+bQnXv6rosHdx8A+wbSgiEm
	OYXeQEmkaiJcdr4U2XbJTLug0rValvud//ypHBChLIcVIILRZkI3N86cyQ==
X-Gm-Gg: ASbGncvUAYOe3cXwDCxtRgolut2o3DFzyUriIw2KPPNAXTRAWHCxxX+N8DweFLv0Kl6
	uNcdpn6dLK8GCSsrl3XAVnvQv6FP3V1c9AsknqkRBWh0VQqdMnDM6X0BeGpisJE0BWX7FSyA6wL
	fLTfkA44QY93R3aJKfdXYWGZ8JhT1KOSIaoIPs5+Cg5ev2pTgLFLeIUUsgDrjKhtuYegT4vMtN7
	7jz2ijcfTjTCUffoP97b17VSCzJVrCojG71Xs8WFrDz6fZKyA4QXceu+2YwoCEWFWNnpsl9XSSr
	649iVqkI8Sbzqombr7NRksOATlY=
X-Google-Smtp-Source: AGHT+IHvBjYRzQOiNx/krqcFXQg+p/Hg//5QGgTwf/AR4bC93SUekkBKC2dp6+OqQSxvuF7mEd8PQA==
X-Received: by 2002:a05:600c:1909:b0:439:4a1f:cf8e with SMTP id 5b1f17b1804b1-439580d5f07mr64864605e9.0.1739426327803;
        Wed, 12 Feb 2025 21:58:47 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm7466515e9.9.2025.02.12.21.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:58:46 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v4][OE-core 3/4] cve-update-db-native: add the fkie source
Date: Thu, 13 Feb 2025 06:57:52 +0100
Message-ID: <20250213055811.6873-4-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
References: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211293

Add support for FKIE-CAD reconstruction of NVD feed from
https://github.com/fkie-cad/nvd-json-data-feeds

We download this feed directly from github releases.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 126 ++++++++++++++++--
 1 file changed, 113 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3a9d43943c..792252f510 100644
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


