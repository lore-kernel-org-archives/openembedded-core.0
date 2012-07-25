Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3l-0004Xn-Dz
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897592"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:16 -0700
Message-Id: <bdc0fcc6a237f1df8f10f6861e6a4aab9c0eaa77.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/28] eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:08 -0000

From: Khem Raj <raj.khem@gmail.com>

poky-tiny disables certain eglibc options which gives good excercise
for eglibc's componentized builds. This patch essentially updates the
GLRO patch to account for additions of GLRO(dl_debug_mask) and
converts them to GLRO_dl_debug_mask

Secondly adds a new patch where it was creating a undefined alias
because we were using INTUSE macro which got exposed when we
disable OPTION_POSIX_WIDE_CHAR_DEVICE_IO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |   48 ++++++++++++++-----
 .../eglibc-2.16/fileops-without-wchar-io.patch     |   22 +++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 3 files changed, 59 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch b/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
index b899562..99cd812 100644
--- a/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
@@ -6,9 +6,9 @@ Singed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 Index: libc/elf/dl-open.c
 ===================================================================
---- libc.orig/elf/dl-open.c	2012-03-09 08:54:34.691443995 -0800
-+++ libc/elf/dl-open.c	2012-03-09 08:55:31.275446730 -0800
-@@ -154,7 +154,7 @@
+--- libc.orig/elf/dl-open.c	2012-07-04 18:26:34.000000000 -0700
++++ libc/elf/dl-open.c	2012-07-23 22:55:10.700072511 -0700
+@@ -153,7 +153,7 @@
  	  ns->_ns_main_searchlist->r_list[new_nlist++] = map;
  
  	  /* We modify the global scope.  Report this.  */
@@ -17,7 +17,7 @@ Index: libc/elf/dl-open.c
  	    _dl_debug_printf ("\nadd %s [%lu] to global scope\n",
  			      map->l_name, map->l_ns);
  	}
-@@ -294,7 +294,7 @@
+@@ -293,7 +293,7 @@
    _dl_debug_state ();
  
    /* Print scope information.  */
@@ -26,7 +26,7 @@ Index: libc/elf/dl-open.c
      _dl_show_scope (new, 0);
  
    /* Only do lazy relocation if `LD_BIND_NOW' is not set.  */
-@@ -438,7 +438,7 @@
+@@ -501,7 +501,7 @@
  	}
  
        /* Print scope information.  */
@@ -37,9 +37,9 @@ Index: libc/elf/dl-open.c
  
 Index: libc/ports/sysdeps/mips/dl-lookup.c
 ===================================================================
---- libc.orig/ports/sysdeps/mips/dl-lookup.c	2012-03-09 08:54:34.707443996 -0800
-+++ libc/ports/sysdeps/mips/dl-lookup.c	2012-03-09 09:02:36.903467324 -0800
-@@ -111,7 +111,7 @@
+--- libc.orig/ports/sysdeps/mips/dl-lookup.c	2012-07-04 18:25:46.000000000 -0700
++++ libc/ports/sysdeps/mips/dl-lookup.c	2012-07-24 00:04:45.496274559 -0700
+@@ -110,7 +110,7 @@
  	continue;
  
        /* Print some debugging info if wanted.  */
@@ -48,7 +48,7 @@ Index: libc/ports/sysdeps/mips/dl-lookup.c
  	_dl_debug_printf ("symbol=%s;  lookup in file=%s [%lu]\n",
  			  undef_name,
  			  map->l_name[0] ? map->l_name : rtld_progname,
-@@ -432,7 +432,7 @@
+@@ -431,7 +431,7 @@
  		     hash table.  */
  		  if (__builtin_expect (tab->size, 0))
  		    {
@@ -57,7 +57,7 @@ Index: libc/ports/sysdeps/mips/dl-lookup.c
  		      __rtld_lock_unlock_recursive (tab->lock);
  		      goto success;
  		    }
-@@ -681,7 +681,7 @@
+@@ -680,7 +680,7 @@
  	}
  
        /* Display information if we are debugging.  */
