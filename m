Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9CA7FC14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id o9so5600981plk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PEW7uerEPvnNb3Y5lUOTrZ9R/Ta7CAony1NFCSRNZb4=;
	b=X6bPYZfF+eSzexiEIAqna540/MeOw6WLexic5Ye8cOsn0cpdzLREJCYgxJJtqaX5d5
	XhrVVFdTfV8wIXFJMoyrx33vEKsfeXwZGTJwG9DLahlfqUXPBEPGoBlt/f2LQ6gfat9d
	NMtKFASR9TNBvR42uIfOMQcYLN9Qw7EMunGbJcYYIwr8uX16pWpINlqN8YVV7Pn2p9JN
	Y1y4NNRGyxYxKus72gyrFvprzaMkJyILKWK4YQTcl+2hqtEsiyBl/kCH+D1RLuLedmNE
	xmPPbL/2AS3KFBmupDs5KtpgjGrhrGVVaDZpax06fdzOCIRlFg/gj4GT7zBYGRV3aVt/
	BWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PEW7uerEPvnNb3Y5lUOTrZ9R/Ta7CAony1NFCSRNZb4=;
	b=WZYMxQ48pl4LCkG0JSzkPE8wkTjRRmMz/9CNoK61BKkT9cYEgji5zgZ61gKmRFVN88
	YAINUUkHH54wozdgRsLv8n0ej+8hAwVPSJMipTl4+Z0/+btqvZRzyROOHAUXhvTQ/Bcc
	21Kp5U5oxknWs7XLaVLa+OYWGuyOGGjXZwYiz8JXtHcmZZPDZvoluXKs7hHULUC235gh
	zQzX1IglZ4l/ZbZ99HIDjdvc9Q4AC7m+mlMgYwLZLegV9te6tQ8ReiqCjp9W2+mvwk8G
	910meNfXC8tR0DjqQgfWHxf5BSxnGi9XWami6pn2C0BoPJX6L+1lKFlz5MqliYJCwp19
	NjCQ==
X-Gm-Message-State: APjAAAW14ymYFulvGv7yctY7twdin5d7ZnA0CvlZ47j/E4CpORR182aR
	LyMdFh9OGN5/rrJalDnPdhZw41pq
X-Google-Smtp-Source: APXvYqznwLmC1i4eKt9hd0Igr3TC7WqlIhQHDbjh4OkV0STz8bzf6FPfHiLa7Dx12iu6P10Px7Y0BA==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id
	l15mr35172101pjq.52.1574639450249; 
	Sun, 24 Nov 2019 15:50:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:12 -0800
Message-Id: <e9569ef736a88af16f25f55074461052dea8a3d3.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 07/35] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:49 -0000

From: Ross Burton <ross.burton@intel.com>

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

(From OE-Core rev: 6b73004668b3b71c9c38814b79fbb58c893ed434)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 31 +++++---------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 08b18f0..db1d69a 100644
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
2.7.4


