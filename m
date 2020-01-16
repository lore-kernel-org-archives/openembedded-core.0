Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id C51187FA1A
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id a33so10039420pgm.5
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fdgIABh6eDkhKaxXukW8ckFwM0/Y1xHWb/SQUdHXNPo=;
	b=hTF8Y+XpwRDQeqH068hRizLx05k2Ljg0bTKSmN2kyF7rK4M9FqzT9BLUeJ+QPc6K1/
	rdtJ+6sRCshl8YBRr12bqtu1D4RwNAuJNs0+mIowbRKsoZmsxz41gXSBxvX0UQxxzxvD
	4kFWw9qIRbvQ2EPVtm01QBLc0XL7s4tjbF0j9i2Vs4vaWYNTr111na30V5g6p/QREC6c
	FwRRH0Lyn7ubbikR1OjibAHe3fXs3JTaHQgdYUJN9yqAaJ6NUguZsLutFCfmBBKzf04Q
	sfj0tC/HFabRv260/CZp/4t2az3UFyRcauMw+hXEDNJes9yZw0n49L6iugENc1Ms2V0+
	9/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fdgIABh6eDkhKaxXukW8ckFwM0/Y1xHWb/SQUdHXNPo=;
	b=pYVZWIjuXbWZIm1UyF+VC+82/4qpavNvs4m5ALHl4twxf4CegXJTCHt4G8B4BqGtly
	/sbuSiWZj3ok9bCys3Pui/s5KeJFKaCh1jTFlHndkloxidTYZ4wv838J9rIAscjdJ8i6
	3e3p+ufBO1m8wzaUXMq5TVnwjmC4/6Wcvfyk4Vz3+UvhD6XYQ9J1heq0RJ65Un3Hf8tZ
	cu0u4NLCzEfFIQCDu/G2rFkwQloIU1d927KLTNidJwDr66+JLfoBMt66LxL/kS81movp
	xgHPKMgeHJFSm2aYgTi0Z45cFgQXhX+v/rbeN1vvOyvlDRPiDt7DG4+b4MwLMqJXD3jT
	mOcA==
X-Gm-Message-State: APjAAAUg+O5PmJGUfWGKjo1JedEADXCUzpO7w2/SB8YIY3ImYLEHMj2w
	bD66B0LWXBbMQzmdU1dO8y/5Mwvq
X-Google-Smtp-Source: APXvYqxkvoVP5iHvr0Wh0Icqmi2L5j1qYFwBabdvmaZqKpOUZtd12dQw/lTnfVUKn4tjhuwZI4nhDg==
X-Received: by 2002:a65:5809:: with SMTP id g9mr40362715pgr.146.1579188067639; 
	Thu, 16 Jan 2020 07:21:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:33 -0800
Message-Id: <2ddf1c0bc4267d38069f9dbb0f716fdac29a49a9.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 24/32] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:07 -0000

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


