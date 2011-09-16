Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R4Nno-0002O7-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:05:16 +0200
Received: by mail-iy0-f175.google.com with SMTP id x2so1971809iad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 19:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WfwZKSL5CYjRvxhbsoEUCZNXxYwZSxFnFhuJMOs5RBE=;
	b=PcecvZFHzAaor8jh4yT/Mve3gSRxSWS0qz643l2UWukceSdHcuZMgrDwT5OiKn6Js1
	zTa4jLmCqk825Av9UZc/fdmxWo0R6JKEeRuChSyx3BbXZHh++mEvMUS/jBueheqQQ3Hm
	o+Unrm1LupM8GCm8CcBBKX/t3Xd8myNaQNTRQ=
Received: by 10.231.65.72 with SMTP id h8mr3033495ibi.47.1316138406283;
	Thu, 15 Sep 2011 19:00:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id r2sm7188837ibq.7.2011.09.15.19.00.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 19:00:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 18:59:54 -0700
Message-Id: <393b811fe4a37004738abc4c4088af552999cdaf.1316138063.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
References: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
In-Reply-To: <cover.1316138063.git.raj.khem@gmail.com>
References: <cover.1316138063.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] gcc-4.6: Use --with-linker-hash-style configure option
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
X-List-Received-Date: Fri, 16 Sep 2011 02:05:16 -0000

Depending upon what hash style is in use this uses
the right flag for setting the hash style type. This
fixes the QA errors about missing GNU hash style reported
in gcc-runtime build particularly libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 +-
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 ++++++++++++++++++++
 2 files changed, 199 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index f7bcf30..20cd323 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r10"
+PR = "r11"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -68,6 +68,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
            file://use-defaults.h-and-t-oe-in-B.patch \
 	   file://powerpc-e5500.patch \
            file://fix-for-ice-50099.patch \
+	   file://gcc-with-linker-hash-style.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
@@ -90,6 +91,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--disable-bootstrap \
 			--disable-libgomp \
 			--disable-libmudflap \
