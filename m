Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 900186AF25
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:46:28 +0000 (UTC)
Received: from aimless.elisa-laajakaista.fi
	(a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id EAA5D26541;
	Mon,  1 Jul 2013 15:46:25 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 16:46:17 +0300
Message-Id: <1372686377-21512-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] webkit-gtk: add aarch64 support
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
X-List-Received-Date: Mon, 01 Jul 2013 13:46:28 -0000

Add patch from meta-linaro to compile webkit on aarch64.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 .../webkit/webkit-gtk-1.8.3/aarch64.patch          | 41 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch

diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
new file mode 100644
index 0000000..a76b0ba
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+Index: webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h
+===================================================================
+--- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/Platform.h 2013-06-12 00:58:14.000000000 -0700
++++ webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h  2013-06-12 00:59:18.764056782 -0700
+@@ -304,6 +304,11 @@
+ #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
+ #endif
+ 
++/* CPU(AARCH64) - Aarch64 */
++#if defined(__aarch64__)
++#define WTF_CPU_AARCH64 1
++#endif
++
+ /* ==== OS() - underlying operating system; only to be used for mandated low-level services like 
+    virtual memory, not to choose a GUI toolkit ==== */
+ 
+@@ -905,7 +910,8 @@
+     || CPU(SPARC64) \
+     || CPU(S390X) \
+     || CPU(MIPS64) \
+-    || CPU(PPC64)
++    || CPU(PPC64) \
++    || CPU(AARCH64)
+ #define WTF_USE_JSVALUE64 1
+ #else
+ #define WTF_USE_JSVALUE32_64 1
+Index: webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h
+===================================================================
+--- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/dtoa/utils.h   2013-06-12 00:57:22.000000000 -0700
++++ webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h    2013-06-12 00:58:28.340056029 -0700
+@@ -49,7 +49,7 @@
+ defined(__ARMEL__) || \
+ defined(_MIPS_ARCH_MIPS32R2)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+-#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64)
++#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64) || CPU(AARCH64)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__)
+ #if defined(_WIN32)
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 3be6dba..ed98b30 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "\
   file://bison-2.6.patch \
   file://obsolete_automake_macros.patch \
   file://0001-Enable-mips64-build.patch \
+  file://aarch64.patch \
  "
 
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
-- 
1.8.3.1


