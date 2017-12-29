Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ACD8F71A36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 05:43:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Dec 2017 21:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,474,1508828400"; d="scan'208";a="16334147"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2017 21:43:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Dec 2017 13:43:31 +0800
Message-Id: <1514526211-19408-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gdb: fix build with x32
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
X-List-Received-Date: Fri, 29 Dec 2017 05:43:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

When compiling gdb for x32, it fails with errors:

|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c: In function 'const target_desc* get_ipa_tdesc(int)':
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:184:10: error: 'X86_TDESC_AVX512' was not declared in this scope
|     case X86_TDESC_AVX512:
|          ^~~~~~~~~~~~~~~~
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:184:10: note: suggested alternative: 'X86_TDESC_AVX'
|     case X86_TDESC_AVX512:
|          ^~~~~~~~~~~~~~~~
|          X86_TDESC_AVX
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:185:14: error: 'tdesc_x32_avx512_linux' was not declared in this scope
|       return tdesc_x32_avx512_linux;
|              ^~~~~~~~~~~~~~~~~~~~~~
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:185:14: note: suggested alternative: 'tdesc_x32_avx_linux'
|       return tdesc_x32_avx512_linux;
|              ^~~~~~~~~~~~~~~~~~~~~~
|              tdesc_x32_avx_linux
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c: In function 'void initialize_low_tracepoint()':
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:282:3: error: 'init_registers_x32_avx512_linux' was not declared in this scope
|   init_registers_x32_avx512_linux ();
|   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|../../../gdb-8.0/gdb/gdbserver/linux-amd64-ipa.c:282:3: note: suggested alternative: 'init_registers_x32_avx_linux'
|   init_registers_x32_avx512_linux ();
|   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|   init_registers_x32_avx_linux

Backport:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=f02fd7745d003d65fd3b981618e07b874b721d79

