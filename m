Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5DA7FCB6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 04:05:57 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id z124so7035725pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 20:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=81bkBcFLIhdN5U+NQKFzg8Kl4Qiyt8L/XUg2+d+Qha0=;
	b=WopmL4p+LiXJfzcH7vHPllQNSnEHjOS6oCFbxli37nUwvWoG60YCSiS5FuL6yK+vb5
	gMFM83m5K7GVL/FS7h97Smt0IRHtGOjis15/vJ2ge1NcebDa+Ih7e61QV5/sO9EQIB1G
	DNMIVu4vKIFTX7pQ2V3/wWwmDz/+Nm0g+MmwbE6V1ND/UMfCJHJFKblYRLiVxVDYZJZI
	ZoZ39LaMe9Rg2yZbvjY2nS6ZQC9smOrD+eht0IWzW1ImzoJixgr6LDaoRQm8MmXbOH++
	jpiHaM4+HsKm3h/BDWBk9DrWZeinZwjtwsj6qoWJCl2DqKNbMc+8X5noOqMQ0QRez7ub
	64zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=81bkBcFLIhdN5U+NQKFzg8Kl4Qiyt8L/XUg2+d+Qha0=;
	b=E3QqAUkAQHr+HLiPlYDT3vEoxHqhiqFftN+XR+acNIXlM2IJPz/Ch1nIZJ2ZlSj39E
	nvUZHbaABDhk2rvR9ae4SkaX6M+PGDX8lIVFdK12DJ0h2G8ZP7LgKNffFVR8F02ZnkuZ
	HSZgCl/IA0Dv0hrmVCHO6+b6R2LTwFnY4tb6jJljbnEAJ0Y6pok0V9NuRTe7bZqx1WI/
	PrIwG8CtUmqof3pmOLnveDfvR+BWXXSWItecjMY/JCoM0qSSixGZ5RxCGv0mDDDQX2no
	dXL9SaruPz0cbqb1XOdkoUYuDgbZHJ0THdPFaLWoFZwIUu137+Om4uNslumvA78VDjih
	4Hkw==
X-Gm-Message-State: APjAAAUtrYikr3PZ6It81yISJUstm6ExSQx7El0B8jhY29yp2usP+Iq2
	jd5A7zoe3idttBH/aBLe2Ho9xSvrSdo=
X-Google-Smtp-Source: APXvYqzFPoaxGNztjpcZHZ9eYlwu+X7BrbjUJNkfiHP7ftSq3c7FjRe00dhzC/TAjU1ICNPvaSIpGw==
X-Received: by 2002:a62:888e:: with SMTP id l136mr25959011pfd.80.1576987558534;
	Sat, 21 Dec 2019 20:05:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	h16sm18988306pfn.85.2019.12.21.20.05.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 20:05:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 20:05:47 -0800
Message-Id: <20191222040549.286151-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222040549.286151-1-raj.khem@gmail.com>
References: <20191222040549.286151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] gcc-sanitizers: Fix build with glibc 2.31
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Dec 2019 04:05:58 -0000
Content-Transfer-Encoding: 8bit

Backport a patch from latest gcc-9-branch to fix an API change in glibc
2.31, this patch wont be needed when upgrading to 9.3 or 10.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
 ...libsanitizer-build-with-master-glibc.patch | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
index c6395998d5..926df11c27 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
            file://0034-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0035-Fix-for-testsuite-failure.patch \
            file://0036-Re-introduce-spe-commandline-options.patch \
+           file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
            file://CVE-2019-14250.patch \
 	   file://CVE-2019-15847_1.patch \
 	   file://CVE-2019-15847_2.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
new file mode 100644
index 0000000000..abe074c289
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
@@ -0,0 +1,70 @@
+From 7ed24d12664319f34625a12fd8c0f729a0e71f5c Mon Sep 17 00:00:00 2001
+From: Auto Builder <ab@rdk>
+Date: Sun, 22 Dec 2019 02:58:24 +0000
+Subject: [PATCH] Fix up libsanitizer build with master glibc
+
+2019-11-26  Jakub Jelinek  <jakub@redhat.com>
+
+	PR sanitizer/92154
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Cherry-pick
+	llvm-project revision 947f9692440836dcb8d88b74b69dd379d85974ce.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b02486e0951bc0ed38310a03be73e479fc6f3e7a;hp=3feeac76ffc38427de2d7d086e2928e63eee2d44]
+Signed-off-by: Auto Builder <ab@rdk>
+---
+ .../sanitizer_platform_limits_posix.cc            |  5 +++--
+ .../sanitizer_platform_limits_posix.h             | 15 +--------------
+ 2 files changed, 4 insertions(+), 16 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+index 6cd4a5bac..d823a1219 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+@@ -1156,8 +1156,9 @@ CHECK_SIZE_AND_OFFSET(ipc_perm, uid);
+ CHECK_SIZE_AND_OFFSET(ipc_perm, gid);
+ CHECK_SIZE_AND_OFFSET(ipc_perm, cuid);
+ CHECK_SIZE_AND_OFFSET(ipc_perm, cgid);
+-#if !defined(__aarch64__) || !SANITIZER_LINUX || __GLIBC_PREREQ (2, 21)
+-/* On aarch64 glibc 2.20 and earlier provided incorrect mode field.  */
++#if !SANITIZER_LINUX || __GLIBC_PREREQ (2, 31)
++/* glibc 2.30 and earlier provided 16-bit mode field instead of 32-bit
++   on many architectures.  */
+ CHECK_SIZE_AND_OFFSET(ipc_perm, mode);
+ #endif
+ 
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index 73af92af1..6a673a7c9 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -211,26 +211,13 @@ namespace __sanitizer {
+     u64 __unused1;
+     u64 __unused2;
+ #elif defined(__sparc__)
+-#if defined(__arch64__)
+     unsigned mode;
+-    unsigned short __pad1;
+-#else
+-    unsigned short __pad1;
+-    unsigned short mode;
+     unsigned short __pad2;
+-#endif
+     unsigned short __seq;
+     unsigned long long __unused1;
+     unsigned long long __unused2;
+-#elif defined(__mips__) || defined(__aarch64__) || defined(__s390x__)
+-    unsigned int mode;
+-    unsigned short __seq;
+-    unsigned short __pad1;
+-    unsigned long __unused1;
+-    unsigned long __unused2;
+ #else
+-    unsigned short mode;
+-    unsigned short __pad1;
++    unsigned int mode;
+     unsigned short __seq;
+     unsigned short __pad2;
+ #if defined(__x86_64__) && !defined(_LP64)
+-- 
+2.17.1
+
-- 
2.24.1


