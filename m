Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E7DD2F7CA
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 09:16:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1866.1764926196077927893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 01:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6HG8ZzJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso17175605e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764926194; x=1765530994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4MVcKaziahswja/2B7MkasOaEbzhELhE6GAkAr7MTI=;
        b=U6HG8ZzJ2zlYhA9mPhz6nAn+oi+x1kUNILSHRCjcrcG0OkervuZJECX35U9UFXSD3C
         eq8l6vBuUChkdWfnixcqKCimlXuXI/xacdBaRJ6HrFZ0ZkdI50V0uHcBJv6jWvWsNSiy
         sC0y9ayyZmfZROSlgpNLhKaNTfPMT3mGVWcafZ502/So/hy1HwZEF88aHCdM6fX2FFe3
         SnGmsNAzvYyvtOiNfKazTOsfMqmLeVtX1Znq7IPwK+0n3kfq8Wxmb24T0lCA2kUTDu18
         3GPCTqetysp86nW7xuPHXVyPiS519yGA+YQukkJGPMP3b3W/VGQWeuG/Yeb79hygB2Nv
         nDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926194; x=1765530994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4MVcKaziahswja/2B7MkasOaEbzhELhE6GAkAr7MTI=;
        b=Hx9CQRP/8DJvPSFM+uKu3vfVUNruqwELWOa3tWSgOSp90dxhh5UOm/J/BifiNVQ98L
         YDpSVnqEUSiN4WUjRqCwOYRbwE7LiAtiNRbN++70WSpCqxIQaBgDAjWvBx4kxM0Nwkby
         SnCYTGpmhxsRX/vH5JHQQZ2MluLyo/FGPvmGZcT9iR6TSvWAD4R5pEJa1Fgu+3rV/oYD
         zmHhfxYTyilCp/dIwYHPyvoO9j9LFDDmV2zu5qce/zVlORiHjzB11QiYbdGXaqOWLBHU
         O7w5ao3RBI6VBnqtnpI6rGIV6rckkzQTrM3uixgr6/6cbPJGDsVosRLJWyuUQz/F23am
         zuAg==
X-Gm-Message-State: AOJu0Yz9TrD4Qap2oNr1vZw8xMjG+lmoWLqqYDgjkbDt4WVi+qNjlgFI
	aiXrgJcQSW1CrUWK999omR57f4qxhO71hFnG+q3lelFrc8rKFRNBjlnTzVH+ww==
X-Gm-Gg: ASbGnctKvw1nmzeYFyLfejT5VxmL5H7et7GplKAk9Ja+ia3Qs9M4zk9KC2wCjLSiJEa
	Yqh66wWRIjfLnfk9/nfAiAKPCY+UC6nb/ctC0xuLQmR/5PTSd7BrY35DHsZCceXerK76IBhbPtH
	GUgn0LaRRiMbv5WXf9m4c0l1Qpq50DgBuSFJj1ZUo7nl+uEj9nUd5lllUOnsto3FeRd/DhwTiT8
	aeY4Yl0ofeiZvbfCwykGt7cw3K+jNL2BEKENhu/g+R7E4NSoeNRcJd490xqzSzW5dDcuRjNxBf8
	r/3ML9ykMJCnWgdsWYRhYEAfSBUbcaEfgWWnomXjiOc0D227YkZmR1SZAY7GotlXuARg5+ZFzGl
	gCgR2TxQ3ytLrEiUKre4lXnyOCiRbGMBvzvqtVDHo5lH/lFFPRXNcVAXJicDHSRAxqZM8qbbB/s
	+NBdPIvVGp
X-Google-Smtp-Source: AGHT+IE2kLH+M4RxRvphOE7AtVSlCDy88IfELlUqI9CdYiFXb9piT1GnzmsXz9Ghe0qLT5+qPeuviQ==
X-Received: by 2002:a05:600c:4504:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-4792eb223a2mr73799935e9.5.1764926194081;
        Fri, 05 Dec 2025 01:16:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm7786260f8f.41.2025.12.05.01.16.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 01:16:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PoC 1/1] cve-update-db: bolt LLM on top of it
