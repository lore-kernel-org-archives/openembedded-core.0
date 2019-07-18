Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 03AFE7F048
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 20:04:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id x15so26742010wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BcPcGSJZjembycdGvjortxGHcKvVMam91E2fyF024d0=;
	b=uFteZaBo7YH/s4oOSK2zkwsrLH3Ypm0FFeyXSfPx169/TIvDEDYgwUu/f6n4cOI3zY
	DOGCDy6IFjDnpH+CXEAyBS2DhIGJ63NKLPibOz/W6qGYhksQqDawwphjyzCe+TqV5/qa
	04y6OAuoyzCp3SfSo4mT60JP2aiOqYga4uGNruEwG4tuUtekEX5Fvfz1AULhgtq7lPlI
	P5zcTqy40k0aGwk3/TeV61Q0eTxhECTxwlA1eMkxuxlsIQM8VlM439doo5csrnpm4gQ1
	Cmy4yCkR3T30ZGRl1Qi6rsXHxlVES/jilwi5tZ2x9pF+X3pIF2Tm18Ia1gLmRL9rhOay
	6kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BcPcGSJZjembycdGvjortxGHcKvVMam91E2fyF024d0=;
	b=DNdRcqGp0Y2yRZ8UZJ8V9lyVlgugfCARGukFks1Zf8mZ1M47SsyR0VtQnmsvENfUVb
	Fmn83+AGMeVkGHG6Ez22ccZqaMhUFmDUKjVcxcHNpq3/rCzaeJot49bG2+15/fxRV/Gt
	mAROd3smwQxMqn1bo/7APNmbb9/K5xGQTSuhsedRB0BinSKj+r7eAuuvLqvi7Hdn3WnJ
	uRIzcdRMDpZINwqekEQlelFw8zLLQXjbcEjsE9KyiANxp0yqNutCj2mbdPWHZ37WjLXr
	Q1a1O7TuUUtuuyMuHpUfGh4+S0qe3OmARysMsTaYCjCHMqF1JWe7wLq6oVISDN6WNqLN
	XpnA==
X-Gm-Message-State: APjAAAUvHITWXJP0DEjRQYXO8Q63/Ii+z3Rkq9EsZHDsJABl/9MNT4ET
	xV5ctlhb9rEsKS/7vtZ1cl8We7x6iGA=
X-Google-Smtp-Source: APXvYqybTqQRPTquzOIyhn2cObnir681U9JVkd66wdoir4r/u7MmjIbjqFfEadXdwJ11W4OCni6slg==
X-Received: by 2002:a05:600c:23cd:: with SMTP id
	p13mr40391215wmb.86.1563480245512; 
	Thu, 18 Jul 2019 13:04:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r12sm35331858wrt.95.2019.07.18.13.04.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 13:04:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 21:04:00 +0100
Message-Id: <20190718200400.19750-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718200400.19750-1-ross.burton@intel.com>
References: <20190718200400.19750-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] cve-update-db: refresh once every 24 hours
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
X-List-Received-Date: Thu, 18 Jul 2019 20:04:05 -0000
Content-Transfer-Encoding: 8bit

Check the mtime of the database before updating, and if it's less than 24 hours
ago don't refresh.  This saves the HTTP fetches to determine if the data has
been updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index cabbde5066c..2afca94fc6b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -22,7 +22,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib, shutil, gzip, re
+    import sqlite3, urllib, shutil, gzip, re, time
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -37,6 +37,11 @@ python do_populate_cve_db() {
     if not os.path.isdir(db_dir):
         os.mkdir(db_dir)
 
+    expiry = time.time() - (60*60*24) # This time yesterday
+    if os.path.exists(db_file) and expiry < os.path.getmtime(db_file):
+        bb.note("CVE data updated less than 24 hours ago, not refreshing. Delete %s to force update." % db_file)
+        return
+
     # Connect to database
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
-- 
2.20.1


