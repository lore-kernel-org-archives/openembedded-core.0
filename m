Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD7AC25B06
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 19:55:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.220.1660074914149043068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FqFq+QI5;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d16so12281892pll.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=FFbORogjoFbQa+NUoYeHovmqgcwBrkq6jW7V5h5Yd8c=;
        b=FqFq+QI5P1RSCOrHlJQCLiqBbNzG22XKY2Ki+1NiYVGMZ+L6POen8NS69GrkBr4Ykp
         +WzdbcEss4DiNXJG6zMdaeWtqRUYweHcBii3oa5w6atZ7PhIPMs5d0SXZAqfWRrwQelA
         qVgh+Sbs0vvg00buWN1TQAtOlQeGrdSVzfWFu+wMqtj2M1kuwvpam9oftyxTOnnIRXb+
         ITStrigwj4geLbCph4ig7uxL0BXwmuG6T4vpTcMT3cwRcYA5xST7l8OkBjsNoCnlBQoU
         PAHIL8Z4uWBVAPhwqZH7m2Y9tl2Y0AkDEoyAV0cNI8etyFQae2ybOSRFbuYx93DJo/04
         bzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FFbORogjoFbQa+NUoYeHovmqgcwBrkq6jW7V5h5Yd8c=;
        b=tpeabTO2/W8+ooSkmFT4LgbRnEexPr35O4ufpQEzI0JdJdGvkmkDIJNHhU7hoLADoy
         Q/ThxcBy9cOWJOZVNQZgUOrxJ1+0+jNyTfx8UewTKnAZtFXKrgiZXz8vSnj281CwrYWX
         869QAWn0iMBnTie8iIovy1ipLaQK3Fx1zu++ksQnsb8l5ZnYryeQ2IJdrVE+YMc4UP+P
         7yanrwy39C7r103yNcym7x9tzXuSagOj4PemgXvR7U4C0D9dNQUdM1g3NT4QeI3lFQYJ
         z7e5S0+mk4B61MRPUKiGI7J8xSE7ioawKlqhFYvfZ0vRVaZ7ofX1Npx7vptMJAS0dkAI
         IBNg==
X-Gm-Message-State: ACgBeo1iyVh1oqx9GPTfNjBBooghahSJcisC/epl7hcKXhIG44FiSDmI
	3rGm9DygQw7qxt6ygk+3uI+vXjoDQBk=
X-Google-Smtp-Source: 
 AA6agR7zjGZx7Y1Z0pObdw6er0SqCpCl80WFxMCnv8AuctbQqR+BLd5SEJZDkLjWdRP7P07RMvGkBg==
X-Received: by 2002:a17:902:ea02:b0:16f:11bf:f018 with SMTP id
 s2-20020a170902ea0200b0016f11bff018mr24312810plg.150.1660074913004;
        Tue, 09 Aug 2022 12:55:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a6557cb000000b0041cd5ddde6fsm8473343pgr.76.2022.08.09.12.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 12:55:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Upgrade to 251.4 and fix build with binutils 2.39
Date: Tue,  9 Aug 2022 12:55:10 -0700
Message-Id: <20220809195510.2520918-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 19:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169161

The mount.h conflict patch is now upstream so drop it.
Additionally this version fixes build with binutils-2.39 [1]

[1] https://github.com/systemd/systemd-stable/commit/8a6f966be404897b5333c218701965ac3b5a0806

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...md-boot_251.3.bb => systemd-boot_251.4.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 97 -------------------
 .../{systemd_251.3.bb => systemd_251.4.bb}    |  1 -
 4 files changed, 1 insertion(+), 99 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.3.bb => systemd-boot_251.4.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
 rename meta/recipes-core/systemd/{systemd_251.3.bb => systemd_251.4.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.3.bb b/meta/recipes-core/systemd/systemd-boot_251.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.3.bb
rename to meta/recipes-core/systemd/systemd-boot_251.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 03f1559f026..71eb93f23a2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "516108f273888df3dcfa4f42b140252a285a2288"
+SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
 SRCBRANCH = "v251-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
deleted file mode 100644
index 6222dfe60dd..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 23 Jul 2022 10:38:49 +0000
-Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build             | 13 ++++++++++++-
- src/basic/fd-util.c     |  2 ++
- src/core/namespace.c    |  2 ++
- src/shared/mount-util.c |  2 ++
- 4 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9c170acc0a..a2e4d5054e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -481,7 +481,6 @@ decl_headers = '''
- #include <uchar.h>
- #include <sys/mount.h>
- #include <sys/stat.h>
--#include <linux/fs.h>
- '''
- 
- foreach decl : ['char16_t',
-@@ -493,6 +492,17 @@ foreach decl : ['char16_t',
-         # We get -1 if the size cannot be determined
-         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
- 
-+        if decl == 'struct mount_attr'
-+                if have
-+                        want_linux_fs_h = false
-+                else
-+                        have = cc.sizeof(decl,
-+                                         prefix : decl_headers + '#include <linux/fs.h>',
-+                                         args : '-D_GNU_SOURCE') > 0
-+                        want_linux_fs_h = have
-+                endif
-+        endif
-+
-         if decl == 'struct statx'
-                 if have
-                         want_linux_stat_h = false
-@@ -508,6 +518,7 @@ foreach decl : ['char16_t',
- endforeach
- 
- conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
-+conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
- 
- foreach ident : ['secure_getenv', '__secure_getenv']
-         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
-diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
-index 6c1de92a26..00591d6c2d 100644
---- a/src/basic/fd-util.c
-+++ b/src/basic/fd-util.c
-@@ -3,7 +3,9 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <linux/btrfs.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- #include <linux/magic.h>
- #include <sys/ioctl.h>
- #include <sys/resource.h>
-diff --git a/src/core/namespace.c b/src/core/namespace.c
-index 3256871803..2eafe43290 100644
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
-@@ -7,7 +7,9 @@
- #include <sys/file.h>
- #include <sys/mount.h>
- #include <unistd.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "base-filesystem.h"
-diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
-index e76e4a0b38..0c8dec7688 100644
---- a/src/shared/mount-util.c
-+++ b/src/shared/mount-util.c
-@@ -7,7 +7,9 @@
- #include <sys/statvfs.h>
- #include <unistd.h>
- #include <linux/loop.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "chase-symlinks.h"
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd_251.3.bb b/meta/recipes-core/systemd/systemd_251.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_251.3.bb
rename to meta/recipes-core/systemd/systemd_251.4.bb
index 72b9155f2e1..8497e24af97 100644
--- a/meta/recipes-core/systemd/systemd_251.3.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -25,7 +25,6 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
-           file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
            "
 
 # patches needed by musl
-- 
2.37.1


