Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6D0C83F1A
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.10496.1693064359992091364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=C/jz1D+I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68c0d262933so960068b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064359; x=1693669159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGK8Dvp10+XZV+LYZVv2Ql3ynP3MHgoDRnMd5n0i2R8=;
        b=C/jz1D+IlUvit85C0mmA9ZF9kFaFGnAYmqIy+1oFA6EWMIan/wjXPrr/ZJ9rY+KlHF
         4Y1tZOvsX3SGqGg1ZpN3FgzkBLAksVhUDbJ69lDDkbIJP8t83oVptHTl+T135Cf88R0J
         AJJq/AeQErm7F4uIJRBomF/TYAJKZaCxECq2e5vZSnSVNbaLwvgTxDP2U9cCkK9qbifY
         6uXID/ECSLKFH19QwI6g4x+OCVMg++k30oCUbnRFzo+Chw44yCbg/7ypsSH6sghTyKN/
         XfrPXqn6v9haSn0+pFq+m4ANkwSuIT4OYX36727yFaXWrL2vzxMdkqAexrjXT+6m0n+3
         TovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064359; x=1693669159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGK8Dvp10+XZV+LYZVv2Ql3ynP3MHgoDRnMd5n0i2R8=;
        b=Krlqmo/CnXvLSLXw9dM1kcmqc6B6fhmZW9hS0tNtZYVaU7QQ6rXotn9hdKR/M7deIP
         wESDUWxp3e+8b7cyGJSJiddA7Qs2bZc6+7klShcjbI/hY6NS9cFL65cDMcWj8tj78M2H
         H9C/zg/WL6HNomWQaAMt2XlSreitHAzeWOkb1g04Flzl1dHdnYWaj21q/hVttzmyQW+V
         OO1vEcU3iZE8Y02+bvAoXitP7xP8oG4wfL+tOyxDFtW7q2v1u46ariqMey7uejqAP0M6
         E17nggWn0hNmF1GS0fkSE1nkAKx1jNS886MrDQer863CVZb5fZqUi6L/h1oFzx8KJH6w
         UcUQ==
X-Gm-Message-State: AOJu0Yy/i3lbN8CYxH8IgfBPZqTgPoyZDHFA+lpA0ODAvHqhkqtmV0cB
	5VdsxLrx/EdnNhxp6HAcuH56Ztd944ULI3nqSDU=
X-Google-Smtp-Source: AGHT+IHBb0dZh6dKbHtewZM5z7kAPFaKSLqzbU2WWg4RWlmwqQ34+Xd4YBxd2EN6vMvodK0qdtN4Gg==
X-Received: by 2002:a05:6a00:b83:b0:68c:111:3adf with SMTP id g3-20020a056a000b8300b0068c01113adfmr5821608pfj.22.1693064358871;
        Sat, 26 Aug 2023 08:39:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/20] pseudo: Fix to work with glibc 2.38
Date: Sat, 26 Aug 2023 05:38:43 -1000
Message-Id: <387b276c2d56d58c2a25d59984fcaaf9c88ac788.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186756

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This adds a horrible hack to get pseudo working with glibc 2.38. We can't
drop _GNU_SOURCE to something like _DEFAULT_SOURCE since we need the defines
the gnu options bring in. That leaves using internal glibc defines to disable
the c23 versions of strtol/fscanf and friends. Which would break pseudo
build with 2.38 from running on hosts with older glibc.

We'll probably need to come up with something better but this gets glibc 2.38
and working and avoids autobuilder failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 596fb699d470d7779bfa694e04908929ffeabcf7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/glibc238.patch               | 72 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
new file mode 100644
index 0000000000..76ca8c11eb
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -0,0 +1,72 @@
+glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
+_GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
+to turn this off within pseudo_wrappers.c. Elsewhere we can switch to _DEFAULT_SOURCE
+rather than _GNU_SOURCE.
+
+Upstream-Status: Pending
+
+Index: git/pseudo_wrappers.c
+===================================================================
+--- git.orig/pseudo_wrappers.c
++++ git/pseudo_wrappers.c
+@@ -6,6 +6,15 @@
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+  */
++/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
++ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
++ * to turn this off.
++ */
++#include <features.h>
++#undef __GLIBC_USE_ISOC2X
++#undef __GLIBC_USE_C2X_STRTOL
++#define __GLIBC_USE_C2X_STRTOL 0
++
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <limits.h>
+Index: git/pseudo_util.c
+===================================================================
+--- git.orig/pseudo_util.c
++++ git/pseudo_util.c
+@@ -8,6 +8,14 @@
+  */
+ /* we need access to RTLD_NEXT for a horrible workaround */
+ #define _GNU_SOURCE
++/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
++ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
++ * to turn this off.
++ */
++#include <features.h>
++#undef __GLIBC_USE_ISOC2X
++#undef __GLIBC_USE_C2X_STRTOL
++#define __GLIBC_USE_C2X_STRTOL 0
+ 
+ #include <ctype.h>
+ #include <errno.h>
+Index: git/pseudolog.c
+===================================================================
+--- git.orig/pseudolog.c
++++ git/pseudolog.c
+@@ -8,7 +8,7 @@
+  */
+ /* We need _XOPEN_SOURCE for strptime(), but if we define that,
+  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
+-#define _GNU_SOURCE
++#define _DEFAULT_SOURCE
+ 
+ #include <ctype.h>
+ #include <limits.h>
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -6,7 +6,7 @@
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+  */
+-#define _GNU_SOURCE
++#define _DEFAULT_SOURCE
+ 
+ #include <stdio.h>
+ #include <signal.h>
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c3c4bb0ed9..9260a3faa3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.34.1


