Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.1518.1588648869381930914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i3fSpj6d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id x10so255778plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wcKVKqOZin4JPDhVZoAV80OhSDN9tcsOWUMSrn+2itg=;
        b=i3fSpj6dMW020kkQmKF1f0FRZBT58bJk917JOby/qsS8HkcsG/ix2qCZM+lxu21uxI
         fjqSXIjwO/yT5vcoNxFADRSAP+FpCDnSnNGgeVw1urRkFw8skTFSdftSHWOXKd6l+Jgu
         weeAwVU2BhL9UxXY7Iy+DyJaWkF+M0k1b/ee1q4dmcW5Lw5iSnMcjVsKzVevFpR8EAUT
         uxI/SiCJzozaZYqNs09gRZISgg1ZdJh/XcrWft6IeymrdVKtEwpzrfW1jYUOuq4y1XzD
         zWPcsGHe2pYiclE7atZxvSqjVh1uH0BMd2lydS5al7z88g9MY9hIE3bJ+VygpaHqn9LD
         3nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wcKVKqOZin4JPDhVZoAV80OhSDN9tcsOWUMSrn+2itg=;
        b=Y//QHEt0hS2wDLsYgPvq2M19lhKk3lDe5EjXDhpqNcJcbzc/i819lLf2NyrY9vGt0q
         jsP7mDD65XTNfFCHiqXlKFi00PfFQ8qYHZtXkySU+QwKf4C/XNyvdwGbg6Mp7tkniFHJ
         hgQ7j0EB6KV0QSKDDH9j3R8w+224vqSs3S/XG1sdS04nFJd9k7KCVe2SDW1gRHS50gn4
         YoPt9xjOJrb1o3sLTNllVnwDRXb+0i4Xx9W0YuLBOmNUOrDbDN+oG5WwBU58+IXVTjr5
         2bueNcP7YTwSaj0ryOuovmtvWPNGyabPTg/28rKlOS3mBBMemOhgTlwCX2LTkvJ72rZb
         dfWg==
X-Gm-Message-State: AGi0PuYkDwHH0BUJoOsNKsEDEPK0XUFWkCFuIyjLo4R7DYaDe+mo4z6q
	JkVc0UGKjKMKEq8EMbVcNmNFjpyjl6Pu6g==
X-Google-Smtp-Source: APiQypJXNyaZLVffYCcwsWqcPqbNZtBw+Pyap51bpWELUBRr6424xPSgr9IOPKhIuit6ICsrXk198Q==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr1123829plp.184.1588648868275;
        Mon, 04 May 2020 20:21:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/28] libffi: fix v3.3 compile on ppc64le
Date: Mon,  4 May 2020 17:19:18 -1000
Message-Id: <ed7ce0d5e9009d80a79c39bb3d0d45de6e7721c0.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Andrew Geissler <geissonator@gmail.com>

The latest released version of libffi no longer compiles on ppc64le
based machines. Some searching found a patch that fixed our issue but
had not been submitted upstream to libffi.

It has now been submitted upstream with this PR:
https://github.com/libffi/libffi/pull/561

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...pc.h-fix-build-failure-with-powerpc7.patch | 62 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.3.bb     |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch b/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
new file mode 100644
index 0000000000..52e6e4536b
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
@@ -0,0 +1,62 @@
+From de93adfb6f48100946bba2c3abad2a77a0cfde0b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Nov 2019 09:52:01 +0100
+Subject: [PATCH] ffi_powerpc.h: fix build failure with powerpc7
+
+This is a patch pulled down from the following:
+https://github.com/buildroot/buildroot/blob/78926f610b1411b03464152472fd430012deb9ac/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
+
+This issue is being hit on OpenBMC code when pulling the latest
+libffi tag and building on a P8 ppc64le machine. I verified this
+patch fixes the issue we are seeing.
+
+Below is the original commit message:
+
+Sicne commit 73dd43afc8a447ba98ea02e9aad4c6898dc77fb0, build on powerpc7
+fails on:
+
+In file included from ../src/powerpc/ffi.c:33:0:
+../src/powerpc/ffi_powerpc.h:61:9: error: '_Float128' is not supported on this target
+ typedef _Float128 float128;
+         ^~~~~~~~~
+
+Fix this build failure by checking for __HAVE_FLOAT128 before using
+_Float128, as _Float128 is enabled only on specific conditions, see
+output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/bits/floatn.h:
+
+ /* Defined to 1 if the current compiler invocation provides a
+    floating-point type with the IEEE 754 binary128 format, and this glibc
+    includes corresponding *f128 interfaces for it.  */
+ #if defined _ARCH_PWR8 && defined __LITTLE_ENDIAN__ && (_CALL_ELF == 2) \
+     && defined __FLOAT128__ && !defined __NO_LONG_DOUBLE_MATH
+ # define __HAVE_FLOAT128 1
+ #else
+ # define __HAVE_FLOAT128 0
+ #endif
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
+
+Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/561]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
+---
+ src/powerpc/ffi_powerpc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
+index 8e2f2f0..960a5c4 100644
+--- a/src/powerpc/ffi_powerpc.h
++++ b/src/powerpc/ffi_powerpc.h
+@@ -57,7 +57,7 @@ typedef union
+   double d;
+ } ffi_dblfl;
+
+-#if defined(__FLOAT128_TYPE__)
++#if defined(__FLOAT128_TYPE__) && defined(__HAVE_FLOAT128)
+ typedef _Float128 float128;
+ #elif defined(__FLOAT128__)
+ typedef __float128 float128;
+--
+2.21.0 (Apple Git-122)
+
diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.3.bb
index 803a25fa35..e5beb985c6 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV
            file://0001-powerpc-fix-build-failure-on-power7-and-older-532.patch \
            file://0001-Address-platforms-with-no-__int128.patch \
            file://0001-Address-platforms-with-no-__int128-part2.patch \
+           file://0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch \
            "
 SRC_URI[md5sum] = "6313289e32f1d38a9df4770b014a2ca7"
 SRC_URI[sha256sum] = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
-- 
2.17.1

