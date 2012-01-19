Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKw-0004cO-5w
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472121"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:43 -0800
Message-Id: <15cf6416e5005cfc9c6876caa37308819a75e1cf.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/33] uclibc: Upgrade to latest master
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:16 -0000

From: Khem Raj <raj.khem@gmail.com>

Document the patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/cross_compile_check.patch    |   13 +
 .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   83 ++++
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
 .../uclibc/uclibc-git/orign_path.patch             |  183 --------
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |    6 +
 .../uclibc-git/remove_attribute_optimize_Os.patch  |    5 +
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  216 ---------
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |    5 +
 .../uclibc/uclibc-git/uclibc-execvpe.patch         |    3 +
 .../uclibc-git/uclibc_enable_log2_test.patch       |    5 +
 .../uclibc-git/uclibc_scheduler_update.patch       |  455 --------------------
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   10 +-
 14 files changed, 134 insertions(+), 860 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch b/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
new file mode 100644
index 0000000..f009cb9
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
@@ -0,0 +1,13 @@
+diff --git a/Rules.mak b/Rules.mak
+index 84baa97..571da05 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -158,7 +158,7 @@ endif
+ comma:=,
+ space:= #
+ 
+-ifndef CROSS_COMPILE
++ifeq ($(CROSS_COMPILE),)
+ CROSS_COMPILE=$(call qstrip,$(CROSS_COMPILER_PREFIX))
+ endif
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch b/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
new file mode 100644
index 0000000..16e48b1
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
@@ -0,0 +1,83 @@
+Defer removal of the local scope of a dl-opened library after
+all the destructors (of itself and related dependencies) are actually
+get unloaded, otherwise any function registered via atexit()
+won't be resolved.
+
+Signed-off-by: Khem Raj <raj.khem at gmail.com>
+Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono at st.com>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso at st.com>
+---
+ ldso/libdl/libdl.c |   33 +++++++++++++++++++++------------
+ 1 files changed, 21 insertions(+), 12 deletions(-)
+
+
+Upstream-Status: Pending
+
+Index: git/ldso/libdl/libdl.c
+===================================================================
+--- git.orig/ldso/libdl/libdl.c	2012-01-17 17:38:44.930821794 -0800
++++ git/ldso/libdl/libdl.c	2012-01-17 17:39:02.754822656 -0800
+@@ -780,7 +780,9 @@
+ 	struct dyn_elf *handle;
+ 	unsigned int end = 0, start = 0xffffffff;
+ 	unsigned int i, j;
+-	struct r_scope_elem *ls;
++	struct r_scope_elem *ls, *ls_next = NULL;
++	struct elf_resolve **handle_rlist;
++
+ #if defined(USE_TLS) && USE_TLS
+ 	bool any_tls = false;
+ 	size_t tls_free_start = NO_TLS_OFFSET;
+@@ -813,6 +815,19 @@
+ 		free(handle);
+ 		return 0;
+ 	}
++
++	/* Store the handle's local scope array for later removal */
++	handle_rlist = handle->dyn->symbol_scope.r_list;
++
++	/* Store references to the local scope entries for later removal */
++	for (ls = &_dl_loaded_modules->symbol_scope; ls && ls->next; ls = ls->next)
++		if (ls->next->r_list[0] == handle->dyn) {
++			break;
++		}
++	/* ls points to the previous local symbol scope */
++	if(ls && ls->next)
++		ls_next = ls->next->next;
++
+ 	/* OK, this is a valid handle - now close out the file */
+ 	for (j = 0; j < handle->init_fini.nlist; ++j) {
+ 		tpnt = handle->init_fini.init_fini[j];
+@@ -974,16 +989,6 @@
+ 				}
+ 			}
+ 
+-			if (handle->dyn == tpnt) {
+-				/* Unlink the local scope from global one */
+-				for (ls = &_dl_loaded_modules->symbol_scope; ls; ls = ls->next)
+-					if (ls->next->r_list[0] == tpnt) {
+-						_dl_if_debug_print("removing symbol_scope: %s\n", tpnt->libname);
+-						break;
+-					}
+-				ls->next = ls->next->next;
+-			}
+-
+ 			/* Next, remove tpnt from the global symbol table list */
+ 			if (_dl_symbol_tables) {
+ 				if (_dl_symbol_tables->dyn == tpnt) {
+@@ -1005,10 +1010,14 @@
+ 				}
+ 			}
+ 			free(tpnt->libname);
+-			free(tpnt->symbol_scope.r_list);
+ 			free(tpnt);
+ 		}
+ 	}
++	/* Unlink and release the handle's local scope from global one */
++	if(ls)
++		ls->next = ls_next;
++	free(handle_rlist);
++
+ 	for (rpnt1 = handle->next; rpnt1; rpnt1 = rpnt1_tmp) {
+ 		rpnt1_tmp = rpnt1->next;
+ 		free(rpnt1);
diff --git a/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch b/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
index cfa68ce..d44acca 100644
--- a/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
@@ -1,3 +1,9 @@
+resolver code should always be in arm mode
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
 Index: uClibc/ldso/ldso/arm/resolve.S
 ===================================================================
 --- uClibc.orig/ldso/ldso/arm/resolve.S	2009-03-20 12:03:32.000000000 -0700
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
deleted file mode 100644
index b22be8c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-Patch is backported from 
-http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
-
-Upstream-Status: Pending
-
-Index: git/ldso/ldso/dl-elf.c
-===================================================================
---- git.orig/ldso/ldso/dl-elf.c	2011-07-01 15:20:51.000000000 -0700
-+++ git/ldso/ldso/dl-elf.c	2011-07-01 15:21:47.493578777 -0700
-@@ -133,53 +133,60 @@
-  * in uClibc/ldso/util/ldd.c */
- static struct elf_resolve *
- search_for_named_library(const char *name, int secure, const char *path_list,
--	struct dyn_elf **rpnt)
-+	struct dyn_elf **rpnt, const char *origin)
- {
--	char *path, *path_n, *mylibname;
-+	char *mylibname;
-+	const char *p, *pn;
- 	struct elf_resolve *tpnt;
--	int done;
-+	int plen;
- 
- 	if (path_list==NULL)
- 		return NULL;
- 
--	/* We need a writable copy of this string, but we don't
--	 * need this allocated permanently since we don't want
--	 * to leak memory, so use alloca to put path on the stack */
--	done = _dl_strlen(path_list);
--	path = alloca(done + 1);
--
- 	/* another bit of local storage */
- 	mylibname = alloca(2050);
- 
--	_dl_memcpy(path, path_list, done+1);
--
- 	/* Unlike ldd.c, don't bother to eliminate double //s */
- 
- 	/* Replace colons with zeros in path_list */
- 	/* : at the beginning or end of path maps to CWD */
- 	/* :: anywhere maps CWD */
- 	/* "" maps to CWD */
--	done = 0;
--	path_n = path;
--	do {
--		if (*path == 0) {
--			*path = ':';
--			done = 1;
--		}
--		if (*path == ':') {
--			*path = 0;
--			if (*path_n)
--				_dl_strcpy(mylibname, path_n);
--			else
--				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
--			_dl_strcat(mylibname, "/");
--			_dl_strcat(mylibname, name);
--			if ((tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname)) != NULL)
--				return tpnt;
--			path_n = path+1;
-+	for (p = path_list; p != NULL; p = pn) {
-+		pn = _dl_strchr(p + 1, ':');
-+		if (pn != NULL) {
-+			plen = pn - p;
-+			pn++;
-+		} else
-+			plen = _dl_strlen(p);
-+
-+		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
-+			int olen;
-+			if (secure && plen != 7)
-+				continue;
-+			if (origin == NULL)
-+				continue;
-+			for (olen = _dl_strlen(origin) - 1; olen >= 0 && origin[olen] != '/'; olen--)
-+				;
-+			if (olen <= 0)
-+				continue;
-+			_dl_memcpy(&mylibname[0], origin, olen);
-+			_dl_memcpy(&mylibname[olen], p + 7, plen - 7);
-+			mylibname[olen + plen - 7] = 0;
-+		} else if (plen != 0) {
-+			_dl_memcpy(mylibname, p, plen);
-+			mylibname[plen] = 0;
-+		} else {
-+			_dl_strcpy(mylibname, ".");
- 		}
--		path++;
--	} while (!done);
-+		_dl_strcat(mylibname, "/");
-+		_dl_strcat(mylibname, name);
-+
-+		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
-+		if (tpnt != NULL)
-+			return tpnt;
-+	}
-+
- 	return NULL;
- }
- 
-@@ -231,7 +238,8 @@
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
-+						      tpnt->libname)) != NULL)
- 			return tpnt1;
- 	}
- #endif
-@@ -239,7 +247,7 @@
- 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
- 	if (_dl_library_path) {
- 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
--		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
- 		{
- 			return tpnt1;
- 		}
-@@ -253,7 +261,7 @@
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
- 			return tpnt1;
- 	}
- #endif
-@@ -287,7 +295,7 @@
- 	/* Look for libraries wherever the shared library loader
- 	 * was installed */
- 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
--	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt);
-+	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
- 	if (tpnt1 != NULL)
- 		return tpnt1;
- 
-@@ -300,7 +308,7 @@
- #ifndef __LDSO_CACHE_SUPPORT__
- 					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
- #endif
--					, rpnt);
-+					, rpnt, NULL);
- 	if (tpnt1 != NULL)
- 		return tpnt1;
- 
-Index: git/ldso/ldso/ldso.c
-===================================================================
---- git.orig/ldso/ldso/ldso.c	2011-07-01 15:20:51.000000000 -0700
-+++ git/ldso/ldso/ldso.c	2011-07-01 15:24:32.363820591 -0700
-@@ -370,6 +370,20 @@
- 	return p - list;
- }
- 
-+static void _dl_setup_progname(const char *argv0)
-+{
-+	char image[PATH_MAX];
-+	ssize_t s;
-+
-+	s = _dl_readlink("/proc/self/exe", image, sizeof(image));
-+	if (s > 0 && image[0] == '/') {
-+		image[s] = 0;
-+		_dl_progname = _dl_strdup(image);
-+	} else if (argv0) {
-+		_dl_progname = argv0;
-+	}
-+}
-+
- void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
- 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
- 			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
-@@ -421,9 +435,7 @@
- 	 * been fixed up by now.  Still no function calls outside of this
- 	 * library, since the dynamic resolver is not yet ready.
- 	 */
--	if (argv[0]) {
--		_dl_progname = argv[0];
--	}
-+	_dl_setup_progname(argv[0]);
- 
- #ifndef __LDSO_STANDALONE_SUPPORT__
- 	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
index 339ce7f..3fa10af 100644
--- a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
@@ -1,3 +1,9 @@
+Add ppc copysignl implementation
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
 ===================================================================
 --- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