Fixes [YOCTO #12120]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gdb/gdb-8.0.inc              |   1 +
 .../gdb/0012-Unbreak-GDBserver-build-for-x32.patch | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.inc
index fba32ce..86fed70 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
+           file://0012-Unbreak-GDBserver-build-for-x32.patch \
 "
 SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
 SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch b/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
new file mode 100644
index 0000000..18a3ce3
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
@@ -0,0 +1,101 @@
+From 3e1e401053ea5f02a9e9c65abddd31a03baa1bd1 Mon Sep 17 00:00:00 2001
+From: Yao Qi <yao.qi@linaro.org>
+Date: Fri, 29 Dec 2017 12:57:25 +0800
+Subject: [PATCH] Unbreak GDBserver build for x32
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When I verify my target description changes, I build GDB and GDBserver for
+x32, but it failed.
+
+/../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c
+../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c: In function ‘const target_desc* get_ipa_tdesc(int)’:
+../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:184:10: error: ‘X86_TDESC_AVX512’ was not declared in this scope
+     case X86_TDESC_AVX512:
+          ^
+../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:185:14: error: ‘tdesc_x32_avx512_linux’ was not declared in this scope
+       return tdesc_x32_avx512_linux;
+              ^
+../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c: In function ‘void initialize_low_tracepoint()’:
+../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:282:36: error: ‘init_registers_x32_avx512_linux’ was not declared in this scope
+   init_registers_x32_avx512_linux ();
+                                    ^
+
+ipa_x32_linux_regobj use to be there, but removed by
+22049425ce40324139be82d9a6ec518c46b65815 by mistake.
+
+gdb/gdbserver:
+
+2017-08-04  Yao Qi  <yao.qi@linaro.org>
+
+        * configure.srv (ipa_x32_linux_regobj): New.
+        * linux-amd64-ipa.c (get_ipa_tdesc): Use X86_TDESC_AVX_AVX512
+        instead of X86_TDESC_AVX512.
+        (initialize_low_tracepoint): Call
+        init_registers_x32_avx_avx512_linux.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=f02fd7745d003d65fd3b981618e07b874b721d79]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ChangeLog                       | 8 ++++++++
+ gdb/gdbserver/configure.srv     | 1 +
+ gdb/gdbserver/linux-amd64-ipa.c | 6 +++---
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 4ac2d63..b5b8228 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++ 2017-08-04  Yao Qi  <yao.qi@linaro.org>
++
++	* configure.srv (ipa_x32_linux_regobj): New.
++	* linux-amd64-ipa.c (get_ipa_tdesc): Use X86_TDESC_AVX_AVX512
++	instead of X86_TDESC_AVX512.
++	(initialize_low_tracepoint): Call
++	init_registers_x32_avx_avx512_linux.
++
+ 2017-04-13  Andrew Jenner  <andrew@codesourcery.com>
+ 
+ 	* config.sub: Sync with master version in config project.
+diff --git a/gdb/gdbserver/configure.srv b/gdb/gdbserver/configure.srv
+index d00d9e2..56951c8 100644
+--- a/gdb/gdbserver/configure.srv
++++ b/gdb/gdbserver/configure.srv
+@@ -31,6 +31,7 @@ srv_amd64_linux_regobj="amd64-linux.o amd64-avx-linux.o amd64-avx-avx512-linux.o
+ 
+ ipa_i386_linux_regobj="i386-linux-ipa.o i386-avx-linux-ipa.o  i386-avx-mpx-linux-ipa.o i386-avx-avx512-linux-ipa.o i386-avx-mpx-avx512-pku-linux-ipa.o i386-mpx-linux-ipa.o i386-mmx-linux-ipa.o"
+ ipa_amd64_linux_regobj="amd64-linux-ipa.o amd64-avx-linux-ipa.o amd64-avx-mpx-linux-ipa.o amd64-avx-avx512-linux-ipa.o amd64-avx-mpx-avx512-pku-linux-ipa.o amd64-mpx-linux-ipa.o"
++ipa_x32_linux_regobj="x32-linux-ipa.o x32-avx-linux-ipa.o x32-avx-avx512-linux-ipa.o"
+ ipa_ppc_linux_regobj="powerpc-32l-ipa.o powerpc-altivec32l-ipa.o powerpc-cell32l-ipa.o powerpc-vsx32l-ipa.o powerpc-isa205-32l-ipa.o powerpc-isa205-altivec32l-ipa.o powerpc-isa205-vsx32l-ipa.o powerpc-e500l-ipa.o powerpc-64l-ipa.o powerpc-altivec64l-ipa.o powerpc-cell64l-ipa.o powerpc-vsx64l-ipa.o powerpc-isa205-64l-ipa.o powerpc-isa205-altivec64l-ipa.o powerpc-isa205-vsx64l-ipa.o"
+ 
+ srv_i386_32bit_xmlfiles="i386/32bit-core.xml i386/32bit-sse.xml i386/32bit-avx.xml i386/32bit-avx512.xml i386/32bit-mpx.xml i386/32bit-pkeys.xml"
+diff --git a/gdb/gdbserver/linux-amd64-ipa.c b/gdb/gdbserver/linux-amd64-ipa.c
+index 67f36c2..683339b 100644
+--- a/gdb/gdbserver/linux-amd64-ipa.c
++++ b/gdb/gdbserver/linux-amd64-ipa.c
+@@ -181,8 +181,8 @@ get_ipa_tdesc (int idx)
+       return tdesc_x32_linux;
+     case X86_TDESC_AVX:
+       return tdesc_x32_avx_linux;
+-    case X86_TDESC_AVX512:
+-      return tdesc_x32_avx512_linux;
++    case X86_TDESC_AVX_AVX512:
++      return tdesc_x32_avx_avx512_linux;
+     default:
+       break;
+     }
+@@ -279,7 +279,7 @@ initialize_low_tracepoint (void)
+ #if defined __ILP32__
+   init_registers_x32_linux ();
+   init_registers_x32_avx_linux ();
+-  init_registers_x32_avx512_linux ();
++  init_registers_x32_avx_avx512_linux ();
+ #else
+   init_registers_amd64_linux ();
+   init_registers_amd64_avx_linux ();
+-- 
+2.7.4
+
-- 
2.7.4


