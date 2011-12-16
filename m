Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbgSV-0002U2-3J
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:40:55 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so1565894iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xF1qGPIiQ4vMYjxLBRAvw0FWIxgHmFpGK62k8ur+WjQ=;
	b=HVME77Bg6KcKNbWblEfaP9gKdnFHic2ccWCX1ICHe3U+e+ghidHcc9gQXQf6mC2Og8
	MRicZ/QYdzg5AhPtB51u6bQMsRmwhXf11aE2WUUh6ePS+rJVCEwQgZCQfDHJCXkUqPri
	tdWfbpOT02HbY/lc0QPgDjxecAhrRRJ2WKP+4=
Received: by 10.50.160.134 with SMTP id xk6mr10991919igb.59.1324074837542;
	Fri, 16 Dec 2011 14:33:57 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e2sm37152455ibe.0.2011.12.16.14.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 14:33:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:33:38 -0800
Message-Id: <ba562cb8461b23e9bdc8c9606e8ac39404e7a2d3.1324074518.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <afc34eae803b41745a8731bd29c93bb4558ba87d.1324074518.git.raj.khem@gmail.com>
References: <afc34eae803b41745a8731bd29c93bb4558ba87d.1324074518.git.raj.khem@gmail.com>
In-Reply-To: <cover.1324074518.git.raj.khem@gmail.com>
References: <cover.1324074518.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] eglibc: Fixes for running regression tests
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
X-List-Received-Date: Fri, 16 Dec 2011 22:40:55 -0000

Override cxx-sysincludes along with CC and CXX
since it contains path pointing to tcbootstrap
sysroot which does not have c++ headers and libraries

Drop shorten-build-commands patch since it
did not override the include flags for c++ headers
when tests written in c++ are executed the @includes file
does not get updated to add c++ header paths
This patch only reduced the build output anyway

Add a patch to point eglibc to look into c++
headers the way OE installs them its not standard
install e.g. usr/include/c++/GCC_VER but instead
usr/include/c++. This lets g++ find the headers
in right place when compiling c++ testcases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc-2.13/shorten-build-commands.patch       |   82 --------------------
 .../eglibc-2.13/use-sysroot-cxx-headers.patch      |   36 +++++++++
 .../eglibc-2.14/shorten-build-commands.patch       |   82 --------------------
 .../eglibc-2.14/use-sysroot-cxx-headers.patch      |   36 +++++++++
 meta/recipes-core/eglibc/eglibc-testing.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    4 +-
 7 files changed, 77 insertions(+), 171 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
