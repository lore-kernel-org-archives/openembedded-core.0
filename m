Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9733.1793273915010944092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.151 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [RFC PATCH 1/4] gcc: point the musl dynamic linker at nonarch_base_libdir
Date: Thu, 29 Oct 2026 20:38:26 +0900
Message-ID: <20261029113829.2806167-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029113829.2806167-1-mark.yang@lge.com>
References: <20261029113829.2806167-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248939
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Make gcc embed the musl loader path from nonarch_base_libdir instead
of base_libdir.

In a multilib build the 64-bit variant got its own base_libdir
(/usr/lib64), so its binaries asked for /usr/lib64/ld-musl-aarch64.so.1.
The musl recipe installs every variant's loader in nonarch_base_libdir
(/usr/lib here), so that file does not exist. With the musl.inc guard
removed, meson's compiler sanity check fails under qemu-user
(qemuarm64 + lib32, usrmerge):

  qemu-aarch64: Could not open '/usr/lib64/ld-musl-aarch64.so.1': No such file or directory

Reference: https://errors.yoctoproject.org/Errors/Details/973525/

The musl wiki wants exactly /lib/ld-musl-$ARCH.so.1 in PT_INTERP, so
that a binary runs on any musl system, and says the loader must not
move to /lib64 or anywhere else. The loader name already carries the
architecture, so all of them can share one directory.

nonarch_base_libdir keeps the no-lib64 rule, and without usrmerge it is
the wiki path itself. With usrmerge it becomes /usr/lib, which
non-multilib usrmerge builds already use.

Reference: https://wiki.musl-libc.org/guidelines-for-distributions

          gcc-cross-aarch64                lib32-gcc-cross-arm
  before  /usr/lib64/ld-musl-aarch64.so.1  /usr/lib/ld-musl-armhf.so.1
  after   /usr/lib/ld-musl-aarch64.so.1    unchanged

glibc builds keep their default loader path.

- 0007: MUSL_DYNAMIC_LINKER* use a new SYSTEMLIBS_NONARCH_DIR. The cross
  classes set target_nonarch_base_libdir for it, next to
  target_base_libdir.
- gcc-multilib-config: stop rewriting the musl loader per multilib,
  which 24c4e01892 ("gcc: also relocate the musl loader") added.
  It gave the x86-64 target and SDK gcc /lib64/ld-musl-x86_64.so.1.
  Only nativesdk-gcc keeps it, for the %r relocation marker.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/cross-canadian.bbclass    |  1 +
 meta/classes-recipe/cross.bbclass             |  1 +
 meta/classes-recipe/crosssdk.bbclass          |  1 +
 meta/recipes-devtools/gcc/gcc-common.inc      |  1 +
 .../gcc/gcc-configure-common.inc              |  2 +
 .../gcc/gcc-multilib-config.inc               | 20 ++++++----
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 39 ++++++++++---------
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  2 +-
 8 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
index 25e67d9e07..4d0b1785b7 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -145,6 +145,7 @@ target_base_prefix := "${root_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
 target_base_libdir = "${target_base_prefix}/${baselib}"
+target_nonarch_base_libdir := "${nonarch_base_libdir}"
 target_libdir = "${target_exec_prefix}/${baselib}"
 target_includedir := "${includedir}"
 
diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index bceee5d6e6..d36c200a48 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -59,6 +59,7 @@ target_base_prefix := "${root_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
 target_base_libdir = "${target_base_prefix}/${baselib}"
+target_nonarch_base_libdir := "${nonarch_base_libdir}"
 target_libdir = "${target_exec_prefix}/${baselib}"
 target_includedir := "${includedir}"
 
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 6246c09de4..7002eb0894 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -42,6 +42,7 @@ TARGET_FPU = ""
 target_libdir = "${SDKPATHNATIVE}${libdir_nativesdk}"
 target_includedir = "${SDKPATHNATIVE}${includedir_nativesdk}"
 target_base_libdir = "${SDKPATHNATIVE}${base_libdir_nativesdk}"
+target_nonarch_base_libdir = "${SDKPATHNATIVE}${base_libdir_nativesdk}"
 target_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 target_exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib = "lib"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 41a8177e0c..9850f5e9da 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -111,6 +111,7 @@ B ?= "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
 target_base_libdir ?= "${base_libdir}"
+target_nonarch_base_libdir ?= "${nonarch_base_libdir}"
 target_prefix ?= "${prefix}"
 
 # We need to ensure that for the shared work directory, the do_patch signatures match
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index ff98f828e5..c5450a23df 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -72,6 +72,7 @@ CPPFLAGS = ""
 SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
