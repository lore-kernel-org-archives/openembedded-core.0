Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B38C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 00:26:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.4078.1677112001866912648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 16:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JnL88HVY;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bt28so2740850wrb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 16:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OfYqMjRyP/utDZVZjVTMc+CcULAdEZvBat8uxzY5Xo=;
        b=JnL88HVYzhaacOp3A/Ulia0NI6mmM8kCgdtb8zjjCO6R+iw0EnBczP1aa955lpCUq8
         ilp/hdlsCuy4tKW7PE1cBfSoA290XEyqwWsrKxOgML4dejdnVvgVjN+w3pB+dwoJ46BL
         IG/JhWFxxmD+3oThdZHJYfzS31iePf5nk/6oAr497drU7NWKSDC6n15JGro3K2v2xd3w
         PjLOM1HKp2zMwfrY9KIGPoE0Qc/AqzOH8ljQM0b1c9MhVmjvxljfjRU9n6gKTi9w5x+X
         H+h8DBWTOX3tULTIyqDRQanQfPHAJa8chdIZdF20g6R8Z8/TcE5G/hevmbIruI9OXQpF
         yyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OfYqMjRyP/utDZVZjVTMc+CcULAdEZvBat8uxzY5Xo=;
        b=XZzAxg5RTY8HM9FCdjHBqNiBIUF2YpdJFcI4mYVrQFOGkahkXgW31QQukxM3euDDlH
         eoWXeGyQWsP2xpWeLwq1owyQtPfgUhGflPGHxeWlOJV8fcVopXegZuo929FoWG+l/2R/
         zb7rDCJ9794wNtTYQ7LyzHTus+bkE5JNdqatNGv8oKD3+FscbyYfKiVo4OCi37K738w5
         bP/lz2ZId1uUgL3GOk1McFLmnM74OBheyg8qgdoGSYUkJQ2GioSTaIM7HXcQnwwiwxbo
         ED+K9Bw/Caupv5xjjpd6699BTgvZ+mxexAFb/09LhHu+6agoWGMhf5qrDdfwfkjjanuR
         F2bQ==
X-Gm-Message-State: AO0yUKXAKXNPDpZ+bVbJTKiiZz+bNDT/Arl/nd+/gKjdWkp9o8xx6oTU
	FIforU2KN935RXC2miYMOAGHkmFJUqg=
X-Google-Smtp-Source: AK7set/51bnYvSgADHmEDZPdUb9ls65AxiGkdM5TUwqtp5iowAXaFiBFCYdn7B6ohYOuR3mdAJhu+w==
X-Received: by 2002:a5d:4acb:0:b0:2c5:9a0d:709f with SMTP id y11-20020a5d4acb000000b002c59a0d709fmr9355193wrs.15.1677112000087;
        Wed, 22 Feb 2023 16:26:40 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m26-20020a7bca5a000000b003e20a6fd604sm8661947wml.4.2023.02.22.16.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 16:26:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joel Stanley <joel@jms.id.au>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv3] qemu: Fix building with 6.2 kernel headers
Date: Thu, 23 Feb 2023 01:26:32 +0100
Message-Id: <20230223002632.3750526-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 00:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177595

From: Joel Stanley <joel@jms.id.au>

