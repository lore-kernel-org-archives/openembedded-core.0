Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTg-0002yt-JE
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="918293005"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2011 00:57:23 -0700
Message-Id: <3546d59ad6f1104526399ad4c95abe1ac371c08f.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Sat, 30 Apr 2011 13:41:51 -0700
Date: Thu, 05 May 2011  0:57:23 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 17/26] eglibc-2.13: Add recipes for eglibc 2.13
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
X-List-Received-Date: Thu, 05 May 2011 08:00:05 -0000

From: Khem Raj <raj.khem@gmail.com>

Add patch to correct fstack-protector configure check

Document all patches for eglibc 2.13

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.13.bb          |   44 ++++++++
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |   17 +++
 .../eglibc/eglibc-2.13/armv4t-interworking.patch   |   82 ++++++++++++++
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 ++++
 .../eglibc/eglibc-2.13/generate-supported.mk       |   11 ++
 .../eglibc/eglibc-2.13/ld-search-order.patch       |   54 +++++++++
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |   24 ++++
 .../eglibc-2.13/shorten-build-commands.patch       |   81 ++++++++++++++
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |   35 ++++++
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    6 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |  115 ++++++++++++++++++++
 12 files changed, 491 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.13.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.13.bb

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
new file mode 100644
index 0000000..68ef864
--- /dev/null
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Cross locale generation tool for eglibc"
+HOMEPAGE = "http://www.eglibc.org/home"
+SECTION = "libs"
+PRIORITY = "required"
+LICENSE = "LGPL"
+
+LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
+      file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
+      file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+
+
+inherit native
+inherit autotools
+
+PR = "r1"
+SRCREV="11982"
+EGLIBC_BRANCH="eglibc-2_12"
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
+S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_ports', d)
+}
+
+do_move_ports() {
+        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+	    rm -rf ${WORKDIR}/libc/ports
+	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${WORKDIR}/libc/
+	fi
+}
+
+EXTRA_OECONF = "--with-glibc=${WORKDIR}/${EGLIBC_BRANCH}/libc"
+
+do_configure () {
+	./configure ${EXTRA_OECONF}
+}
+
+
+do_install() {
+	install -d ${D}${bindir} 
+	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
+}
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
new file mode 100644
index 0000000..7bfb67c
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
@@ -0,0 +1,17 @@
+import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
+
+Upstream-status: Pending
+
+Index: libc/bits/stdio-lock.h
+===================================================================
+--- libc.orig/bits/stdio-lock.h	2009-10-28 14:34:19.000000000 -0700
++++ libc/bits/stdio-lock.h	2009-10-28 14:34:54.000000000 -0700
+@@ -50,6 +50,8 @@ __libc_lock_define_recursive (typedef, _
+   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
+   _IO_flockfile (_fp)
+ 
++# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
++
+ # define _IO_release_lock(_fp) \
+   _IO_funlockfile (_fp);						      \
+   _IO_cleanup_region_end (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch b/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
new file mode 100644
index 0000000..945a8ff
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
@@ -0,0 +1,82 @@
+Needed to support ARMv4t machines
+
+Upstream-status: Pending
+
+Index: libc/ports/sysdeps/arm/memcpy.S
+===================================================================
+--- libc.orig/ports/sysdeps/arm/memcpy.S	2009-09-03 16:12:00.000000000 -0700
++++ libc/ports/sysdeps/arm/memcpy.S	2009-10-28 12:51:22.000000000 -0700
+@@ -130,7 +130,12 @@ ENTRY(memcpy)
+ 		strcsb	r4, [r0], #1
+ 		strcsb	ip, [r0]
+ 
++#if defined (__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
++		ldmfd	sp!, {r0, r4, lr}
++                bx      lr
++#else
+ 		ldmfd	sp!, {r0, r4, pc}
++#endif
+ 
+ 9:		rsb	ip, ip, #4
+ 		cmp	ip, #2
+Index: libc/ports/sysdeps/arm/memmove.S
+===================================================================
+--- libc.orig/ports/sysdeps/arm/memmove.S	2009-09-03 16:12:00.000000000 -0700
++++ libc/ports/sysdeps/arm/memmove.S	2009-10-28 12:51:22.000000000 -0700
+@@ -144,7 +144,12 @@ ENTRY(memmove)
+ 		strneb	r3, [r0, #-1]!
+ 		strcsb	r4, [r0, #-1]!
+ 		strcsb	ip, [r0, #-1]
++#if defined (__ARM_ARCH_4T__) && defined (__THUMB_INTERWORK__)
++		ldmfd	sp!, {r0, r4, lr}
++                bx      lr
++#else
+ 		ldmfd	sp!, {r0, r4, pc}
++#endif
+ 
+ 9:		cmp	ip, #2
+ 		ldrgtb	r3, [r1, #-1]!
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/clone.S
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-09-03 16:12:04.000000000 -0700
++++ libc/ports/sysdeps/unix/sysv/linux/arm/clone.S	2009-10-28 12:51:22.000000000 -0700
+@@ -96,8 +96,14 @@ ENTRY(__clone)
+ #endif
+ 	@ pick the function arg and call address off the stack and execute
+ 	ldr	r0, [sp, #4]
++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
++	ldr 	ip, [sp], #8
++	mov	lr, pc
++        bx      ip
++#else
+ 	mov	lr, pc
+ 	ldr 	pc, [sp], #8
++#endif
+ 
+ 	@ and we are done, passing the return value through r0
+ 	b	PLTJMP(HIDDEN_JUMPTARGET(_exit))
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-09-16 13:58:18.000000000 +0100
++++ libc/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2009-11-03 19:17:16.000000000 +0000
+@@ -129,6 +129,11 @@
+        DO_RET(lr);						\
+ 1:     .word C_SYMBOL_NAME(rtld_errno) - 0b - 8;
+ # else
++#if defined(__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
++#define POP_PC  ldr     lr, [sp], #4; bx lr
++#else
++#define POP_PC  ldr     pc, [sp], #4
++#endif
+ #  define SYSCALL_ERROR_HANDLER					\
+ __local_syscall_error:						\
+ 	str	lr, [sp, #-4]!;					\
+@@ -138,7 +143,7 @@
+ 	rsb	r1, r1, #0;					\
+ 	str	r1, [r0];					\
+ 	mvn	r0, #0;						\
+-	ldr	pc, [sp], #4;
++        POP_PC;
+ # endif
+ #else
+ # define SYSCALL_ERROR_HANDLER	/* Nothing here; code in sysdep.S is used.  */
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
new file mode 100644
index 0000000..a667d56
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
@@ -0,0 +1,21 @@
+In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c: In function '__lll_lock_wait_private':
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: warning: implicit declaration of function 'THREAD_GETMEM'
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'THREAD_SELF' undeclared (first use in this function)
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: (Each undeclared identifier is reported only once
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: for each function it appears in.)
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'header' undeclared (first use in this function)
+make[4]: *** [/var/tmp/portage/sys-libs/glibc-2.7-r1/work/build-default-armv4l-unknown-linux-gnu-nptl/nptl/rtld-libc-lowlevellock.os] Error 1
+
+Upstream-status: Pending
+
+--- libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h.orig
++++ libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
+@@ -25,6 +25,7 @@
+ #include <atomic.h>
+ #include <sysdep.h>
+ #include <kernel-features.h>
++#include <tls.h>
+ 
+ #define FUTEX_WAIT		0
+ #define FUTEX_WAKE		1
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
new file mode 100644
index 0000000..e69de29
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
new file mode 100644
index 0000000..d2a28c2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
@@ -0,0 +1,11 @@
+#!/usr/bin/make
+
+include $(IN)
+
+all:
+	rm -f $(OUT)
+	touch $(OUT)
+	for locale in $(SUPPORTED-LOCALES); do \
+		[ $$locale = true ] && continue; \
+		echo $$locale | sed 's,/, ,' >> $(OUT); \
+	done
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
new file mode 100644
index 0000000..f968678
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
@@ -0,0 +1,54 @@
+The default lib search path order is:
+
+  1) LD_LIBRARY_PATH
+  2) RPATH from the binary
+  3) ld.so.cache
+  4) default search paths embedded in the linker
+
+For nativesdk binaries which are being used alongside binaries on a host system, we 
+need the search paths to firstly search the shipped nativesdk libs but then also
+cover the host system. For example we want the host system's libGL and this may be
+in a non-standard location like /usr/lib/mesa. The only place the location is know 
+about is in the ld.so.cache of the host system.
+
+Since nativesdk has a simple structure and doesn't need to use a cache itself, we 
+repurpose the cache for use as a last resort in finding host system binaries. This 
+means we need to switch the order of 3 and 4 above to make this work effectively.
+
+RP 14/10/2010
+
+Index: libc/elf/dl-load.c
+===================================================================
+--- libc.orig/elf/dl-load.c
++++ libc/elf/dl-load.c
+@@ -2107,6 +2107,15 @@ _dl_map_object (struct link_map *loader,
+ 			&loader->l_runpath_dirs, &realname, &fb, loader,
+ 			LA_SER_RUNPATH, &found_other_class);
+ 
++      /* try the default path.  */
++      if (fd == -1
++	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
++	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
++	  && rtld_search_dirs.dirs != (void *) -1)
++	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
++			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
++
++      /* Finally try ld.so.cache */
+       if (fd == -1
+ 	  && (__builtin_expect (! (mode & __RTLD_SECURE), 1)
+ 	      || ! INTUSE(__libc_enable_secure)))
+@@ -2169,14 +2178,6 @@ _dl_map_object (struct link_map *loader,
+ 	    }
+ 	}
+ 
+-      /* Finally, try the default path.  */
+-      if (fd == -1
+-	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
+-	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
+-	  && rtld_search_dirs.dirs != (void *) -1)
+-	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
+-			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
+-
+       /* Add another newline when we are tracing the library loading.  */
+       if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
+ 	_dl_debug_printf ("\n");
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
new file mode 100644
index 0000000..9424003
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
@@ -0,0 +1,24 @@
+On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
+section if a --version-script sets _RLD_MAP to local. This is apparently
+a binutils bug, but libc shouldn't segfault in this case.
+
+see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
+
+9/19/2010 - added by Qing He <qing.he@intel.com>
+
+Upstream-status: Pending
+
+---
+diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
+--- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h	2009-05-16 16:36:20.000000000 +0800
++++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h	2010-09-19 09:11:53.000000000 +0800
+@@ -70,7 +70,8 @@
+ /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it in
+    with the run-time address of the r_debug structure  */
+ #define ELF_MACHINE_DEBUG_SETUP(l,r) \
+-do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
++do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
++         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
+        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) = \
+        (ElfW(Addr)) (r); \
+    } while (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
new file mode 100644
index 0000000..7bd6d56
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
@@ -0,0 +1,81 @@
+Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
+
+This patch scratches an itch.  Each individual gcc command in the
+glibc build is over 1K, which means it takes up a good chunk of my
+terminal.  Most of that is include paths.  Any version of GCC new
+enough to build glibc supports response files, which were added in
+2005.  So use a response file for the static list of include paths.
+Now the build commands are a lot shorter, and easier to use when
+developing glibc.
+
+Tested on x86_64-linux-gnu.  Please apply if acceptable.
+
+-- 
+Daniel Jacobowitz
+CodeSourcery
+
+2010-03-30  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	* Makeconfig (+common-includes): Define.
+	(+includes): Use @$(common-objpfx)includes.
+	* Makefile (postclean): Remove includes and includes.mk.
+	* Makerules ($(common-objpfx)includes.mk): Include and create
+	includes.mk.  Create includes.
+
+Upstream-status: Pending
+
+Index: libc/Makeconfig
+===================================================================
+--- libc.orig/Makeconfig	2009-10-13 22:55:12.000000000 -0700
++++ libc/Makeconfig	2010-03-31 16:02:37.120489733 -0700
+@@ -678,9 +678,10 @@ endif	# $(+cflags) == ""
+ # library source directory, in the include directory, and in the
+ # current directory.
+ +sysdep-includes = $(addprefix -I,$(+sysdep_dirs))
+++common-includes = $(+sysdep-includes) $(includes) $(sysincludes)
+ +includes = -I$(..)include $(if $(subdir),$(objpfx:%/=-I%)) \
+-	    $(+sysdep-includes) $(includes) \
+-	    $(patsubst %/,-I%,$(..)) $(libio-include) -I. $(sysincludes)
++	    @$(common-objpfx)includes \
++	    $(patsubst %/,-I%,$(..)) $(libio-include) -I.
+ 
+ # Since libio has several internal header files, we use a -I instead
+ # of many little headers in the include directory.
+Index: libc/Makefile
+===================================================================
+--- libc.orig/Makefile	2009-12-09 12:06:28.000000000 -0800
++++ libc/Makefile	2010-03-31 16:02:37.132481508 -0700
+@@ -247,7 +247,7 @@ parent-mostlyclean: common-mostlyclean #
+ parent-clean: parent-mostlyclean common-clean
+ 
+ postclean = $(addprefix $(common-objpfx),$(postclean-generated)) \
+-	    $(addprefix $(objpfx),sysd-dirs sysd-rules) \
++	    $(addprefix $(objpfx),sysd-dirs sysd-rules includes includes.mk) \
+ 	    $(addprefix $(objpfx),sysd-sorted soversions.mk soversions.i)
+ 
+ clean: parent-clean
+Index: libc/Makerules
+===================================================================
+--- libc.orig/Makerules	2009-12-09 12:06:28.000000000 -0800
++++ libc/Makerules	2010-03-31 16:02:37.140481645 -0700
+@@ -254,6 +254,20 @@ ifndef sysd-rules-done
+ no_deps=t
+ endif
+ 
++-include $(common-objpfx)includes.mk
++ifneq ($(+common-includes),$(saved-includes))
++# Recreate includes.mk (and includes).
++includes-force = FORCE
++FORCE:
++endif
++$(common-objpfx)includes.mk: $(includes-force)
++	-@rm -f $@T $(common-objpfx)includesT
++	for inc in $(+common-includes); do echo "$$inc"; done \
++	  > $(common-objpfx)includesT
++	mv -f $(common-objpfx)includesT $(common-objpfx)includes
++	echo 'saved-includes := $(+common-includes)' > $@T
++	mv -f $@T $@
++
+ define o-iterator-doit
+ $(objpfx)%$o: %.S $(before-compile); $$(compile-command.S)
+ endef
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch b/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
new file mode 100644
index 0000000..63a86c9
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
@@ -0,0 +1,35 @@
+Test for -fstack-protector is compile only test. One might have the option but
+might have build the compiler with --disable-ssp which means ssp should not be
+enabled. Therefore we change the test to a link time test. It will fail if
+libssp is not available.
+
+Upstream-status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libc/configure
+===================================================================
+--- libc.orig/configure
++++ libc/configure
+@@ -6937,7 +6937,7 @@ if test "${libc_cv_ssp+set}" = set; then
+   $as_echo_n "(cached) " >&6
+ else
+   if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -Werror -fstack-protector
+-			    -o /dev/null -c -x c /dev/null 1>&5'
++			    -o /dev/null -x c /dev/null 1>&5'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+Index: libc/configure.in
+===================================================================
+--- libc.orig/configure.in
++++ libc/configure.in
+@@ -1787,7 +1787,7 @@ AC_SUBST(fno_unit_at_a_time)
+ 
+ AC_CACHE_CHECK(for -fstack-protector, libc_cv_ssp, [dnl
+ if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS -Werror -fstack-protector
+-			    -o /dev/null -c -x c /dev/null 1>&AS_MESSAGE_LOG_FD])
++			    -o /dev/null -x c /dev/null 1>&AS_MESSAGE_LOG_FD])
+ then
+   libc_cv_ssp=yes
+ else
diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
index a9b1476..a36011a 100644
--- a/meta/recipes-core/eglibc/eglibc-common.inc
+++ b/meta/recipes-core/eglibc/eglibc-common.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
 INC_PR = "r11"
