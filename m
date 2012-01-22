Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1id-00029F-AT
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:00:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jan 2012 09:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98549573"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 22 Jan 2012 09:52:58 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:13 +0800
Message-Id: <43dbe2532383e3a88b975034b13ba21dc599a229.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 08/18] kexec-tools: upgrade to 2.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jan 2012 18:00:43 -0000

This patch is to upgrade kexec-tools to 2.0.3.
And since fix_for_compiling_with_gcc-4.6.0.patch is there in 2.0.3, it is removed.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 --------------------
 .../{kexec-tools_2.0.2.bb => kexec-tools_2.0.3.bb} |    7 +--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.2.bb => kexec-tools_2.0.3.bb} (47%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch b/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
deleted file mode 100644
index 658699b..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-Fix following compiler warining/errors with gcc 4.6.0.
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/09
-
-| kexec/kexec.c: In function 'my_exec':
-| kexec/kexec.c:818:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
-
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/build_disk/poky_build/build_gcc_4.6.0/tmp/sysroots/qemux86  --no-undefined -nostartfiles -nostdlib -nodefaultlibs -e purgatory_start -r -o purgatory/purgatory.ro purgatory/purgatory.o purgatory/printf.o purgatory/string.o purgatory/arch/i386/entry32-16.o purgatory/arch/i386/entry32-16-debug.o purgatory/arch/i386/entry32.o purgatory/arch/i386/setup-x86.o purgatory/arch/i386/stack.o purgatory/arch/i386/compat_x86_64.o purgatory/arch/i386/purgatory-x86.o purgatory/arch/i386/console-x86.o purgatory/arch/i386/vga.o purgatory/arch/i386/pic.o purgatory/arch/i386/crashdump_backup.o purgatory/sha256.o
-| i586-poky-linux-gcc: error: unrecognized option '--no-undefined'
-| make: *** [purgatory/purgatory.ro] Error 1
-| ERROR: oe_runmake failed
-
-
-Index: kexec-tools-2.0.2/kexec/kexec.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/kexec.c
-+++ kexec-tools-2.0.2/kexec/kexec.c
-@@ -815,7 +815,7 @@ static int my_shutdown(void)
-  */
- static int my_exec(void)
- {
--	int result;
-+	int __attribute__((__unused__)) result;
- 
- 	result = kexec_reboot();
- 	/* I have failed if I make it here */
-Index: kexec-tools-2.0.2/purgatory/Makefile
-===================================================================
---- kexec-tools-2.0.2.orig/purgatory/Makefile
-+++ kexec-tools-2.0.2/purgatory/Makefile
-@@ -56,7 +56,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATO
- 			-I$(srcdir)/include \
- 			-I$(shell $(CC) -print-file-name=include)
- $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
--			--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
-+			-Wl,--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
- 			-e purgatory_start -r
- 
- $(PURGATORY): $(PURGATORY_OBJS)
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb
similarity index 47%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb
index 8d2e606..3cc8265 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb
@@ -2,11 +2,10 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI += " file://fix_for_compiling_with_gcc-4.6.0.patch"
-SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
-SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
+SRC_URI[md5sum] = "1b362abd2e8669171a5ba50a9cc26183"
+SRC_URI[sha256sum] = "36a50fad961e24c9cdaa7c01b74d3cdd2b1bebf9bf0f0f3740dd1f21bd1b8ba6"
 
 PACKAGES =+ "kexec kdump"
 
-- 
1.7.6



