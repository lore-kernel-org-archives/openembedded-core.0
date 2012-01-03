Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004fO-VY
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752281"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:12 -0800
Message-Id: <eeca337a3cca4712bf0c43b499f2e55d4e084c9a.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 086/113] libomxil: upgrade to 0.9.3
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:41 -0000

From: Shane Wang <shane.wang@intel.com>

This patch is to upgrade libomxil from 0.3.3 to 0.9.3.
The following is the licence change:

2c2
<   @file src/omxcore.h
---
>   src/omxcore.h
4c4
<   OpenMax Integration Layer Core. This library implements the OpenMAX core
---
>   OpenMAX Integration Layer Core. This library implements the OpenMAX core
7c7,8
<   Copyright (C) 2007  STMicroelectronics and Nokia
---
>   Copyright (C) 2007-2009 STMicroelectronics
>   Copyright (C) 2007-2009 Nokia Corporation and/or its subsidiary(-ies).
24,26d24
<   $Date: 2007-05-22 16:48:41 +0200 (Tue, 22 May 2007) $
<   Revision $Rev: 239 $
<   Author $Author: gsent $
34d31
<
36d32

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../libomxil/libomxil-0.9.3/configure-fix.patch    |   58 ++++++++++++++++++++
 .../libomxil-0.9.3/makefile-docdir-fix.patch       |   19 +++++++
 .../libomxil/libomxil-0.9.3/parallel-make.patch    |   18 ++++++
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |   23 --------
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |   33 +++++++++++
 5 files changed, 128 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
