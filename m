Return-Path: <zhengjunling@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE64736B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 06:03:09 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLQ86207; Fri, 03 Apr 2015 14:03:07 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 3 Apr 2015 14:03:03 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>, <rep.dot.nop@gmail.com>
Date: Fri, 3 Apr 2015 05:59:59 +0000
Message-ID: <1428040799-5896-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
Subject: [PATCH v2] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Fri, 03 Apr 2015 06:03:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The orign_path.patch introduced '_dl_strchr' in ldso/ldso/dl-elf.c, and
caused the following undefined referencing compiling error:

  | .../libdl.a(libdl.os): In function `search_for_named_library':
  | .../dl-elf.c:156: undefined reference to `_dl_strchr'
  | collect2: error: ld returned 1 exit status

I found this problem when compiling gdb in static mode using uclibc.

So, add the definition of '_dl_strchr' to fix it. The '_dl_strstr' is
added as well.

And I regenerated a patch to replace the original one.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  2 +-
 ...ldso-limited-support-for-ORIGIN-in-rpath.patch} | 92 ++++++++++++++++------
 2 files changed, 69 insertions(+), 25 deletions(-)
 rename meta/recipes-core/uclibc/uclibc-git/{orign_path.patch => 0001-ldso-limited-support-for-ORIGIN-in-rpath.patch} (63%)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a2b2353..8308e60 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -15,7 +15,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
 	file://compile-arm-fork-with-O2.patch \
-	file://orign_path.patch \
+	file://0001-ldso-limited-support-for-ORIGIN-in-rpath.patch \
 	file://0001-atexit_old-Do-not-add-it-to-shared-libc.patch \
 	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch
similarity index 63%
rename from meta/recipes-core/uclibc/uclibc-git/orign_path.patch
rename to meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch
index 81bb8f8..7479ec3 100644
--- a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-ldso-limited-support-for-ORIGIN-in-rpath.patch
@@ -1,13 +1,56 @@
-Patch is backported from 
+From 32eaf738faafad2b16e1f3f5beb91736b3c27a3b Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Fri, 3 Apr 2015 05:02:27 +0000
+Subject: [PATCH] ldso: limited support for $ORIGIN in rpath
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Derived from:
 http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
 
-Upstream-Status: Pending
+However, the above patch introduced '_dl_strchr' in ldso/ldso/dl-elf.c,
+and caused the following undefined referencing compiling error:
+
+  | .../libdl.a(libdl.os): In function `search_for_named_library':
+  | .../dl-elf.c:156: undefined reference to `_dl_strchr'
+  | collect2: error: ld returned 1 exit status
+
+This problem would be reproduced through compiling gdb in static mode
+using uclibc.
+
+So, add the definition of '_dl_strchr' to fix it. The '_dl_strstr' is
+added as well.
 