@@ -66,6 +66,15 @@ Index: libc/ports/sysdeps/mips/dl-lookup.c
  	_dl_debug_printf ("\
  \nfile=%s [%lu];  needed by %s [%lu] (relocation dependency)\n\n",
  			  map->l_name[0] ? map->l_name : rtld_progname,
+@@ -787,7 +787,7 @@
+     {
+       if ((*ref == NULL || ELFW(ST_BIND) ((*ref)->st_info) != STB_WEAK)
+ 	  && skip_map == NULL
+-	  && !(GLRO(dl_debug_mask) & DL_DEBUG_UNUSED))
++	  && !(GLRO_dl_debug_mask & DL_DEBUG_UNUSED))
+ 	{
+ 	  /* We could find no value for a strong reference.  */
+ 	  const char *reference_name = undef_map ? undef_map->l_name : "";
 @@ -860,7 +860,7 @@
    if (__builtin_expect (current_value.m->l_used == 0, 0))
      current_value.m->l_used = 1;
@@ -95,9 +104,9 @@ Index: libc/ports/sysdeps/mips/dl-lookup.c
        struct sym_val val = { NULL, NULL };
 Index: libc/elf/rtld.c
 ===================================================================
---- libc.orig/elf/rtld.c	2012-03-09 09:01:35.159464344 -0800
-+++ libc/elf/rtld.c	2012-03-09 09:01:56.247465364 -0800
-@@ -2198,7 +2198,7 @@
+--- libc.orig/elf/rtld.c	2012-07-04 18:26:34.000000000 -0700
++++ libc/elf/rtld.c	2012-07-23 22:55:10.700072511 -0700
+@@ -2214,7 +2214,7 @@
    GLRO(dl_init_all_dirs) = GL(dl_all_dirs);
  
    /* Print scope information.  */
@@ -106,3 +115,16 @@ Index: libc/elf/rtld.c
      {
        _dl_debug_printf ("\nInitial object scopes\n");
  
+Index: libc/elf/dl-lookup.c
+===================================================================
+--- libc.orig/elf/dl-lookup.c	2012-07-04 18:26:35.000000000 -0700
++++ libc/elf/dl-lookup.c	2012-07-24 00:04:14.680273070 -0700
+@@ -770,7 +770,7 @@
+     {
+       if ((*ref == NULL || ELFW(ST_BIND) ((*ref)->st_info) != STB_WEAK)
+ 	  && skip_map == NULL
+-	  && !(GLRO(dl_debug_mask) & DL_DEBUG_UNUSED))
++	  && !(GLRO_dl_debug_mask & DL_DEBUG_UNUSED))
+ 	{
+ 	  /* We could find no value for a strong reference.  */
+ 	  const char *reference_name = undef_map ? undef_map->l_name : "";
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch b/meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch
new file mode 100644
index 0000000..2ca0bca
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch
@@ -0,0 +1,22 @@
+Fix error like
+
+/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/work/mips64-oe-linux/eglibc-2.16-r2+svnr19383/build-mips64-oe-linux/libc_pic.os: In function `_IO_new_file_fopen':
+/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/work/mips64-oe-linux/eglibc-2.16-r2+svnr19383/eglibc-2_16/libc/libio/fileops.c:431: undefined reference to `_IO_file_close_it_internal'
+collect2: error: ld returned 1 exit status
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: libc/libio/fileops.c
+===================================================================
+--- libc.orig/libio/fileops.c	2012-07-04 18:25:47.000000000 -0700
++++ libc/libio/fileops.c	2012-07-24 00:21:17.220322557 -0700
+@@ -428,7 +428,7 @@
+ 	  result->_mode = 1;
+ #else
+           /* Treat this as if we couldn't find the given character set.  */
+-          (void) INTUSE(_IO_file_close_it) (fp);
++          (void) _IO_file_close_it (fp);
+           __set_errno (EINVAL);
+           return NULL;
+ #endif
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index fc3d82b..8fa5451 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r2"
+PR = "r3"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -23,6 +23,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://ppc_slow_ieee754_sqrt.patch \
            file://rpc-bootstrap.patch \
            file://e500-math_private.patch \
+           file://fileops-without-wchar-io.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.7.6