Date: Fri,  5 Dec 2025 10:16:32 +0100
Message-ID: <20251205091632.1268768-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205091632.1268768-1-skandigraun@gmail.com>
References: <20251205091632.1268768-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227344

[Do not run this on autobuilder, it changes the CVE database]

This patch adds some LLM calls on top of the cve-update-db recipe, to derive
missing CPE identifiers. It also extends the cve database with a column to
indicate if a given CVE-product association was derived with or without LLM,
and includes this information in the final cve json also.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes/cve-check.bbclass                |   6 +-
 .../recipes-core/meta/cve-update-db-native.bb | 138 ++++++++++++++++--
 2 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c63ebd56e1..d9a3636cb4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -360,7 +360,7 @@ def check_cves(d, cve_data):
 
             product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
             for row in product_cursor:
-                (_, _, _, version_start, operator_start, version_end, operator_end) = row
+                (_, _, _, version_start, operator_start, version_end, operator_end, llm_guess) = row
                 #bb.debug(2, "Evaluating row " + str(row))
                 if cve_is_ignored(d, cve_data, cve):
                     ignored = True
@@ -440,7 +440,7 @@ def get_cve_info(d, cve_data):
     conn = sqlite3.connect(db_file, uri=True)
 
     for cve in cve_data:
-        cursor = conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,))
+        cursor = conn.execute("SELECT NVD.*, PRODUCTS.llm_guess FROM NVD, products WHERE NVD.ID IS ? and NVD.id=PRODUCTS.id", (cve,))
         for row in cursor:
             # The CVE itdelf has been added already
             if row[0] not in cve_data:
@@ -454,6 +454,7 @@ def get_cve_info(d, cve_data):
             cve_data[row[0]]["NVD-modified"] = row[5]
             cve_data[row[0]]["NVD-vector"] = row[6]
             cve_data[row[0]]["NVD-vectorString"] = row[7]
+            cve_data[row[0]]['PRODUCTS-llmGuess'] = row[8]
         cursor.close()
     conn.close()
 
@@ -544,6 +545,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["modified"] = cve_data[cve]["NVD-modified"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
+            cve_item["llmGuess"] = cve_data[cve]["PRODUCTS-llmGuess"]
         if 'status' in cve_data[cve]:
             cve_item["detail"] = cve_data[cve]["status"]
         if 'justification' in cve_data[cve]:
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3a6dc95580..3e186ad960 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -26,6 +26,42 @@ CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 
+CVE_CHECK_USE_LLM ?= "0"     
+CVE_CHECK_LLM_ENDPOINT ?= "http://localhost:11434/api/generate"
+CVE_CHECK_LLM_MODEL ?= "llama3.1:8b"
+
+CVE_CHECK_LLM_PROMPT = "Based on a given CVE (Common Vulnerability and Exposures) \
+description and related reference URLs try to determine the correct CPE (Common Platform Enumeration) \
+value that is associated with the CVE, and also the first and last version \
+numbers that is affected by the vulnerability. The CPE id should have the \
+following format: "cpe:2.3:a:VENDOR:PRODUCT:*:*:*:*:*:*:*:*". You must substitute only the VENDOR and \
+PRODUCT placeholders in the mentioned CPE template. Pay attention to the number of asterisks at the end. \
+In case a CPE ID can be derived, the template MUST NOT be changed otherwise beside the placeholders. \
+Primarily use the CVE description to derive the VENDOR and PRODUCT details, but in case it is insuffient, \
+use the given reference URLs. The domain name frequently contains the product name and the vendor. In case one or \
+more details cannot be derived from the description, return "N/A" for these details. \
+You must respond with ONLY valid JSON. Do not include any explanation, formatting nor text outside \
+the JSON structure. It is imperative not to change the next mentioned JSON schema in your response, \
+the keys must remain intact. In case you are not able to determine any details, just set it to "N/A" \
+in the response. Your response MUST be a single JSON object with the following format: \
+{'CPE_ID': 'string - the CPE identifier', 'FIRST_VERSION': 'string - first vulnerable version', 'LAST_VERSION': 'string - last vulnerable version'} \
+\n\
+CRITICAL:  Do NOT change any of the keys in the above JSON schema, all keys MUST remain as \
+specified above. Especially CPE_ID key must be kept. \
+The CVE description is enclosed below the 'CVE descripton START' and \
+'CVE description END' lines. Everything between these lines are part of \
+the CVE description to process. The reference urls can be found between the 'CVE URLS START' \
+and 'CVE URLS END' lines. Each line contains one reference URL. \
+\n\n\
+CVE description START \
+\n%s\n\
+CVE description END \
+\n\
+CVE URLS START \
+\n%s\
+CVE_URLS END \
+"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -219,12 +255,12 @@ def initialize_db(conn):
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
+            VERSION_END TEXT, OPERATOR_END TEXT, LLM_GUESS INTEGER)")
         c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID);")
 
         c.close()
 
