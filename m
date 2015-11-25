Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAD9365D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAPKiXWi030691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:44:33 -0800
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 12:44:32 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 14:44:28 -0600
Message-ID: <1448484269-132667-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
References: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python: Fix cross compiling x86->x86
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
X-List-Received-Date: Wed, 25 Nov 2015 20:44:33 -0000
Content-Type: text/plain

If the target and host have the same type, the system may try to execute the
instructions from the target version.  This can lead to illegal instructions
as well as the wrong copy of the code running.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 23 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch

diff --git a/meta/recipes-devtools/python/python/use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
new file mode 100644
index 0000000..3c44cc0
--- /dev/null
+++ b/meta/recipes-devtools/python/python/use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -0,0 +1,23 @@
+configure.ac: use CROSSPYTHONPATH instead of a static list
+
+When building x86->x86 the system will try to execute .so and related items
+from the default PYTHONPATH.  This will fail if the target CPU contains
+instructions that the host CPU does not have.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: Python-2.7.9/configure.ac
+===================================================================
+--- Python-2.7.9.orig/configure.ac
++++ Python-2.7.9/configure.ac
+@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
+ 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
+ 	fi
+         AC_MSG_RESULT($interp)
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
+     fi
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index f7e2f27..183f715 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
+  file://use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -38,6 +39,7 @@ CONFIGUREOPTS += " --with-system-ffi "
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
 # The following is a hack until we drop ac_cv_sizeof_off_t from site files
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
@@ -101,7 +103,6 @@ do_install() {
 	# install can race with the build so we have to run this first, then install
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
@@ -110,7 +111,6 @@ do_install() {
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-- 
1.9.3


