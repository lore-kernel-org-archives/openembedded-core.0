Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net
	[83.102.40.154])
	by mail.openembedded.org (Postfix) with ESMTP id DE9557F849
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 9C3EF14E51;
	Sun,  8 Dec 2019 20:40:56 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id Pu3TWmUkL8zn; Sun,  8 Dec 2019 20:40:56 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 11144149A7;
	Sun,  8 Dec 2019 20:40:56 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 1A15F89;
	Sun,  8 Dec 2019 20:40:50 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:54 +0200
Message-Id: <20191208183557.32589-8-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 08/11] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Sun, 08 Dec 2019 18:40:56 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

(From OE-Core rev: 6b73004668b3b71c9c38814b79fbb58c893ed434)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.20.1


