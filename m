Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id A8CF37FDC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:23 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id q127so3963649pga.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lVCLDTPb0GFJoEWDw+Gg93KUJz04qQroZhCJYvxuk0E=;
	b=sWuilZB8F0LS6JkHR2J1gr3jonJfTHDzARzpPkr4nKd5/OU7yLLFAiNSYhpgC1+/gf
	pcbGm3v/L7LrCXfYblFujPm0EWFlCUuKnZcxSse5Vb2vnvGhnxy+ELKgDhqZGDudT4Ka
	jc6W1TQD6LenGjy/NM+G0ynEPXfJsPTlVGk/zLTe+DMsMuGcllHoYdzd81QBg2PcN5t7
	BuyXvHnbgW87PpGb/bZhXvPI/tGKcrcBFFS7XooNMWdiJaun41LLdmd6RRfMNpHu3Bm+
	Qa+IQyHN2JNVtLhlZuVcF83xVu52sj4ZrTUgnVcrvM0dYv1zZRYgm5VPY5b6+76OAB7Q
	SfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lVCLDTPb0GFJoEWDw+Gg93KUJz04qQroZhCJYvxuk0E=;
	b=h9OmJcLkCes7X/TtucwE7lHOHH+CFImMCpvHtmV2QJVS5yOtXfW5v8xqjwx7k+xXJ3
	WfITjuR6qoni3T5kTIOtHfWhn+8/vsFEbbeY1rIAbw4CfW1ZalaiKm/mDaZ51pv1uL7R
	IR4ox3CCiU3e1iWXekQxRkPlTtkwHAvfTGba0Yaq+xchDfyCwNr5jxyLKTuqljMZf5xf
	3V4i9mIDdTWeQJd1e33NOesAcqALoKdph21Z7XB0of2/xvMAjKI/p8wi+dKACrMROOST
	jvQSDok+ODJewc7HadwemZlRx2QfPNckp5X43fF/cIrbEbHirRe7bJBv4nTdwB5f7/Nz
	+fhg==
X-Gm-Message-State: APjAAAUhvpjs7WpgzfrpdWP1+n7SfZ8tpwbypBwPPUGWV+Wlr808Cnr6
	E/6UjzdQCEvDelxboQHAOVSGjM865UA=
X-Google-Smtp-Source: APXvYqybV0uRghdntqdoEhmUZACWW/We0Hky6MCXFL1bngOe5FEf+zTp9PsPvl0O16A7C5FykO+7Hg==
X-Received: by 2002:a63:f64a:: with SMTP id u10mr18666101pgj.16.1576512024590; 
	Mon, 16 Dec 2019 08:00:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:03 -0800
Message-Id: <aa197b91e1770925ae1a31ee7334b593bfcdc9e3.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 13/18] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:23 -0000

From: Ross Burton <ross.burton@intel.com>

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

(From OE-Core rev: 6b73004668b3b71c9c38814b79fbb58c893ed434)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


