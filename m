Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web10.1520.1588012852459502127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 11:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZvQJEqYW;
 spf=pass (domain: gmail.com, ip: 209.85.161.68, mailfrom: geissonator@gmail.com)
Received: by mail-oo1-f68.google.com with SMTP id r1so4089316oog.7
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=visreqx+QntjtY2zZokqrNHVqWpM71+esZ/dfliXH9A=;
        b=ZvQJEqYW7efUlUllscBewHdMeTgkU2PKt0eDQWloTLrODme05ePjrPMXOTiMMFGpme
         JXbtYR5QZ3KcbSITq8cQHjqtU0d4w1y9VlZtF/HL5RHenP7lKsrb9QlO8sA7epKEJquJ
         MY1IonGYUPW7FJzk1rXn0AOCLL4X465UF6bunm6Ks8k+oWqSRlc4Y2LwIj9IsXrEDQTo
         yuQFFsVmqRsKhJ8Pj5yTMoWl/0PEDWfi1cPX/s9cy21j7UrE4PEJTLh3uSdFEvCq5Dyh
         6IDhXiCT4Y9DBZ1UBgUH3mWUTIUV435HWBtft1/mHZbgQDmF+/NreS9Yx+BDsSfSR9Kc
         8DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=visreqx+QntjtY2zZokqrNHVqWpM71+esZ/dfliXH9A=;
        b=N+epqjrLKm0K9B0r1brSSOs3PYjAPMTPHl4+zBbzbX+pwxKNrwdqK4ZekhMLDxtzKW
         jFYUXQjuokQ/ptueIB7sC3r012TU2Z+r0jtNvlB13sllP3V/ioVoz57liU+rgu5mvCKK
         4Sbjhon64AJvQItvM4q5bh7uIxnY7t2nePe/LJHnd560Rqo5eliA3VzKYHXoSAO1W5U1
         sE/KswpSvFpGyd5fskNhYKAT6X1EMTt8kdtf9ir8sS/sXDIH6gGM7Az446r/2/u/NBNz
         /lPTO2af7k8nwG1ckZY4dzwtS8cSXpEPuldR+mXVszp3S/2Ah194Lz+hXRJdRIZEhC52
         orLw==
X-Gm-Message-State: AGi0Pua6e58ko6G+0YV1dfctpAOPJOctnWhkpSUpy076DNty+5BzVtt9
	Gyr2cL9ydr1gJ1so3NiHwyxeOp1Y950=
X-Google-Smtp-Source: APiQypJRnngF+gAk2wqwnNhtLiQ35V2RypvdEm8wdyEDJU2mqUg1ECT+D5ZZS/mfwWIQvCU+Cgyk8A==
X-Received: by 2002:a4a:7346:: with SMTP id e6mr19877698oof.89.1588012851548;
        Mon, 27 Apr 2020 11:40:51 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id y92sm4227191ota.33.2020.04.27.11.40.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2020 11:40:51 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] libffi: fix v3.3 compile on ppc64le
Date: Mon, 27 Apr 2020 13:40:28 -0500
Message-Id: <20200427184028.13675-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest released version of libffi no longer compiles on ppc64le
based machines. Some searching found a patch that fixed our issue but
had not been submitted upstream to libffi.

It has now been submitted upstream with this PR:
https://github.com/libffi/libffi/pull/561

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
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
2.21.0 (Apple Git-122)

