Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E007E6A874
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:58:18 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 10so10281354pdi.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yLduFwsbiv3gxvnnvz/lmDpoPp542O9IhnNUEdbPAII=;
	b=SSYs/KDjsXWaAyLfHsqodCUrOkDra/NNPUHATsXTnMzhNxrj0mQ83D4wYrNmhRpcFe
	jb0X4ZlM++UfoOkHAvT0uq6Qcl7TcVJMnqIFIUnID4+eZvNb+yEYsbKahLKIDfnsocjL
	/vKDGDLIK3HvUQdiVPZI07F0RvTCb9DPclBPXG6tNV48+NzZgSD7CxWpU4XH+G36juFa
	fTfA+rF46OPnI9rqtRzyWCpLeaXyfs8updkHTGqjygUgMsyOpL7x5N+/wGMt71GGU+vS
	UZIgMiM0uUzVB8NNiZpYnHBKXJoyIS61Q6+tH7N1e7mo7WB7vBld1Nc09MmFldEi0Q9H
	2s9Q==
X-Received: by 10.66.230.130 with SMTP id sy2mr25402442pac.75.1371059900201;
	Wed, 12 Jun 2013 10:58:20 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ix3sm19909219pbc.37.2013.06.12.10.58.19 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 10:58:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 10:56:05 -0700
Message-Id: <1371059765-22276-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] webkit-gtk: Support build on mips64
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
X-List-Received-Date: Wed, 12 Jun 2013 17:58:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Enable-mips64-build.patch                 |   69 ++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch

diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
new file mode 100644
index 0000000..5a42cd7
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
@@ -0,0 +1,69 @@
+From 4084d31d5b1fe3bf041881ad124873dbf3cd1868 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 17 May 2013 19:51:11 -0700
+Subject: [PATCH] Enable mips64 build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ Source/JavaScriptCore/wtf/Platform.h   |    2 +-
+ Source/JavaScriptCore/wtf/dtoa/utils.h |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h
+===================================================================
+--- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/Platform.h	2012-08-20 09:30:25.000000000 -0700
++++ webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h	2013-06-12 00:58:14.624055787 -0700
+@@ -76,14 +76,19 @@
+ 
+ /* CPU(MIPS) - MIPS 32-bit */
+ /* Note: Only O32 ABI is tested, so we enable it for O32 ABI for now.  */
+-#if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_)) \
+-    && defined(_ABIO32)
++#if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_) \
++    || defined(__mips64))
++#if defined(__mips64)
++#define WTF_CPU_MIPS64 1
++#define WTF_MIPS_ARCH __mips64
++#else
+ #define WTF_CPU_MIPS 1
++#define WTF_MIPS_ARCH __mips
++#endif
+ #if defined(__MIPSEB__)
+ #define WTF_CPU_BIG_ENDIAN 1
+ #endif
+ #define WTF_MIPS_PIC (defined __PIC__)
+-#define WTF_MIPS_ARCH __mips
+ #define WTF_MIPS_ISA(v) (defined WTF_MIPS_ARCH && WTF_MIPS_ARCH == v)
+ #define WTF_MIPS_ISA_AT_LEAST(v) (defined WTF_MIPS_ARCH && WTF_MIPS_ARCH >= v)
+ #define WTF_MIPS_ARCH_REV __mips_isa_rev
+@@ -295,7 +300,7 @@
+ 
+ #endif /* ARM */
+ 
+-#if CPU(ARM) || CPU(MIPS) || CPU(SH4) || CPU(SPARC)
++#if CPU(ARM) || CPU(MIPS) || CPU(MIPS64) || CPU(SH4) || CPU(SPARC)
+ #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
+ #endif
+ 
+@@ -899,6 +904,7 @@
+     || CPU(ALPHA) \
+     || CPU(SPARC64) \
+     || CPU(S390X) \
++    || CPU(MIPS64) \
+     || CPU(PPC64)
+ #define WTF_USE_JSVALUE64 1
+ #else
+Index: webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h
+===================================================================
+--- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/dtoa/utils.h	2012-08-20 09:26:05.000000000 -0700
++++ webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h	2013-06-12 00:57:22.424054793 -0700
+@@ -49,7 +49,7 @@
+ defined(__ARMEL__) || \
+ defined(_MIPS_ARCH_MIPS32R2)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+-#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA)
++#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__)
+ #if defined(_WIN32)
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index cb192ff..3be6dba 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
   file://webgit-gtk_fix_build_with_automake_1.12.patch \
   file://bison-2.6.patch \
   file://obsolete_automake_macros.patch \
+  file://0001-Enable-mips64-build.patch \
  "
 
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
-- 
1.7.9.5


