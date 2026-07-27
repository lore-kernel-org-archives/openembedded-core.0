Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D856C54F51
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43811.1785192993075881626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HcjB28xX;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so31087135e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192991; x=1785797791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D9CFKnEVXInVse50D3hSUd+RoGCuSHrb2RgDBWoGhAM=;
        b=HcjB28xXu3Y1PkGOFI2eqvyRHrRb0uzABDMgo7v9alA29Zzi72yue2N1NbJXVHF3wg
         GvOBTihEXNGJqMyt7fJtnMuVNDbZUQDjcgX+//JI4/rxd8bFBUQPvoLFTYyeWCFlyqO8
         qWhsm5fc+TdL7b7SpQ9t/ibG/YlslErfggyyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192991; x=1785797791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D9CFKnEVXInVse50D3hSUd+RoGCuSHrb2RgDBWoGhAM=;
        b=KE1EUjNGXbKLJmsU7TbJJTlpmQzp6XY9y5pIoZ78KqG9SF1B/PhEqrkDvUAYNQ1gN1
         Tn5NfuUWAimP6N/L10EIcje8KKFHWpQW27eIrlDU8nQLpOli/6oZW64wA+cn8SUxWO/Q
         cqtliwjdbr4D+ODk431HgT9ZYutodg7fJCQfBOQhL95R0XYFJwkp0tpcnVPn+uKPnqi1
         VMAqW/LugFe1k6uH4JiiFxKHNPTFmclu42gMl13KMha/3CBQKHl5XHN6bZI+f0jGUfps
         jCa5dqcOZXURBNpI/IUPMi1O7Me2xJ+yIKOxt6TZL1J6HVzzMfo2dx8FN7tFWCxUvIwv
         Yr8w==
X-Gm-Message-State: AOJu0YyveCHalRb4V8z/RN6vl4r7/Ulh/lso6GVV0gyPzNLjMQZDueTD
	XGDscIvncBxbehbGItCrjeUDfr5sQ+R5FJIq0rVI8p9MZysCEHNGh93l4Z5Lnq/zb1fdTvFrzaG
	7qR3DCqo=
X-Gm-Gg: AR+sD10tGBe4R6QUtp3XOWrk3ngp9+AzDynkqQ7/AvQuyTX1BQkOGSpVcj7UemJee9m
	S2rpWVkImzwE43JjbOL2cglIegCC95pvtYIOZkxmxBLyqiC4pSoHYQ2CIjaJxC17wveuaCqfYBQ
	FcpUfCOCXjy2abOTe8VLkA0sPQrR2rXovjavs3/4nuMlAKZNnwT98SgqGhzE5PHlbRMj2lKSEfJ
	2V0MUeAk87LljedRxMXfniGdhC/4bRFPE5MSx+TziCAUx9R0oNazfig76u7jP4ComYAAwBE442y
	Nj62TfqGDOKJ+/Zi6PZTHEPoboHCf7xhilXTjuldrzfdYFsedfUH8JjTSh+3U27BRFuEnnxPOph
	XFi4413mP7k8XGtR81LByFQwPPxzAJVgvgirfvg71SyUR8oiIormvPaXMI6iaHLgNCeHYXxQEPS
	HA+3Id1xccoJKGALrj0L16p7rAt0zF/1U8P5Goq1YUi4IeCyu0s+TWXSKUUI8fWi/saDDBJONia
	HSvng==
X-Received: by 2002:a05:600c:8010:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-496c4f91af8mr10094815e9.15.1785192991305;
        Mon, 27 Jul 2026 15:56:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/36] sqlite3: fix CVE-2026-11822 and CVE-2026-11824
Date: Tue, 28 Jul 2026 00:55:35 +0200
Message-ID: <9f5f7f47b4626c22419e9d815b2352ea8ac80d47.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242138

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses memory
corruption vulnerabilities in the SQLite FTS5 full-text search extension.
The GitHub mirror commit [1] corresponds to the SQLite Fossil check-in
shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f
[2] https://sqlite.org/src/info/061febcf41ca

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-11822
https://nvd.nist.gov/vuln/detail/CVE-2026-11824

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-11822_CVE-2026-11824.patch       | 41 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
new file mode 100644
index 00000000000..0bac4412b18
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
@@ -0,0 +1,41 @@
+From d38b8fb5636c6d77f76dbeb5291f49ab594dcad4 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 11 May 2026 12:00:19 +0000
+Subject: [PATCH] Fix potential buffer overwrite that could occur in fts5 when
+ processing corrupt records.
+
+FossilOrigin-Name: 061febcf41ca4872a0f407951e1507209daca7895122b909a7806c60b6e200c4
+
+CVE: CVE-2026-11822 CVE-2026-11824
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f]
+
+Backport Changes:
+- Applied the upstream fts5LeafRead() fix from ext/fts5/fts5_index.c
+  to sqlite3.c because the Yocto sqlite-autoconf source uses the
+  amalgamated SQLite layout.
+- Omitted ext/fts5/test/fts5corruptA.test because this extracted
+  recipe source contains the SQLite autoconf/amalgamation layout and
+  does not carry the upstream Tcl test tree.
+- Omitted Git mirror metadata files manifest and manifest.uuid because
+  they are not required for the security fix in this source layout.
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 851a2504c..2f4b77429 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -248157,7 +248157,7 @@ static void fts5DataRelease(Fts5Data *pData){
+ static Fts5Data *fts5LeafRead(Fts5Index *p, i64 iRowid){
+   Fts5Data *pRet = fts5DataRead(p, iRowid);
+   if( pRet ){
+-    if( pRet->nn<4 || pRet->szLeaf>pRet->nn ){
++    if( pRet->szLeaf<4 || pRet->szLeaf>pRet->nn ){
+       FTS5_CORRUPT_ROWID(p, iRowid);
+       fts5DataRelease(pRet);
+       pRet = 0;
+--
+2.51.0
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 0a8727e4f2c..2b0a9c0e4d7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -6,4 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
 
-SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
+SRC_URI += "\
+	file://0001-Add-option-to-disable-zlib.patch \
+	file://CVE-2026-11822_CVE-2026-11824.patch \
+"

