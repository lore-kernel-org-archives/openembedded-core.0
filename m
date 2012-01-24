Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWU-0000Gp-1y
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:10 +0100
Received: by mail-iy0-f175.google.com with SMTP id z21so7118245iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JRjCl54piTns9BSJ5tcLVlsjpd5Y1zGV1rUMBqrYP3Y=;
	b=RimjdsaDUagHlhd/cGgxukLcMEihNXK/KL+uuRFZYBoW9jqyybtS5XVFuog7LosYTF
	CIdSa+/sesQrqvVnJ55K0s6pXtFAi+TRBXfGJTBB+d3zBsX0TIXnsNHGqv4m/iXcfhiA
	W9/xohscXlTtp0bl6r4CM+Yc9GyC6ZOWlQ7bc=
Received: by 10.42.158.69 with SMTP id g5mr5713308icx.55.1327427004627;
	Tue, 24 Jan 2012 09:43:24 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:43:00 -0800
Message-Id: <df15b2df40a0b0b612a269691dd4c28352830299.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] uclibc-git: Update to latest RC
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
X-List-Received-Date: Tue, 24 Jan 2012 17:51:10 -0000

Document the patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/argp-headers.patch           |    2 +
 .../uclibc/uclibc-git/argp-support.patch           |    3 +
 .../uclibc-git/compile-arm-fork-with-O2.patch      |    2 +-
 .../uclibc/uclibc-git/cross_compile_check.patch    |   13 --
 .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   83 ---------
 .../uclibc/uclibc-git/orign_path.patch             |  185 ++++++++++++++++++++
 .../uclibc-git/remove_attribute_optimize_Os.patch  |   12 --
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   18 --
 meta/recipes-core/uclibc/uclibc_git.bb             |    8 +-
 9 files changed, 194 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch b/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
index 7fd148f..b31b991 100644
--- a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
@@ -8,6 +8,8 @@ Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
  create mode 100644 include/argp.h
  create mode 100644 libc/argp/argp-fmtstream.h
 
+Upstream-Status: Pending
+
 Index: git/include/argp.h
 ===================================================================
 --- /dev/null
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
index 04a3c78..3e9680f 100644
--- a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
@@ -13,6 +13,9 @@ it doesn't need to link libuargp.so explicitely.
 Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
 Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono at st.com>
 Signed-off-by: Carmelo Amoroso <carmelo.amoroso at st.com>
+
+Upstream-Status: Pending
+
 ---
  Makefile.in                                 |    8 +
  Makerules                                   |    8 +-
diff --git a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch b/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
index 429f27d..15ee0ca 100644
--- a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
@@ -1,5 +1,5 @@
 When compiling in thumb mode for arm with -Os gcc gives up since it can not find registers
