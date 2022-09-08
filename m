Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233F2ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:29:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.713.1662604173541267808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A2OSiPT9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id l10so3188066plb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=CYzi4rd7PTjcuhBd0RbDN36p0giOrfOkrEJPYwUSL8I=;
        b=A2OSiPT9EYAzkS+7+ZAZzM3VzgMlfxp1WGTd6TG+/TYmLoKWNumlQ4/Beo5AfK/aAP
         ELlpkFMMuTjBg8O/H2c0/huX+ptm43qyYnWrqvKluT0o5Od6cVs0R6DRyOAQv+/CzsTg
         XUurfUEj1hfWT+l+7lxAFdfrF7NTXFmxHkhnWkEUToYaD00ptVh47KNrE8/l3RnxHgyV
         dDLCUyGojZcxcsKos/nibAsR9597uA3yhiVaX5NgJz1E/0nMmTt1bpPm5SwzqH4iwYb3
         BDie0fEYKWJu2O+ONeFsX5kytbBjG8HC/7HKggxKxmLVaq1+laxqmDlSvfmUzIXWfR4A
         hOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CYzi4rd7PTjcuhBd0RbDN36p0giOrfOkrEJPYwUSL8I=;
        b=rZjILNfmB/bMgUkSyl+YO7DbKlp5QtQpkQ0RFwotWxXmcYUyh4AfiWgg7GLi77HRK4
         IUSlhy0TUsQGlEka7Gq8lFlJ1KpdnNL8VF7WqwTPtJIkuPSgdlWIdYjYtgx5JZNII7gN
         gRnbGij6GeXkglwX4W4s4fbrd6zqNL5HOlhUVp4abOf0W7sWMQOGBUUlPp6gTMKMCnOD
         X9Doe348JOkJiV0pnKUlnLv+z5svU20e9UCyDlGfWDf/tD035ihSrk8qd3594lrHeHaM
         8bt7bd6+1+k4UApFEgnOPdZyoVu1/mGCcq15lfDtSzrYsoZbndNTrgtqEHh7bx9XNz8D
         zyAA==
X-Gm-Message-State: ACgBeo3DdRJBwfHGK3eq3zr7VN10sEh+RQaiNZy36hROe4uVW8ALv5Sl
	lgdJo15lq0Kf271EMaqiGtvZKzEniYEFq0tx
X-Google-Smtp-Source: 
 AA6agR6s7fYBI0Dx2fQjzkRXHBFsQpE4U9jopZcb+3E5s6pRTJtOMTVzC2VukpbicV8qWD9LuwjgZw==
X-Received: by 2002:a17:90a:5b0d:b0:1fe:3769:5fb8 with SMTP id
 o13-20020a17090a5b0d00b001fe37695fb8mr1724249pji.152.1662604172400;
        Wed, 07 Sep 2022 19:29:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:29:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] cve-check: close cursors as soon as possible
Date: Wed,  7 Sep 2022 16:28:31 -1000
Message-Id: 
 <48742ddf4d0acd419c8ffb8f22124ed525efc2d9.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170445

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
index c0d4e2a972..4fc4e545e4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -290,7 +290,8 @@ def check_cves(d, patched_cves):
             vendor = "%"
 
         # Find all relevant CVE IDs.
-        for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
+        cve_cursor = conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor))
+        for cverow in cve_cursor:
             cve = cverow[0]
 
             if cve in cve_whitelist:
@@ -309,7 +310,8 @@ def check_cves(d, patched_cves):
             vulnerable = False
             ignored = False
 
-            for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
+            product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
+            for row in product_cursor:
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
                 if cve in cve_whitelist:
@@ -353,10 +355,12 @@ def check_cves(d, patched_cves):
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
@@ -378,14 +382,15 @@ def get_cve_info(d, cves):
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
index a49f446a53..85874ead01 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -65,9 +65,7 @@ python do_fetch() {
 
     # Connect to database
     conn = sqlite3.connect(db_file)
-    c = conn.cursor()
-
-    initialize_db(c)
+    initialize_db(conn)
 
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
@@ -96,18 +94,20 @@ python do_fetch() {
                     return
 
             # Compare with current db last modified date
-            c.execute("select DATE from META where YEAR = ?", (year,))
-            meta = c.fetchone()
+            cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
+            meta = cursor.fetchone()
+            cursor.close()
+
             if not meta or meta[0] != last_modified:
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
@@ -125,21 +125,26 @@ do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
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
@@ -196,9 +201,9 @@ def parse_node_and_insert(c, node, cveId):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
 
-    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator()).close()
 
-def update_db(c, jsondata):
+def update_db(conn, jsondata):
     import json
     root = json.loads(jsondata)
 
@@ -222,12 +227,12 @@ def update_db(c, jsondata):
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


