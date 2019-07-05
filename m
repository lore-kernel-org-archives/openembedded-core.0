Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3207E6DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 09:41:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a15so8175962wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=beSAqx9Bv2qYWRkJ52hdCuVYdP8OxZ0EdZDy+re2SQQ=;
	b=veMx96XRR2NICpX34MEYgpBpAhT31KbnM2qqxCE+9pmdBW/DVeVQ/YUKFzDNGhBioJ
	cDavvthZuo6UL5+EglNuiRaR4eeFsVVTBCyws2QCLV9x6X5TsHvWgNPNkpoHfD3uv88R
	PQG8/9A7N2+0qSFqs+HGQ3Xqfy6FuIZMGK+uweONq3SoTaOuUC6D8NSnJt4CEGMVqgiF
	bN6OrntsFfqamwF+MZnTL+O6Ncp1slgupN5ffJq/JD2FL8Tj8VwKPgceHa0KLNMwJeiW
	slWOIx79UTBUsIzdg1UB2+qh9jWoZ5YlAgzlYgZjlBkNwI1UbV0gz+Kp+82dDxFk1/qj
	H+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=beSAqx9Bv2qYWRkJ52hdCuVYdP8OxZ0EdZDy+re2SQQ=;
	b=D2PBR3ISklJ6kjChgwjjp4aNBYjqnC6XTNTN/7mNcNksMCmyVf/oBBii3fuW0+cS4q
	g0bR9jWtw6fEF2602DBS6r/vcDdSqejZz1FeAs9b0vbvZe9sTvVKlr9wU/D92hydnExF
	8Sp7sBpl0mDWHwhXIqHcXXIwS1KdRxFKXN0pTXhEw3r7Eqz9jCKs5ZS5mJDAnbkHjMzn
	Fu/kBZVkusAW/opaVpGXlP6avJEhRzc1W9bSISaTu9SVoBbXmxul/Cz288oZRuaP3Edb
	gzQHiifEOFDuDP2ocF/qHtfJIQc261cLLe1ibrEw3d/uKEMPu9szQN8Bhc62QqoVp3dy
	yhtg==
X-Gm-Message-State: APjAAAV5hyYhNVjAJIGG3WsXbZxXe+EHVFjDQI/xjoy7UXdo+rTNs+D6
	dWI8wuOifusJPZYQDmTkFzBMyPE7
X-Google-Smtp-Source: APXvYqy+OFqcvBeoKKa7r17A0gyuByvewQAD2lRzeIfIljERfTdmH8jAjYsYLL7TIWBOy3llQ+nK0Q==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr2568997wmg.177.1562319682706;
	Fri, 05 Jul 2019 02:41:22 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id y16sm738249wrw.33.2019.07.05.02.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 02:41:21 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 11:40:37 +0200
Message-Id: <20190705094038.29377-2-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705094038.29377-1-lemagoup@gmail.com>
References: <20190705094038.29377-1-lemagoup@gmail.com>
Subject: [PATCH v2 2/3] cve-update-db: Use NVD CPE data to populate PRODUCTS table
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2019 09:41:22 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Instead of using expanded list of affected versions that is not
reliable, use the 'cpe_match' node in the 'configurations' json node.

For cve-check to correctly match affected CVE, the sqlite database need to
contain operator_start, operator_end and the corresponding versions fields.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 88 ++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index ae8f1a958b..d658c7bfea 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -25,7 +25,7 @@ python do_populate_cve_db() {
     YEAR_START = 2002
 
     db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
-    db_file = db_dir + '/nvd-json.db'
+    db_file = db_dir + '/nvdcve.db'
     json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
     cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
@@ -99,9 +99,76 @@ def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
         SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
     c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
-        VENDOR TEXT, PRODUCT TEXT, VERSION TEXT, OPERATOR TEXT)")
-    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_IDX ON PRODUCTS \
-        (PRODUCT, VERSION)")
+        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
+        VERSION_END TEXT, OPERATOR_END TEXT)")
+
+def insert_elt(c, db_values):
+    product_str = db_values[0] + db_values[1] + db_values[2] + db_values[3]
+    hashstr = hash_djb2(product_str)
+    db_values.insert(0, hashstr)
+    query = "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)"
+    c.execute(query, db_values)
+
+def parse_node_and_insert(c, node, cveId):
+    # Parse children node if needed
+    try:
+        for child in node['children']:
+            parse_node_and_insert(c, child, cveId)
+    except:
+        pass
+
+    # Exit if the cpe_match node does not exists
+    try:
+        cpe_match = node['cpe_match']
+    except:
+        return
+
+    for cpe in cpe_match:
+        if not cpe['vulnerable']:
+            return
+        cpe23 = cpe['cpe23Uri'].split(':')
+        vendor = cpe23[3]
+        product = cpe23[4]
+        version = cpe23[5]
+
+        if version != '*':
+            # Version is defined, this is a '=' match
+            db_values = [cveId, vendor, product, version, '=', '', '']
+            insert_elt(c, db_values)
+        else:
+            # Parse start version, end version and operators
+            op_start = ''
+            op_end = ''
+            v_start = ''
+            v_end = ''
+
+            try:
+                if cpe['versionStartIncluding']:
+                    op_start = '>='
+                    v_start = cpe['versionStartIncluding']
+            except:
+                pass
+            try:
+                if cpe['versionStartExcluding']:
+                    op_start = '>'
+                    v_start = cpe['versionStartExcluding']
+            except:
+                pass
+            try:
+                if cpe['versionEndIncluding']:
+                    op_end = '<='
+                    v_end = cpe['versionEndIncluding']
+            except:
+                pass
+            try:
+                if cpe['versionEndExcluding']:
+                    op_end = '<'
+                    v_end = cpe['versionEndExcluding']
+            except:
+                pass
+
+            db_values = [cveId, vendor, product, v_start, op_start, v_end, op_end]
+            insert_elt(c, db_values)
 
 def update_db(c, json_filename):
     import json
@@ -125,16 +192,9 @@ def update_db(c, json_filename):
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
 
-        for vendor in elt['cve']['affects']['vendor']['vendor_data']:
-            for product in vendor['product']['product_data']:
-                for version in product['version']['version_data']:
-                    product_str = cveId+vendor['vendor_name']+product['product_name']+version['version_value']
-                    hashstr = hash_djb2(product_str)
-                    c.execute("insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?)",
-                            [ hashstr, cveId, vendor['vendor_name'],
-                                product['product_name'], version['version_value'],
-                                version['version_affected']])
-
+        configurations = elt['configurations']['nodes']
+        for config in configurations:
+            parse_node_and_insert(c, config, cveId)
 
 
 addtask do_populate_cve_db before do_fetch
-- 
2.11.0


