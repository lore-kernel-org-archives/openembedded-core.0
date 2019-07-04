Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id B68E37EBC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 15:19:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n4so7054740wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=swPT+rrb8sQEtXmY0xDpxCOuUtgwbeKhekEfC4ylIPs=;
	b=CfJGMMyQEcNDAjRUYkdAaVB8tO8YgEZyu4Ep5OkIvgOlpE7GPFeBkiUlw4katLfZMT
	ry0pfPO8kI8l/CU3w9QmtFKL5hphBdFmvJMiZ0HfLD+8Jb0PTuu5sdL+nEqVi0V9Or7Z
	ZG9QRyHptFhx8AEidVozNxm1G7JyqQr0U21rzk5QRZYy4Epu6f+Amt20PvpQPQJSNs31
	roeO5zCf6oRfP5dYtmW4VK8A9Ms8qmv229I6Rl4/Fvl9g5w2R7QNWAzKubnWaxYv0idx
	H3S7/4mNPpdhRi+/qm3b31mUj5n5ZOa6KUpfvWImivl3FTmZg96y1FPvU0uyFmhJbPGF
	6l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=swPT+rrb8sQEtXmY0xDpxCOuUtgwbeKhekEfC4ylIPs=;
	b=FcViOhncRGd7D6wsprbIqiTzB79Jgv3RQHwEuBohPpZQSWpCdqJjboe3L8uFT2rpDX
	8JUBIop7dNOTerUsdCu/4aZrEpx+QS3CdM7vv69cLCw9Dr2fLRX4TGmcxiSCmjjLOGXY
	CW/QDzjx8xSSnaA4xX5qeOkN9D07f3knvjYKalO8lk4ldv5ldU5tnd9GjTCQYVvYGngW
	14s+7YO0gde7eGHr3biLZkQvMF8vAHz1NYXs4IKZm5Evtyqsij9G0htySU/k0PsexIm3
	IA2fCoBsvcpYDeR5brltwxHapRBgDjdyZdfZyZxi2dF3+5wTQo4kJ3YD5IdsvoG4rFES
	WsZA==
X-Gm-Message-State: APjAAAUgu5dc8R9kxpg/jSW/EaD5bMuwrPcEzSwwwl+RVVZr3yk6dB3h
	zL+s+/2K1pIMv6V0Rai8Q3iZBug/
X-Google-Smtp-Source: APXvYqzcINHK80qYo5BwzCyii0c8jDaWdGgCVL9JBeKqULN9k+eRaR5fYO7lBi1kDbb/9NueLD3urg==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr7946470wrw.266.1562253590125; 
	Thu, 04 Jul 2019 08:19:50 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	j189sm5430264wmb.48.2019.07.04.08.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 08:19:49 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 17:19:07 +0200
Message-Id: <20190704151908.5094-2-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190704151908.5094-1-lemagoup@gmail.com>
References: <20190704151908.5094-1-lemagoup@gmail.com>
Subject: [meta-oe][PATCH 2/3] cve-update-db: Use NVD CPE data to populate PRODUCTS table
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
X-List-Received-Date: Thu, 04 Jul 2019 15:19:49 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Instead of using expanded list of affected versions that is not
reliable, use the 'cpe_match' node in the 'configurations' json node.

For cve-check to correctly match affected CVE, the sqlite database need to
contain operator_start, operator_end and the corresponding versions fields.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 88 +++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 8e553b4f9b..3ba80a0d28 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
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


