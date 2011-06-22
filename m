Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXp-00034i-3B
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:53 +0200
Received: by mail-pz0-f50.google.com with SMTP id 2so236586pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=WvO7tpnubOsp9IxcF/5XlKHDV4sQHkoXOVAJ4/lawiE=;
	b=xeQRI+/0bf2unibNwJSftY2/2DvJQMXS4SDB+1AyTMeeN5pbis3elnFpRuzwd+CTF4
	pL5OowlD1xvl+qBTILuzhCLbpOzc29UDtkALgEwdr8WtLF/UmG1cL2boqvfZXnQ2ARVg
	c1OfyyZrNr3ihnHiC3tXI0YwvA0tsfqcctxMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FR9rGoxFG6PK+pnwyZwNv08gl2EoV48IzJ42gogMl3inU7SP72j1JM1W5AvjXWI31K
	JjnBbyS5TxpVXjn5cdM95fl+y5RrwdO4OUtrviDwDkI01HsBJicwffRJCbMyesBM8n5O
	mTXSMllkBPXZr0KHYqkX6ZNf3rmqfp5ZHQeVk=
Received: by 10.142.135.12 with SMTP id i12mr12464wfd.270.1308707060456;
	Tue, 21 Jun 2011 18:44:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm55947pbd.87.2011.06.21.18.44.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:44:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:44:09 -0700
Message-Id: <fe1261b1f6ee5140fd952f9ce26b935141fcc259.1308706511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
References: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1308706511.git.raj.khem@gmail.com>
References: <cover.1308706511.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] uclibc: Add support for $ORIGIN
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:54 -0000

This is required by systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/orign_path.patch             |  183 +++++++++++++++++
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  215 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 +-
 3 files changed, 401 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