-Index: git/ldso/ldso/dl-elf.c
-===================================================================
---- git.orig/ldso/ldso/dl-elf.c	2012-06-19 18:29:08.629931662 -0700
-+++ git/ldso/ldso/dl-elf.c	2012-06-19 21:21:14.798431393 -0700
-@@ -133,56 +133,60 @@
+Upstream-Status: Submitted
+
+Signed-off-by: Timo Teräs <timo.teras at iki.fi>
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+---
+ ldso/include/dl-string.h |  2 ++
+ ldso/ldso/dl-elf.c       | 79 +++++++++++++++++++++++++-----------------------
+ ldso/ldso/ldso.c         | 18 +++++++++--
+ 3 files changed, 59 insertions(+), 40 deletions(-)
+
+diff --git a/ldso/include/dl-string.h b/ldso/include/dl-string.h
+index aacad10..14ae617 100644
+--- a/ldso/include/dl-string.h
++++ b/ldso/include/dl-string.h
+@@ -204,7 +204,9 @@ static __always_inline char * _dl_get_last_path_component(char *path)
+ # define _dl_strcat strcat
+ # define _dl_strcpy strcpy
+ # define _dl_strcmp strcmp
++# define _dl_strchr strchr
+ # define _dl_strrchr strrchr
++# define _dl_strstr strstr
+ # define _dl_memcpy memcpy
+ # define _dl_memcmp memcmp
+ # define _dl_memset memset
+diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
+index 1b06bc1..b323c90 100644
+--- a/ldso/ldso/dl-elf.c
++++ b/ldso/ldso/dl-elf.c
+@@ -133,56 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
   * in uClibc/ldso/util/ldd.c */
  static struct elf_resolve *
  search_for_named_library(const char *name, unsigned rflags, const char *path_list,
@@ -16,9 +59,9 @@ Index: git/ldso/ldso/dl-elf.c
  {
 -	char *path, *path_n, *mylibname;
 +	char *mylibname;
++	const char *p, *pn;
  	struct elf_resolve *tpnt;
 -	int done;
-+	const char *p, *pn;
 +	int plen;
  
  	if (path_list==NULL)
@@ -100,7 +143,7 @@ Index: git/ldso/ldso/dl-elf.c
  	return NULL;
  }
  
-@@ -234,8 +238,10 @@
+@@ -234,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
@@ -108,11 +151,9 @@ Index: git/ldso/ldso/dl-elf.c
 +		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt,
 +						      tpnt->libname)) != NULL)
  			return tpnt1;
-+
  	}
  #endif
- 
-@@ -243,7 +249,7 @@
+@@ -243,7 +248,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
  	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
  	if (_dl_library_path) {
  		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
@@ -121,7 +162,7 @@ Index: git/ldso/ldso/dl-elf.c
  		{
  			return tpnt1;
  		}
-@@ -257,7 +263,7 @@
+@@ -257,7 +262,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
@@ -130,7 +171,7 @@ Index: git/ldso/ldso/dl-elf.c
  			return tpnt1;
  	}
  #endif
-@@ -291,7 +297,7 @@
+@@ -291,7 +296,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
  	/* Look for libraries wherever the shared library loader
  	 * was installed */
  	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
@@ -139,7 +180,7 @@ Index: git/ldso/ldso/dl-elf.c
  	if (tpnt1 != NULL)
  		return tpnt1;
  #endif
-@@ -304,7 +310,7 @@
+@@ -304,7 +309,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
  #ifndef __LDSO_CACHE_SUPPORT__
  					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
  #endif
@@ -148,14 +189,15 @@ Index: git/ldso/ldso/dl-elf.c
  	if (tpnt1 != NULL)
  		return tpnt1;
  
-Index: git/ldso/ldso/ldso.c
-===================================================================
---- git.orig/ldso/ldso/ldso.c	2012-06-19 18:29:08.633931663 -0700
-+++ git/ldso/ldso/ldso.c	2012-06-19 18:29:10.197931738 -0700
-@@ -403,6 +403,20 @@
+diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
+index 5619629..73bcc41 100644
+--- a/ldso/ldso/ldso.c
++++ b/ldso/ldso/ldso.c
+@@ -402,6 +402,20 @@ static ptrdiff_t _dl_build_local_scope (struct elf_resolve **list,
+ 				p += _dl_build_local_scope (p, q->tpnt);
  	return p - list;
  }
- 
++ 
 +static void _dl_setup_progname(const char *argv0)
 +{
 +	char image[PATH_MAX];
@@ -169,11 +211,10 @@ Index: git/ldso/ldso/ldso.c
 +		_dl_progname = argv0;
 +	}
 +}
-+
+ 
  void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
  			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
- 			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
-@@ -454,9 +468,7 @@
+@@ -454,9 +468,7 @@ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
  	 * been fixed up by now.  Still no function calls outside of this
  	 * library, since the dynamic resolver is not yet ready.
  	 */
@@ -184,3 +225,6 @@ Index: git/ldso/ldso/ldso.c
  
  #ifdef __DSBT__
  	_dl_ldso_dsbt = (void *)tpnt->dynamic_info[DT_DSBT_BASE_IDX];
+-- 
+1.8.3.4
+
-- 
1.8.3.4


