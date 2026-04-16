Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7202AF8DFDF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28559.1776378785265162412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EidBdZuy;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso366165e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378783; x=1776983583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaYkrZqYD3QKvU1M3QQz1qp/jXduDv3dzKI5FWKlIdw=;
        b=EidBdZuycnQguiBC6vMIJ46yXobEPLIaJXSC7uf3wdF7FjRDQhpFwQiu0tu/ljZPyR
         8Z9SqeLS/+dypvyIVaA+iRnK4BMB2HN13/0yKFDB7SoumWvjFEb3MMnSMKjeC1jWkhsw
         IiSPwu9Q54OGpcyEEUQBPZR9umWHXMP+oKKyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378783; x=1776983583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WaYkrZqYD3QKvU1M3QQz1qp/jXduDv3dzKI5FWKlIdw=;
        b=nBpy7YuOnMiPO6nLqqjz7aii/kZs/9XG8sUMR2ueh1qXBBEL587P+63cNXF5+9iMac
         cWOzjzeieelKoDLDIdF8Mt1St8TYr1YYDOTCmYH4XkEhw8M0MwJ5ow82rVpVgTxQjpET
         RP0kkoARZFv2PO+xp4DHxsdDYF21U3E9CcSC9tN0R4YdQ8k+c47xK3cQiRXtbH7G1RXU
         98fS87hxv4SxDp65mEpgiJvkgivA+rSKlMLG2ntx4UklOCaFlZSWkg46TohEXkeE5N2x
         xmcwBqpT4syY9eljlXF21xuw9DaOTWHph1F5UPkZmDusscVAfc+vkKBV+j5wxD2urxwI
         HP5Q==
X-Gm-Message-State: AOJu0YxZZ5JgnTK0IIM/VjofNJN5gY5OdA+d9Ky6UxIkovWtYOlVjqRC
	U1k+vA3pQGy1qU/CPkforKJDnygV8e4z8+X01I911W2OvffB2q8Csdjroyyjc5PqE/p4zVMSVam
	nUpJvsNxcJ6wb
X-Gm-Gg: AeBDieu8XhWOpFM855IdoQZBVGJO/WB0Gws8Vxne3bPZAhkkBWxsxI0/YAzWPazhNGE
	CvztCTKtATfPsZEJBYZQy1P1NNBL4V28tDag2W7N+BWihPAtbPWGRHibnQeYGlUXjGVEIyn1Iwq
	P19UKcL0l6A174WFjF4pcEysPhZECKF1mMMxn/G+2cdOtqHEVDlHiNdwzddoSyFtR3tti0d3v1u
	n9vHUSxifQL5ymwpwaWSsd9gr22PGOt6hmwK2mPOxzoAp5WtajPh7cL8FAksESzY7now3TwjOwp
	qJVrDxNv6ArM/wJZJpxaF5PttjosUOIr2n1s8GVOFJsmWLj5HCqo9uO0xwcdHin7ToT+szp99SN
	0vhS5XOc4/50ds1smSCjSdGCGqydOb0y8h9+C/bHp9ctZsVKJ1b4q/ahiwzXOJ/fzJdrNn0+Ejl
	XbWicWDt6Dk761v051lMIv1eD/lv9TpeBIcDyoJtRAXTQjgqylKYHk710P8ATqXAFde1qlAbxVo
	loivMqVqZX3hD/+fRf2rjZzROiWCuidVg7MhA==
X-Received: by 2002:a05:600c:c085:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488fb784948mr3468465e9.25.1776378783255;
        Thu, 16 Apr 2026 15:33:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 07/51] sqlite3: Fix CVE-2025-70873
Date: Fri, 17 Apr 2026 00:29:50 +0200
Message-ID: <57de3882a93f624caf6d72391f896d6e317da44d.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235436

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 00000000000..5c8c429a157
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index ca26f8a..a3f7898 100644
+--- a/shell.c
++++ b/shell.c
+@@ -11141,7 +11141,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index c9ff062255f..df261bdbf86 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 

