Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD95C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 15:44:42 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.137365.1671119080801070958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 07:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AAKq51bn;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so3144904pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn9i3M0FSr03aWlQR0frrTIGNvvMt8mDdQogLHgkKng=;
        b=AAKq51bnZzbRlc/M7glFbJ08+oRMGLyRgPf90cnGDFKtAw9X8TesUN9ZbAY45R41Fe
         Fc5dzGOzKc4kV+C+X/x3BUVNqst8VXPuXyPFQ/vMLeyfED1p7VB/o5MEbdgoMzVKXRu3
         y5jyttxmwU6FZWAj6CiFAAV5nZv/EBpMM2kK3j/zmI05orfjfjFJ4rS/6fGi7N9dEPdF
         lrV1CScwssmjunIdEkrXdTALNGFMeiKx/hQiUxPVYYTNzEj+l6z7b2jsXKyV8JnxN5go
         Nog7WPSGGtHB1RDB6/eAPgZ6r4gnmW+F4Q2XL6D2wJOhK8AcloCd4mk2UcOxAVCwSZti
         wLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn9i3M0FSr03aWlQR0frrTIGNvvMt8mDdQogLHgkKng=;
        b=hiuZAjY7wezeAZDca8yVeGsmFxgF+XvbRQEGCVBVoSwes0LrbtEs33UKjExwagnTlD
         +xWS+Q3vMpiRu726bnMC2ql0b3CzpTn8X/Bvp9KbVAj0Aqzbd2jlzUTj5pYkEKPo5+u4
         W1hRDjijttWPxmASMuh9NinlEFxzehPC2y6DmdJA1MjuwP/TXlW3MtBPWbax0cZbgYU7
         LVjjFoMbliKvhyq9c71jNhGBkLH5pqKjhB25vGC9Kn3SxPtg5bpv9dtxyLDRi+rIqkHh
         eGB5mEO4EpmS8SN3KLC1QITWhCyWrCjm6xbB4K8m/BsL1M5U7FXr4Jl8rbX5h45fzdM0
         cJDA==
X-Gm-Message-State: ANoB5pnw+K80CZzTd+gWbtvBTXmQ0jfECrcEs4hNLM3dq1s47YMpBGFd
	P5UgikDwNsEJNZGb6ZTkjFEonc6/xjU=
X-Google-Smtp-Source: AA0mqf5TTjj1rG4GmX9LpIXBsR0XKu1F70CCUsCM8oo3ZnTOyvrQmPPzj+2Ct8U4wLMXcqMhXw2yJA==
X-Received: by 2002:a05:6a20:e193:b0:ad:f86d:c0ba with SMTP id ks19-20020a056a20e19300b000adf86dc0bamr8829319pzb.25.1671119079767;
        Thu, 15 Dec 2022 07:44:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id g27-20020a63521b000000b004790f514f15sm1704744pgb.22.2022.12.15.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 07:44:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] e2fsprogs: Do not use 64bit functions for largefile support
Date: Thu, 15 Dec 2022 07:44:37 -0800
Message-Id: <20221215154437.3655140-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 15:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174582

Using -D_FILE_OFFSET_BITS=64 already makes the normal function behave
like 64bit variants. Moreover it makes them portable across libc

Ensure that right lseek function is used with _FILE_OFFSET_BITS = 64

Refresh patches with devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change submission location to github

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
index 0000000000..a770d0cf89
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
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/129]
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
index 0000000000..20ed6ecb3b
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
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/129]
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