deleted file mode 100644
index 080568d..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-
-Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
-
-This patch scratches an itch.  Each individual gcc command in the
-glibc build is over 1K, which means it takes up a good chunk of my
-terminal.  Most of that is include paths.  Any version of GCC new
-enough to build glibc supports response files, which were added in
-2005.  So use a response file for the static list of include paths.
-Now the build commands are a lot shorter, and easier to use when
-developing glibc.
-
-Tested on x86_64-linux-gnu.  Please apply if acceptable.
-
--- 
-Daniel Jacobowitz
-CodeSourcery
-
-2010-03-30  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	* Makeconfig (+common-includes): Define.
-	(+includes): Use @$(common-objpfx)includes.
-	* Makefile (postclean): Remove includes and includes.mk.
-	* Makerules ($(common-objpfx)includes.mk): Include and create
-	includes.mk.  Create includes.
-
-Upstream-Status: Pending
-
-Index: libc/Makeconfig
-===================================================================
---- libc.orig/Makeconfig	2009-10-13 22:55:12.000000000 -0700
-+++ libc/Makeconfig	2010-03-31 16:02:37.120489733 -0700
-@@ -678,9 +678,10 @@ endif	# $(+cflags) == ""
- # library source directory, in the include directory, and in the
- # current directory.
- +sysdep-includes = $(addprefix -I,$(+sysdep_dirs))
-++common-includes = $(+sysdep-includes) $(includes) $(sysincludes)
- +includes = -I$(..)include $(if $(subdir),$(objpfx:%/=-I%)) \
--	    $(+sysdep-includes) $(includes) \
--	    $(patsubst %/,-I%,$(..)) $(libio-include) -I. $(sysincludes)
-+	    @$(common-objpfx)includes \
-+	    $(patsubst %/,-I%,$(..)) $(libio-include) -I.
- 
- # Since libio has several internal header files, we use a -I instead
- # of many little headers in the include directory.
-Index: libc/Makefile
-===================================================================
---- libc.orig/Makefile	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makefile	2010-03-31 16:02:37.132481508 -0700
-@@ -247,7 +247,7 @@ parent-mostlyclean: common-mostlyclean #
- parent-clean: parent-mostlyclean common-clean
- 
- postclean = $(addprefix $(common-objpfx),$(postclean-generated)) \
--	    $(addprefix $(objpfx),sysd-dirs sysd-rules) \
-+	    $(addprefix $(objpfx),sysd-dirs sysd-rules includes includes.mk) \
- 	    $(addprefix $(objpfx),sysd-sorted soversions.mk soversions.i)
- 
- clean: parent-clean
-Index: libc/Makerules
-===================================================================
---- libc.orig/Makerules	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makerules	2010-03-31 16:02:37.140481645 -0700
-@@ -254,6 +254,20 @@ ifndef sysd-rules-done
- no_deps=t
- endif
- 
-+-include $(common-objpfx)includes.mk
-+ifneq ($(+common-includes),$(saved-includes))
-+# Recreate includes.mk (and includes).
-+includes-force = FORCE
-+FORCE:
-+endif
-+$(common-objpfx)includes.mk: $(includes-force)
-+	-@rm -f $@T $(common-objpfx)includesT
-+	for inc in $(+common-includes); do echo "$$inc"; done \
-+	  > $(common-objpfx)includesT
-+	mv -f $(common-objpfx)includesT $(common-objpfx)includes
-+	echo 'saved-includes := $(+common-includes)' > $@T
-+	mv -f $@T $@
-+
- define o-iterator-doit
- $(objpfx)%$o: %.S $(before-compile); $$(compile-command.S)
- endef
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch b/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
new file mode 100644
index 0000000..c06eebf
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
@@ -0,0 +1,36 @@
+build system of glibc currently adds the cxx headers path by detecting
+it using provided CXX and expects that they are installed w.r.t to standard
+installation location but in OE we install and use cxx headers from target
+sysroot therefore that code needs to be adapted for OE
+
+Upstream-Status: Inappropriate [OE-specific]
+
+-Khem
+
+
+--- a/configure.in
++++ b/configure.in
+@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
+   SYSINCLUDES="$SYSINCLUDES \
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+-    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD` &&
+     cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD` &&
+-    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
++    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
+     CXX_SYSINCLUDES="-isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
+   fi
+--- a/configure
++++ b/configure
+@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
+   SYSINCLUDES="$SYSINCLUDES \
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+-    cxxversion=`$CXX -dumpversion 2>&5` &&
+     cxxmachine=`$CXX -dumpmachine 2>&5` &&
+-    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
++    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
+     CXX_SYSINCLUDES="-isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
+   fi
diff --git a/meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
deleted file mode 100644
index 080568d..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-
-Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
-
-This patch scratches an itch.  Each individual gcc command in the
-glibc build is over 1K, which means it takes up a good chunk of my
-terminal.  Most of that is include paths.  Any version of GCC new
-enough to build glibc supports response files, which were added in
-2005.  So use a response file for the static list of include paths.
-Now the build commands are a lot shorter, and easier to use when
-developing glibc.
-
-Tested on x86_64-linux-gnu.  Please apply if acceptable.
-
--- 
-Daniel Jacobowitz
-CodeSourcery
-
-2010-03-30  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	* Makeconfig (+common-includes): Define.
-	(+includes): Use @$(common-objpfx)includes.
-	* Makefile (postclean): Remove includes and includes.mk.
-	* Makerules ($(common-objpfx)includes.mk): Include and create
-	includes.mk.  Create includes.
-
-Upstream-Status: Pending
-
-Index: libc/Makeconfig
-===================================================================
---- libc.orig/Makeconfig	2009-10-13 22:55:12.000000000 -0700
-+++ libc/Makeconfig	2010-03-31 16:02:37.120489733 -0700
-@@ -678,9 +678,10 @@ endif	# $(+cflags) == ""
- # library source directory, in the include directory, and in the
- # current directory.
- +sysdep-includes = $(addprefix -I,$(+sysdep_dirs))
-++common-includes = $(+sysdep-includes) $(includes) $(sysincludes)
- +includes = -I$(..)include $(if $(subdir),$(objpfx:%/=-I%)) \
--	    $(+sysdep-includes) $(includes) \
--	    $(patsubst %/,-I%,$(..)) $(libio-include) -I. $(sysincludes)
-+	    @$(common-objpfx)includes \
-+	    $(patsubst %/,-I%,$(..)) $(libio-include) -I.
- 
- # Since libio has several internal header files, we use a -I instead
- # of many little headers in the include directory.
-Index: libc/Makefile
-===================================================================
---- libc.orig/Makefile	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makefile	2010-03-31 16:02:37.132481508 -0700
-@@ -247,7 +247,7 @@ parent-mostlyclean: common-mostlyclean #
- parent-clean: parent-mostlyclean common-clean
- 
- postclean = $(addprefix $(common-objpfx),$(postclean-generated)) \
--	    $(addprefix $(objpfx),sysd-dirs sysd-rules) \
-+	    $(addprefix $(objpfx),sysd-dirs sysd-rules includes includes.mk) \
- 	    $(addprefix $(objpfx),sysd-sorted soversions.mk soversions.i)
- 
- clean: parent-clean
-Index: libc/Makerules
-===================================================================
---- libc.orig/Makerules	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makerules	2010-03-31 16:02:37.140481645 -0700
-@@ -254,6 +254,20 @@ ifndef sysd-rules-done
- no_deps=t
- endif
- 
-+-include $(common-objpfx)includes.mk
-+ifneq ($(+common-includes),$(saved-includes))
-+# Recreate includes.mk (and includes).
-+includes-force = FORCE
-+FORCE:
-+endif
-+$(common-objpfx)includes.mk: $(includes-force)
-+	-@rm -f $@T $(common-objpfx)includesT
-+	for inc in $(+common-includes); do echo "$$inc"; done \
-+	  > $(common-objpfx)includesT
-+	mv -f $(common-objpfx)includesT $(common-objpfx)includes
-+	echo 'saved-includes := $(+common-includes)' > $@T
-+	mv -f $@T $@
-+
- define o-iterator-doit
- $(objpfx)%$o: %.S $(before-compile); $$(compile-command.S)
- endef
diff --git a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch b/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch
new file mode 100644
index 0000000..c06eebf
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch
@@ -0,0 +1,36 @@
+build system of glibc currently adds the cxx headers path by detecting
+it using provided CXX and expects that they are installed w.r.t to standard
+installation location but in OE we install and use cxx headers from target
+sysroot therefore that code needs to be adapted for OE
+
+Upstream-Status: Inappropriate [OE-specific]
+
+-Khem
+
+
+--- a/configure.in
++++ b/configure.in
+@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
+   SYSINCLUDES="$SYSINCLUDES \
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+-    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD` &&
+     cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD` &&
+-    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
++    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
+     CXX_SYSINCLUDES="-isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
+   fi
+--- a/configure
++++ b/configure
+@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
+   SYSINCLUDES="$SYSINCLUDES \
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+-    cxxversion=`$CXX -dumpversion 2>&5` &&
+     cxxmachine=`$CXX -dumpmachine 2>&5` &&
+-    cxxheaders=`$CXX -print-file-name=../../../../include/c++/`"$cxxversion" &&
++    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++" &&
+     CXX_SYSINCLUDES="-isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
+   fi
diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
index 2cd7c6a..c30409f 100644
--- a/meta/recipes-core/eglibc/eglibc-testing.inc
+++ b/meta/recipes-core/eglibc/eglibc-testing.inc
@@ -66,10 +66,8 @@ fi
 	echo "# we test using cross compiler from real sysroot therefore override the" > ${B}/configparms
 	echo "# definitions that come from ${B}/config.make" >> ${B}/configparms
 
-	echo "CC = ${CC}" >> ${B}/configparms
-	echo "CXX = ${CXX}" >> ${B}/configparms
+	fgrep tcbootstrap ${B}/config.make > ${B}/configparms
 	sed -i -e "s/\-tcbootstrap//g" ${B}/configparms
-
 wrapper="${S}/scripts/cross-test-ssh.sh \$target"
 localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
 make tests-clean
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 9d3ec85..8555985 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,14 +3,13 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r19"
+PR = "r20"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
-           file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
            file://stack-protector-test.patch \
            file://armv4-eabi-compile-fix.patch \
@@ -18,6 +17,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://generate-supported.mk \
            file://ppc-sqrt.patch \
            file://multilib_readlib.patch \
+           file://use-sysroot-cxx-headers.patch \
 	   "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
index 8553106..ad2161e 100644
--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
@@ -3,14 +3,13 @@ require eglibc.inc
 SRCREV = "15870"
 
 DEPENDS += "gperf-native"
-PR = "r2"
+PR = "r3"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_14"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
-           file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
            file://stack-protector-test.patch \
            file://armv4-eabi-compile-fix.patch \
@@ -20,6 +19,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://multilib_readlib.patch \
            file://eglibc-rpc-export-again.patch \
            file://glibc-2.14-libdl-crash.patch \
+           file://use-sysroot-cxx-headers.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.5.4