-def parse_node_and_insert(conn, node, cveId, is_nvd):
+def parse_node_and_insert(conn, node, cveId, is_nvd, llm_guess=0):
     # Parse children node if needed
     for child in node.get('children', ()):
         parse_node_and_insert(conn, child, cveId, is_nvd)
@@ -256,10 +292,10 @@ def parse_node_and_insert(conn, node, cveId, is_nvd):
 
             if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
-                yield [cveId, vendor, product, version + version_suffix, '=', '', '']
+                yield [cveId, vendor, product, version + version_suffix, '=', '', '', llm_guess]
             elif version == '-':
                 # no version information is available
-                yield [cveId, vendor, product, version, '', '', '']
+                yield [cveId, vendor, product, version, '', '', '', llm_guess]
             else:
                 # Parse start version, end version and operators
                 op_start = ''
@@ -284,13 +320,13 @@ def parse_node_and_insert(conn, node, cveId, is_nvd):
                     v_end = cpe['versionEndExcluding']
 
                 if op_start or op_end or v_start or v_end:
-                    yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                    yield [cveId, vendor, product, v_start, op_start, v_end, op_end, llm_guess]
                 else:
                     # This is no version information, expressed differently.
                     # Save processing by representing as -.
-                    yield [cveId, vendor, product, '-', '', '', '']
+                    yield [cveId, vendor, product, '-', '', '', '', llm_guess]
 
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator(is_nvd)).close()
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)", cpe_generator(is_nvd)).close()
 
 def update_db_nvdjson(conn, jsondata):
     import json
@@ -338,17 +374,97 @@ def get_metric_entry(metric):
         return secondaries[0]
     return None
 
