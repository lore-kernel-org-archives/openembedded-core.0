Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgr1-00066G-SR
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:56 +0200
Received: by ggnp4 with SMTP id p4so6251995ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZLWJZMgVtYBhhIMzubUIrtMozozVqrQhEp6OM2Mkmek=;
	b=f680e5fRdtGv2p8GFLR/Coy0taruVHh4qi+1BfBP1i0ywkb6YTn57WrIc+PCWAKZdu
	O/qRZFRKCfkxq/4Cp4J4GZBKZTyi0rSrzRN5Jn7fEezQ05T0+V+vZA72Fk9yRuaaOb/Q
	UEQwJmoAalUol0OKam+2qZK2bYR09N3ZYBIBh0Bshn9KoBmcdddZQLQ2JKaQOiuhm+wj
	CahNpgsvnmVCvM8ACMqvtNIoCXmls6p3BbLkm04kIS6Q4L4QDZ+ZDoD1th6zG+k1i3aF
	eibmMegFpo9S4+6xW6cNUsAJH5h8TreWzLb91vvA6TyMKU/7cXZOaVD0VsYZMfBGhiEk
	c3vg==
Received: by 10.66.89.228 with SMTP id br4mr5326503pab.6.1343142326840;
	Tue, 24 Jul 2012 08:05:26 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sh3sm12332139pbc.16.2012.07.24.08.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:05:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:04:24 -0700
Message-Id: <13fa496f4e8866bb247f9ddb6afa7b64d67fc5a7.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
References: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:56 -0000

poky-tiny disables certain eglibc options which gives good excercise
for eglibc's componentized builds. This patch essentially updates the
GLRO patch to account for additions of GLRO(dl_debug_mask) and
converts them to GLRO_dl_debug_mask

Secondly adds a new patch where it was creating a undefined alias
because we were using INTUSE macro which got exposed when we
disable OPTION_POSIX_WIDE_CHAR_DEVICE_IO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |   48 ++++++++++++++------
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
1.7.9.5