+SYSTEMLIBS_NONARCH = "${target_nonarch_base_libdir}/"
 SYSTEMLOCALHEADERS = "${target_prefix}/local/include"
 
 do_configure:prepend () {
@@ -84,6 +85,7 @@ do_configure:prepend () {
 #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
 #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
+#define SYSTEMLIBS_NONARCH_DIR "${SYSTEMLIBS_NONARCH}"
 #define LOCAL_INCLUDE_DIR "${SYSTEMLOCALHEADERS}"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index cafc64971d..ede0b68144 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -123,15 +123,19 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir32) + r'\3'),
-                    (r'^(#define\s*MUSL_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
-                        r'\1' + wrap_libdir(libdir32) + r'\3'),
-                    (r'^(#define\s*MUSL_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
-                        r'\1' + wrap_libdir(libdir64) + r'\3'),
-                    (r'^(#define\s*MUSL_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
-                        r'\1' + wrap_libdir(libdirx32) + r'\3'),
-                    (r'^(#define\s*MUSL_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
-                        r'\1' + wrap_libdir(libdir32) + r'\3'),
                 ]
+                # musl loaders keep SYSTEMLIBS_NONARCH_DIR, nativesdk-gcc needs %r
+                if pn == "nativesdk-gcc":
+                    substs += [
+                        (r'^(#define\s*MUSL_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
+                            r'\1' + wrap_libdir(libdir32) + r'\3'),
+                        (r'^(#define\s*MUSL_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                            r'\1' + wrap_libdir(libdir64) + r'\3'),
+                        (r'^(#define\s*MUSL_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
+                            r'\1' + wrap_libdir(libdirx32) + r'\3'),
+                        (r'^(#define\s*MUSL_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
+                            r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    ]
 
                 for (i, line) in enumerate(filelines):
                     for subst in substs:
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 07e9e23f3d..17c9a7173a 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -12,8 +12,11 @@ SH, sparc, alpha for possible future support (if any)
 
 Removes the do_headerfix task in metadata
 
+MUSL_DYNAMIC_LINKER uses SYSTEMLIBS_NONARCH_DIR instead.
+
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
  gcc/config/aarch64/aarch64-linux.h |  4 ++--
  gcc/config/alpha/linux-elf.h       |  4 ++--
@@ -47,7 +50,7 @@ index 116bb4e69f3..c0de4900dc2 100644
  
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_NONARCH_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
  
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
@@ -86,7 +89,7 @@ index 8ef5643b5d6..76893197773 100644
  #endif
  #define MUSL_DYNAMIC_LINKER \
 -  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
@@ -116,7 +119,7 @@ index efbd978c610..9ea0261b0fc 100644
  
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_NONARCH_DIR "ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
 index 24170ee2845..733e3e4945a 100644
 --- a/gcc/config/i386/linux64.h
@@ -134,13 +137,13 @@ index 24170ee2845..733e3e4945a 100644
  
  #undef MUSL_DYNAMIC_LINKER32
 -#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_NONARCH_DIR "ld-musl-i386.so.1"
  #undef MUSL_DYNAMIC_LINKER64
 -#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
-+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_NONARCH_DIR "ld-musl-x86_64.so.1"
  #undef MUSL_DYNAMIC_LINKERX32
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
-+#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_NONARCH_DIR "ld-musl-x32.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
 index d6280a4d4dd..c79d4902f85 100644
 --- a/gcc/config/linux.h
@@ -178,7 +181,7 @@ index fbc75a90ad5..38c239940bd 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER \
 -  "/lib/ld-musl-loongarch" ABI_GRLEN_SPEC MUSL_ABI_SPEC ".so.1"
-+  SYSTEMLIBS_DIR "ld-musl-loongarch" ABI_GRLEN_SPEC MUSL_ABI_SPEC ".so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-loongarch" ABI_GRLEN_SPEC MUSL_ABI_SPEC ".so.1"
  
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
@@ -200,7 +203,7 @@ index 7b09cde7693..8bfafaf87f7 100644
  
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_NONARCH_DIR "ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
  
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
@@ -236,14 +239,14 @@ index ae15d490108..0281650009d 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
 -  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
  #undef MUSL_DYNAMIC_LINKER64
  #define MUSL_DYNAMIC_LINKER64 \
 -  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
  #define MUSL_DYNAMIC_LINKERN32 \
 -  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
  
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
@@ -265,7 +268,7 @@ index 9060c940a44..c7712db194a 100644
  
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_NONARCH_DIR "ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
  
  #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
  
@@ -295,11 +298,11 @@ index 0316d8cb65d..8de5eb8bb49 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
 -  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
  #undef MUSL_DYNAMIC_LINKER64
  #define MUSL_DYNAMIC_LINKER64 \
 -  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
@@ -316,7 +319,7 @@ index afb5c6ad867..3eb6c814ced 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER \
 -  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
  
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
@@ -335,10 +338,10 @@ index 2c3bca5dfcb..1332624abad 100644
  
  #undef MUSL_DYNAMIC_LINKER32
 -#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-s390.so.1"
-+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-s390.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_NONARCH_DIR "ld-musl-s390.so.1"
  #undef MUSL_DYNAMIC_LINKER64
 -#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-s390x.so.1"
-+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-s390x.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_NONARCH_DIR "ld-musl-s390x.so.1"
  
  #undef  LINK_SPEC
  #define LINK_SPEC \
@@ -351,7 +354,7 @@ index 78a7905a919..28493851982 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER \
 -  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
-+  SYSTEMLIBS_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
++  SYSTEMLIBS_NONARCH_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
    "%{mfdpic:-fdpic}.so.1"
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index d8c96ed86e..5fce4c4ca1 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -23,7 +23,7 @@ index 76893197773..12c334463c6 100644
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
-   SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+   SYSTEMLIBS_NONARCH_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
 +/* For armv4 we pass --fix-v4bx to linker to support EABI */
 +#undef TARGET_FIX_V4BX_SPEC
