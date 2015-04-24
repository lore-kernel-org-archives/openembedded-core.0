Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 730E173D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:40 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so36160727pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5FXxRLguXFZsJFSbP85mGoP9m5PLb8LnatV+RJNzz68=;
	b=xqSqjICtC7YGj/8FibVMS7LdiEZXMe1raNwGjOfQ+nsSA+m/3LxJYOjzc4sl2eEXFH
	dkzRVk2a6mSheZYP+nheOvluLlhQzOdRIC2wfS06xn5Pj9n4Vjb58W1NpzYVry0uS7T8
	Z+7zPgPkS+P02j5ESTRceYHaQqRn0YI+/adjvOokNXmGJqDx5U9ridQSMpvzEeMbpVLF
	Ni1Jzb+mAGr1PJUIDthivhht2ZNDiej27o5jzVPMcZJbu64OUIwdc9qAAglySy4h1l27
	qwEQN1BuCSju4U4dFjLxoJXmv2JKIqcbLM27hh6/HciKKJv5VrCJEFm/cCQtiZ2WEh/Q
	mNxg==
X-Received: by 10.70.36.139 with SMTP id q11mr2341819pdj.38.1429846542346;
	Thu, 23 Apr 2015 20:35:42 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:22 -0700
Message-Id: <3aa32b12ef330fc506b1d56d9b40324e14503e7b.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 04/14] u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:41 -0000

Change-Id: I5322f1ff8653009b45ddee1a2d3a0d96584d3327
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch | 91 +++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb |  4 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
new file mode 100644
index 0000000..12db94c
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
@@ -0,0 +1,91 @@
+Upstream-Status: Backport
+
+From 478b02f1a7043b673565075ea5016376f3293b23 Mon Sep 17 00:00:00 2001
+From: Hans de Goede <hdegoede@redhat.com>
+Date: Sat, 7 Feb 2015 22:52:40 +0100
+Subject: [PATCH] Add linux/compiler-gcc5.h to fix builds with gcc5
+
+Add linux/compiler-gcc5/h from the kernel sources at:
+
+commit 5631b8fba640a4ab2f8a954f63a603fa34eda96b
+Author: Steven Noonan <steven@uplinklabs.net>
+Date:   Sat Oct 25 15:09:42 2014 -0700
+
+    compiler/gcc4+: Remove inaccurate comment about 'asm goto' miscompiles
+
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
+---
+ include/linux/compiler-gcc5.h |   65 +++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 65 insertions(+)
+ create mode 100644 include/linux/compiler-gcc5.h
+
+Index: git/include/linux/compiler-gcc5.h
+===================================================================
+--- /dev/null
++++ git/include/linux/compiler-gcc5.h
+@@ -0,0 +1,65 @@
++#ifndef __LINUX_COMPILER_H
++#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
++#endif
++
++#define __used				__attribute__((__used__))
++#define __must_check			__attribute__((warn_unused_result))
++#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
++
++/* Mark functions as cold. gcc will assume any path leading to a call
++   to them will be unlikely.  This means a lot of manual unlikely()s
++   are unnecessary now for any paths leading to the usual suspects
++   like BUG(), printk(), panic() etc. [but let's keep them for now for
++   older compilers]
++
++   Early snapshots of gcc 4.3 don't support this and we can't detect this
++   in the preprocessor, but we can live with this because they're unreleased.
++   Maketime probing would be overkill here.
++
++   gcc also has a __attribute__((__hot__)) to move hot functions into
++   a special section, but I don't see any sense in this right now in
++   the kernel context */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++
++/*
++ * Mark a position in code as unreachable.  This can be used to
++ * suppress control flow warnings after asm blocks that transfer
++ * control elsewhere.
++ *
++ * Early snapshots of gcc 4.5 don't support this and we can't detect
++ * this in the preprocessor, but we can live with this because they're
++ * unreleased.  Really, we need to have autoconf for the kernel.
++ */
++#define unreachable() __builtin_unreachable()
++
++/* Mark a function definition as prohibited from being cloned. */
++#define __noclone	__attribute__((__noclone__))
++
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible __attribute__((externally_visible))
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#define __HAVE_BUILTIN_BSWAP16__
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
index 076dff8..7735288 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
@@ -12,7 +12,9 @@ SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
 
 PV = "v2015.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+           file://gcc5.patch \
+	   "
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


