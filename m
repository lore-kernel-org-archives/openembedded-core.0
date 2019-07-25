Return-Path: <chin.huat.ang@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D79F27DDA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 02:03:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 19:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="345285504"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 24 Jul 2019 19:03:48 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jul 2019 10:01:20 +0800
Message-Id: <1564020080-62476-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cve-update-db-native: fix https proxy issues
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
X-List-Received-Date: Thu, 25 Jul 2019 02:03:50 -0000

When https_proxy is set, use proxy opener to open CVE metadata and
database URLs, otherwise fallback to the urllib.request.urlopen.

Also fix a minor issue where the json database which has been gzip
decompressed as byte object should be decoded as utf-8 string as
expected by update_db.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 41 +++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9c083bd..2c427a5 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -22,7 +22,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib, shutil, gzip
+    import sqlite3, urllib, urllib.parse, shutil, gzip
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -32,6 +32,16 @@ python do_populate_cve_db() {
     db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
     proxy = d.getVar("https_proxy")
+
+    if proxy:
+        # instantiate an opener but do not install it as the global
+        # opener unless if we're really sure it's applicable for all
+        # urllib requests
+        proxy_handler = urllib.request.ProxyHandler({'https': proxy})
+        proxy_opener = urllib.request.build_opener(proxy_handler)
+    else:
+        proxy_opener = None
+
     cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
     if not os.path.isdir(db_dir):
@@ -49,11 +59,17 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        req = urllib.request.Request(meta_url)
-        if proxy:
-            req.set_proxy(proxy, 'https')
-        with urllib.request.urlopen(req) as r:
-            for l in r.read().decode("utf-8").splitlines():
+
+        response = None
+
+        if proxy_opener:
+            response = proxy_opener.open(meta_url)
+        else:
+            req = urllib.request.Request(meta_url)
+            response = urllib.request.urlopen(req)
+
+        if response:
+            for l in response.read().decode("utf-8").splitlines():
                 key, value = l.split(":", 1)
                 if key == "lastModifiedDate":
                     last_modified = value
@@ -71,11 +87,14 @@ python do_populate_cve_db() {
 
             # Update db with current year json file
             try:
-                req = urllib.request.Request(json_url)
-                if proxy:
-                    req.set_proxy(proxy, 'https')
-                with urllib.request.urlopen(req) as r:
-                    update_db(c, gzip.decompress(r.read()))
+                if proxy_opener:
+                    response = proxy_opener.open(json_url)
+                else:
+                    req = urllib.request.Request(json_url)
+                    response = urllib.request.urlopen(req)
+
+                if response:
+                    update_db(c, gzip.decompress(response.read()).decode('utf-8'))
                 c.execute("insert or replace into META values (?, ?)", [year, last_modified])
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-- 
2.7.4


