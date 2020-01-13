Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id D83687FCF4
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id ay11so3961191plb.0
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fdgIABh6eDkhKaxXukW8ckFwM0/Y1xHWb/SQUdHXNPo=;
	b=G+h1gnZd3gvmtIXn06cjQnsArRho5Z5szoKIA3L3TEZrQObo8/vANzz079oJCVYC5J
	yhTMAG4xbow18+Y6+MqHjPPz8AYDcDNbOHNKkSeykS7L5Yk1HRZ0yMlR8AUnNPoca2VC
	62rG1xeSWAFJPR7/EuFEMPAoAPAOAwSFV8PtmfhrJtjTq/8c6iZz2j5k569FTKEFVlwM
	0iMUBnQSVyhIy/yeZpYVgrPVyWfUTOULCRUASWRMhMvv/j+zZ0MgoqwqYuG5Uug8Eqzj
	gaJJSpnUnhF78JyY7mpuxn9/lno7B2q/2BmxLjTFKGsSX1+fmDqoqtFTmXX5/lwneQIL
	5g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fdgIABh6eDkhKaxXukW8ckFwM0/Y1xHWb/SQUdHXNPo=;
	b=DEmy01LaG+nQWnlG7KsfYlGUpJpd86fn1cEgtsJ+XDsXaRzYlJDanzvWJWaOYprEWM
	XZZmjcuwCkKChgKDeidRVVn6sUUwoDP9j3sQmoNqT2iK4UiV0CGA+A3QplA2UEfmjbVX
	MlOYAhO3kLAEFLCIqHWj3yb1B8s1xQWEbwyLUA8VIMs2F1T9bY8RbOwIU3hL4d6PsTYK
	Dau0X4PbLb1vEDMsSfGiZIXdz28FQ1yafZ+rBUuMge0u3qIgl/w53xxyc4I2nkaFzDRH
	Z/aggEI9VkDzA5aQnUMcOJZwIfTAuG9YO5rCz7EJ0hHmEnCdvXgdJ6oCVFGENZgOi1fV
	zjZw==
X-Gm-Message-State: APjAAAWPv9JVoR0oernWxY5T8L900vZrpJszoWcUXKPwriubIkkw1PUH
	fwVMHBT+LoeeWdHFDlKbk9HfukcC
X-Google-Smtp-Source: APXvYqzP+J5P4Jl/InzZTleI3jswHahylx2+0bEDnOTaAwG/UwcF1SxKc6gxU4KGiUHYPxoUXv+tuA==
X-Received: by 2002:a17:90a:974b:: with SMTP id
	i11mr22699743pjw.47.1578929455810; 
	Mon, 13 Jan 2020 07:30:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:19 -0800
Message-Id: <2ddf1c0bc4267d38069f9dbb0f716fdac29a49a9.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 20/28] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:55 -0000

From: Ross Burton <ross.burton@intel.com>

urllib handles adding proxy handlers if the proxies are set in the environment,
so call bb.utils.export_proxies() to do that and remove the manual setup.

(From OE-Core rev: 6b73004668b3b71c9c38814b79fbb58c893ed434)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1


