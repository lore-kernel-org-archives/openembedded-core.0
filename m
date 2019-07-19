Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D3F5F7F1C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:33:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 207so29903608wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OMjkKOr6498GEdEZisk7t+n/Vc+Lnh2P/4ijmX4iutc=;
	b=utLCdmS3VZoHGUiueNjO8SBECelBeebCb/ycMYHS8YZXQZekbqXn1aUwlu5A2M08Cq
	Z2uIeOQcUkam1J4RMJ2nUGUf4/dFBEguSQuy4gaDdWUX5k5p6yN4sb0EdY9FpUdG3PJi
	FRgLQ2HJiR0aWo8gCgjmkTxGLMM7rbB7tuCQ1A+ozs+D7NgTF7+1E1FQUTr4MmoXeKoB
	ErhqnsyacvQ/ag4wZq+FfDgOF9ymBbL9anEhlVfuPC6zrv6i16pWnXwi9KtXwof+7wPd
	b8E/Lqo37ibCLTpXV4AUg0pw50n3hArjVK84wLkxmExNi90V3pOp8RlpV6Cl007jW3Kk
	icgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OMjkKOr6498GEdEZisk7t+n/Vc+Lnh2P/4ijmX4iutc=;
	b=ni5hLeuSnRQ6kGsMXxqV/ox0KjWL+D5tM8xgcl7awM+if/oEstvZ29/NRMtzlZVd9w
	yviDx/O9O/VuMBK11vFjThqrVrPLEU1tyL2A9wq1DYMXc2E8TnUkgXbzLUPUL+2tEYWe
	p1ylJXrf/hntlHpOQrUAvpv8A9rxhP4pPgpxeMCh4cRjdzlAkhP8540mOpjjkzoXlmcJ
	U1jtYuvhgNSZrL3QbmqvYz38qq5uBZgBZEwN96qc7WY7Arn+wOpNJOXuxQjT+5mLBfhk
	sjFNF7VixNSA1wsBVUwMykkXAUjOEQyj2V3ydX0uRxpyNDlVpQlZTrsIgMye/Vkh3ZJZ
	ZSrA==
X-Gm-Message-State: APjAAAUgUZqcsggkzlCBThEEQrHEbtWo232BpnN3Rm23VweLLOtScvOa
	fmm0JJfHCu3ae3gOYibIOZdN0kfPals=
X-Google-Smtp-Source: APXvYqyflBVumWUi7naR+vjq/zfoMEzWW/Y7r0wvp3yPIOREMkbqgana2ZRLRT2irkfjmcDivVVNHg==
X-Received: by 2002:a1c:1a87:: with SMTP id a129mr48949791wma.21.1563568405327;
	Fri, 19 Jul 2019 13:33:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z1sm35298988wrp.51.2019.07.19.13.33.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 13:33:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 21:33:18 +0100
Message-Id: <20190719203319.20580-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719203319.20580-1-ross.burton@intel.com>
References: <20190719203319.20580-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] cve-update-db-native: improve metadata parsing
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
X-List-Received-Date: Fri, 19 Jul 2019 20:33:25 -0000
Content-Transfer-Encoding: 8bit

The metadata parser is fragile: first it coerces a bytes() to a str() (so the
string is b'LastModifiedDate:2019...'), assumes the first line is the date, and
then uses a regex to parse (which then includes the trailing quote as part of
the date).

Clean this up by parsing the bytes as UTF-8 (ASCII is probably fine, but this is
safer), iterate through the lines and split on colons to find the right
key/value pair.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 09e19c0aaef..41a2aa8f207 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -22,7 +22,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib, shutil, gzip, re
+    import sqlite3, urllib, shutil, gzip
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -52,13 +52,15 @@ python do_populate_cve_db() {
         req = urllib.request.Request(meta_url)
         if proxy:
             req.set_proxy(proxy, 'https')
-        try:
-            with urllib.request.urlopen(req, timeout=1) as r:
-                date_line = str(r.read().splitlines()[0])
-                last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
-        except:
-            cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-            break
+        with urllib.request.urlopen(req) as r:
+            for l in r.read().decode("utf-8").splitlines():
+                key, value = l.split(":", 1)
+                if key == "lastModifiedDate":
+                    last_modified = value
+                    break
+            else:
+                bb.warn("Cannot parse CVE metadata, update failed")
+                return
 
         # Compare with current db last modified date
         c.execute("select DATE from META where YEAR = ?", (year,))
-- 
2.20.1


