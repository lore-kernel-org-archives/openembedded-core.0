Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1431CC25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 16:07:02 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.149.1659974813069178488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pvzR9PMz;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gb36so17418657ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Ll/DolFYnDu+VhdES/H4oIdPaqgbwYIl3FUD/wjIvZg=;
        b=pvzR9PMzhIzfkzs6jGrfXUwZrPmjlIaJ6599AuD0pE5fgE+VH+dTJhoSqUJVIdqIgg
         +NNXvfV+phf14ysRRxX6fXOozxOBRtkCWQ/JZNyG61V91e7/f2CAhAENwk5SvPMmYVCD
         rSqG8UGhbWoQSAmEEQhWJQuInHcuFhnTKddsjmkV0RU2m7J7vtuv70ntP5dokJAtwVMM
         pekbX+3bYa/5oP/fmdnXa1TTaVXCoEHcjETELk3aN+6TnQTe8NGNEIO145QNPS/LWF8E
         Swnbk3iy/4D8Qko0KndNZxq2JAPvaqeJNPZrrngkr3tfX85Ya8mphtgDSOlDrr+sIsyi
         tg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Ll/DolFYnDu+VhdES/H4oIdPaqgbwYIl3FUD/wjIvZg=;
        b=UVlBA28AbDivTeJJJ09FABsAbNDjfQoH9I5sCsltDXA8xxldNc+wHYC8TqoMAn41RR
         VNi8TkKOHK5RwclarFPosCTZeqmJ9/dtgrrK/c81TK7jAiwCy6N976QNq85E/ysSnz3Z
         ZYmdBRlGyr4S+cTj/ocYHHD6y63quELa9aWCFBdXBkZlozCCQ4OiRnxheytPbYWUbqRr
         JtOeHbJlU8jjMB+5zTYsvAlR2f0/CQFgA5wGe3jjBR2m6w1lgOvRiABkQa1AQ6AdpkcD
         NTknvACUeJDSXIbchQTy5xcVHK7S4hDg2q4xLBDVuV/tmJ4zAF5sYXvE5Kxy54LbyRBx
         P+JQ==
X-Gm-Message-State: ACgBeo1qk8daoIqe7m4X5l5WWPRTUC6n0CaRiyvWEjznfyaciy/P2Rcm
	0o2Y5oJnZAABMKhjpBi65YK+FNcmp+A=
X-Google-Smtp-Source: 
 AA6agR4NmZimbgQAQ46h42q6k3/WYJdZ2O5CgiuRKw/U/6N6XFcgwhkXe2AoZl+vVZUWr6hM0t1hxA==
X-Received: by 2002:a17:907:2c64:b0:730:defe:a419 with SMTP id
 ib4-20020a1709072c6400b00730defea419mr12763066ejc.680.1659974811217;
        Mon, 08 Aug 2022 09:06:51 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 y25-20020a170906471900b0072fa24c2ecbsm14566ejq.94.2022.08.08.09.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 09:06:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] syslinux: Fix build with glibc-2.36
Date: Mon,  8 Aug 2022 18:06:12 +0200
Message-Id: <20220808160612.4087903-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <17094F652C04D2B6.7414@lists.openembedded.org>
References: <17094F652C04D2B6.7414@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 16:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169096

* add only necessary definitions from linux/fs.h, because including
  whole file causes conflicts with sys/mount.h since glibc-2.36:
  http://errors.yoctoproject.org/Errors/Details/664535/

  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

 v2: add linux/limits.h needed for musl builds for PATH_MAX
     http://errors.yoctoproject.org/Errors/Details/665150/

 ...binstaller-Fix-build-with-glibc-2.36.patch | 56 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
new file mode 100644
index 0000000000..b16eec0076
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
@@ -0,0 +1,56 @@
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
+ libinstaller/linuxioctl.h | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/libinstaller/linuxioctl.h b/libinstaller/linuxioctl.h
+index e2731c7..f4a6703 100644
+--- a/libinstaller/linuxioctl.h
++++ b/libinstaller/linuxioctl.h
+@@ -16,7 +16,20 @@
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
++
++// for musl we also need limits.h for PATH_MAX
++#include <linux/limits.h>
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