index 1930383..90fd3db 100644
--- a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
@@ -1,3 +1,8 @@
+Dont support localised optimizations this helps to have a global -O level
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
 Index: git/include/features.h
 ===================================================================
 --- git.orig/include/features.h
diff --git a/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch b/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
deleted file mode 100644
index 36fec65..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-Patch is backported from
-http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html
-
-Upstream-Status: Pending
-
-Index: git/ldso/include/dl-elf.h
-===================================================================
---- git.orig/ldso/include/dl-elf.h	2011-07-01 15:20:51.000000000 -0700
-+++ git/ldso/include/dl-elf.h	2011-07-01 15:30:43.274364603 -0700
-@@ -26,16 +26,18 @@
- static __inline__ void _dl_unmap_cache(void) { }
- #endif
- 
-+#define DL_RESOLVE_SECURE		0x0001
-+#define DL_RESOLVE_NOLOAD		0x0002
- 
- /* Function prototypes for non-static stuff in readelflib1.c */
- extern void _dl_parse_lazy_relocation_information(struct dyn_elf *rpnt,
- 	unsigned long rel_addr, unsigned long rel_size);
- extern int _dl_parse_relocation_information(struct dyn_elf *rpnt,
- 	struct r_scope_elem *scope, unsigned long rel_addr, unsigned long rel_size);
--extern struct elf_resolve * _dl_load_shared_library(int secure,
-+extern struct elf_resolve * _dl_load_shared_library(int resolve_flags,
- 	struct dyn_elf **rpnt, struct elf_resolve *tpnt, char *full_libname,
- 	int trace_loaded_objects);
--extern struct elf_resolve * _dl_load_elf_shared_library(int secure,
-+extern struct elf_resolve * _dl_load_elf_shared_library(int resolve_flags,
- 	struct dyn_elf **rpnt, const char *libname);
- extern struct elf_resolve *_dl_check_if_named_library_is_loaded(const char *full_libname,
- 	int trace_loaded_objects);
-Index: git/ldso/ldso/dl-elf.c
-===================================================================
---- git.orig/ldso/ldso/dl-elf.c	2011-07-01 15:21:47.000000000 -0700
-+++ git/ldso/ldso/dl-elf.c	2011-07-01 15:31:29.814432859 -0700
-@@ -132,7 +132,7 @@
- /* This function's behavior must exactly match that
-  * in uClibc/ldso/util/ldd.c */
- static struct elf_resolve *
--search_for_named_library(const char *name, int secure, const char *path_list,
-+search_for_named_library(const char *name, int resolve_flags, const char *path_list,
- 	struct dyn_elf **rpnt, const char *origin)
- {
- 	char *mylibname;
-@@ -162,7 +162,7 @@
- 
- 		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
- 			int olen;
--			if (secure && plen != 7)
-+			if ((resolve_flags & DL_RESOLVE_SECURE) && plen != 7)
- 				continue;
- 			if (origin == NULL)
- 				continue;
-@@ -182,7 +182,7 @@
- 		_dl_strcat(mylibname, "/");
- 		_dl_strcat(mylibname, name);
- 
--		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
-+		tpnt = _dl_load_elf_shared_library(resolve_flags, rpnt, mylibname);
- 		if (tpnt != NULL)
- 			return tpnt;
- 	}
-@@ -194,7 +194,7 @@
- unsigned long _dl_error_number;
- unsigned long _dl_internal_error_number;
- 
--struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
-+struct elf_resolve *_dl_load_shared_library(int resolve_flags, struct dyn_elf **rpnt,
- 	struct elf_resolve *tpnt, char *full_libname, int attribute_unused trace_loaded_objects)
- {
- 	char *pnt;
-@@ -223,7 +223,7 @@
- 
- 	if (libname != full_libname) {
- 		_dl_if_debug_dprint("\ttrying file='%s'\n", full_libname);
--		tpnt1 = _dl_load_elf_shared_library(secure, rpnt, full_libname);
-+		tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, full_libname);
- 		if (tpnt1) {
- 			return tpnt1;
- 		}
-@@ -238,7 +238,7 @@
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
-+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt,
- 						      tpnt->libname)) != NULL)
- 			return tpnt1;
- 	}
-@@ -247,7 +247,7 @@
- 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
- 	if (_dl_library_path) {
- 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
--		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, _dl_library_path, rpnt, NULL)) != NULL)
- 		{
- 			return tpnt1;
- 		}
-@@ -261,7 +261,7 @@
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt, NULL)) != NULL)
- 			return tpnt1;
- 	}
- #endif
-@@ -284,7 +284,7 @@
- 			     || libent[i].flags == LIB_ELF_LIBC0
- 			     ||	libent[i].flags == LIB_ELF_LIBC5)
- 			 && _dl_strcmp(libname, strs + libent[i].sooffset) == 0
--			 && (tpnt1 = _dl_load_elf_shared_library(secure, rpnt, strs + libent[i].liboffset))
-+			 && (tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, strs + libent[i].liboffset))
- 			) {
- 				return tpnt1;
- 			}
-@@ -295,14 +295,14 @@
- 	/* Look for libraries wherever the shared library loader
- 	 * was installed */
- 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
--	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
-+	tpnt1 = search_for_named_library(libname, resolve_flags, _dl_ldsopath, rpnt, NULL);
- 	if (tpnt1 != NULL)
- 		return tpnt1;
- 
- 	/* Lastly, search the standard list of paths for the library.
- 	   This list must exactly match the list in uClibc/ldso/util/ldd.c */
- 	_dl_if_debug_dprint("\tsearching full lib path list\n");
--	tpnt1 = search_for_named_library(libname, secure,
-+	tpnt1 = search_for_named_library(libname, resolve_flags,
- 					UCLIBC_RUNTIME_PREFIX "lib:"
- 					UCLIBC_RUNTIME_PREFIX "usr/lib"
- #ifndef __LDSO_CACHE_SUPPORT__
-@@ -444,7 +444,7 @@
-  * are required.
-  */
- 
--struct elf_resolve *_dl_load_elf_shared_library(int secure,
-+struct elf_resolve *_dl_load_elf_shared_library(int resolve_flags,
- 	struct dyn_elf **rpnt, const char *libname)
- {
- 	ElfW(Ehdr) *epnt;
-@@ -483,7 +483,7 @@
- 	}
- 	/* If we are in secure mode (i.e. a setu/gid binary using LD_PRELOAD),
- 	   we don't load the library if it isn't setuid. */
--	if (secure) {
-+	if (resolve_flags & DL_RESOLVE_SECURE) {
- 		if (!(st.st_mode & S_ISUID)) {
- 			_dl_close(infile);
- 			return NULL;
-@@ -499,6 +499,10 @@
- 			return tpnt;
- 		}
- 	}
-+	if (resolve_flags & DL_RESOLVE_NOLOAD) {
-+		_dl_close(infile);
-+		return NULL;
-+	}
- 	header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ | PROT_WRITE,
- 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
- 	if (_dl_mmap_check_error(header)) {
-Index: git/ldso/ldso/ldso.c
-===================================================================
---- git.orig/ldso/ldso/ldso.c	2011-07-01 15:24:32.000000000 -0700
-+++ git/ldso/ldso/ldso.c	2011-07-01 15:24:55.143854007 -0700
-@@ -854,7 +854,9 @@
- 			if (!_dl_secure || _dl_strchr(str, '/') == NULL) {
- 				_dl_if_debug_dprint("\tfile='%s';  needed by '%s'\n", str, _dl_progname);
- 
--				tpnt1 = _dl_load_shared_library(_dl_secure, &rpnt, NULL, str, trace_loaded_objects);
-+				tpnt1 = _dl_load_shared_library(
-+					_dl_secure ? DL_RESOLVE_SECURE : 0,
-+					&rpnt, NULL, str, trace_loaded_objects);
- 				if (!tpnt1) {
- #ifdef __LDSO_LDD_SUPPORT__
- 					if (trace_loaded_objects || _dl_trace_prelink)
-Index: git/ldso/libdl/libdl.c
-===================================================================
---- git.orig/ldso/libdl/libdl.c	2011-07-01 15:20:51.000000000 -0700
-+++ git/ldso/libdl/libdl.c	2011-07-01 15:24:55.143854007 -0700
-@@ -305,7 +305,7 @@
- #endif
- 
- 	/* A bit of sanity checking... */
--	if (!(flag & (RTLD_LAZY|RTLD_NOW))) {
-+	if (!(flag & (RTLD_LAZY|RTLD_NOW|RTLD_NOLOAD))) {
- 		_dl_error_number = LD_BAD_HANDLE;
- 		return NULL;
- 	}
-@@ -375,8 +375,9 @@
- 	/* Try to load the specified library */
- 	_dl_if_debug_print("Trying to dlopen '%s', RTLD_GLOBAL:%d RTLD_NOW:%d\n",
- 			(char*)libname, (flag & RTLD_GLOBAL ? 1:0), (now_flag & RTLD_NOW ? 1:0));
--	tpnt = _dl_load_shared_library(0, &rpnt, tfrom, (char*)libname, 0);
- 
-+	tpnt = _dl_load_shared_library((flag & RTLD_NOLOAD) ? DL_RESOLVE_NOLOAD : 0,
-+					&rpnt, tfrom, (char*)libname, 0);
- 	if (tpnt == NULL) {
- 		_dl_unmap_cache();
- 		return NULL;
-Index: git/libc/sysdeps/linux/common/bits/dlfcn.h
-===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/dlfcn.h	2011-07-01 15:20:52.000000000 -0700
-+++ git/libc/sysdeps/linux/common/bits/dlfcn.h	2011-07-01 15:24:55.143854007 -0700
-@@ -24,9 +24,9 @@
- /* The MODE argument to `dlopen' contains one of the following: */
- #define RTLD_LAZY	0x00001	/* Lazy function call binding.  */
- #define RTLD_NOW	0x00002	/* Immediate function call binding.  */
--#if 0 /* uClibc doesnt support these */
--#define	RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
-+#define RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
- #define RTLD_NOLOAD	0x00004	/* Do not load the object.  */
-+#if 0 /* uClibc doesnt support these */
- #define RTLD_DEEPBIND	0x00008	/* Use deep binding.  */
- #endif
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 9b2a0e5..3948d1a 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -181,3 +181,5 @@ UCLIBC_HAS_FLOATS=y
 
 # needed by systemd
 UCLIBC_HAS_UTMPX=y
+UCLIBC_LINUX_MODULE_26=y
+UCLIBC_HAS_RESOLVER_SUPPORT=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
index 504d37b..05a394d 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
@@ -1,3 +1,8 @@
+ftruncate64 has 4 args on arm
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
 Index: uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
 ===================================================================
 --- uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
index cd90a09..fe191fc 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
@@ -12,6 +12,9 @@ Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
  3 files changed, 46 insertions(+), 5 deletions(-)
  create mode 100644 libc/unistd/execvpe.c
 
+
+Upstream-Status: Pending
+
 diff --git a/include/unistd.h b/include/unistd.h
 index 9568790..070e4f2 100644
 --- a/include/unistd.h
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
index f8f3a7d..37a5988 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
@@ -1,3 +1,8 @@
+uclibc now has log2 so enable the tests
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
 Index: uClibc/test/math/libm-test.inc
 ===================================================================
 --- uClibc/test/math/libm-test.inc	(revision 23784)
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
deleted file mode 100644
index 78401bd..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
+++ /dev/null
@@ -1,455 +0,0 @@
-From 2becc16ecbef71c496644d9dc6cbd7383d7cdca3 Mon Sep 17 00:00:00 2001
-From: Henning Heinold <heinold@inf.fu-berlin.de>
-Date: Sat, 4 Jun 2011 21:21:41 +0200
-Subject: [PATCH 1/2] libc: updates the linux scheduler functions, most stuff
- was taken from the eglibc
-
-
-Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
----
- include/sched.h                            |   52 ++++++++++++----
- libc/sysdeps/linux/common/Makefile.in      |    4 +-
- libc/sysdeps/linux/common/bits/sched.h     |   96 +++++++++++++++++++++++-----
- libc/sysdeps/linux/common/sched_cpualloc.c |   27 ++++++++
- libc/sysdeps/linux/common/sched_cpucount.c |   60 +++++++++++++++++
- libc/sysdeps/linux/common/sched_cpufree.c  |   27 ++++++++
- libc/sysdeps/linux/common/sched_getcpu.c   |   37 +++++++++++
- libc/sysdeps/linux/common/unshare.c        |   12 ++++
- 8 files changed, 286 insertions(+), 29 deletions(-)
- create mode 100644 libc/sysdeps/linux/common/sched_cpualloc.c
- create mode 100644 libc/sysdeps/linux/common/sched_cpucount.c
- create mode 100644 libc/sysdeps/linux/common/sched_cpufree.c
- create mode 100644 libc/sysdeps/linux/common/sched_getcpu.c
- create mode 100644 libc/sysdeps/linux/common/unshare.c
-
-diff --git a/include/sched.h b/include/sched.h
-index 0d110c3..e265b84 100644
---- a/include/sched.h
-+++ b/include/sched.h
-@@ -1,5 +1,5 @@
- /* Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
--   Copyright (C) 1996,1997,1999,2001-2003,2004 Free Software Foundation, Inc.
-+   Copyright (C) 1996,1997,1999,2001-2004,2007 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -25,6 +25,9 @@
- /* Get type definitions.  */
- #include <bits/types.h>
- 
-+#define __need_size_t
-+#include <stddef.h>
-+
- #define __need_timespec
- #include <time.h>
- 
-@@ -65,11 +68,42 @@ extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __THROW;
- 
- #if defined __USE_GNU && defined __UCLIBC_LINUX_SPECIFIC__
- /* Access macros for `cpu_set'.  */
--#define CPU_SETSIZE __CPU_SETSIZE
--#define CPU_SET(cpu, cpusetp)	__CPU_SET (cpu, cpusetp)
--#define CPU_CLR(cpu, cpusetp)	__CPU_CLR (cpu, cpusetp)
--#define CPU_ISSET(cpu, cpusetp)	__CPU_ISSET (cpu, cpusetp)
--#define CPU_ZERO(cpusetp)	__CPU_ZERO (cpusetp)
-+# define CPU_SETSIZE __CPU_SETSIZE
-+# define CPU_SET(cpu, cpusetp)	 __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
-+# define CPU_CLR(cpu, cpusetp)	 __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
-+# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu_set_t), \
-+						cpusetp)
-+# define CPU_ZERO(cpusetp)	 __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
-+# define CPU_COUNT(cpusetp)	 __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)
-+
-+# define CPU_SET_S(cpu, setsize, cpusetp)   __CPU_SET_S (cpu, setsize, cpusetp)
-+# define CPU_CLR_S(cpu, setsize, cpusetp)   __CPU_CLR_S (cpu, setsize, cpusetp)
-+# define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu, setsize, \
-+							   cpusetp)
-+# define CPU_ZERO_S(setsize, cpusetp)	    __CPU_ZERO_S (setsize, cpusetp)
-+# define CPU_COUNT_S(setsize, cpusetp)	    __CPU_COUNT_S (setsize, cpusetp)
-+
-+# define CPU_EQUAL(cpusetp1, cpusetp2) \
-+  __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
-+# define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
-+  __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
-+
-+# define CPU_AND(destset, srcset1, srcset2) \
-+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, &)
-+# define CPU_OR(destset, srcset1, srcset2) \
-+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)
-+# define CPU_XOR(destset, srcset1, srcset2) \
-+  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)
-+# define CPU_AND_S(setsize, destset, srcset1, srcset2) \
-+  __CPU_OP_S (setsize, destset, srcset1, srcset2, &)
-+# define CPU_OR_S(setsize, destset, srcset1, srcset2) \
-+  __CPU_OP_S (setsize, destset, srcset1, srcset2, |)
-+# define CPU_XOR_S(setsize, destset, srcset1, srcset2) \
-+  __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)
-+
-+# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
-+# define CPU_ALLOC(count) __CPU_ALLOC (count)
-+# define CPU_FREE(cpuset) __CPU_FREE (cpuset)
- 
- 
- /* Set the CPU affinity for a task */
-@@ -79,12 +113,6 @@ extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
- /* Get the CPU affinity for a task */
- extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
- 			      cpu_set_t *__cpuset) __THROW;
--
--extern int __clone (int (*__fn) (void *__arg), void *__child_stack,
--		    int __flags, void *__arg, ...);
--extern int __clone2 (int (*__fn) (void *__arg), void *__child_stack_base,
--		     size_t __child_stack_size, int __flags, void *__arg, ...);
--
- #endif
- 
- __END_DECLS
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index 8f936ff..cb8c153 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -22,9 +22,11 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += capget.c capset.c inotify.c ioperm.c iopl.c \
- 	modify_ldt.c pipe2.c personality.c ppoll.c prctl.c \
- 	readahead.c reboot.c \
- 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
-+	sched_cpualloc.c sched_cpucount.c sched_cpufree.c \
- 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
- 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
--	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c
-+	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c \
-+	uselib.c vhangup.c
- # NPTL needs these internally: madvise.c
- CSRC-$(findstring y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) += madvise.c
- ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
-diff --git a/libc/sysdeps/linux/common/bits/sched.h b/libc/sysdeps/linux/common/bits/sched.h
-index b48a0c8..fea66a8 100644
---- a/libc/sysdeps/linux/common/bits/sched.h
-+++ b/libc/sysdeps/linux/common/bits/sched.h
-@@ -1,6 +1,7 @@
- /* Definitions of constants and data structure for POSIX 1003.1b-1993
-    scheduling interface.
--   Copyright (C) 1996-1999,2001-2003,2005,2006 Free Software Foundation, Inc.
-+   Copyright (C) 1996-1999,2001-2003,2005,2006,2007,2008
-+   Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -58,7 +59,13 @@
- 				      force CLONE_PTRACE on this clone.  */
- # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
- 					  the child.  */
--# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
-+# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
-+# define CLONE_NEWUTS	0x04000000	/* New utsname group.  */
-+# define CLONE_NEWIPC	0x08000000	/* New ipcs.  */
-+# define CLONE_NEWUSER	0x10000000	/* New user namespace.  */
-+# define CLONE_NEWPID	0x20000000	/* New pid namespace.  */
-+# define CLONE_NEWNET	0x40000000	/* New network namespace.  */
-+# define CLONE_IO	0x80000000	/* Clone I/O context.  */
- #endif
- 
- /* The official definition.  */
-@@ -74,10 +81,11 @@ __BEGIN_DECLS
- extern int clone (int (*__fn) (void *__arg), void *__child_stack,
- 		  int __flags, void *__arg, ...) __THROW;
- 
--#if 0
- /* Unshare the specified resources.  */
- extern int unshare (int __flags) __THROW;
--#endif
-+
-+/* Get index of currently used CPU.  */
-+extern int sched_getcpu (void) __THROW;
- #endif
- 
- __END_DECLS
-@@ -102,7 +110,7 @@ struct __sched_param
- # define __CPU_SETSIZE	1024
- # define __NCPUBITS	(8 * sizeof (__cpu_mask))
- 
--/* Type for array elements in 'cpu_set'.  */
-+/* Type for array elements in 'cpu_set_t'.  */
- typedef unsigned long int __cpu_mask;
- 
- /* Basic access functions.  */
-@@ -116,17 +124,73 @@ typedef struct
- } cpu_set_t;
- 
- /* Access functions for CPU masks.  */
--# define __CPU_ZERO(cpusetp) \
-+# define __CPU_ZERO_S(setsize, cpusetp) \
-   do {									      \
--    unsigned int __i;							      \
--    cpu_set_t *__arr = (cpusetp);					      \
--    for (__i = 0; __i < sizeof (cpu_set_t) / sizeof (__cpu_mask); ++__i)      \
--      __arr->__bits[__i] = 0;						      \
-+    size_t __i;								      \
-+    size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
-+    __cpu_mask *__bits = (cpusetp)->__bits;				      \
-+    for (__i = 0; __i < __imax; ++__i)					      \
-+      __bits[__i] = 0;							      \
-   } while (0)
--# define __CPU_SET(cpu, cpusetp) \
--  ((cpusetp)->__bits[__CPUELT (cpu)] |= __CPUMASK (cpu))
--# define __CPU_CLR(cpu, cpusetp) \
--  ((cpusetp)->__bits[__CPUELT (cpu)] &= ~__CPUMASK (cpu))
--# define __CPU_ISSET(cpu, cpusetp) \
--  (((cpusetp)->__bits[__CPUELT (cpu)] & __CPUMASK (cpu)) != 0)
-+# define __CPU_SET_S(cpu, setsize, cpusetp) \
-+  (__extension__							      \
-+   ({ size_t __cpu = (cpu);						      \
-+      __cpu < 8 * (setsize)						      \
-+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
-+	 |= __CPUMASK (__cpu))						      \
-+      : 0; }))
-+# define __CPU_CLR_S(cpu, setsize, cpusetp) \
-+  (__extension__							      \
-+   ({ size_t __cpu = (cpu);						      \
-+      __cpu < 8 * (setsize)						      \
-+      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
-+	 &= ~__CPUMASK (__cpu))						      \
-+      : 0; }))
-+# define __CPU_ISSET_S(cpu, setsize, cpusetp) \
-+  (__extension__							      \
-+   ({ size_t __cpu = (cpu);						      \
-+      __cpu < 8 * (setsize)						      \
-+      ? ((((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]	      \
-+	  & __CPUMASK (__cpu))) != 0					      \
-+      : 0; }))
-+
-+# define __CPU_COUNT_S(setsize, cpusetp) \
-+  __sched_cpucount (setsize, cpusetp)
-+
-+# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
-+  (__extension__							      \
-+   ({ __cpu_mask *__arr1 = (cpusetp1)->__bits;				      \
-+      __cpu_mask *__arr2 = (cpusetp2)->__bits;				      \
-+      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
-+      size_t __i;							      \
-+      for (__i = 0; __i < __imax; ++__i)				      \
-+	if (__arr1[__i] != __arr2[__i])					      \
-+	  break;							      \
-+      __i == __imax; }))
-+
-+# define __CPU_OP_S(setsize, destset, srcset1, srcset2, op) \
-+  (__extension__							      \
-+   ({ cpu_set_t *__dest = (destset);					      \
-+      __cpu_mask *__arr1 = (srcset1)->__bits;				      \
-+      __cpu_mask *__arr2 = (srcset2)->__bits;				      \
-+      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
-+      size_t __i;							      \
-+      for (__i = 0; __i < __imax; ++__i)				      \
-+	((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i];    \
-+      __dest; }))
-+
-+# define __CPU_ALLOC_SIZE(count) \
-+  ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))
-+# define __CPU_ALLOC(count) __sched_cpualloc (count)
-+# define __CPU_FREE(cpuset) __sched_cpufree (cpuset)
-+
-+__BEGIN_DECLS
-+
-+extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
-+  __THROW;
-+extern cpu_set_t *__sched_cpualloc (size_t __count) __THROW __wur;
-+extern void __sched_cpufree (cpu_set_t *__set) __THROW;
-+
-+__END_DECLS
-+
- #endif
-diff --git a/libc/sysdeps/linux/common/sched_cpualloc.c b/libc/sysdeps/linux/common/sched_cpualloc.c
-new file mode 100644
-index 0000000..2642a80
---- /dev/null
-+++ b/libc/sysdeps/linux/common/sched_cpualloc.c
-@@ -0,0 +1,27 @@
-+/* Copyright (C) 2007 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <sched.h>
-+#include <stdlib.h>
-+
-+
-+cpu_set_t *
-+__sched_cpualloc (size_t count)
-+{
-+  return malloc (CPU_ALLOC_SIZE (count));
-+}
-diff --git a/libc/sysdeps/linux/common/sched_cpucount.c b/libc/sysdeps/linux/common/sched_cpucount.c
-new file mode 100644
-index 0000000..331c0b8
---- /dev/null
-+++ b/libc/sysdeps/linux/common/sched_cpucount.c
-@@ -0,0 +1,60 @@
-+/* Copyright (C) 2007 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <limits.h>
-+#include <sched.h>
-+
-+
-+int
-+__sched_cpucount (size_t setsize, const cpu_set_t *setp)
-+{
-+  int s = 0;
-+  const __cpu_mask *p = setp->__bits;
-+  const __cpu_mask *end = &setp->__bits[setsize / sizeof (__cpu_mask)];
-+
-+  while (p < end)
-+    {
-+      __cpu_mask l = *p++;
-+
-+#ifdef POPCNT
-+      s += POPCNT (l);
-+#else
-+      if (l == 0)
-+	continue;
-+
-+# if LONG_BIT > 32
-+      l = (l & 0x5555555555555555ul) + ((l >> 1) & 0x5555555555555555ul);
-+      l = (l & 0x3333333333333333ul) + ((l >> 2) & 0x3333333333333333ul);
-+      l = (l & 0x0f0f0f0f0f0f0f0ful) + ((l >> 4) & 0x0f0f0f0f0f0f0f0ful);
-+      l = (l & 0x00ff00ff00ff00fful) + ((l >> 8) & 0x00ff00ff00ff00fful);
-+      l = (l & 0x0000ffff0000fffful) + ((l >> 16) & 0x0000ffff0000fffful);
-+      l = (l & 0x00000000fffffffful) + ((l >> 32) & 0x00000000fffffffful);
-+# else
-+      l = (l & 0x55555555ul) + ((l >> 1) & 0x55555555ul);
-+      l = (l & 0x33333333ul) + ((l >> 2) & 0x33333333ul);
-+      l = (l & 0x0f0f0f0ful) + ((l >> 4) & 0x0f0f0f0ful);
-+      l = (l & 0x00ff00fful) + ((l >> 8) & 0x00ff00fful);
-+      l = (l & 0x0000fffful) + ((l >> 16) & 0x0000fffful);
-+# endif
-+
-+      s += l;
-+#endif
-+    }
-+
-+  return s;
-+}
-diff --git a/libc/sysdeps/linux/common/sched_cpufree.c b/libc/sysdeps/linux/common/sched_cpufree.c
-new file mode 100644
-index 0000000..dd4c613
---- /dev/null
-+++ b/libc/sysdeps/linux/common/sched_cpufree.c
-@@ -0,0 +1,27 @@
-+/* Copyright (C) 2007 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <sched.h>
-+#include <stdlib.h>
-+
-+
-+void
-+__sched_cpufree (cpu_set_t *set)
-+{
-+  free (set);
-+}
-diff --git a/libc/sysdeps/linux/common/sched_getcpu.c b/libc/sysdeps/linux/common/sched_getcpu.c
-new file mode 100644
-index 0000000..b193d65
---- /dev/null
-+++ b/libc/sysdeps/linux/common/sched_getcpu.c
-@@ -0,0 +1,37 @@
-+/* Copyright (C) 2007 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <stdlib.h>
-+#include <errno.h>
-+#include <sched.h>
-+#include <sysdep.h>
-+
-+
-+int
-+sched_getcpu (void)
-+{
-+#ifdef __NR_getcpu
-+  unsigned int cpu;
-+  int r = INLINE_SYSCALL (getcpu, 3, &cpu, NULL, NULL);
-+
-+  return r == -1 ? r : cpu;
-+#else
-+  __set_errno (ENOSYS);
-+  return -1;
-+#endif
-+}
-diff --git a/libc/sysdeps/linux/common/unshare.c b/libc/sysdeps/linux/common/unshare.c
-new file mode 100644
-index 0000000..485bf88
---- /dev/null
-+++ b/libc/sysdeps/linux/common/unshare.c
-@@ -0,0 +1,12 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * unshare() for uClibc
-+ *
-+ * Copyright (C) 2011 Henning Heinold <heinold@inf.fu-berlin.de>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <sched.h>
-+_syscall1(int, unshare, int, flags)
--- 
-1.7.5.3
-
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 92157bd..0779221 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -8,7 +8,7 @@ features, at the cost of ABI differences for different configurations. \
 uClibc has been designed from the ground up to be a C library for \
 embedded Linux.  It is NOT compatible with binaries linked against glibc."
 
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1+"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 8681233..ee1b5e0 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,4 +1,4 @@
-SRCREV="f87898ca4a7d4b7171779c06ff1f4848efeee431"
+SRCREV="a4421e60526d3420a9c0bd55bfa4a25a746cbc8e"
 
 require uclibc.inc
 
@@ -11,7 +11,7 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
+SRC_URI = "git://busybox.osuosl.org/uClibc.git;branch=master;protocol=git \
 	file://uClibc.machine \
 	file://uClibc.distro \
 	file://uclibc-arm-ftruncate64.patch \
@@ -22,9 +22,9 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
 	file://compile-arm-fork-with-O2.patch \
-	file://orign_path.patch \
-	file://rtld_no.patch \
 	file://uclibc-execvpe.patch \
-	file://uclibc_scheduler_update.patch \
+	file://fix_libdl.patch \
+	file://cross_compile_check.patch \
 	"
+
 S = "${WORKDIR}/git"
-- 
1.7.6.5



