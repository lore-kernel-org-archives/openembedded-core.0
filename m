Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4BC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.8297.1662560448885136595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZBXlsThA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id y136so9843386pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ZbQ6RALgq7wRyxNzu2d371dcejw15G6fqBKHXtufUXQ=;
        b=ZBXlsThAYmWiIb1XJFo7TvkdbZtKdjMoQ2afHIDTwcNoxLqWGjUbDSU2GQ3X8IF/qb
         kreX4vPPe0AWFLVwWkPdgbVzkUdpyegyno+iJ+vcXS24rvzOHhlQw4lf4XwdybR0+Qcr
         YvY6Mt8MPyycFNxhZ3i8pN7dp5GZdzb+1DeWDy5a13bHflsTjqTg6l//Wr/DSWNDyLBN
         NQOcB0gR4Xog+AmqrPsPEtAKvyKL+058t/DbnulHL+h2dQVFKLLCK02lyBAj51GSXHTe
         e57LfsZDzjnfa6Nj5KfbY7DltSZSbypK5fwU4ZbaBfjAth2ywKqFM/j9gK0YjX4QmaR4
         O9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZbQ6RALgq7wRyxNzu2d371dcejw15G6fqBKHXtufUXQ=;
        b=XVGr/sPx4HeSXKSAmQfb536HkSU6QzHJ77WDzU8Ot+X6W8tr5EaywVXuurkNfZpJ7v
         wgHK4dRxG6P58aSj8El41JHv9OuYYQDDEAjKDvBBH2Ryh5apMm1zxmvY6164FboY0T4x
         tkH5fUJwHHvEUmSKzN6f8OpFVmcfj77CEifEY+0ur1Jz2orqP0QVQd835RMCgM+wkpBn
         GQw3lpUg1IjZ7mwgHVktBMFCERZor0Vd32+mNGnOcpLUSZ+SElpdVjqIAwTNpIe4EpZI
         lthcQcFzp//mDpHE27DY4tHHzT6mn4m+39Letqv8xH+UMQMw8ngbvxqp2ma1xhf/IiYh
         loQQ==
X-Gm-Message-State: ACgBeo0bhChzpmJ/pSkaDCYSQWp6uotxclkZIc7pKvzjTvlSHDU/jtLf
	xYedp1xNIHGcVwXL1UGGnpcmi80SiUn74FHf
X-Google-Smtp-Source: 
 AA6agR5tAKx4+plhoH4HyadBiqwbYXLmjBRPvMsLjpZpFYQMjbWh9rXgEgHCsiLWCBZUtT9w4D12zA==
X-Received: by 2002:a63:cc51:0:b0:41f:12f5:675b with SMTP id
 q17-20020a63cc51000000b0041f12f5675bmr3534613pgi.69.1662560447809;
        Wed, 07 Sep 2022 07:20:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/24] cve-check: close cursors as soon as
 possible
Date: Wed,  7 Sep 2022 04:20:06 -1000
Message-Id: 
 <90917cadeb7201e56c74294e9156fe899d5455d7.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170400

From: Ross Burton <ross.burton@arm.com>

We can have multiple processes reading the database at the same time, and
cursors only release their locks when they're garbage collected.

This might be the cause of random sqlite errors on the autobuilder, so
explicitly close the cursors when we're done with them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 5d2e90e4a58217a943ec21140bc2ecdd4357a98a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                | 13 +++--
 .../recipes-core/meta/cve-update-db-native.bb | 51 ++++++++++---------
 2 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b751c986ef..16466586a7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -291,7 +291,8 @@ def check_cves(d, patched_cves):
             vendor = "%"
 
         # Find all relevant CVE IDs.
-        for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
+        cve_cursor = conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor))
+        for cverow in cve_cursor:
             cve = cverow[0]
 
             if cve in cve_ignore:
@@ -310,7 +311,8 @@ def check_cves(d, patched_cves):
             vulnerable = False
             ignored = False
 
-            for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
+            product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
+            for row in product_cursor:
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
                 if cve in cve_ignore:
@@ -354,10 +356,12 @@ def check_cves(d, patched_cves):
                         bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
                         cves_unpatched.append(cve)
                     break
+            product_cursor.close()
 
             if not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
                 patched_cves.add(cve)
+        cve_cursor.close()
 
         if not cves_in_product:
             bb.note("No CVE records found for product %s, pn %s" % (product, pn))
@@ -382,14 +386,15 @@ def get_cve_info(d, cves):
     conn = sqlite3.connect(db_file, uri=True)
 
     for cve in cves:
-        for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
+        cursor = conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,))
+        for row in cursor:
             cve_data[row[0]] = {}
             cve_data[row[0]]["summary"] = row[1]
             cve_data[row[0]]["scorev2"] = row[2]
             cve_data[row[0]]["scorev3"] = row[3]
             cve_data[row[0]]["modified"] = row[4]
             cve_data[row[0]]["vector"] = row[5]
-
+        cursor.close()
     conn.close()
     return cve_data
 
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 18af89b53e..944243fce9 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -66,9 +66,7 @@ python do_fetch() {
 
     # Connect to database
     conn = sqlite3.connect(db_file)
-    c = conn.cursor()
-
-    initialize_db(c)
+    initialize_db(conn)
 
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
@@ -98,19 +96,21 @@ python do_fetch() {
                     return
 
             # Compare with current db last modified date
-            c.execute("select DATE from META where YEAR = ?", (year,))
-            meta = c.fetchone()
+            cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
+            meta = cursor.fetchone()
+            cursor.close()
+
             if not meta or meta[0] != last_modified:
                 bb.debug(2, "Updating entries")
                 # Clear products table entries corresponding to current year
-                c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
+                conn.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,)).close()
 
                 # Update db with current year json file
                 try:
                     response = urllib.request.urlopen(json_url)
                     if response:
-                        update_db(c, gzip.decompress(response.read()).decode('utf-8'))
-                    c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+                        update_db(conn, gzip.decompress(response.read()).decode('utf-8'))
+                    conn.execute("insert or replace into META values (?, ?)", [year, last_modified]).close()
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
@@ -129,21 +129,26 @@ do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_fetch[file-checksums] = ""
 do_fetch[vardeps] = ""
 
-def initialize_db(c):
-    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+def initialize_db(conn):
+    with conn:
+        c = conn.cursor()
+
+        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
 
-    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
+            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
+            VERSION_END TEXT, OPERATOR_END TEXT)")
+        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID);")
 
-    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
-        VERSION_END TEXT, OPERATOR_END TEXT)")
-    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID);")
+        c.close()
 
-def parse_node_and_insert(c, node, cveId):
+def parse_node_and_insert(conn, node, cveId):
     # Parse children node if needed
     for child in node.get('children', ()):
-        parse_node_and_insert(c, child, cveId)
+        parse_node_and_insert(conn, child, cveId)
 
     def cpe_generator():
         for cpe in node.get('cpe_match', ()):
@@ -200,9 +205,9 @@ def parse_node_and_insert(c, node, cveId):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
 
-    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator()).close()
 
-def update_db(c, jsondata):
+def update_db(conn, jsondata):
     import json
     root = json.loads(jsondata)
 
@@ -226,12 +231,12 @@ def update_db(c, jsondata):
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
 
-        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
 
         configurations = elt['configurations']['nodes']
         for config in configurations:
-            parse_node_and_insert(c, config, cveId)
+            parse_node_and_insert(conn, config, cveId)
 
 
 do_fetch[nostamp] = "1"
-- 
2.25.1