new file mode 100644
index 0000000..631951e
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
@@ -0,0 +1,183 @@
+Patch is backported from 
+http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
+
+Upstream-Status: Pending
+
+diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
+index 505247e..2b2d429 100644
+--- a/ldso/ldso/dl-elf.c
++++ b/ldso/ldso/dl-elf.c
+@@ -133,53 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
+  * in uClibc/ldso/util/ldd.c */
+ static struct elf_resolve *
+ search_for_named_library(const char *name, int secure, const char *path_list,
+-	struct dyn_elf **rpnt)
++	struct dyn_elf **rpnt, const char *origin)
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
+-		}
+-		if (*path == ':') {
+-			*path = 0;
+-			if (*path_n)
+-				_dl_strcpy(mylibname, path_n);
+-			else
+-				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
+-			_dl_strcat(mylibname, "/");
+-			_dl_strcat(mylibname, name);
+-			if ((tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname)) != NULL)
+-				return tpnt;
+-			path_n = path+1;
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
++			if (secure && plen != 7)
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
+-		path++;
+-	} while (!done);
++		_dl_strcat(mylibname, "/");
++		_dl_strcat(mylibname, name);
++
++		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
++		if (tpnt != NULL)
++			return tpnt;
++	}
++
+ 	return NULL;
+ }
+ 
+@@ -231,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
++						      tpnt->libname)) != NULL)
+ 			return tpnt1;
+ 	}
+ #endif
+@@ -239,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
+ 	if (_dl_library_path) {
+ 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
+-		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
+ 		{
+ 			return tpnt1;
+ 		}
+@@ -253,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
+ 			return tpnt1;
+ 	}
+ #endif
+@@ -287,7 +295,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	/* Look for libraries wherever the shared library loader
+ 	 * was installed */
+ 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
+-	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt);
++	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
+ 	if (tpnt1 != NULL)
+ 		return tpnt1;
+ 
+@@ -300,7 +308,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ #ifndef __LDSO_CACHE_SUPPORT__
+ 					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
+ #endif
+-					, rpnt);
++					, rpnt, NULL);
+ 	if (tpnt1 != NULL)
+ 		return tpnt1;
+ 
+diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
+index 7ee9257..9423670 100644
+--- a/ldso/ldso/ldso.c
++++ b/ldso/ldso/ldso.c
+@@ -272,6 +272,20 @@ static void __attribute__ ((destructor)) __attribute_used__ _dl_fini(void)
+ 	}
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
+ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp,
+ 			  char **argv
+@@ -321,9 +335,7 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 	 * been fixed up by now.  Still no function calls outside of this
+ 	 * library, since the dynamic resolver is not yet ready.
+ 	 */
+-	if (argv[0]) {
+-		_dl_progname = argv[0];
+-	}
++	_dl_setup_progname(argv[0]);
+ 
+ 	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
+ 		_dl_dprintf(_dl_debug_file, "Standalone execution is not supported yet\n");
diff --git a/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch b/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
new file mode 100644
index 0000000..30cb7f6
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
@@ -0,0 +1,215 @@
+Patch is backported from
+http://lists.busybox.net/pipermail/uclibc/2011-March/045004.html
+
+Upstream-Status: Pending
+
+diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h
+index 7fbb373..7102351 100644
+--- a/ldso/include/dl-elf.h
++++ b/ldso/include/dl-elf.h
+@@ -25,16 +25,18 @@ static __inline__ void _dl_map_cache(void) { }
+ static __inline__ void _dl_unmap_cache(void) { }
+ #endif
+ 
++#define DL_RESOLVE_SECURE		0x0001
++#define DL_RESOLVE_NOLOAD		0x0002
+ 
+ /* Function prototypes for non-static stuff in readelflib1.c */
+ extern void _dl_parse_lazy_relocation_information(struct dyn_elf *rpnt,
+ 	unsigned long rel_addr, unsigned long rel_size);
+ extern int _dl_parse_relocation_information(struct dyn_elf *rpnt,
+ 	unsigned long rel_addr, unsigned long rel_size);
+-extern struct elf_resolve * _dl_load_shared_library(int secure,
++extern struct elf_resolve * _dl_load_shared_library(int resolve_flags,
+ 	struct dyn_elf **rpnt, struct elf_resolve *tpnt, char *full_libname,
+ 	int trace_loaded_objects);
+-extern struct elf_resolve * _dl_load_elf_shared_library(int secure,
++extern struct elf_resolve * _dl_load_elf_shared_library(int resolve_flags,
+ 	struct dyn_elf **rpnt, char *libname);
+ extern struct elf_resolve *_dl_check_if_named_library_is_loaded(const char *full_libname,
+ 	int trace_loaded_objects);
+diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
+index 2b2d429..6d35bf2 100644
+--- a/ldso/ldso/dl-elf.c
++++ b/ldso/ldso/dl-elf.c
+@@ -132,7 +132,7 @@ _dl_protect_relro (struct elf_resolve *l)
+ /* This function's behavior must exactly match that
+  * in uClibc/ldso/util/ldd.c */
+ static struct elf_resolve *
+-search_for_named_library(const char *name, int secure, const char *path_list,
++search_for_named_library(const char *name, int resolve_flags, const char *path_list,
+ 	struct dyn_elf **rpnt, const char *origin)
+ {
+ 	char *mylibname;
+@@ -162,7 +162,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+ 
+ 		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
+ 			int olen;
+-			if (secure && plen != 7)
++			if ((resolve_flags & DL_RESOLVE_SECURE) && plen != 7)
+ 				continue;
+ 			if (origin == NULL)
+ 				continue;
+@@ -182,7 +182,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+ 		_dl_strcat(mylibname, "/");
+ 		_dl_strcat(mylibname, name);
+ 
+-		tpnt = _dl_load_elf_shared_library(secure, rpnt, mylibname);
++		tpnt = _dl_load_elf_shared_library(resolve_flags, rpnt, mylibname);
+ 		if (tpnt != NULL)
+ 			return tpnt;
+ 	}
+@@ -194,7 +194,7 @@ search_for_named_library(const char *name, int secure, const char *path_list,
+ unsigned long _dl_error_number;
+ unsigned long _dl_internal_error_number;
+ 
+-struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
++struct elf_resolve *_dl_load_shared_library(int resolve_flags, struct dyn_elf **rpnt,
+ 	struct elf_resolve *tpnt, char *full_libname, int attribute_unused trace_loaded_objects)
+ {
+ 	char *pnt;
+@@ -223,7 +223,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 
+ 	if (libname != full_libname) {
+ 		_dl_if_debug_dprint("\ttrying file='%s'\n", full_libname);
+-		tpnt1 = _dl_load_elf_shared_library(secure, rpnt, full_libname);
++		tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, full_libname);
+ 		if (tpnt1) {
+ 			return tpnt1;
+ 		}
+@@ -238,7 +238,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt,
++		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt,
+ 						      tpnt->libname)) != NULL)
+ 			return tpnt1;
+ 	}
+@@ -247,7 +247,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
+ 	if (_dl_library_path) {
+ 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
+-		if ((tpnt1 = search_for_named_library(libname, secure, _dl_library_path, rpnt, NULL)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, resolve_flags, _dl_library_path, rpnt, NULL)) != NULL)
+ 		{
+ 			return tpnt1;
+ 		}
+@@ -261,7 +261,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	if (pnt) {
+ 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
+ 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
+-		if ((tpnt1 = search_for_named_library(libname, secure, pnt, rpnt, NULL)) != NULL)
++		if ((tpnt1 = search_for_named_library(libname, resolve_flags, pnt, rpnt, NULL)) != NULL)
+ 			return tpnt1;
+ 	}
+ #endif
+@@ -284,7 +284,7 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 			     || libent[i].flags == LIB_ELF_LIBC0
+ 			     ||	libent[i].flags == LIB_ELF_LIBC5)
+ 			 && _dl_strcmp(libname, strs + libent[i].sooffset) == 0
+-			 && (tpnt1 = _dl_load_elf_shared_library(secure, rpnt, strs + libent[i].liboffset))
++			 && (tpnt1 = _dl_load_elf_shared_library(resolve_flags, rpnt, strs + libent[i].liboffset))
+ 			) {
+ 				return tpnt1;
+ 			}
+@@ -295,14 +295,14 @@ struct elf_resolve *_dl_load_shared_library(int secure, struct dyn_elf **rpnt,
+ 	/* Look for libraries wherever the shared library loader
+ 	 * was installed */
+ 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
+-	tpnt1 = search_for_named_library(libname, secure, _dl_ldsopath, rpnt, NULL);
++	tpnt1 = search_for_named_library(libname, resolve_flags, _dl_ldsopath, rpnt, NULL);
+ 	if (tpnt1 != NULL)
+ 		return tpnt1;
+ 
+ 	/* Lastly, search the standard list of paths for the library.
+ 	   This list must exactly match the list in uClibc/ldso/util/ldd.c */
+ 	_dl_if_debug_dprint("\tsearching full lib path list\n");
+-	tpnt1 = search_for_named_library(libname, secure,
++	tpnt1 = search_for_named_library(libname, resolve_flags,
+ 					UCLIBC_RUNTIME_PREFIX "lib:"
+ 					UCLIBC_RUNTIME_PREFIX "usr/lib"
+ #ifndef __LDSO_CACHE_SUPPORT__
+@@ -329,7 +329,7 @@ goof:
+  * are required.
+  */
+ 
+-struct elf_resolve *_dl_load_elf_shared_library(int secure,
++struct elf_resolve *_dl_load_elf_shared_library(int resolve_flags,
+ 	struct dyn_elf **rpnt, char *libname)
+ {
+ 	ElfW(Ehdr) *epnt;
+@@ -368,7 +368,7 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
+ 	}
+ 	/* If we are in secure mode (i.e. a setu/gid binary using LD_PRELOAD),
+ 	   we don't load the library if it isn't setuid. */
+-	if (secure) {
++	if (resolve_flags & DL_RESOLVE_SECURE) {
+ 		if (!(st.st_mode & S_ISUID)) {
+ 			_dl_close(infile);
+ 			return NULL;
+@@ -384,6 +384,10 @@ struct elf_resolve *_dl_load_elf_shared_library(int secure,
+ 			return tpnt;
+ 		}
+ 	}
++	if (resolve_flags & DL_RESOLVE_NOLOAD) {
++		_dl_close(infile);
++		return NULL;
++	}
+ 	header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ | PROT_WRITE,
+ 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
+ 	if (_dl_mmap_check_error(header)) {
+diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
+index 9423670..b71af34 100644
+--- a/ldso/ldso/ldso.c
++++ b/ldso/ldso/ldso.c
+@@ -646,7 +646,9 @@ void _dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
+ 			if (!_dl_secure || _dl_strchr(str, '/') == NULL) {
+ 				_dl_if_debug_dprint("\tfile='%s';  needed by '%s'\n", str, _dl_progname);
+ 
+-				tpnt1 = _dl_load_shared_library(_dl_secure, &rpnt, NULL, str, trace_loaded_objects);
++				tpnt1 = _dl_load_shared_library(
++					_dl_secure ? DL_RESOLVE_SECURE : 0,
++					&rpnt, NULL, str, trace_loaded_objects);
+ 				if (!tpnt1) {
+ #ifdef __LDSO_LDD_SUPPORT__
+ 					if (trace_loaded_objects)
+diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
+index 68cd579..edf38d2 100644
+--- a/ldso/libdl/libdl.c
++++ b/ldso/libdl/libdl.c
+@@ -288,7 +288,7 @@ void *dlopen(const char *libname, int flag)
+ #endif
+ 
+ 	/* A bit of sanity checking... */
+-	if (!(flag & (RTLD_LAZY|RTLD_NOW))) {
++	if (!(flag & (RTLD_LAZY|RTLD_NOW|RTLD_NOLOAD))) {
+ 		_dl_error_number = LD_BAD_HANDLE;
+ 		return NULL;
+ 	}
+@@ -358,8 +358,9 @@ void *dlopen(const char *libname, int flag)
+ 	/* Try to load the specified library */
+ 	_dl_if_debug_print("Trying to dlopen '%s', RTLD_GLOBAL:%d RTLD_NOW:%d\n",
+ 			(char*)libname, (flag & RTLD_GLOBAL ? 1:0), (now_flag & RTLD_NOW ? 1:0));
+-	tpnt = _dl_load_shared_library(0, &rpnt, tfrom, (char*)libname, 0);
+ 
++	tpnt = _dl_load_shared_library((flag & RTLD_NOLOAD) ? DL_RESOLVE_NOLOAD : 0,
++					&rpnt, tfrom, (char*)libname, 0);
+ 	if (tpnt == NULL) {
+ 		_dl_unmap_cache();
+ 		return NULL;
+diff --git a/libc/sysdeps/linux/common/bits/dlfcn.h b/libc/sysdeps/linux/common/bits/dlfcn.h
+index 4bfbbff..47b42ad 100644
+--- a/libc/sysdeps/linux/common/bits/dlfcn.h
++++ b/libc/sysdeps/linux/common/bits/dlfcn.h
+@@ -24,9 +24,9 @@
+ /* The MODE argument to `dlopen' contains one of the following: */
+ #define RTLD_LAZY	0x00001	/* Lazy function call binding.  */
+ #define RTLD_NOW	0x00002	/* Immediate function call binding.  */
+-#if 0 /* uClibc doesnt support these */
+-#define	RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
++#define RTLD_BINDING_MASK   0x3	/* Mask of binding time value.  */
+ #define RTLD_NOLOAD	0x00004	/* Do not load the object.  */
++#if 0 /* uClibc doesnt support these */
+ #define RTLD_DEEPBIND	0x00008	/* Use deep binding.  */
+ #endif
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index b8f58f0..6445243 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,7 +2,7 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
@@ -27,5 +27,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://append_UCLIBC_EXTRA_CFLAGS.patch \
 	file://compile-arm-fork-with-O2.patch \
 	file://epoll-asm-fix.patch \
+	file://orign_path.patch \
+	file://rtld_no.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.5.1