new file mode 100644
index 0000000..876e80e
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
@@ -0,0 +1,58 @@
+To enable --disable-Werror for libomxil to avoid some compilers which check code strictly.
+
+For example, at least the following errors happened to some compilers:
+
+1) OMX_INDEXTYPE in include/OMX_Index.h IS NOT OMX_INDEXVENDORTYPE in src/base/omx_base_component.h
+| i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/yocto-build5/poky/build/tmp/sysroots/qemux86 -DHAVE_Climinate-unused-debug-types -Wall -Werror -DCONFIG_DEBUG_LEVEL=0 -c OMXComponentRMExt.c  -fPIC -DPIC -o .libs/libomxbase_la-OMXComponentRMExt.o
+| omx_base_component.c: In function 'omx_base_component_GetParameter':
+| omx_base_component.c:991:3: error: case value '2130706435' not in enumerated type 'OMX_INDEXTYPE' [-Werror=switch]
+| omx_base_component.c:918:3: error: case value '2130706436' not in enumerated type 'OMX_INDEXTYPE' [-Werror=switch]
+
+2)
+| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/home/yocto-build5/poky/build/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I..    -DOMXILCOMPOminate-unused-debug-types -Wall -Werror -DCONFIG_DEBUG_LEVEL=0 -c -o omxregister_bellagio-omxregister.o `test -f 'omxregister.c' || echo './'`o
+| omxregister.c: In function 'buildComponentsList':
+| omxregister.c:175:7: error: variable 'err' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+diff -r 82d742d3ea90 configure.ac
+--- a/configure.ac	Tue Dec 27 15:30:35 2011 +0800
++++ b/configure.ac	Tue Dec 27 16:26:03 2011 +0800
+@@ -5,7 +5,7 @@
+ AC_PREREQ([2.59])
+ 
+ AC_CONFIG_HEADERS([config.h])
+-CFLAGS="${CFLAGS} -Wall -Werror"
++CFLAGS="${CFLAGS} -Wall"
+ 
+ ################################################################################
+ # Set the shared versioning info, according to section 6.3 of the libtool info #
+@@ -122,6 +122,14 @@
+     [with_android=$enableval],
+     [with_android=no])
+ 
++AC_ARG_ENABLE(
++    [Werror],
++    [AC_HELP_STRING(
++        [--disable-Werror],
++        [whether to diable treating gcc warnings as errors])],
++    [with_Werror=$enableval],
++    [with_Werror=yes])
++
+ ################################################################################
+ # Check for programs                                                           #
+ ################################################################################
+@@ -193,6 +201,10 @@
+  CFG_DEBUG_LEVEL=255
+ fi
+ 
++if test "x$with_Werror" = "xyes"; then
++ CFLAGS="${CFLAGS} -Werror"
++fi
++
+ AC_SUBST(CFG_DEBUG_LEVEL)
+ CFLAGS="${CFLAGS} -DCONFIG_DEBUG_LEVEL=$CFG_DEBUG_LEVEL"
+ 
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
new file mode 100644
index 0000000..dbe8c41
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
@@ -0,0 +1,19 @@
+This patch is to remove DESTDIR in docdir.
+Otherwise, when users install by running `make install DESTDIR=/alternate/directory' specified in the file INSTALL, the doc will go into /alternate/directory/alternate/directory, which is not expected.
+
+Upstream-Status: Pending
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+diff -r 30b597e4e70d Makefile.am
+--- a/Makefile.am	Wed Dec 28 15:38:35 2011 +0800
++++ b/Makefile.am	Wed Dec 28 15:39:25 2011 +0800
+@@ -7,7 +7,7 @@
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libomxil-bellagio.pc
+ 
+-docdir = $(DESTDIR)$(prefix)/share/doc/@PACKAGE@
++docdir = $(prefix)/share/doc/@PACKAGE@
+ doc_DATA = README \
+ 	   ChangeLog \
+ 	   TODO
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
new file mode 100644
index 0000000..483ca13
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
@@ -0,0 +1,18 @@
+This patch is to make libomxil Makefile support "make -jN".
+The omxregister_bellagio stuffs depend on libomxil_bellagio library.
+
+Upstream-Status: Pending
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+diff -r f59d077d3dd5 Makefile.am
+--- a/src/Makefile.am	Wed Dec 28 10:54:36 2011 +0800
++++ b/src/Makefile.am	Wed Dec 28 10:55:46 2011 +0800
+@@ -7,6 +7,7 @@
+ omxregister_bellagio_SOURCES = omxregister.c common.c common.h
+ omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
+ 			      -I$(top_srcdir)/include
++omxregister_bellagio_LDADD = $(lib_LTLIBRARIES)
+ omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
+ 
+ lib_LTLIBRARIES = libomxil-bellagio.la
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
deleted file mode 100644
index da3ddde..0000000
--- a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Bellagio OpenMAX Integration Layer"
-HOMEPAGE = "http://omxil.sourceforge.net/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
-                    file://src/omxcore.h;beginline=1;endline=27;md5=c2e37f68ba9652ca9b2431f466944174"
-DEPENDS = "libvorbis libogg alsa-lib libmad"
-
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-B-${PV}.tar.gz"
-
-S = "${WORKDIR}/${BPN}-B-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF += "--disable-ffmpegcomponents"
-
-FILES_${PN} += "${libdir}/omxilcomponents/*${SOLIBS} \
-                ${datadir}/libomxil-B"
-FILES_${PN}-staticdev += "${libdir}/omxilcomponents/*.a"
-FILES_${PN}-dev += "${libdir}/omxilcomponents/*.la \
-                    ${libdir}/omxilcomponents/*${SOLIBSDEV}"
-FILES_${PN}-dbg += "${libdir}/omxilcomponents/.debug/"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
new file mode 100644
index 0000000..bb31c56
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Bellagio OpenMAX Integration Layer"
+HOMEPAGE = "http://omxil.sourceforge.net/"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
+                    file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
+DEPENDS = "libvorbis libogg alsa-lib libmad"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
+           file://configure-fix.patch \
+           file://parallel-make.patch \
+           file://makefile-docdir-fix.patch"
+
+SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
+SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
+
+S = "${WORKDIR}/${BPN}-bellagio-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF += "--disable-ffmpegcomponents --disable-Werror"
+
+FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
+                ${libdir}/omxloaders/*${SOLIBS}"
+FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
+                          ${libdir}/omxloaders/*.a"
+FILES_${PN}-dev += "${libdir}/bellagio/*.la \
+                    ${libdir}/bellagio/*${SOLIBSDEV} \
+                    ${libdir}/omxloaders/*.la \
+                    ${libdir}/omxloaders/*${SOLIBSDEV}"
+FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
+                    ${libdir}/omxloaders/.debug/"
-- 
1.7.6.4