-to spill. So we use -O2 option for compiling fork.c It may be addressable is gcc.
+to spill. So we use -O2 option for compiling fork.c It may be addressable in gcc.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch b/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
deleted file mode 100644
index f009cb9..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/Rules.mak b/Rules.mak
-index 84baa97..571da05 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -158,7 +158,7 @@ endif
- comma:=,
- space:= #
- 
--ifndef CROSS_COMPILE
-+ifeq ($(CROSS_COMPILE),)
- CROSS_COMPILE=$(call qstrip,$(CROSS_COMPILER_PREFIX))
- endif
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch b/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
deleted file mode 100644
index 16e48b1..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Defer removal of the local scope of a dl-opened library after
-all the destructors (of itself and related dependencies) are actually
-get unloaded, otherwise any function registered via atexit()
-won't be resolved.
-
-Signed-off-by: Khem Raj <raj.khem at gmail.com>
-Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono at st.com>
-Signed-off-by: Carmelo Amoroso <carmelo.amoroso at st.com>
----
- ldso/libdl/libdl.c |   33 +++++++++++++++++++++------------
- 1 files changed, 21 insertions(+), 12 deletions(-)
-
-
-Upstream-Status: Pending
-
-Index: git/ldso/libdl/libdl.c
-===================================================================
---- git.orig/ldso/libdl/libdl.c	2012-01-17 17:38:44.930821794 -0800
-+++ git/ldso/libdl/libdl.c	2012-01-17 17:39:02.754822656 -0800
-@@ -780,7 +780,9 @@
- 	struct dyn_elf *handle;
- 	unsigned int end = 0, start = 0xffffffff;
- 	unsigned int i, j;
--	struct r_scope_elem *ls;
-+	struct r_scope_elem *ls, *ls_next = NULL;
-+	struct elf_resolve **handle_rlist;
-+
- #if defined(USE_TLS) && USE_TLS
- 	bool any_tls = false;
- 	size_t tls_free_start = NO_TLS_OFFSET;
-@@ -813,6 +815,19 @@
- 		free(handle);
- 		return 0;
- 	}
-+
-+	/* Store the handle's local scope array for later removal */
-+	handle_rlist = handle->dyn->symbol_scope.r_list;
-+
-+	/* Store references to the local scope entries for later removal */
-+	for (ls = &_dl_loaded_modules->symbol_scope; ls && ls->next; ls = ls->next)
-+		if (ls->next->r_list[0] == handle->dyn) {
-+			break;
-+		}
-+	/* ls points to the previous local symbol scope */
-+	if(ls && ls->next)
-+		ls_next = ls->next->next;
-+
- 	/* OK, this is a valid handle - now close out the file */
- 	for (j = 0; j < handle->init_fini.nlist; ++j) {
- 		tpnt = handle->init_fini.init_fini[j];
-@@ -974,16 +989,6 @@
- 				}
- 			}
- 
--			if (handle->dyn == tpnt) {
--				/* Unlink the local scope from global one */
--				for (ls = &_dl_loaded_modules->symbol_scope; ls; ls = ls->next)
--					if (ls->next->r_list[0] == tpnt) {
--						_dl_if_debug_print("removing symbol_scope: %s\n", tpnt->libname);
--						break;
--					}
--				ls->next = ls->next->next;
--			}
--
- 			/* Next, remove tpnt from the global symbol table list */
- 			if (_dl_symbol_tables) {
- 				if (_dl_symbol_tables->dyn == tpnt) {
-@@ -1005,10 +1010,14 @@
- 				}
- 			}
- 			free(tpnt->libname);
--			free(tpnt->symbol_scope.r_list);
- 			free(tpnt);
- 		}
- 	}
-+	/* Unlink and release the handle's local scope from global one */
-+	if(ls)
-+		ls->next = ls_next;
-+	free(handle_rlist);
-+
- 	for (rpnt1 = handle->next; rpnt1; rpnt1 = rpnt1_tmp) {
- 		rpnt1_tmp = rpnt1->next;
- 		free(rpnt1);
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
new file mode 100644
index 0000000..c9c15a3
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
@@ -0,0 +1,185 @@
+Patch is backported from 
+http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
+
+Upstream-Status: Pending
+
+Index: git/ldso/ldso/dl-elf.c
+===================================================================
+--- git.orig/ldso/ldso/dl-elf.c	2012-01-23 19:18:58.000000000 -0800
++++ git/ldso/ldso/dl-elf.c	2012-01-23 21:52:06.144646590 -0800
+@@ -133,53 +133,60 @@
+  * in uClibc/ldso/util/ldd.c */
+ static struct elf_resolve *
+ search_for_named_library(const char *name, unsigned rflags, const char *path_list,
+-	struct dyn_elf **rpnt)
++	struct dyn_elf **rpnt, const char* origin)
+ {
+-	char *path, *path_n, *mylibname;
++	char *mylibname;
++	const char *p, *pn;
+ 	struct elf_resolve *tpnt;
+-	int done;
++	int plen;
+ 
+ 	if (path_list==NULL)
+ 		return NULL;
+ 
+-	/* We need a writable copy of this string, but we don't
+-	 * need this allocated permanently since we don't want
+-	 * to leak memory, so use alloca to put path on the stack */
+-	done = _dl_strlen(path_list);
+-	path = alloca(done + 1);
+-
+ 	/* another bit of local storage */
+ 	mylibname = alloca(2050);
+ 
+-	_dl_memcpy(path, path_list, done+1);
+-
+ 	/* Unlike ldd.c, don't bother to eliminate double //s */
+ 
+ 	/* Replace colons with zeros in path_list */
+ 	/* : at the beginning or end of path maps to CWD */
+ 	/* :: anywhere maps CWD */
+ 	/* "" maps to CWD */
+-	done = 0;
+-	path_n = path;
+-	do {
+-		if (*path == 0) {
+-			*path = ':';
+-			done = 1;
++	for (p = path_list; p != NULL; p = pn) {
++		pn = _dl_strchr(p + 1, ':');
++		if (pn != NULL) {
++			plen = pn - p;
++			pn++;
++		} else
++			plen = _dl_strlen(p);
++
++		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
++			int olen;
++			if (rflags && plen != 7)
++				continue;
++			if (origin == NULL)
++				continue;
++			for (olen = _dl_strlen(origin) - 1; olen >= 0 && origin[olen] != '/'; olen--)
++				;
++			if (olen <= 0)
++				continue;
++			_dl_memcpy(&mylibname[0], origin, olen);
++			_dl_memcpy(&mylibname[olen], p + 7, plen - 7);
++			mylibname[olen + plen - 7] = 0;
++		} else if (plen != 0) {
++			_dl_memcpy(mylibname, p, plen);
++			mylibname[plen] = 0;
++		} else {
++			_dl_strcpy(mylibname, ".");
+ 		}
+-		if (*path == ':') {
+-			*path = 0;
+-			if (*path_n)
+-				_dl_strcpy(mylibname, path_n);
+-			else
+-				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
+-			_dl_strcat(mylibname, "/");
+-			_dl_strcat(mylibname, name);
+-			if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
+-				return tpnt;
+-			path_n = path+1;
+-		}
+-		path++;
+-	} while (!done);
++		_dl_strcat(mylibname, "/");
++		_dl_strcat(mylibname, name);
++
++		tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname);
++		if (tpnt != NULL)
++			return tpnt;
++	}
++
+ 	return NULL;
+ }
+ 
+@@ -231,8 +238,10 @@
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt,
++						      tpnt->libname)) != NULL)
+ 			return tpnt1;
++
+ 	}
+ #endif
+ 
+@@ -240,7 +249,7 @@
+ 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
+ 	if (_dl_library_path) {
+ 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
+-		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt, NULL)) != NULL)
+ 		{
+ 			return tpnt1;
+ 		}
+@@ -254,7 +263,7 @@
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt, NULL)) != NULL)
+ 			return tpnt1;
+ 	}
+ #endif
+@@ -288,7 +297,7 @@
+ 	/* Look for libraries wherever the shared library loader
+ 	 * was installed */
+ 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
+-	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt);
++	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt, NULL);
+ 	if (tpnt1 != NULL)
+ 		return tpnt1;
+ #endif
+@@ -301,7 +310,7 @@
+ #ifndef __LDSO_CACHE_SUPPORT__
+ 					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
+ #endif
+-					, rpnt);
++					, rpnt, NULL);
+ 	if (tpnt1 != NULL)
+ 		return tpnt1;
+ 
+Index: git/ldso/ldso/ldso.c
+===================================================================
+--- git.orig/ldso/ldso/ldso.c	2012-01-23 19:18:58.000000000 -0800
++++ git/ldso/ldso/ldso.c	2012-01-23 21:34:11.152594621 -0800
+@@ -407,6 +407,20 @@
+ 	return p - list;
+ }
+ 
++static void _dl_setup_progname(const char *argv0)
++{
++	char image[PATH_MAX];
++	ssize_t s;
++
++	s = _dl_readlink("/proc/self/exe", image, sizeof(image));
++	if (s > 0 && image[0] == '/') {
++		image[s] = 0;
++		_dl_progname = _dl_strdup(image);
++	} else if (argv0) {
++		_dl_progname = argv0;
++	}
++}
++
+ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
+ 			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
+@@ -458,9 +472,7 @@
+ 	 * been fixed up by now.  Still no function calls outside of this
+ 	 * library, since the dynamic resolver is not yet ready.
+ 	 */
+-	if (argv[0]) {
+-		_dl_progname = argv[0];
+-	}
++	_dl_setup_progname(argv[0]);
+ 
+ #ifndef __LDSO_STANDALONE_SUPPORT__
+ 	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
index 90fd3db..bee251c 100644
--- a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
@@ -3,18 +3,6 @@ Dont support localised optimizations this helps to have a global -O level
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: git/include/features.h
-===================================================================
---- git.orig/include/features.h
-+++ git/include/features.h
-@@ -186,7 +186,6 @@
- # define __need_uClibc_config_h
- # include <bits/uClibc_config.h>
- # undef __need_uClibc_config_h
--
- /* For uClibc, always optimize for size -- this should disable
-  * a lot of expensive inlining...
-  * TODO: this is wrong! __OPTIMIZE_SIZE__ is an indicator of
 Index: git/libpthread/nptl/pthread_mutex_timedlock.c
 ===================================================================
 --- git.orig/libpthread/nptl/pthread_mutex_timedlock.c
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
deleted file mode 100644
index 05a394d..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-ftruncate64 has 4 args on arm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
-===================================================================
---- uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
-+++ uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
-@@ -38,4 +38,8 @@
- /* define if target supports IEEE signed zero floats */
- #define __UCLIBC_HAVE_SIGNED_ZERO__
- 
-+#ifdef __ARM_EABI__
-+# define __UCLIBC_TRUNCATE64_HAS_4_ARGS__
-+#endif
-+
- #endif /* _BITS_UCLIBC_ARCH_FEATURES_H */
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index ee1b5e0..0088152 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,4 +1,4 @@
-SRCREV="a4421e60526d3420a9c0bd55bfa4a25a746cbc8e"
+SRCREV="eb72efd81e0d5be6c836c5a084cc65b9734f544d"
 
 require uclibc.inc
 
@@ -11,10 +11,9 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
-SRC_URI = "git://busybox.osuosl.org/uClibc.git;branch=master;protocol=git \
+SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://uClibc.machine \
 	file://uClibc.distro \
-	file://uclibc-arm-ftruncate64.patch \
 	file://uclibc_enable_log2_test.patch \
 	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
 	file://powerpc_copysignl.patch \
@@ -23,8 +22,7 @@ SRC_URI = "git://busybox.osuosl.org/uClibc.git;branch=master;protocol=git \
 	file://remove_attribute_optimize_Os.patch \
 	file://compile-arm-fork-with-O2.patch \
 	file://uclibc-execvpe.patch \
-	file://fix_libdl.patch \
-	file://cross_compile_check.patch \
+	file://orign_path.patch \
 	"
 
 S = "${WORKDIR}/git"
-- 
1.7.8.3