When building native qemu with 6.2 kernel headers, qemu fails to build:

 In file included from /usr/include/linux/btrfs.h:29,
                  from ../qemu-7.2.0/linux-user/syscall.c:165:
 /usr/include/linux/fs.h:50:8: error: redefinition of ‘struct file_clone_range’
    50 | struct file_clone_range {
       |        ^~~~~~~~~~~~~~~~
 ../qemu-7.2.0/linux-user/syscall.c:129:8: note: originally defined here
   129 | struct file_clone_range {
       |        ^~~~~~~~~~~~~~~~

Backport changes to linux-user that remove the local copy of struct
file_clone_range.

Patches from https://lore.kernel.org/qemu-devel/20230110174901.2580297-1-berrange@redhat.com/

Signed-off-by: Joel Stanley <joel@jms.id.au>
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 ...er-add-more-compat-ioctl-definitions.patch | 69 ++++++++++++++++
 ...r-fix-compat-with-glibc-2.36-sys-mou.patch | 78 +++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 92828e8f2d..1e768b560d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
+           file://0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch \
+           file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
new file mode 100644
index 0000000000..cd8121fed1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
@@ -0,0 +1,69 @@
+From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 10 Jan 2023 12:49:00 -0500
+Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
+
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem
+that caused a clash when both sys/mount.h annd linux/mount.h
+are included, and backported this to the 2.36 stable release
+too:
+
+  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+It is saner for QEMU to remove the workaround it applied for
+glibc 2.36 and expect distros to ship the 2.36 maint release
+with the fix. This avoids needing to add a further workaround
+to QEMU to deal with the fact that linux/brtfs.h now also pulls
+in linux/mount.h via linux/fs.h since Linux 6.1
+
+Upstream-Status: Backport from v8.0 (master)
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Link: https://lore.kernel.org/r/20230110174901.2580297-2-berrange@redhat.com
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ linux-user/syscall.c | 25 -------------------------
+ 1 file changed, 25 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index f95a6161e..510de8edc 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -111,31 +111,6 @@
+ #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
+ #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
+ #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+-
+-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
+-#define BLKDISCARD _IO(0x12,119)
+-#define BLKIOMIN _IO(0x12,120)
+-#define BLKIOOPT _IO(0x12,121)
+-#define BLKALIGNOFF _IO(0x12,122)
+-#define BLKPBSZGET _IO(0x12,123)
+-#define BLKDISCARDZEROES _IO(0x12,124)
+-#define BLKSECDISCARD _IO(0x12,125)
+-#define BLKROTATIONAL _IO(0x12,126)
+-#define BLKZEROOUT _IO(0x12,127)
+-
+-#define FIBMAP     _IO(0x00,1)
+-#define FIGETBSZ   _IO(0x00,2)
+-
+-struct file_clone_range {
+-        __s64 src_fd;
+-        __u64 src_offset;
+-        __u64 src_length;
+-        __u64 dest_offset;
+-};
+-
+-#define FICLONE         _IOW(0x94, 9, int)
+-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
+-
+ #else
+ #include <linux/fs.h>
+ #endif
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
new file mode 100644
index 0000000000..d754f21ad4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
@@ -0,0 +1,78 @@
+From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 10 Jan 2023 12:49:01 -0500
+Subject: [PATCH] Revert "linux-user: fix compat with glibc >= 2.36
+ sys/mount.h"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
+
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem
+that caused a clash when both sys/mount.h annd linux/mount.h
+are included, and backported this to the 2.36 stable release
+too:
+
+  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+It is saner for QEMU to remove the workaround it applied for
+glibc 2.36 and expect distros to ship the 2.36 maint release
+with the fix. This avoids needing to add a further workaround
+to QEMU to deal with the fact that linux/brtfs.h now also pulls
+in linux/mount.h via linux/fs.h since Linux 6.1
+
+Upstream-Status: Backport from v8.0 (master)
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Link: https://lore.kernel.org/r/20230110174901.2580297-3-berrange@redhat.com
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ linux-user/syscall.c | 18 ------------------
+ meson.build          |  2 --
+ 2 files changed, 20 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 510de8edc..13a67b84b 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -95,25 +95,7 @@
+ #include <linux/soundcard.h>
+ #include <linux/kd.h>
+ #include <linux/mtio.h>
+-
+-#ifdef HAVE_SYS_MOUNT_FSCONFIG
+-/*
+- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
+- * which in turn prevents use of linux/fs.h. So we have to
+- * define the constants ourselves for now.
+- */
+-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
+-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
+-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
+-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
+-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
+-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
+-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
+-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
+-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+-#else
+ #include <linux/fs.h>
+-#endif
+ #include <linux/fd.h>
+ #if defined(CONFIG_FIEMAP)
+ #include <linux/fiemap.h>
+diff --git a/meson.build b/meson.build
+index e44432370..f37ba4114 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
+                      cc.has_header_symbol('getopt.h', 'optreset'))
+ config_host_data.set('HAVE_IPPROTO_MPTCP',
+                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
+-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
+-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
+ 
+ # has_member
+ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.39.2


