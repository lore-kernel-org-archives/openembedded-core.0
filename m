Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id D035E7F8C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q15so7538138wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GJwE60olmB34OdDBRJlGoCyRwjwAxCOyFJr0nPQzq5w=;
	b=a9A7/QocVtg879NJKdPegUY0gnzkRYFWwRie6EYfN2NAMwPZlz/tjeVp7AEF4ahZsO
	aeOxF8h0AB60ili0SopVqVCkgO/dnh4Y8RNkrG3BjGEcQ/FYE9hVw6PhlkFPDGuTkpkN
	dsEuGmAp4qfpIkLB3rNg+L1j1p7gDYlGTP0BfSzx9Je5K0S52TqjJU8M7MWp/F/LZ/Wq
	pleXYav2mVvBjQUvZvMB1V6cCH0TITj/u8FLD49a2ZfpaU6kH35Yr0WsgaxcXSTLx1Fa
	uMNl4BSGHDaA1rC2BomBmuOIARXLqQ3d5XMV7vTwO/H6J3hAylOJlNFYB+9eQGQWz28v
	UK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GJwE60olmB34OdDBRJlGoCyRwjwAxCOyFJr0nPQzq5w=;
	b=kqajzjLsmhsZXQwX0r1e+qxKn3NHgp45Cy+itd3G2G/2REakGaz/aKdME4jCZmCu89
	thUWx2UnpNhmoWZA43vIRqWwuhIQsFKD+kl4kO6uaGfJeUi+kQfdLS6hKopbqat0/n75
	poGtEI770nLmSoDq7l38GdlwLevkOpP6jtvYuLh+b4PydYawqf39bIqdF6Jx6VjieHa0
	KutWL1ZD36Q/pgH8sCXp3E2pgD4DswUQBmMQUBviaQhiRvo8pFY+ShIE5k/nCyhvvMdu
	Id7FZE+pzcs8LNYjSGO8MTXjubO9EQY6PSWkWF8p8wu1U+oVh3YKPoWroisevDjXB1/A
	A+gw==
X-Gm-Message-State: APjAAAVxAykgZyyxvdeSVo5Xgt7l+WeAzmpkLdSR3e5uLCAB6okKEILN
	r5nKHkr2IYvC7TMjFEjfRemtM0lMPno=
X-Google-Smtp-Source: APXvYqyIgXAnrCdrV/HtinyZWYqEEB/IvC1invUCRmPXYMzCLlptKC4S4AHB49FdHkmxAE5oaLWZGg==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr17032533wrm.4.1574095615155; 
	Mon, 18 Nov 2019 08:46:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:44 +0000
Message-Id: <20191118164647.29409-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
References: <20191118164647.29409-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:55 -0000
Content-Transfer-Encoding: 8bit

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 31 +++----------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 08b18f064f0..db1d69a28e5 100644
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


