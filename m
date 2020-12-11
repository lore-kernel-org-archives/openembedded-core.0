Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3670.1607672214198337033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 23:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /ULwQmW1+ROUKnJuXQitDbsZqGQdnHCpP/ZCHs4GTvEhY5yRI89y8Xr1TxxE9ttIdKCAOGN2Sv
 budoaU4G91UA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="235988026"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="235988026"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 23:36:55 -0800
IronPort-SDR: 9RDEThokts0xIqE/fsdsQNNHNLjur+bm6yT+1+m5WX8i2SjUUFFjmKv7BmO7W0sM3k5lxChidr
 r9iq8Gl3oeNQ==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="374067412"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.129.147])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 23:36:53 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair@alistair23.me
Subject: [PATCH 2/2] mesa: remove patch disabling asm
Date: Fri, 11 Dec 2020 15:36:40 +0800
Message-Id: <20201211073640.479105-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211073640.479105-1-anuj.mittal@intel.com>
References: <20201211073640.479105-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was originally added for musl only [1]. Upstream has removed this
option but we reverted that change during an upgrade to fix certain
musl specific compile time issues [2].

I compile tested without this patch on musl-x86 and musl-x86-64 and
don't see the warnings anymore. Similar textrel issues were fixed
upstream so perhaps those helped [3].

[1] https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit?id=68bf128e901e89d5b49a28b15d5083b2bf6b536f
[2] https://www.openembedded.org/pipermail/openembedded-core/2019-November/289222.html
[3] https://gitlab.freedesktop.org/mesa/mesa/-/commit/45206d7673adb1484cbdb3eadaf82e0849c9cdcf?merge_request_iid=1974

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...le-asm-unconditionally-now-that-gen_.patch | 147 ------------------
 meta/recipes-graphics/mesa/mesa.inc           |   4 -
 2 files changed, 151 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch

diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
deleted file mode 100644
index 833742359f..0000000000
--- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 43d9e40db7357f27e91002b2bb7688b6775ebb43 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 09:06:02 -0800
-Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
- gen_matypes is gone."
-
-This reverts commit 20294dceebc23236e33b22578245f7e6f41b6997.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
-
----
- meson.build       | 94 ++++++++++++++++++++++++++++++-----------------
- meson_options.txt |  6 +++
- 2 files changed, 67 insertions(+), 33 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index e7dc599..e2fc934 100644
---- a/meson.build
-+++ b/meson.build
-@@ -52,6 +52,7 @@ pre_args = [
- with_vulkan_icd_dir = get_option('vulkan-icd-dir')
- with_tests = get_option('build-tests')
- with_aco_tests = get_option('build-aco-tests')
-+with_asm = get_option('asm')
- with_glx_read_only_text = get_option('glx-read-only-text')
- with_glx_direct = get_option('glx-direct')
- with_osmesa = get_option('osmesa')
-@@ -1154,41 +1155,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
- 
- # TODO: shared/static? Is this even worth doing?
- 
-+# When cross compiling we generally need to turn off the use of assembly,
-+# because mesa's assembly relies on building an executable for the host system,
-+# and running it to get information about struct sizes. There is at least one
-+# case of cross compiling where we can use asm, and that's x86_64 -> x86 when
-+# host OS == build OS, since in that case the build machine can run the host's
-+# binaries.
-+if with_asm and meson.is_cross_build()
-+  if build_machine.system() != host_machine.system()
-+    # TODO: It may be possible to do this with an exe_wrapper (like wine).
-+    message('Cross compiling from one OS to another, disabling assembly.')
-+    with_asm = false
-+  elif not (build_machine.cpu_family().startswith('x86') and host_machine.cpu_family() == 'x86')
-+    # FIXME: Gentoo always sets -m32 for x86_64 -> x86 builds, resulting in an
-+    # x86 -> x86 cross compile. We use startswith rather than == to handle this
-+    # case.
-+    # TODO: There may be other cases where the 64 bit version of the
-+    # architecture can run 32 bit binaries (aarch64 and armv7 for example)
-+    message('''
-+      Cross compiling to different architectures, and the host cannot run
-+      the build machine's binaries. Disabling assembly.
-+    ''')
-+    with_asm = false
-+  endif
-+endif
-+
- with_asm_arch = ''
--if host_machine.cpu_family() == 'x86'
--  if system_has_kms_drm or host_machine.system() == 'gnu'
--    with_asm_arch = 'x86'
--    pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
--                 '-DUSE_SSE_ASM']
--
--    if with_glx_read_only_text
--      pre_args += ['-DGLX_X86_READONLY_TEXT']
-+if with_asm
-+  if host_machine.cpu_family() == 'x86'
-+    if system_has_kms_drm or host_machine.system() == 'gnu'
-+      with_asm_arch = 'x86'
-+      pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
-+                   '-DUSE_SSE_ASM']
-+
-+      if with_glx_read_only_text
-+         pre_args += ['-DGLX_X86_READONLY_TEXT']
-+      endif
-+    endif
-+  elif host_machine.cpu_family() == 'x86_64'
-+    if system_has_kms_drm
-+      with_asm_arch = 'x86_64'
-+      pre_args += ['-DUSE_X86_64_ASM']
-+    endif
-+  elif host_machine.cpu_family() == 'arm'
-+    if system_has_kms_drm
-+      with_asm_arch = 'arm'
-+      pre_args += ['-DUSE_ARM_ASM']
-+    endif
-+  elif host_machine.cpu_family() == 'aarch64'
-+    if system_has_kms_drm
-+      with_asm_arch = 'aarch64'
-+      pre_args += ['-DUSE_AARCH64_ASM']
-+    endif
-+  elif host_machine.cpu_family() == 'sparc64'
-+    if system_has_kms_drm
-+      with_asm_arch = 'sparc'
-+      pre_args += ['-DUSE_SPARC_ASM']
-+    endif
-+  elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
-+    if system_has_kms_drm
-+      with_asm_arch = 'ppc64le'
-+      pre_args += ['-DUSE_PPC64LE_ASM']
-     endif
--  endif
--elif host_machine.cpu_family() == 'x86_64'
--  if system_has_kms_drm
--    with_asm_arch = 'x86_64'
--    pre_args += ['-DUSE_X86_64_ASM']
--  endif
--elif host_machine.cpu_family() == 'arm'
--  if system_has_kms_drm
--    with_asm_arch = 'arm'
--    pre_args += ['-DUSE_ARM_ASM']
--  endif
--elif host_machine.cpu_family() == 'aarch64'
--  if system_has_kms_drm
--    with_asm_arch = 'aarch64'
--    pre_args += ['-DUSE_AARCH64_ASM']
--  endif
--elif host_machine.cpu_family() == 'sparc64'
--  if system_has_kms_drm
--    with_asm_arch = 'sparc'
--    pre_args += ['-DUSE_SPARC_ASM']
--  endif
--elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
--  if system_has_kms_drm
--    with_asm_arch = 'ppc64le'
--    pre_args += ['-DUSE_PPC64LE_ASM']
-   endif
- endif
- 
-diff --git a/meson_options.txt b/meson_options.txt
-index 147cccb..562b059 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -254,6 +254,12 @@ option(
-   value : false,
-   description : 'Enable GLVND support.'
- )
-+option(
-+  'asm',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Build assembly code if possible'
-+)
- option(
-    'glx-read-only-text',
-    type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7956d95fc1..dba23f586f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,6 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
-           file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
@@ -178,9 +177,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
 
-# mesa tries to run cross-built gen_matypes on build machine to get struct size information
-EXTRA_OEMESON_append = " -Dasm=false"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
-- 
2.29.2

