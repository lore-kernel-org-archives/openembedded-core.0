Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4129C2FC32
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:07:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.188562.1692281236471876404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BmqooJ3l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-317c3ac7339so6591258f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692281235; x=1692886035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYvIe8xByWWHeS67nOI0IL0Jh3Hf1R6EO45NuW/pnLU=;
        b=BmqooJ3lTQAhz6ul6qf2d0WsrxkWsqsZjZGlCn2NrcMQoTfz/7a1Pvwndyoe99Qvst
         uFE8706ZhDytoGbDyFefDeboCWX+6wLt3khdk+T4jv8O906DFVsgSaizNoXSvlPtHMJo
         LSSbS4jaJZIbW1YnZTm9so6BQ+sY8eLMURHi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281235; x=1692886035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYvIe8xByWWHeS67nOI0IL0Jh3Hf1R6EO45NuW/pnLU=;
        b=Cp9kbHD9ksl3DPn0xHcQ4Q1xIeTt5gJ2jz8kkbAYFoj37edl1m1bOjDwOLpmP5c/LH
         TcXKHCXzstmP+0eJU55XwU5zdDWH+hsGVDnzR1sY5nQ4G18Wcec4ySbjgCsnQA0KiVob
         Ggkz8VERM1efDJJu/nVdrVCNCoFG350gaqoZWodEEnNTUKANdZOeX6oBTLmDx5Zz88W3
         2lkmcaFavfIXN0tkwfkjNG/bJJIxe8ivJSQBSG+0iQ7yV+all296hWB3P6tVnM4uivJ5
         xt9jTGPNR7gWscNjcdf/3sLZUYizyRG+ZX+rmNK6xle7YnmMg3+ZBBWBsFGItDAWaDO0
         /TmQ==
X-Gm-Message-State: AOJu0YzGIAyvbHQ1wmQozDWkpWJNssDmGdyRix/wYRaf2ZQLVJx/2Miv
	em/J2GFJOZQvAUfHl63xNjkc79ybHbdB3FQm/C0=
X-Google-Smtp-Source: AGHT+IEs3mwF6/5iYKMhEGVIpSn6UamIyRu+jATH8wfPjo9H5eeTx8P4QEOKSfxFwF3GPBclY/gl7w==
X-Received: by 2002:adf:e905:0:b0:313:ef08:c83b with SMTP id f5-20020adfe905000000b00313ef08c83bmr5106120wrm.56.1692281234355;
        Thu, 17 Aug 2023 07:07:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id s13-20020a7bc38d000000b003fe2ebf479fsm3132639wmj.36.2023.08.17.07.07.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:07:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix to work with glibc 2.38
Date: Thu, 17 Aug 2023 15:07:12 +0100
Message-Id: <20230817140712.681363-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186319

This adds a horrible hack to get pseudo working with glibc 2.38. We can't
drop _GNU_SOURCE to something like _DEFAULT_SOURCE since we need the defines
the gnu options bring in. That leaves using internal glibc defines to disable
the c23 versions of strtol/fscanf and friends. Which would break pseudo
build with 2.38 from running on hosts with older glibc.

We'll probably need to come up with something better but this gets glibc 2.38
and working and avoids autobuilder failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/glibc238.patch               | 72 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
new file mode 100644
index 00000000000..76ca8c11eb6
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
index 4ba752f1745..4a894ebdd0b 100644
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
2.39.2


