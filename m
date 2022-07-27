Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5A3C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 03:19:27 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.15686.1658891958974195310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 20:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMkv9QrO;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id z18so12158334qki.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 20:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A2VupvFbCNuly3Sy0qIVQDopmF9zyD2QeRsGtqCIEo=;
        b=VMkv9QrOWo6sYBOEigP+4YEH2ujgC+5J2OyfI5xL/vHLeh85BDxEuhDitqCwNwUem6
         3XrWKWrUS6Qx0qw2sNFFzk3E6QI4qmqBx0lGCHDm1u+4d/zjECk1xHwDGC6LVwedwbfR
         P56UHjEWVyDdGYssIplKGa4hFA75IWpBZS3+CyS8K4tLJgSN2DJbg6g2qdycb/yEO74r
         D0fA05HRIy4c8v7K4NJgRqnsjUdVOKLb1HLh2SPd05jqplOOTji2xuOPX7/iPmwsUFp/
         slpm7XywmNUSWrEBAItvheVqD/lNZ56iQjfiMzjuhHUNymY2qIEqQaA6/iAtEbEMrR1t
         Zi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A2VupvFbCNuly3Sy0qIVQDopmF9zyD2QeRsGtqCIEo=;
        b=mo6HYvawGdwXuTpAHAXb9+WeqOi1SYL/TaCesPSrBXc//PERd96EgzjqtdhyHIv75L
         m/lwFfOfdCQX2V029Ny/RycrxWsOTG9NpKano63GDnMB1+StCcRnX7XZNm8Vv59rSYkC
         aLyWPewrJEnKSOP15ibqGsxUZ++5qTnbGMypVxyTipCPm64xX345/nPnsxWDJJ/w2zG1
         IbVG20ikBtbe7G2lPdzLDZ8GDgCmGtgZsOQmmgSTQ0oMmVFjKMa296rriGUQKFyp7joH
         Ue7iwNYTqXd+onPxx7iCV9W62Jk3c7j8bDSkCkUPynlDUlewzS32Q7ktc7TIsH2LvlB+
         KhCw==
X-Gm-Message-State: AJIora/FrZBmc76Th6jsw1l9IB1hHd+TAQzW8+vR7wgdytOg/vzehW0H
	VK6hCcNk6RUcGSc6OGBp8u0lTCQqoJH/ow==
X-Google-Smtp-Source: 
 AGRyM1sVnRfY4AhUncq4kckBsqpArE36Kqc/iv2Ce6RA5cPEIXJQznJ8vs0Dh4hQnNRZcSb7WIM5UA==
X-Received: by 2002:a05:620a:4411:b0:6b6:59a:5456 with SMTP id
 v17-20020a05620a441100b006b6059a5456mr14642696qkp.574.1658891957620;
        Tue, 26 Jul 2022 20:19:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fea8:95df:9730:e8b7:596a:a352:5d5c])
        by smtp.gmail.com with ESMTPSA id
 d21-20020ac85ad5000000b0031ea1ad6c5asm10772457qtd.75.2022.07.26.20.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 20:19:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix conflict between glibc mount.h and kernel
 mount.h
Date: Tue, 26 Jul 2022 23:19:04 -0400
Message-Id: <20220727031904.16562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 03:19:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168539

See glibc documentation [1] for details

[1] https://sourceware.org/glibc/wiki/Release/2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 97 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_251.3.bb    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
new file mode 100644
index 0000000000..6222dfe60d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
@@ -0,0 +1,97 @@
+From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 23 Jul 2022 10:38:49 +0000
+Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build             | 13 ++++++++++++-
+ src/basic/fd-util.c     |  2 ++
+ src/core/namespace.c    |  2 ++
+ src/shared/mount-util.c |  2 ++
+ 4 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9c170acc0a..a2e4d5054e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -481,7 +481,6 @@ decl_headers = '''
+ #include <uchar.h>
+ #include <sys/mount.h>
+ #include <sys/stat.h>
+-#include <linux/fs.h>
+ '''
+ 
+ foreach decl : ['char16_t',
+@@ -493,6 +492,17 @@ foreach decl : ['char16_t',
+         # We get -1 if the size cannot be determined
+         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
+ 
++        if decl == 'struct mount_attr'
++                if have
++                        want_linux_fs_h = false
++                else
++                        have = cc.sizeof(decl,
++                                         prefix : decl_headers + '#include <linux/fs.h>',
++                                         args : '-D_GNU_SOURCE') > 0
++                        want_linux_fs_h = have
++                endif
++        endif
++
+         if decl == 'struct statx'
+                 if have
+                         want_linux_stat_h = false
+@@ -508,6 +518,7 @@ foreach decl : ['char16_t',
+ endforeach
+ 
+ conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
++conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
+ 
+ foreach ident : ['secure_getenv', '__secure_getenv']
+         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
+diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
+index 6c1de92a26..00591d6c2d 100644
+--- a/src/basic/fd-util.c
++++ b/src/basic/fd-util.c
+@@ -3,7 +3,9 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <linux/btrfs.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ #include <linux/magic.h>
+ #include <sys/ioctl.h>
+ #include <sys/resource.h>
+diff --git a/src/core/namespace.c b/src/core/namespace.c
+index 3256871803..2eafe43290 100644
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -7,7 +7,9 @@
+ #include <sys/file.h>
+ #include <sys/mount.h>
+ #include <unistd.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "base-filesystem.h"
+diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
+index e76e4a0b38..0c8dec7688 100644
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -7,7 +7,9 @@
+ #include <sys/statvfs.h>
+ #include <unistd.h>
+ #include <linux/loop.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "chase-symlinks.h"
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_251.3.bb b/meta/recipes-core/systemd/systemd_251.3.bb
index 8497e24af9..72b9155f2e 100644
--- a/meta/recipes-core/systemd/systemd_251.3.bb
+++ b/meta/recipes-core/systemd/systemd_251.3.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
            "
 
 # patches needed by musl
-- 
2.32.1 (Apple Git-133)


