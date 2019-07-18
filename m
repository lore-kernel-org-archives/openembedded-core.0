Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 01DBF7EF49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:41:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v19so25558397wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6RiuY8Jl/ZSCMVWBnvHnn8Vi5ets9xvk+5ObvDABzb4=;
	b=ROqMkC2POTLOAx1hynp2niEujdS83MQ6pd7AoXYFMmfNaZHwKLlQZoeUKJK87CsBoM
	SK2CTcttC1pmKDQhQa+0ZpL30eBrb/RQC60+i5xIdDV/XauS+4cVMlZwiVwT2ksDyMWp
	92Qu4c96G9vlcM4yLymeD2ACSlIuM6CqXUnBAOq928vUoP88IlFHPWo08PF6EI3CwlF2
	QxpP5bJYGRxKpGYGNBYLlVC+8cjYv57/C5YLwbxb9LoAP0HUqoyEk2WMmD8kPyetF2CL
	OznJ03T3qrlaFMUAoDDeM8ijD2EYonwgY0SjtLvBDoQmmRVrD77/PZFBl8KTig/ycCtY
	3y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6RiuY8Jl/ZSCMVWBnvHnn8Vi5ets9xvk+5ObvDABzb4=;
	b=Ms47uchUFYmE3rNXBZ75vdyDzO0yO9iOIT1L6Up8gPONnC/R6cTxGdmFdLHRyIdOyX
	qw+gK33ReepCoLAfcNt4r/2yQQZA8RYWzxRwOq4VM10pEfn5qi9X6SkPm2uWfEFPGf/C
	gvzWYw8Q2r5iRx1pdkrKzbHAKFU/+7DY5/25dWl6hwGOxhwj9/kuFoY4PXR+gWqEf/l8
	sY9Wqc+K+4qlO0QKvdOHpXPp19p+EYp558LMryZVbF+tVQZzbGBxdIyIo2S+aog8O+Tr
	kD/ORFY2pUsEf0+qKg9KJj038PBdV2dbH5PQVGz2PdD86NBTgYMmFtmvkiNiCVHskU94
	PwSA==
X-Gm-Message-State: APjAAAXDr2l/gvigCLbRjzepXGM9nEi+ak+aCw7WHRryLRPW6wUb547l
	6GzDG4nmacBcMQnkmgXSzFkpYrlo
X-Google-Smtp-Source: APXvYqznU8IRoKqaA9cqA4EOnv5mW6E5pxzf5BX614V0msUew1OyVGOUqkNu6LxckmQNFrudFkgusQ==
X-Received: by 2002:a1c:a5c2:: with SMTP id
	o185mr41601490wme.172.1563453702371; 
	Thu, 18 Jul 2019 05:41:42 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id c1sm52715645wrh.1.2019.07.18.05.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 05:41:41 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 14:41:19 +0200
Message-Id: <20190718124119.991-2-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190718124119.991-1-lemagoup@gmail.com>
References: <20190718124119.991-1-lemagoup@gmail.com>
Subject: [PATCH 2/2] cve-update-db-native: Remove hash column from database.
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
X-List-Received-Date: Thu, 18 Jul 2019 12:41:42 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

djb2 hash algorithm was found to do collisions, so the database was
sometime missing data. Remove this hash mechanism, clear and populate
elements from scratch in PRODUCTS table if the current year needs an
update.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass                 | 12 ++++++------
 meta/recipes-core/meta/cve-update-db-native.bb | 21 +++++++--------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 512d4c7302..c00d2910be 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -200,11 +200,11 @@ def check_cves(d, patched_cves):
             c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
 
         for row in c:
-            cve = row[1]
-            version_start = row[4]
-            operator_start = row[5]
-            version_end = row[6]
-            operator_end = row[7]
+            cve = row[0]
+            version_start = row[3]
+            operator_start = row[4]
+            version_end = row[5]
+            operator_end = row[6]
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 72d1f48835..3519beae5f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -30,7 +30,7 @@ python do_populate_cve_db() {
     YEAR_START = 2002
 
     db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
-    db_file = db_dir + '/nvdcve.db'
+    db_file = db_dir + '/nvdcve_1.0.db'
     json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
     cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
@@ -65,6 +65,10 @@ python do_populate_cve_db() {
         c.execute("select DATE from META where YEAR = ?", (year,))
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
+            # Clear products table entries corresponding to current year
+            cve_year = 'CVE-' + str(year) + '%'
+            c.execute("delete from PRODUCTS where ID like ?", (cve_year,))
+
             # Update db with current year json file
             req = urllib.request.Request(json_url)
             if proxy:
@@ -91,27 +95,16 @@ python do_populate_cve_db() {
     conn.close()
 }
 
-# DJB2 hash algorithm
-def hash_djb2(s):
-    hash = 5381
-    for x in s:
-        hash = (( hash << 5) + hash) + ord(x)
-
-    return hash & 0xFFFFFFFF
-
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
     c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
         SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
-    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
+    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
         VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
         VERSION_END TEXT, OPERATOR_END TEXT)")
 
 def insert_elt(c, db_values):
-    product_str = db_values[0] + db_values[1] + db_values[2] + db_values[3]
-    hashstr = hash_djb2(product_str)
-    db_values.insert(0, hashstr)
-    query = "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)"
+    query = "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
     c.execute(query, db_values)
 
 def parse_node_and_insert(c, node, cveId):
-- 
2.11.0


