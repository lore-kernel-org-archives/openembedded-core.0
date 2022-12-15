Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8625FC25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.128335.1671093951750537163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eBhnrzz1;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so2042244pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5FR59x43KKvoKLz00M0bujHhtlEJiVX8piZWEngr/g=;
        b=eBhnrzz1VSiUAQS5mkd4iWkA7XBYUJ0YHqa6Ismr3g4fositS5er3mMsiVA6Z7gXTB
         EnuLhrv6v2YI4moAyxfbuwCMvJbJ2Soq4tkGzz8Dhum6IDoUtp+RrCxfKx1UrMnUO0YU
         37t1nXhzq1CaQXY8xDqv7Buz4mp5dAMVF2L/o4sgcV56zMxG2Vs6p/BTKM/XeC12h3WX
         MZiUXBCr2gHxqQAylmQLwr2nlkRVU3S2CqeCz+pzzbCIIQEVSESUxjK8o8BrcdE9Ho2j
         3yU4GChdrc6Jfy1ZhV693UX8wap6L3s/PP/VG3se2S18FpdYsEfZU6xqLCTaeQ0IhMuG
         ciaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5FR59x43KKvoKLz00M0bujHhtlEJiVX8piZWEngr/g=;
        b=UV8+y9dVAY9Ff/w9p8n2SZwYSCyhsmDIK7pE28f2WXf5Ss97E1TuSApPdbMcB2ewHP
         HI5SmFxXkVBrvhIfMr5osdVrC7RsC7iSGgZg/jcqPsgq4pFzKGXj61TUMLtaRrMp8tro
         MRlbRENJ9wAUDRslZjERDTt3ZV2+m5kmTGV76+AzfyoMDF7vV4SroTFYSFCHTjfE3UvH
         dankikZyx9gKgNUtvAbm3F19KMylH0WWgHQfdir+GvTwxq6Ra2GJGm+lzhIOMfgtWfXG
         Q2GILOSG2QISuxB3wNTkFwT3nqP0L/wg3TBeQHF8r4uGdBwDg+B/7ysoE30I52mBBQmE
         Re5w==
X-Gm-Message-State: ANoB5plgFEUkV4iL7M38ldt5FhkQzoYB+9OaC/gXEOF9pj9/HNTxk7IZ
	hWyzZfD8VP763oHbgWhWblvwWp8fNJ8=
X-Google-Smtp-Source: AA0mqf7EI/5KkcVQFfG+W4tHWhAQT6j/T8vECHHUedhyggegwq2fDHQT/okTx9gENtXd7EBGL/H8mA==
X-Received: by 2002:a17:903:1209:b0:185:441e:90b4 with SMTP id l9-20020a170903120900b00185441e90b4mr39383310plh.26.1671093954300;
        Thu, 15 Dec 2022 00:45:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 08/11] e2fsprogs: Do not use 64bit functions for largefile support
Date: Thu, 15 Dec 2022 00:45:43 -0800
Message-Id: <20221215084546.125368-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174570

Using -D_FILE_OFFSET_BITS=64 already makes the normal function behave
like 64bit variants. Moreover it makes them portable across libc

Ensure that right lseek function is used with _FILE_OFFSET_BITS = 64

Refresh patches with devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-to-enable-disable-largefile-support.patch | 57 +++++++++++++++++++
 ...t-lseek-when-_FILE_OFFSET_BITS-is-64.patch | 37 ++++++++++++
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |  4 +-
 5 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
