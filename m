Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DE7A67FCB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485342"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:39:06 +0800
Message-Id: <d298606528e9c9c4392b4ee81996b64a27a70b9c.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574422359.git.anuj.mittal@intel.com>
References: <cover.1574422359.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 07/15] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Fri, 22 Nov 2019 11:40:27 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

(From OE-Core rev: 6b73004668b3b71c9c38814b79fbb58c893ed434)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 31 +++----------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 08b18f064f..db1d69a28e 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -21,10 +21,12 @@ python do_populate_cve_db() {
     """
     Update NVD database with json data feed
     """
-
+    import bb.utils
     import sqlite3, urllib, urllib.parse, shutil, gzip
     from datetime import date
 
+    bb.utils.export_proxies(d)
+
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
 
@@ -40,16 +42,6 @@ python do_populate_cve_db() {
     except OSError:
         pass
 
-    proxy = d.getVar("https_proxy")
-    if proxy:
-        # instantiate an opener but do not install it as the global
-        # opener unless if we're really sure it's applicable for all
-        # urllib requests
-        proxy_handler = urllib.request.ProxyHandler({'https': proxy})
-        proxy_opener = urllib.request.build_opener(proxy_handler)
-    else:
-        proxy_opener = None
-
     cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
     if not os.path.isdir(db_dir):
@@ -67,15 +59,7 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-
-        response = None
-
-        if proxy_opener:
-            response = proxy_opener.open(meta_url)
-        else:
-            req = urllib.request.Request(meta_url)
-            response = urllib.request.urlopen(req)
-
+        response = urllib.request.urlopen(meta_url)
         if response:
             for l in response.read().decode("utf-8").splitlines():
                 key, value = l.split(":", 1)
@@ -95,12 +79,7 @@ python do_populate_cve_db() {
 
             # Update db with current year json file
             try:
-                if proxy_opener:
-                    response = proxy_opener.open(json_url)
-                else:
-                    req = urllib.request.Request(json_url)
-                    response = urllib.request.urlopen(req)
-
+                response = urllib.request.urlopen(json_url)
                 if response:
                     update_db(c, gzip.decompress(response.read()).decode('utf-8'))
                 c.execute("insert or replace into META values (?, ?)", [year, last_modified])
-- 
2.21.0


