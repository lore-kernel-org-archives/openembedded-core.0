Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35E1C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:25:59 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.62461.1702239957155269645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MinUUKDP;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so2442481b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702239956; x=1702844756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biIyLaBWX2odm7iShPtv1+uqjxPEXU/Ruo6Z+iyDpJU=;
        b=MinUUKDPfChTDVeQaTXGPb4GgJ59gjaqgxDjhQA8ChRxqVHA56iA3qkffh57o8cmWp
         JhdU9Ges9S1MPsBHpMbFinK6EO3tz2nk/YrK3277+DtyhJXNWGxYv3waG0eshy2uM7FC
         BshjzKlsVmwoHdLrJKf5D6Kn/1qT9kW81J9z4+UXPY9l2xDIzB7vT7wyUasZcEM8GFEE
         AP4TfsV3r/+3QhZFSIWPwjbbqJq5EV0SAbn3DvAWF5CBr9hChtPPwx6BFZhPetYc4cfR
         gHJ9CwQG36Gex1rmLwCrOaLSyoxD8PEUd3sfcAYfoYsVweySkAL8bAsKJO+7xLlOExqA
         /SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702239956; x=1702844756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biIyLaBWX2odm7iShPtv1+uqjxPEXU/Ruo6Z+iyDpJU=;
        b=X2jI6RykUSuUEA11Xc7hYVEWbOwNMDOqQn5kWxDDQojV1gCztx3vAHmBEdgd4nzias
         eXWiFvrFfVSHz6+nr7Rp/atGn0CzIkJ3C11BVpmzhRCQ8680crA+T0zeJivAmTtbAqrg
         lQ5cTSBHiEFes8zhjYYWAz3O/X2tJT2raa9B9u5xEtCOrry4ga5S7KwriAwsMmG49Zb+
         1eyFNAR+PWhqmInwEd4I8Hh6K79gn0XyXn9DT9bQ7AZ2+REJRfrsYuBtxtK6h5cXjIiK
         6f4yPdgG8qgN3AmHkztBhWJfw+HBZ+b5STHH4usxIucFPeIHYgGC2DddtcZ6xl3++6op
         oE1w==
X-Gm-Message-State: AOJu0Yy38ykfNbdJ6NTcyE2ukyP7E3dguJGa5FN5yooHcMDoLvmyfxm1
	bmGKX4HV5nii7CXOYVlmxqly3sGIth0=
X-Google-Smtp-Source: AGHT+IER4yrgujxE/p4omZzXPxeHffYLdz0TJtHUS9BMmILYrdb3gb+ku7npkWSDNUZ4drCfvGxa7w==
X-Received: by 2002:a05:6a00:b51:b0:6cb:cd66:2102 with SMTP id p17-20020a056a000b5100b006cbcd662102mr4174476pfo.4.1702239956258;
        Sun, 10 Dec 2023 12:25:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b006cee23e7677sm4246487pfn.210.2023.12.10.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 12:25:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] attr: Fix build with latest musl
Date: Sun, 10 Dec 2023 12:25:49 -0800
Message-ID: <20231210202549.155550-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231210202549.155550-1-raj.khem@gmail.com>
References: <20231210202549.155550-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192124

Include libgen.h to get basename() signature

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr.inc            |  1 +
 ...ibgen.h-for-posix-version-of-basenam.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index e8835398afa..75d616893a5 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
            file://run-ptest \
+           file://0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch \
 "
 
 inherit ptest update-alternatives autotools gettext
diff --git a/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch b/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
new file mode 100644
index 00000000000..1e2bea5067e
--- /dev/null
+++ b/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
@@ -0,0 +1,35 @@
+From 6d9e827bcacf387bb3cfae64bd4fe520168ccad4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Dec 2023 19:29:27 -0800
+Subject: [PATCH] attr.c: Include libgen.h for posix version of basename API
+
+Musl has removed the definition from string.h [1] which results in
+compile failures with clang
+
+| ../attr-2.5.1/tools/attr.c:69:13: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|    69 |         progname = basename(argv[0]);
+|       |                    ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://savannah.nongnu.org/bugs/index.php?64972]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/attr.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/attr.c b/tools/attr.c
+index 312aef1..90dab83 100644
+--- a/tools/attr.c
++++ b/tools/attr.c
+@@ -26,6 +26,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <libgen.h>
+ #include <string.h>
+ #include <locale.h>
+ 
+-- 
+2.43.0
+
-- 
2.43.0