new file mode 100644
index 0000000000..5e3730ca40
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
@@ -0,0 +1,57 @@
+From 6fab3346d448298a24cee1faeb5fc8507a3b9712 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Nov 2022 20:34:54 -0800
+Subject: [PATCH] Add option to enable/disable largefile support
+
+fallocate can be used to have 64bit off_t provided its compiled with
+_FILE_OFFSET_BITS=64 which will be added automatically when
+--enable-largefile is used.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/e2fsprogs/code/merge-requests/4/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac    | 3 +++
+ misc/e4defrag.c | 6 +-----
+ 2 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dff3d1ca..ec1c5b64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1800,6 +1800,9 @@ OS_IO_FILE=""
+   ;;
+ esac]
+ AC_SUBST(OS_IO_FILE)
++
++AC_SYS_LARGEFILE
++
+ dnl
+ dnl Make our output files, being sure that we create the some miscellaneous 
+ dnl directories
+diff --git a/misc/e4defrag.c b/misc/e4defrag.c
+index 86e97ee3..e7175c37 100644
+--- a/misc/e4defrag.c
++++ b/misc/e4defrag.c
+@@ -195,10 +195,6 @@ static struct frag_statistic_ino	frag_rank[SHOW_FRAG_FILES];
+ #error posix_fadvise not available!
+ #endif
+ 
+-#ifndef HAVE_FALLOCATE64
+-#error fallocate64 not available!
+-#endif /* ! HAVE_FALLOCATE64 */
+-
+ /*
+  * get_mount_point() -	Get device's mount point.
+  *
+@@ -1568,7 +1564,7 @@ static int file_defrag(const char *file, const struct stat64 *buf,
+ 	/* Allocate space for donor inode */
+ 	orig_group_tmp = orig_group_head;
+ 	do {
+-		ret = fallocate64(donor_fd, 0,
++		ret = fallocate(donor_fd, 0,
+ 		  (ext2_loff_t)orig_group_tmp->start->data.logical * block_size,
+ 		  (ext2_loff_t)orig_group_tmp->len * block_size);
+ 		if (ret < 0) {
+-- 
+2.38.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch
new file mode 100644
index 0000000000..a219296b89
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch
@@ -0,0 +1,37 @@
+From 1a8aaa8ff7f4aca68b5ae964458e49ab16b4315f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Dec 2022 20:56:44 -0800
+Subject: [PATCH] ext2fs: Use 64bit lseek when _FILE_OFFSET_BITS is 64
+
+Use lseek() with 64bit off_t when _FILE_OFFSET_BITS is 64
+this fixes build with musl where there is no _llseek but lseek
+is using off_t which is 64bit on musl
+
+Upstream-Status: Submitted [https://sourceforge.net/p/e2fsprogs/code/merge-requests/4/]
+Signe-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ext2fs/llseek.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ext2fs/llseek.c b/lib/ext2fs/llseek.c
+index 922a0d56..45f21d09 100644
+--- a/lib/ext2fs/llseek.c
++++ b/lib/ext2fs/llseek.c
+@@ -51,7 +51,7 @@ extern long long llseek (int fd, long long offset, int origin);
+ 
+ #else	/* ! HAVE_LLSEEK */
+ 
+-#if SIZEOF_LONG == SIZEOF_LONG_LONG
++#if SIZEOF_LONG == SIZEOF_LONG_LONG || _FILE_OFFSET_BITS+0 == 64
+ 
+ #define my_llseek lseek
+ 
+@@ -69,7 +69,7 @@ static int _llseek (unsigned int, unsigned long,
+ 
+ static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offset_high,
+ 		 unsigned long, offset_low,ext2_loff_t *,result,
+-		 unsigned int, origin)
++		 unsigned int, origin);
+ #endif
+ 
+ static ext2_loff_t my_llseek (int fd, ext2_loff_t offset, int origin)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 29078f9dd3..92bd0d0c1f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 22d7557905534d9e1b39f7d2a6d2036a40bf0c4e Mon Sep 17 00:00:00 2001
+From cce489c96aa3f4272a19d2137c2a46b439636712 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 902a369eb0..d695580c92 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 5408b6463ee700a080a15102bccccdeb2615d734 Mon Sep 17 00:00:00 2001
+From 20bf59365646af0466c1910e8763b352380b26d6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index 5b2d1921f0..ceceb7edcc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -5,6 +5,8 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://ptest.patch \
            file://mkdir_p.patch \
            file://extents.patch \
+           file://0001-Add-option-to-enable-disable-largefile-support.patch \
+           file://0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
@@ -17,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
                 --disable-libblkid --enable-verbose-makecmds \
-                --with-crond-dir=no"
+                --enable-largefile --with-crond-dir=no"
 
 EXTRA_OECONF:darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-- 
2.39.0


