Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id EA95E7F888
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:37 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id i23so11845492pfo.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=81bkBcFLIhdN5U+NQKFzg8Kl4Qiyt8L/XUg2+d+Qha0=;
	b=azoIJhlWce2h6goXM6TO+z7nQfxbHF5o+TufejT2Lo5ioskCrproARtEme864/a5ZX
	p9QUQrS70xiqtAU3DtjFsMEjBvVVcShWRf1rpuc4bkcikxchm2D+FdTrILMO2WT6zy9H
	ZyCrtmtAtC24Fl+I3lBea5eMcoZjxVFP+vRZDjQdmX8ZE2dH1Z1aTu233XQZqgTu1O7P
	dUt21ihl3sjE1fnqjsb7WDZR7wxSblc6IiwX1445Lj6fvmcXMj6dXr8OZt8RS+729E+Q
	t94w9aYHMDkCTZGzc1H6g3CHujR5xiW0C/owppkbDy2vuW88sUMGdk/nE2s5x71O8ZFC
	/SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=81bkBcFLIhdN5U+NQKFzg8Kl4Qiyt8L/XUg2+d+Qha0=;
	b=YX5JJuV8+2uhdxCavv65iLYx3NqTOvnldp5eioAse604zOH36T+ZYcZIvtVrIkfhtT
	XJElH0iYMxBxwfk4f044wueMfZ06zL5tD9P8XBvsnuZuDufx2eNG2YaIBy5BlBWSOahq
	6sq1p6rSIUsApXjN2rQ0ow8VABqLXaIkfofUVK+qH8gg6g8mqm68JXUFn6bg5GCvn/yC
	K9TA18DmnGG60kVL0UU8ONx6aIJhsLpWy+T57v0v/R/TM1kbtTTR9xvIWiIgLc2KixTe
	Wxz7gdX6NdbHrSs953HzdvJxqXDrPJTGhYzdH2wg9umltUXXX3w0Sw1XF76ZRXBvuwaT
	rn0w==
X-Gm-Message-State: APjAAAW7xb4Nr0HtwhRyaquWc1V3LSrnMabsFwpRzqD+ODpXrIkPy1uK
	+mzTQOaF3FyRho9w++s8IEtuYATmF/U=
X-Google-Smtp-Source: APXvYqwH+Mp6zRW1wW+C0SvI2usefgTOlelQlFsxvl6tAypxnKvx4Wl0LgM6qaeKzuNhvrNN2M2n0A==
X-Received: by 2002:a65:46c6:: with SMTP id n6mr67846673pgr.15.1577645078558; 
	Sun, 29 Dec 2019 10:44:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:08 -0800
Message-Id: <20191229184415.19514-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] gcc-sanitizers: Fix build with glibc 2.31
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:38 -0000
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


