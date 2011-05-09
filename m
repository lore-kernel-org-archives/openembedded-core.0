Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJYHC-0006va-H1
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 23:46:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2011 14:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,342,1301900400"; d="scan'208";a="433218817"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 14:43:17 -0700
Message-Id: <6e2e2720451a7de5c29233cc8374b4fa85cfd8b4.1304977277.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304977276.git.nitin.a.kamble@intel.com>
References: <cover.1304977276.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 9 May 2011 10:53:43 -0700
Date: Mon, 09 May 2011 14:43:16 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 5/5] kexec-tools: fix compiler errors with gcc 4.6.0
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
X-List-Received-Date: Mon, 09 May 2011 21:46:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 ++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb     |    3 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch b/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
new file mode 100644
index 0000000..65cf051
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
@@ -0,0 +1,40 @@
+Upstream-Status="Pending"
+
+Fix following compiler warining/errors with gcc 4.6.0.
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/09
+
+| kexec/kexec.c: In function 'my_exec':
+| kexec/kexec.c:818:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
+
+| ccache i586-poky-linux-gcc -march=i586 --sysroot=/build_disk/poky_build/build_gcc_4.6.0/tmp/sysroots/qemux86  --no-undefined -nostartfiles -nostdlib -nodefaultlibs -e purgatory_start -r -o purgatory/purgatory.ro purgatory/purgatory.o purgatory/printf.o purgatory/string.o purgatory/arch/i386/entry32-16.o purgatory/arch/i386/entry32-16-debug.o purgatory/arch/i386/entry32.o purgatory/arch/i386/setup-x86.o purgatory/arch/i386/stack.o purgatory/arch/i386/compat_x86_64.o purgatory/arch/i386/purgatory-x86.o purgatory/arch/i386/console-x86.o purgatory/arch/i386/vga.o purgatory/arch/i386/pic.o purgatory/arch/i386/crashdump_backup.o purgatory/sha256.o
+| i586-poky-linux-gcc: error: unrecognized option '--no-undefined'
+| make: *** [purgatory/purgatory.ro] Error 1
+| ERROR: oe_runmake failed
+
+
+Index: kexec-tools-2.0.2/kexec/kexec.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/kexec.c
++++ kexec-tools-2.0.2/kexec/kexec.c
+@@ -815,7 +815,7 @@ static int my_shutdown(void)
+  */
+ static int my_exec(void)
+ {
+-	int result;
++	int __attribute__((__unused__)) result;
+ 
+ 	result = kexec_reboot();
+ 	/* I have failed if I make it here */
+Index: kexec-tools-2.0.2/purgatory/Makefile
+===================================================================
+--- kexec-tools-2.0.2.orig/purgatory/Makefile
++++ kexec-tools-2.0.2/purgatory/Makefile
+@@ -56,7 +56,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATO
+ 			-I$(srcdir)/include \
+ 			-I$(shell $(CC) -print-file-name=include)
+ $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
+-			--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
++			-Wl,--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
+ 			-e purgatory_start -r
+ 
+ $(PURGATORY): $(PURGATORY_OBJS)
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
index 0d15b5b..caed816 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
@@ -2,7 +2,8 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-PR = "r0"
+PR = "r1"
 
+SRC_URI += " file://fix_for_compiling_with_gcc-4.6.0.patch"
 SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
 SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
-- 
1.7.3.4



