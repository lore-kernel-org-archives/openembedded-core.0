Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1615C609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 22:43:41 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s63M0hsJ025076 for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 17:00:43 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014070317004346-806949 ;
	Thu, 3 Jul 2014 17:00:43 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 3 Jul 2014 17:00:26 -0500
Message-Id: <1404424826-12023-3-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1404424826-12023-1-git-send-email-rich.tollerton@ni.com>
References: <1404424826-12023-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 07/03/2014 05:00:43 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 07/03/2014 05:00:43 PM,
	Serialize complete at 07/03/2014 05:00:43 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-03_07:2014-07-03, 2014-07-03,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH 2/2] gcc: Ensure c++ includes are in /usr/include/c++/${BINV}
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
X-List-Received-Date: Thu, 03 Jul 2014 22:43:45 -0000

It was observed that code using STLport 4.6 fails to compile under the
SDK with the following error message:

.../includes/cstddef:38:46: fatal error: ../4.7.2/cstddef: No such file
or directory

STLport 4.6 (screwily) assumes that the C++ system headers live in a
gcc-versioned subdirectory, for gcc>=3.0; cf
http://sourceforge.net/p/stlport/code/ci/STLport-4.6-patch/tree/stlport/config/stl_gcc.h#l269.

This assumption is *almost always* valid, because that matches the
default setting of --with-gxx-include-dir. We can match that behavior by
appending "/${BINV}" to our own --with-gxx-include-dir settings.

Natinst-CAR-ID: 446449
Natinst-Reviewboard-ID: 57209
Acked-by: Ken Sharp <ken.sharp@ni.com>
Acked-by: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc            | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc          | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc        | 2 +-
 meta/recipes-devtools/gcc/gcc-target.inc         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 9f2928b..2816f13 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -115,7 +115,7 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = " \ 
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
                       --with-sysroot=${STAGING_DIR_TARGET} \ 
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 1a826ec..636b4db 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -9,7 +9,7 @@ GCCMULTILIB = "--enable-multilib"
 
 require gcc-configure-common.inc
 
-EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++ \
+EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++/${BINV} \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
                       --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 0bf29e3..cf3e5e8 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -21,7 +21,7 @@ EXTRA_OECONF += "--disable-libunwind-exceptions \
                  --with-system-zlib "
 
 EXTRA_OECONF_PATHS = " \
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 70f9e0e..974c80c 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -3,7 +3,7 @@ require gcc-configure-common.inc
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
 EXTRA_OECONF_PATHS = " \
-    --with-gxx-include-dir=${includedir}/c++/ \
+    --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index de906d6..59c554d 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -5,7 +5,7 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
-    --with-gxx-include-dir=${includedir}/c++/"
+    --with-gxx-include-dir=${includedir}/c++/${BINV}"
 
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 
-- 
2.0.1