-def update_db_fkie(conn, jsondata):
+def guess_missing_configuration(elt, d):
+    import requests
+    import json
+    cve_description = elt['descriptions'][0]['value']
+    cve_id = elt['id']
+    bb.note('Using LLM to guess cpe for %s' % cve_id)
+
+    # Skip CPE-less kernel CVEs
+    if cve_description.startswith("In the Linux kernel, the following vulnerability has been resolved"):
+        bb.note("Kernel CVE, skipping")
+        return False
+
+    cve_ref_urls = ""
+    for ref in elt['references']:
+        cve_ref_urls += "\n" + ref['url']
+
+    llm_prompt = d.getVar('CVE_CHECK_LLM_PROMPT') % (cve_description, cve_ref_urls)
+    payload = {'model': d.getVar('CVE_CHECK_LLM_MODEL'), 'stream': False, 'prompt': llm_prompt, 'format': 'json'}
+
+    try:
+        response = requests.post(d.getVar('CVE_CHECK_LLM_ENDPOINT'), json=payload) 
+        response = response.json()['response']
+        response = json.loads(response)
+    except Exception as e:
+        bb.warn('Could not connect to LLM. Check logs for more details')
+        bb.note('Exception during LLM request: %s' % e)
+        return False
+
+    bb.note('Parsed LLM response: %s' % response)
+
+    if 'CPE_ID' not in response or response['CPE_ID'].upper() == 'N/A':
+        bb.note('Unknown CPE or hallucinated JSON schema')
+        return False
+
+    cpe = response['CPE_ID'].replace(' ', '').lower()
+
+    # tolerate one missing asterisk
+    if not cpe.endswith(':*:*:*:*:*:*:*:*') and cpe.endswith(':*:*:*:*:*:*:*'):
+        cpe += ":*"
+
+    if not cpe.startswith('cpe:2.3:a:') or not cpe.endswith(':*:*:*:*:*:*:*:*') or '\\' in cpe:
+        bb.note('Malformed CPE id')
+        return False
+
+    if any('\ud800' <= c <= '\udfff' for c in cpe):
+        bb.note('Invalid character in CPE id')
+        return False
+
+    elt['configurations'] = [{'nodes': []}]
+    elt['configurations'][0]['nodes'].append({'operator': 'OR', 'negate': False, 'cpeMatch': []})
+    elt['configurations'][0]['nodes'][0]['cpeMatch'].append({'vulnerable': True, 'criteria': cpe})
+
+    if 'FIRST_VERSION' in response and response['FIRST_VERSION'].upper() != 'N/A':
+        first_version = response['FIRST_VERSION']
+        elt['configurations'][0]['nodes'][0]['cpeMatch'][0]['versionStartIncluding'] = first_version
+    elif 'FIRST_VERSION' not in response:
+        bb.note('FIRST_VERSION key is missing from LLM response: %s' % cve_id)
+
+    if 'LAST_VERSION' in response and response['LAST_VERSION'].upper() != 'N/A':
+        last_version = response['LAST_VERSION']
+        elt['configurations'][0]['nodes'][0]['cpeMatch'][0]['versionEndIncluding'] = last_version
+    elif 'LAST_VERSION' not in response:
+        bb.note('LAST_VERSION key is missing from LLM response: %s' % cve_id)
+
+    return True
+
+def update_db_fkie(conn, jsondata, d):
     import json
     root = json.loads(jsondata)
 
+    use_llm = d.getVar('CVE_CHECK_USE_LLM')
+
     for elt in root['cve_items']:
+        llm_guess = 0;
         if 'vulnStatus' not in elt or elt['vulnStatus'] == 'Rejected':
             continue
 
-        if 'configurations' not in elt:
+        if 'configurations' not in elt and use_llm == '0':
+            continue
+
+        # ignore old CVEs without CPE. This is not a scientific decision, simply
+        # llm calls are heavy (at the time of writing this comment)
+        if 'configurations' not in elt and not elt['id'].startswith('CVE-2025-'):
             continue
 
+        if 'configurations' not in elt:
+            llm_guess = 1
+            guess_result = guess_missing_configuration(elt, d)
+            if not guess_result:
+                continue
+
         accessVector = None
         vectorString = None
         cvssv2 = 0.0
@@ -403,11 +519,11 @@ def update_db_fkie(conn, jsondata):
         for config in elt['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
             for node in config.get("nodes") or []:
-                parse_node_and_insert(conn, node, cveId, False)
+                parse_node_and_insert(conn, node, cveId, False, llm_guess)
 
 def update_db(d, conn, jsondata):
     if (d.getVar("NVD_DB_VERSION") == "FKIE"):
-        return update_db_fkie(conn, jsondata)
+        return update_db_fkie(conn, jsondata, d)
     else:
         return update_db_nvdjson(conn, jsondata)
 

