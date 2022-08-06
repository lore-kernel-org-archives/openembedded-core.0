Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6800DC19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 12:10:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.2551.1659787816624332160
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YPEu5Qur;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id z16so5840824wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=gSHzVuxcP7vJ0mYizSUdtPhVfxWIVsKL3X0P2WleeGY=;
        b=YPEu5QuraS3hFqxscefjvtBuCmiAstToqLY7abJcInyhXYup8K27QMnSDeXlWn+qPA
         xj0thfVFIHHW80vJWuHnd/mUEp9vasrQ7SmLFHMPUYzr5vnKlE5MnNYD01i8UkbItas9
         +GDpFEu/q52iS7Upg8C+T/NySXZREAnmTy3t4InDkFR4OlTJz6o62wHbmZ7LZ5fHlI6E
         tWNNKPSOFi2uRTb5YX9GdVrl9/siZawfrER4PyDlUETJfoF0q+0YunjM6OA0d1oQkGXz
         Jphp9jbWHCaup+aqzy1/grxe77bdbh2rL0ajOfqwBbbUdb74v/9ZBFHonzeB7Q5BmBBk
         3xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=gSHzVuxcP7vJ0mYizSUdtPhVfxWIVsKL3X0P2WleeGY=;
        b=lUmAk7IrSWRwyIZhr6G02sYtx49InAD4Cc5FZiGgDSr2Mn7nRcVkWPw4//UPeUGKTf
         4nI1+Fk4QNLlw/lpazDOZOLbxtWiR0UtabPYKmguxcG9dmuIobhrjsXp0gToZPetjd6F
         D9fEM9If/Low/83CyfOdAU1bi4mV+wbIpYT8nPJTk1iuV3dvd7CX0Iq0nihEb4yrzbQ0
         U3oefSD2ROpRZrqyZb2JmN/5EKbEmL2Gs5tcmD8fRhbIDWjTMIxTzrOPRDBNfl7FDKrB
         QRN5m44LEAVS3yQf3tooSQfygUfKAYFw5FodGyGnekT/cu5g933wqLzP9br6QTNwV7fO
         P0eQ==
X-Gm-Message-State: ACgBeo3ltEC+rFNUxV/LJTZPAuf12WVXVI+8wYBrTZFoUnDKZvxqg7NH
	KICLMf1yZuvURUeWlPx2zuQ8SaRV+TE=
X-Google-Smtp-Source: 
 AA6agR7oJcjhYswHAj3X9gTaj27ENpLgvk1dcHs6oPGMviRUYaFWL569GUeh2wWXlRMgMShwN/T+kg==
X-Received: by 2002:adf:ea0a:0:b0:220:6222:ee48 with SMTP id
 q10-20020adfea0a000000b002206222ee48mr6328170wrm.243.1659787814651;
        Sat, 06 Aug 2022 05:10:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c414a00b003a32167b8d4sm13465518wmm.13.2022.08.06.05.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 05:10:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] syslinux: Fix build with glibc-2.36
Date: Sat,  6 Aug 2022 14:09:38 +0200
Message-Id: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 12:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168971

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...binstaller-Fix-build-with-glibc-2.36.patch | 53 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
new file mode 100644
index 0000000000..69fea47088
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
@@ -0,0 +1,53 @@
+From 0c4f97b2dd22365d32b865dd002282e454a7edf0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Aug 2022 11:53:55 +0000
+Subject: [PATCH] libinstaller: Fix build with glibc-2.36
+
+* add only necessary definitions from linux/fs.h, because including whole
+  causes conflicts with sys/mount.h:
+  http://errors.yoctoproject.org/Errors/Details/664535/
+
+In file included from TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/recipe-sysroot/usr/include/linux/fs.h:19,
+                 from TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/linux/../libinstaller/linuxioctl.h:19,
+                 from TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/linux/../libinstaller/syslxcom.c:34:
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/recipe-sysroot/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
+   95 | enum fsconfig_command {
+      |      ^~~~~~~~~~~~~~~~
+In file included from TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/syslinux-6.04-pre2/linux/../libinstaller/syslxcom.c:31:
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/recipe-sysroot/usr/include/sys/mount.h:189:6: note: originally defined here
+  189 | enum fsconfig_command
+      |      ^~~~~~~~~~~~~~~~
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/recipe-sysroot/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
+   96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
+      |         ^~~~~~~~~~~~~~~~~
+...
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libinstaller/linuxioctl.h | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/libinstaller/linuxioctl.h b/libinstaller/linuxioctl.h
+index e2731c7..392bf16 100644
+--- a/libinstaller/linuxioctl.h
++++ b/libinstaller/linuxioctl.h
+@@ -16,7 +16,17 @@
+ #include <linux/fd.h>		/* Floppy geometry */
+ #include <linux/hdreg.h>	/* Hard disk geometry */
+ 
+-#include <linux/fs.h>		/* FIGETBSZ, FIBMAP, FS_IOC_* */
++// #include <linux/fs.h>		/* FIGETBSZ, FIBMAP, FS_IOC_* */
++// linux/fs.h unfortunately causes conflict with sys/mount.h since glibc-2.36
++// https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
++// add the necessary definitions
++
++#define FS_IOC_GETFLAGS                 _IOR('f', 1, long)
++#define FS_IOC_SETFLAGS                 _IOW('f', 2, long)
++#define FIBMAP	   _IO(0x00,1)	/* bmap access */
++#define FIGETBSZ   _IO(0x00,2)	/* get the block size used for bmap */
++#define FS_IMMUTABLE_FL			0x00000010 /* Immutable file */
++#define BLKGETSIZE _IO(0x12,96)	/* return device size /512 (long *arg) */
+ 
+ #undef SECTOR_SIZE		/* Defined in msdos_fs.h for no good reason */
+ #undef SECTOR_BITS
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 0e4a23c1b4..d8dac8ccf9 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0009-linux-syslinux-implement-install_bootblock.patch \
            file://0010-Workaround-multiple-definition-of-symbol-errors.patch \
            file://0001-install-don-t-install-obsolete-file-com32.ld.patch \
+           file://0012-libinstaller-Fix-build-with-glibc-2.36.patch \
            file://determinism.patch \
            "
 
-- 
2.35.1


