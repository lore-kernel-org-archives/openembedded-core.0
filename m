Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4ABFF512B
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85280.1775578587240948098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rp90z9Fl;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso70855545e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578585; x=1776183385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=rp90z9FleQHkgl0bKcV25s8yQNhshU71CT3vcDW/suzrjifKfCqtJD4F5Q8dA4JHQI
         WpueHxFO6lOF/QjNyFO073SU1kZceGypTyW37gebKpyqPkHK3aGmaz3UJ7h1jAdx0NwK
         A58P5Uiq4IahHSNHomwF5C64joFkvKtjwkzAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578585; x=1776183385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=ZfGdupGDQ1Tzoc0Vv6Zq4yEJrAix/rQpLkrdTGAcTmiAGx1trC+iZoGNRXmZvfDjW2
         CjH6zPy+Yn3wJfpzxLERy9xmTEMu6A+2x3fOCi1/hHVuYZlqfe6RG0fcpU7aN6aMfjVR
         7BECtO1ZdUrZF/gf0HpKLm1NRgCeWFB0Q7i9TYcnOa5flyA8Q53fpZuv6O6nd5DmsnYH
         88u2GiTD8STrerQNOyMIB0MKQZqWfmBj4bE+qUvTurjW0ONGDGGgwvpXvunFya5R9lXM
         ipJ6irM0bR89/eCNEVDOH/5ccxIIZJ2MmZwh43kBGezTLK6J290YQjFqc582H+LIyRqW
         FWrg==
X-Gm-Message-State: AOJu0YxW69PNlyzcnivnltcg1n9+n3qdC4/jPkQSry6rk0nLazzKP7lz
	hBgWdLiOjmIqq1nbfR5OkPsDVXtIl/LACPWICC3MR2E/7wZga1SgkdZniRclDlAA2bFmHZqQVi9
	lw+4l+iA=
X-Gm-Gg: AeBDiesDz3LRSpKXEczH3ik1nTFQLUSIVVOASQPlSDmeC0tOI6QdA1Ml5+307KeuBO4
	eMOYnUw50bsXcU1H7sewFk6PGbZ4bVYOszCrRGpT6VSCpWzI837UxAwI1aH0JmGA2YCdKA4k0xY
	EwhOFNs7PZksCg73aTJRtQvOxVZqeDeWu43GMbY9DSiD3zDrT7Zf4cPYwjYjkIh5T6UbQ2mewPv
	ZoONG0ExZDxY57xs5roy3ILYGDzClq5OEecvVltBQPpElEY48BPAJ3EnZlQ/cNcRAYUEGGBY43t
	siKNYxHXWM1+ikzHGtwkqHy9lDP2MAWhdZCeJtFTe77UawzNzSt+Rr5OQF1GWWy8M51bStG/yEQ
	/nDUYIQ678lYzhIoMIy5CMdKKvRe9STk9nBkrZy89zi43RI3xyGibTmBQdd6dlhP2u8L7RF+f83
	aHHDUav7658r8LtnU+j1AwJ43D+mbyqqoMhifDM8R9HTAw3e5BOF6OfQoxPeuSGxNkddo5ag42b
	mNSdAMkBUV2vTY+vZmusLzEuEGL
X-Received: by 2002:a05:600c:1553:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-488acbc0ca8mr127511915e9.17.1775578585151;
        Tue, 07 Apr 2026 09:16:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 13/19] sqlite3: Fix CVE-2025-70873
Date: Tue,  7 Apr 2026 18:15:50 +0200
Message-ID: <c83cd0147548921f87d4167f6a4a7c58ddc8600f.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234766

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 00000000000..86004c0b741
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
+index fa45d40..3c4902c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -7668,7 +7668,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index acdd80022e1..9e10caa399a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 

