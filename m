Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E26DCD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1008.1779233437068027682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yc1iudYK;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so40025575e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233435; x=1779838235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/hvd7GpTWf4/glanBmSWN+COQQ7YAXhtXLTQDDANNY=;
        b=yc1iudYKEhhr04P1/dxQVv4ovJ0h8nIT41Cbnm8PLOG8zp1sC49BboQyDj4eKVELQx
         WDjwUq15EQA4Gt1+J80Ysqm3uyUSX/uJLVC69Dx8BCrnfY8suZTzuiVg2fDQBRBgm0Kc
         PlNRKlAqpZX038t9qxPkLs1Dln7TM3mKVzHN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233435; x=1779838235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/hvd7GpTWf4/glanBmSWN+COQQ7YAXhtXLTQDDANNY=;
        b=RNO0NiLZk+Uf9qDgXR0Jcyw+CBB054IxXCKluTUAI81i6eq5cT6yTTO8cnr6fT32uD
         IW546c0AmTShGRTi296WectbIEcX/ofRc6R8+TVv+Dn/J7PbrdqHMgnrCez5tDSv1Y8X
         yFeoORDETgZ8P5tOqy/4s9TgEaLTukWOJ+hm+d772sFdeiq2SigYwUv1IAYKHmzqHu3E
         +t8VbO/Va9ZkTWMb4ZxT/mHMtDKRXWULMP3mkerDwgVuZlnlMBQrGVd6+e+RjyDhTAOR
         hxHPhh1ZZCrkyYJwFMd8XFKBKaFOrDVXp0VkUDa6ls2tEGvWm0PQM9+VnyZJulcl7+Bi
         wiZA==
X-Gm-Message-State: AOJu0YwrgXqLG674WXPYQwZNltHClH3hUiOdrw/Lf6ez++T408KHCdn1
	SjbTdGJMsxpt0J+DA4mSvGSJw0MPbkVMiCoazJQWgTERHrJNcsY7dINMLxdeNAK/CXYeM7MJQlE
	ieO05
X-Gm-Gg: Acq92OG9HNAcwpLN4H2ejOu7a7YYn+iNTI51GvD20IcMcha8sBDvBhZj75t65GRHzUX
	oFk2gpKshiVw+IjTt6wCXSs5Z6jFVb+3b3npRBQnG8RO/AC7Fn2Wjjq/3/pfQeEAZ1qxiAJqBTH
	IPvmMmewGrRreOtfINSsFvXv0uCglDoa/OwV4eX8qZL63hjkdoRyzUCKFOUR7+igVD2g/DeJ4rG
	rwZT/jn1UMnKc4DFfdEnEi0ixCCW46TlVucMKLurmu2ycKpfyTgd6zHWBmvFOIVBkhT0ygD0uEI
	kJXGPa2aZnQjIulUW8FUkgLIW/YNo4yt/cQki7HKaKuPip5A2LFRh+NdVrKRcNmDoe0Oyc2abpj
	z4cNtz5WAXY3ijJltfsZiC2R6pL5irqfKzDZtzfXDoKtvMr7z5Hw7c621UO+W5do6CnEnamNmls
	CclrcbEwusQq0+rgobeFUZckGLxI+34XjklH24FqUqf4wsogaVIB2qDrhZq5cKx+g+bXEkWX0Qf
	MdjeyDqV9PuOV2aW4MxDkXDn9k=
X-Received: by 2002:a05:600c:a11c:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48fe61f27famr247081005e9.14.1779233435217;
        Tue, 19 May 2026 16:30:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/28] efivar: Backport patch to fix -march issue for ppc64le
Date: Wed, 20 May 2026 01:29:52 +0200
Message-ID: <5d9e1eaefa5360ecfdc5058e25746ac5a58203fd.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237362

From: Andrew Geissler <geissonator@yahoo.com>

Backport upstream commit 9711b8aa5acc to fix compilation errors on ppc64le
architecture. The issue occurs because GCC on ppc64le does not recognize the
'-march=native' option and suggests using '-mcpu=native' instead.

Upstream commit:
https://github.com/rhboot/efivar/commit/9711b8aa5acc63c54a12ba5505fe68b4475c8a13

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 683e2531be8ca28ace0ed1ef06b6211056338a35)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0003-fix-march-issue-for-ppc64le.patch    | 45 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_39.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch b/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
new file mode 100644
index 00000000000..d27541aeb10
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
@@ -0,0 +1,45 @@
+From 9711b8aa5acc63c54a12ba5505fe68b4475c8a13 Mon Sep 17 00:00:00 2001
+From: Andrew Geissler <geissonator@yahoo.com>
+Date: Tue, 4 Nov 2025 09:58:55 -0600
+Subject: [PATCH] Fix the -march issue for ppc64le
+
+Similar to the fix in aab4e9b10ac, need to also support the ppc64le
+architecture.
+
+The failure without this fix on a ppc64le machine:
+
+| cp util.c util-makeguids.c
+| gcc: error: unrecognized command-line option '-march=native'; did you mean '-mcpu=native'?
+
+Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
+
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/9711b8aa5acc63c54a12ba5505fe68b4475c8a13]
+---
+ src/include/defaults.mk | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index 4da0cde3..a21a7aeb 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -74,6 +74,7 @@ override SOFLAGS = $(_SOFLAGS) \
+ HOST_ARCH=$(shell uname -m)
+ ifneq ($(HOST_ARCH),ia64)
+ ifneq ($(HOST_ARCH),riscv64)
++ifneq ($(HOST_ARCH),ppc64le)
+ 	HOST_MARCH=-march=native
+ else
+ 	HOST_MARCH=
+@@ -81,6 +82,9 @@ endif
+ else
+ 	HOST_MARCH=
+ endif
++else
++	HOST_MARCH=
++endif
+ HOST_CPPFLAGS ?= $(CPPFLAGS)
+ override _HOST_CPPFLAGS := $(HOST_CPPFLAGS)
+ override HOST_CPPFLAGS = $(_HOST_CPPFLAGS) \
+--
+2.34.1
+
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index c0e8d521819..e5839f7a990 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -10,6 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch \
+           file://0003-fix-march-issue-for-ppc64le.patch \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 