-LIC_FILES_CHKSUM = "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
+LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb b/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
new file mode 100644
index 0000000..787c762
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
@@ -0,0 +1,6 @@
+require eglibc_${PV}.bb
+require eglibc-initial.inc
+
+do_configure_prepend () {
+        unset CFLAGS
+}
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
new file mode 100644
index 0000000..398da69
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -0,0 +1,115 @@
+require eglibc.inc
+
+SRCREV = "13356"
+
+DEPENDS += "gperf-native"
+FILESPATHPKG =. "eglibc-svn:"
+PR = "r0"
+PR_append = "+svnr${SRCPV}"
+
+EGLIBC_BRANCH="eglibc-2_13"
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
+           file://eglibc-svn-arm-lowlevellock-include-tls.patch \
+           file://IO-acquire-lock-fix.patch \
+           file://shorten-build-commands.patch \
+           file://mips-rld-map-check.patch \
+           file://stack-protector-test.patch \
+           file://etc/ld.so.conf \
+           file://generate-supported.mk \
+	   "
+LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
+      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
+      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+
+SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
+S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+B = "${WORKDIR}/build-${TARGET_SYS}"
+
+PACKAGES_DYNAMIC = "libc6*"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
+PROVIDES_${PN}-dbg = "glibc-dbg"
+
+# the -isystem in bitbake.conf screws up glibc do_stage
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
+
+GLIBC_ADDONS ?= "ports,nptl,libidn"
+
+GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+
+#
+# For now, we will skip building of a gcc package if it is a uclibc one
+# and our build is not a uclibc one, and we skip a glibc one if our build
+# is a uclibc build.
+#
+# See the note in gcc/gcc_3.4.0.oe
+#
+
+python __anonymous () {
+    import bb, re
+    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
+    if uc_os:
+        raise bb.parse.SkipPackage("incompatible with target %s" %
+                                   bb.data.getVar('TARGET_OS', d, 1))
+}
+
+export libc_cv_slibdir = "${base_libdir}"
+
+EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
+                --without-cvs --disable-profile --disable-debug --without-gd \
+                --enable-clocale=gnu \
+                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --with-headers=${STAGING_INCDIR} \
+                --without-selinux \
+                ${GLIBC_EXTRA_OECONF}"
+
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_ports', d)
+}
+
+do_move_ports() {
+        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+	    rm -rf ${S}/ports
+	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
+	fi
+}
+
+do_configure () {
+# override this function to avoid the autoconf/automake/aclocal/autoheader
+# calls for now
+# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
+# version check and doesn't really help with anything
+        if [ -z "`which rpcgen`" ]; then
+                echo "rpcgen not found.  Install glibc-devel."
+                exit 1
+        fi
+        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+        find ${S} -name "configure" | xargs touch
+        CPPFLAGS="" oe_runconf
+}
+
+rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
+	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
+	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
+
+do_compile () {
+	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
+	unset LDFLAGS
+	base_do_compile
+	(
+		cd ${S}/sunrpc/rpcsvc
+		for r in ${rpcsvc}; do
+			h=`echo $r|sed -e's,\.x$,.h,'`
+			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
+		done
+	)
+}
+
+require eglibc-package.inc
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.1.1



