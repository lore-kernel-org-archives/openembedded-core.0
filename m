Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7853260089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 18:09:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 08 Apr 2015 11:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,545,1422950400"; d="scan'208";a="710768996"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2015 11:10:02 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 10:04:44 +0000
Message-Id: <781aa0f2b865b5bb3c3eff7bce50385118ea8701.1428487200.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1428487200.git.anibal.limon@linux.intel.com>
References: <cover.1428487200.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1428487200.git.anibal.limon@linux.intel.com>
References: <cover.1428487200.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/2] kexec-tools: Add support for build with x32 ABI in x86_64
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
X-List-Received-Date: Wed, 08 Apr 2015 18:10:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Add autoconf test for detect when build is x32 ABI this enables to
test into purgatory Makefile to avoid use -mcmodel=large flag in CC.

Add ELFCLASS read and syscall number into kexec, see patch.

[YOCTO #7419]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../kexec/kexec-tools/kexec-x32.patch              | 113 +++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb     |   3 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
new file mode 100644
index 0000000..0bd3264
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
@@ -0,0 +1,113 @@
+x86_64: Add support to build kexec-tools with x32 ABI
+
+Summary of changes,
+
+configure.ac: Add test for detect x32 ABI.
+purgatory/arch/x86_64/Makefile: Not use mcmodel large when
+	x32 ABI is set.
+kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
+	use ELFCLASS32 instead of ELFCLASS64.
+kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+
+---
+ configure.ac                             | 9 +++++++++
+ kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
+ kexec/kexec-syscall.h                    | 4 ++++
+ purgatory/arch/x86_64/Makefile           | 4 +++-
+ 4 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c410e90..1ecadd5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,15 @@ case $target_cpu in
+ 		;;
+ 	ia64|x86_64|alpha|m68k )
+ 		ARCH="$target_cpu"
++
++		dnl ---Test for x32 ABI in x86_64
++		if test "x$ARCH" = "xx86_64" ; then
++			AC_EGREP_CPP(x32_test,
++			[#if defined(__x86_64__) && defined (__ILP32__)
++				x32_test
++			#endif
++			], SUBARCH='x32', SUBARCH='64')
++		fi
+ 		;;
+ 	* )
+ 		AC_MSG_ERROR([unsupported architecture $target_cpu])
+diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+index c795037..06db7f0 100644
+--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
+ 	if (ehdr->ei_data != ELFDATA2LSB) {
+ 		return 0;
+ 	}
++#ifdef __ILP32__
++	if (ehdr->ei_class != ELFCLASS32) {
++#else
+ 	if (ehdr->ei_class != ELFCLASS64) {
++#endif
+ 		return 0;
+ 	}
+ 	if (ehdr->e_machine != EM_X86_64) {
+diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
+index ce2e20b..cab5535 100644
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
+@@ -31,8 +31,12 @@
+ #define __NR_kexec_load		268
+ #endif
+ #ifdef __x86_64__
++#ifdef __ILP32__
++#define __NR_kexec_load		528
++#else
+ #define __NR_kexec_load		246
+ #endif
++#endif
+ #ifdef __s390x__
+ #define __NR_kexec_load		277
+ #endif
+diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
+index 7300937..4af11e4 100644
+--- a/purgatory/arch/x86_64/Makefile
++++ b/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
+ 
+-x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++ifeq ($(SUBARCH),64)
++        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++endif
+-- 
+1.8.4.5
+
+diff --git a/configure.ac b/configure.ac
+index 1ecadd5..e0b5f78 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,6 +8,7 @@ AC_INIT(kexec-tools, 2.0.10.git)
+ AC_CONFIG_AUX_DIR(./config)
+ AC_CONFIG_HEADERS([include/config.h])
+ AC_LANG(C)
++AC_PROG_CC
+ 
+ AC_DEFINE_UNQUOTED(PACKAGE_DATE, "`date '+%d %B %Y'`",
+ 		[Define to the release date of this package])
+@@ -106,9 +107,6 @@ AC_ARG_WITH([booke],
+ 
+ dnl ---Programs
+ dnl To specify a different compiler, just 'export CC=/path/to/compiler'
+-
+-AC_PROG_CC
+-
+ if test "${build}" != "${host}" ; then
+ 	AC_CHECK_PROGS(BUILD_CC, [${build_alias}-gcc ${build}-gcc gcc])
+ else
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
index c0c2727..36e4c15 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
@@ -4,7 +4,8 @@ EXTRA_OECONF = " --with-zlib=yes"
 
 SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
-           "
+            file://kexec-x32.patch \
+         "
 
 SRC_URI[md5sum] = "4ecb7ab7ad9eb6ce413899bdb07a8426"
 SRC_URI[sha256sum] = "c2c6d204fe0911ebd304c40100163237feca4c5a854a2cca382ee36916a573d8"
-- 
1.8.4.5


