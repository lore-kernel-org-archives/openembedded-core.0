Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C441FC10DCE
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:25:59 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.62458.1702239955719920563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joQhErtB;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-590a2a963baso1043010eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702239954; x=1702844754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+Uz/3KFVeX3oRC1CajzwZ+q91STUa8qMEVE1M5Lzcw=;
        b=joQhErtBP5DVQ6CrgJs5uWpJltJGARqUako0IgTCV35JjA2K+7YjVqRWRQsqsKwJon
         htt7VQ5l6yw0BOjxlctJuc1uMChxxu4e+c65LzykfsgJcoIVrl4XxfvKI9AE+YMm5baw
         mrzRj7SZQOayaw/bFKa9a+Fd69n3ZUzA15NMdzzL3HIRUbHaa6TtZnwe2fio5csAUm5m
         We4JHo3ttxvutWVIfpfemHRa7vkWacqoAM6yLi/oV36YyDOuRYydWUO7WH44hkcmapdQ
         tRz2AU5EPabw0A4wphfx6JPyTYhY08B5ppTgsNCicd5HEQK8+zM0Uge6yQuN7uImfWpD
         T9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702239954; x=1702844754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+Uz/3KFVeX3oRC1CajzwZ+q91STUa8qMEVE1M5Lzcw=;
        b=goUbku5cAuSfldH7Cpe9jsklhllAP42zkXS0s27aL/ci+EDwHZQHiUFHVyYQY9JLft
         6A0dSHXV1WkUqGJAk6rXdqXxrKqKzT03ZRqeGm/qC4nqOhKBiyoFOx8zgJN/bJbgQ5y5
         NNJDiZfXOj+9OBqxCgIYdLHC5lJIQTI1+0QHgNCll5ah6HA3B2iaDIxlhyMQkxrIIbTc
         7r7Ii3iPXjQI85yLWsAWMZFmblAs9ybKH4s4vRY708ydiI+oXDGmdE+z5jax5digara1
         N+KLwZ3eQwZUts0Wp3dnBgeTID2FkM8afKdAdwfShJn0vPWZhLRMLazodPExrsCftLHX
         i1Dw==
X-Gm-Message-State: AOJu0YzoFtAPjHLlno6zONRGB0e6ccvc9DhY6DtXOvMjHm0yKydcsRPG
	RZL8fcv9SY21maNiupvVyPTXZlnwN4g=
X-Google-Smtp-Source: AGHT+IE932hSHagjfVGp3WuqrIJ95pBq85zDTdsWZX6bCyjo8BNmpduIUFki8Usilh0R7007hzRMbg==
X-Received: by 2002:a05:6808:3089:b0:3a9:ba39:6d6e with SMTP id bl9-20020a056808308900b003a9ba396d6emr3735317oib.0.1702239954515;
        Sun, 10 Dec 2023 12:25:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b006cee23e7677sm4246487pfn.210.2023.12.10.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 12:25:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] util-linux: Fix build with latest musl
Date: Sun, 10 Dec 2023 12:25:47 -0800
Message-ID: <20231210202549.155550-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231210202549.155550-1-raj.khem@gmail.com>
References: <20231210202549.155550-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192122

Musl has removed basename declaration in string.h which exposes this
error.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...ls-include-libgen.h-for-basename-API.patch | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 952a680a849..e3bef5acfc5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,6 +36,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch \
+           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            "
 
 SRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
new file mode 100644
index 00000000000..2b9897ade12
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
@@ -0,0 +1,57 @@
+From 6581cf8ac95b99b5a35fea88c52646558d05b5e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Dec 2023 19:59:46 -0800
+Subject: [PATCH] login-utils: include libgen.h for basename API
+
+musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
+
+include libgen.h for using the posix declaration of the funciton.
+
+Fixes
+
+../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+  847 |                 shell_basename = basename(shell);
+      |                                  ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ login-utils/su-common.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+--- a/login-utils/su-common.c
++++ b/login-utils/su-common.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <pwd.h>
+ #include <grp.h>
++#include <libgen.h>
+ #include <security/pam_appl.h>
+ #ifdef HAVE_SECURITY_PAM_MISC_H
+ # include <security/pam_misc.h>
+@@ -840,17 +841,20 @@ static void run_shell(
+ 				su->simulate_login ? " login" : "",
+ 				su->fast_startup ? " fast-start" : ""));
+ 
++  char* tmp = xstrdup(shell);
+ 	if (su->simulate_login) {
+ 		char *arg0;
+ 		char *shell_basename;
+ 
+-		shell_basename = basename(shell);
++		shell_basename = basename(tmp);
+ 		arg0 = xmalloc(strlen(shell_basename) + 2);
+ 		arg0[0] = '-';
+ 		strcpy(arg0 + 1, shell_basename);
+ 		args[0] = arg0;
+-	} else
+-		args[0] = basename(shell);
++	} else {
++    args[0] = basename(tmp);
++  }
++  free(tmp);
+ 
+ 	if (su->fast_startup)
+ 		args[argno++] = "-f";
-- 
2.43.0