+			--with-linker-hash-style=${LINKER_HASH_STYLE} \
 			--enable-cheaders=c_global "
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
new file mode 100644
index 0000000..4fa3cbe
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
@@ -0,0 +1,196 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+commit 3cb9bbfa927aa187048534f9069202c017a78e38
+Author: ppluzhnikov <ppluzhnikov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date:   Wed May 11 18:28:14 2011 +0000
+
+    2011-05-11  Satoru Takabayashi  <satorux@google.com>
+    	    Paul Pluzhnikov  <ppluzhnikov@google.com>
+    
+    	* gcc/doc/install.texi (Configuration): Document
+    	--with-linker-hash-style.
+    	* gcc/gcc.c (init_spec): Handle LINKER_HASH_STYLE.
+    	* gcc/config.in: Add LINKER_HASH_STYLE.
+    	* gcc/configure.ac: Add --with-linker-hash-style.
+    	* gcc/configure: Regenerate.
+    
+    
+    
+    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@173668 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Index: gcc-4_6-branch/gcc/config.in
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config.in	2011-09-09 08:26:10.000000000 -0700
++++ gcc-4_6-branch/gcc/config.in	2011-09-09 08:27:14.142981164 -0700
+@@ -1583,6 +1583,12 @@
+ #endif
+ 
+ 
++/* The linker hash style */
++#ifndef USED_FOR_TARGET
++#undef LINKER_HASH_STYLE
++#endif
++
++
+ /* Define to the name of the LTO plugin DSO that must be passed to the
+    linker's -plugin=LIB option. */
+ #ifndef USED_FOR_TARGET
+Index: gcc-4_6-branch/gcc/configure
+===================================================================
+--- gcc-4_6-branch.orig/gcc/configure	2011-09-09 08:26:15.000000000 -0700
++++ gcc-4_6-branch/gcc/configure	2011-09-09 08:27:42.793023181 -0700
+@@ -915,6 +915,7 @@
+ enable_poison_system_directories
+ enable_plugin
+ enable_libquadmath_support
++with_linker_hash_style
+ '
+       ac_precious_vars='build_alias
+ host_alias
+@@ -1667,6 +1668,8 @@
+                           with the compiler
+   --with-system-zlib      use installed libz
+   --with-slibdir=DIR      shared libraries in DIR [LIBDIR]
++  --with-linker-hash-style={sysv,gnu,both}
++                          specify the linker hash style
+ 
+ Some influential environment variables:
+   CC          C compiler command
+@@ -17511,7 +17514,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17514 "configure"
++#line 17517 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17617,7 +17620,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17620 "configure"
++#line 17623 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -26434,6 +26437,36 @@
+ fi
+ 
+ 
++# Specify what hash style to use by default.
++
++# Check whether --with-linker-hash-style was given.
++if test "${with_linker_hash_style+set}" = set; then :
++  withval=$with_linker_hash_style; case x"$withval" in
++   xsysv)
++     LINKER_HASH_STYLE=sysv
++     ;;
++   xgnu)
++     LINKER_HASH_STYLE=gnu
++     ;;
++   xboth)
++     LINKER_HASH_STYLE=both
++     ;;
++   *)
++     as_fn_error "$withval is an invalid option to --with-linker-hash-style" "$LINENO" 5
++     ;;
++ esac
++else
++  LINKER_HASH_STYLE=''
++fi
++
++if test x"${LINKER_HASH_STYLE}" != x; then
++
++cat >>confdefs.h <<_ACEOF
++#define LINKER_HASH_STYLE "$LINKER_HASH_STYLE"
++_ACEOF
++
++fi
++
+ # Configure the subdirectories
+ # AC_CONFIG_SUBDIRS($subdirs)
+ 
+Index: gcc-4_6-branch/gcc/configure.ac
+===================================================================
+--- gcc-4_6-branch.orig/gcc/configure.ac	2011-09-09 08:26:15.000000000 -0700
++++ gcc-4_6-branch/gcc/configure.ac	2011-09-09 08:27:14.162981193 -0700
+@@ -4907,6 +4907,30 @@
+ fi
+ 
+ 
++# Specify what hash style to use by default.
++AC_ARG_WITH([linker-hash-style],
++[AC_HELP_STRING([--with-linker-hash-style={sysv,gnu,both}],
++                [specify the linker hash style])],
++[case x"$withval" in
++   xsysv)
++     LINKER_HASH_STYLE=sysv
++     ;;
++   xgnu)
++     LINKER_HASH_STYLE=gnu
++     ;;
++   xboth)
++     LINKER_HASH_STYLE=both
++     ;;
++   *)
++     AC_MSG_ERROR([$withval is an invalid option to --with-linker-hash-style])
++     ;;
++ esac],
++[LINKER_HASH_STYLE=''])
++if test x"${LINKER_HASH_STYLE}" != x; then
++  AC_DEFINE_UNQUOTED(LINKER_HASH_STYLE, "$LINKER_HASH_STYLE",
++                                         [The linker hash style])
++fi
++
+ # Configure the subdirectories
+ # AC_CONFIG_SUBDIRS($subdirs)
+ 
+Index: gcc-4_6-branch/gcc/doc/install.texi
+===================================================================
+--- gcc-4_6-branch.orig/gcc/doc/install.texi	2011-06-24 08:13:00.000000000 -0700
++++ gcc-4_6-branch/gcc/doc/install.texi	2011-09-09 08:27:14.172981215 -0700
+@@ -1665,6 +1665,11 @@
+ support @option{--build-id} option, a warning is issued and the
+ @option{--enable-linker-build-id} option is ignored.  The default is off.
+ 
++@item --with-linker-hash-style=@var{choice}
++Tells GCC to pass @option{--hash-style=@var{choice}} option to the
++linker for all final links. @var{choice} can be one of
++@samp{sysv}, @samp{gnu}, and @samp{both} where @samp{sysv} is the default.
++
+ @item --enable-gnu-unique-object
+ @itemx --disable-gnu-unique-object
+ Tells GCC to use the gnu_unique_object relocation for C++ template
+Index: gcc-4_6-branch/gcc/gcc.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/gcc.c	2011-09-09 08:26:14.000000000 -0700
++++ gcc-4_6-branch/gcc/gcc.c	2011-09-09 08:27:14.172981215 -0700
+@@ -1427,7 +1427,8 @@
+   }
+ #endif
+ 
+-#if defined LINK_EH_SPEC || defined LINK_BUILDID_SPEC
++#if defined LINK_EH_SPEC || defined LINK_BUILDID_SPEC || \
++    defined LINKER_HASH_STYLE
+ # ifdef LINK_BUILDID_SPEC
+   /* Prepend LINK_BUILDID_SPEC to whatever link_spec we had before.  */
+   obstack_grow (&obstack, LINK_BUILDID_SPEC, sizeof(LINK_BUILDID_SPEC) - 1);
+@@ -1436,6 +1437,16 @@
+   /* Prepend LINK_EH_SPEC to whatever link_spec we had before.  */
+   obstack_grow (&obstack, LINK_EH_SPEC, sizeof(LINK_EH_SPEC) - 1);
+ # endif
++# ifdef LINKER_HASH_STYLE
++  /* Prepend --hash-style=LINKER_HASH_STYLE to whatever link_spec we had
++     before.  */
++  {
++    static const char hash_style[] = "--hash-style=";
++    obstack_grow (&obstack, hash_style, sizeof(hash_style) - 1);
++    obstack_grow (&obstack, LINKER_HASH_STYLE, sizeof(LINKER_HASH_STYLE) - 1);
++    obstack_1grow (&obstack, ' ');
++  }
++# endif
+   obstack_grow0 (&obstack, link_spec, strlen (link_spec));
+   link_spec = XOBFINISH (&obstack, const char *);
+ #endif
-- 
1.7.5.4



