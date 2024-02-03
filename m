Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2DFC48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:47 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.8374.1706920182585645304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fj0SAmV0;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21920c78c9fso618654fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706920181; x=1707524981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3K9owf40hYGVgn6tkTrPW+gN2xGPsS4G7Q7hh22GIGw=;
        b=fj0SAmV0DwD4tMZFLiiGhHe594NSNVZ9m3mq1I7g6M7KsroKeq9MjTZbFlPSsW5HVq
         eZclAuksN2qKyrpdsd5N87bwokBHm7HAu3az47IHBbLRclVzZaMAfkj3rrejOMDO4qLP
         mK1jirt8GRQ/6ukFucoofLW4zbgncRtrJSwjFJKBuz5/tdhyb7Dc3eRGa5KETsLpHFYL
         xZhRhSY3d1yrYUrjVv6kQk8rueyRaoFSh3z2NBLwoVqqasJABhlG8fkYzKBxe3oZ8i2E
         SdUpHGqED1RBuSIF7xZBuSo68o0Tj6I7NRKi8dzR1NotqGpQyA9DaX4NdAJHcqFxyWLK
         dHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706920181; x=1707524981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3K9owf40hYGVgn6tkTrPW+gN2xGPsS4G7Q7hh22GIGw=;
        b=oekAPRxMlQLbjIpJq3LpQ84xa+FxHLHP0F/5M9SJUTUmy+NCKrU0w+yJ6oAvGsuNDH
         CDMUYU262q42v8Htu1JB8erOAAaoXAqYDFPTICUv+1Iq97ra1aoV1QWUbpWLCcOu9Njk
         sz91FGWFR+Qk7yUOtKxuyudBf73QqDEqgfbHUmTbM0AAZB6MfHFAMRM81AI+0MhhYQ/o
         NTSz9DqJlaWdZigUWQspDn9XGK44FKCnMR1qhFHT52AW1VxvtlUcHajcJky0mw7pl/oY
         uwFeCAOzOiRBSyOackF1Ea0vZS97WNOlY9Se8fShlCsWbYRg3HVz+X8dlG6pHyDAwV22
         Em/A==
X-Gm-Message-State: AOJu0Ywd/ldAbsAP8Lzfj1fQQR1hsLaBnPHYSbgyVbAyiHulyMvkLEzC
	cInBkGm2BaL+pISj8XEwCKQXdQvPejPxAwUtfRxq+XRP3qdHlY5PO64QemZHJ1s=
X-Google-Smtp-Source: AGHT+IGTUy2x5/JUq0cQKeS5uwS7nqtAPgUnm8z5MiN4o9MIDlvYPVwjlAhpIisAkB7caxQcyI6/Vg==
X-Received: by 2002:a05:6871:811:b0:219:2581:d50f with SMTP id q17-20020a056871081100b002192581d50fmr1445403oap.6.1706920181430;
        Fri, 02 Feb 2024 16:29:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f19a])
        by smtp.gmail.com with ESMTPSA id bq16-20020a056a02045000b005d8baa3188esm2056785pgb.11.2024.02.02.16.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 16:29:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] pseudo: Fix build with gcc-14
Date: Fri,  2 Feb 2024 16:29:38 -0800
Message-ID: <20240203002938.3903103-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194824

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Fix-build-warnings-seen-with-gcc-14.patch | 41 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudolog.c-Fix-build-warnings-seen-with-gcc-14.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudolog.c-Fix-build-warnings-seen-with-gcc-14.patch b/meta/recipes-devtools/pseudo/files/0001-pseudolog.c-Fix-build-warnings-seen-with-gcc-14.patch
new file mode 100644
index 00000000000..d727a54d98d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudolog.c-Fix-build-warnings-seen-with-gcc-14.patch
@@ -0,0 +1,41 @@
+From 60af912335f9564862e9159ec21737210080e965 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Feb 2024 20:19:38 -0800
+Subject: [PATCH] pseudolog.c: Fix build warnings seen with gcc-14
+
+Define _XOPEN_SOURCE or we do not get strptime() signature defined
+resulting in implicit-function-declaration which is an error in gcc-14
+
+Swap the parameters of calloc call to fix calloc-transposed-args warning
+
+pseudolog.c: In function 'plog_trait':
+pseudolog.c:378:34: warning: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
+  378 |         new_trait = calloc(sizeof(*new_trait), 1);
+      |                                  ^
+pseudolog.c:378:34: note: earlier argument should specify number of elements, later size of each element
+
+Upstream-Status: Submitted [https://lore.kernel.org/openembedded-core/20240202043130.398590-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pseudolog.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+--- a/pseudolog.c
++++ b/pseudolog.c
+@@ -9,6 +9,7 @@
+ /* We need _XOPEN_SOURCE for strptime(), but if we define that,
+  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
+ #define _DEFAULT_SOURCE
++#define _XOPEN_SOURCE
+ 
+ #include <ctype.h>
+ #include <limits.h>
+@@ -374,7 +375,7 @@ plog_trait(int opt, char *string) {
+ 		pseudo_diag("invalid empty string for -%c\n", opt);
+ 		return 0;
+ 	}
+-	new_trait = calloc(sizeof(*new_trait), 1);
++	new_trait = calloc(1, sizeof(*new_trait));
+ 	if (!new_trait) {
+ 		pseudo_diag("Couldn't allocate requested trait (for -%c %s)\n",
+ 			opt, string ? string : "<nil>");
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f15fb0aaee5..8d1160944c5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
            file://0001-ports-linux-add-wrapper-for-statvfs64.patch \
+           file://0001-pseudolog.c-Fix-build-warnings-seen-with-gcc-14.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.43.0


