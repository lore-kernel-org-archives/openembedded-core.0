Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FBECD492A
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.3144.1695249082504355233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EIWSkKZm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bf58009a8dso245015a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249081; x=1695853881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGAYPYHrMSEIrWNmuyoxuV4/EfaOezGu5sn/XwyjnJs=;
        b=EIWSkKZmsJ9ORYPW8onXQuxLObAsxl6Kj2alBNMv7UNqwShhVe57vXWTseS+5d8EIy
         Vka4B3mCXARPFajc/DmjC9oKtGtnG485TGgupgnBEFpQmwoGHARRmUA59pNgghgzvgNB
         +xF60VRisSI3fvk58tMnW5veYs2QBZIyYK5PX8gy8ltbE0jqAwXakz2Ui1anxfqpTwjg
         eTvYHFkUNs1HH1HcGpsNJcxZP3cITU8vzlBnvxLf2FLR7OmxEu3G8qYHqORgMAT6trSU
         8v0K979ILe5qRM/4Z+p7dC5IjQsV5t4LEw4+QSXuMOrJ9W1j+2VLEaPTl1lTM3JszFGH
         I4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249081; x=1695853881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGAYPYHrMSEIrWNmuyoxuV4/EfaOezGu5sn/XwyjnJs=;
        b=GuM2iowO7i1da4MjpmMdNp5S8EuKcHFps8jsf17xlu+lQDlqKkp7cZNlKUYMaWes9u
         E5KWNOnTG1fSvWZGl7vdzMLbctJ3nTACu4z3aY9WgmWPZr/fiknqG7u+Ap/Hm8LgYxuw
         WJyqciwGSJoZ2Mf60IUBq5nE+MvPOTrjnmDx2X7SGE1zzvzFOrbyscPrce9/Kp/97jHp
         ZDn9a93+sjLrQqCz4MlXHy+h/dkei1dpWUa5vIPdumvNvInBAJ5plPBHDkXd2N0pfykj
         77Y0WVExk1fzbMY1ISwO3LPAx5b+bM5a9PBsawV+kflMbEu9C0YRkZHj++LEFBPrYUg7
         Rnrw==
X-Gm-Message-State: AOJu0YxtStmcB2SnwoGFkF+fWwfjyceL80ylvOEjw7kg482O0dr/kLpg
	4zBDtccsvJch6XPkU++1a+eHBrjigf2rd4QDEmc=
X-Google-Smtp-Source: AGHT+IHczz5wnOV7JuxeYQMqf3qScy6W+JFN48qNQXgKRNCth4KO1X1tEfb2sxw8Pu5hwGUagcv6gA==
X-Received: by 2002:a05:6358:fe4b:b0:143:7d04:36bb with SMTP id wf11-20020a056358fe4b00b001437d0436bbmr1178072rwb.6.1695249081339;
        Wed, 20 Sep 2023 15:31:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/20] pseudo: Fix to work with glibc 2.38
Date: Wed, 20 Sep 2023 12:30:48 -1000
Message-Id: <909fd25c2ebd25f5d3bc560e26f9df6862e033d0.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187959

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
index c34580b4ff..4dd9156238 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.34.1


