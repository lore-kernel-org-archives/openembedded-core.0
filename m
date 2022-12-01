Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16897C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:02:56 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.53543.1669921375227182619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5w61UkI;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id q71so2435672pgq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rktNNreWYjRsWkw6NB38fu+e5eQTjBeKKfkB1KkTdCY=;
        b=X5w61UkI+TVqTDSYkvUyTutVDgBsecjGnpMc4xKCASIXyuFwXYrt+Vxj5qraFitUiD
         pE2OTSHA91J5lD4aYWWdYxKR1QASMfIxEodMMisv7Bu3cYjpdv/OdtWvqH+xJPla5Yb5
         hXOTA01LkL2j/a9fRyruk13Hw7iwylP6C/GSAnXLY2QEfeJwHKWaSMqdPhdHbLUK3jpE
         G1968qnH3PlFy57mIBvZZyw8WEVz+etpHBvoCavzJJM22CaXhw+wenYyy1AJV2s3klsc
         RTagenCGZECsjgsoWWEScba818g87lxsAuAJRPjtF4XoLduLq4X+Xddpvo8lthqpq1q8
         qYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rktNNreWYjRsWkw6NB38fu+e5eQTjBeKKfkB1KkTdCY=;
        b=eDFzC6EGdTs2fRcrvVbfVopVbFzdTyexzbqORUE12/ktWO8fk5VmH/kCAHJIvcD6VF
         gruHXRjNVUdZTn22gJUwXkpjaH+qtj2kbw+cnn4eepUAZ3j7EpKwG4FZ56N5AdRaK2Ui
         kl0lq/AhEvcHHjggFnQ8OyRjAvqtOpiK+cx1K9WEaYvo3E6KK/ULSduVfLoTJWEHJSQY
         YvqhTMXLwzdn6cB6ix1L+OcqXW+qM5VyFUa+oC2n8px7lMnGZspGPOCyqO257H0eVyHI
         EFIJCf8Jzl7nTRg+xxkcXFSJLSOOk7ALLJeNKu1va0E8kZ8C6SCiMCm/2Xt7so2DbtnJ
         zzoQ==
X-Gm-Message-State: ANoB5plt6OPQ6Xr+iqV0pp6Hha54zpia1qhoJ3Sp64Ky+zu88RLrij9Z
	BjXNibGXEH10V4lYUEm/0/ogHnVYmfs=
X-Google-Smtp-Source: AA0mqf4S0vUTlruQ4fdgosyaskh5vQHvRhiYYt0n0432evJJvkG547hCymm++2tNpqYDnCwedINEcg==
X-Received: by 2002:a63:e658:0:b0:476:d785:71 with SMTP id p24-20020a63e658000000b00476d7850071mr43688274pgj.161.1669921374369;
        Thu, 01 Dec 2022 11:02:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id 19-20020a621413000000b00576489088c7sm321092pfu.37.2022.12.01.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:02:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] e2fsprogs: Do not use 64bit functions for largefile support
Date: Thu,  1 Dec 2022 11:02:46 -0800
Message-Id: <20221201190248.175753-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201190248.175753-1-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174205

Using -D_FILE_OFFSET_BITS=64 already makes the normal function behave
like 64bit variants. Moreover it makes them portable across libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-to-enable-disable-largefile-support.patch | 57 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
new file mode 100644
index 0000000000..1a00fa844c
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
+Upstream-Status: Pending
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index 5b2d1921f0..a251f126ae 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://ptest.patch \
            file://mkdir_p.patch \
            file://extents.patch \
+           file://0001-Add-option-to-enable-disable-largefile-support.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
@@ -17,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
                 --disable-libblkid --enable-verbose-makecmds \
-                --with-crond-dir=no"
+                --enable-largefile --with-crond-dir=no"
 
 EXTRA_OECONF:darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-- 
2.38.1


