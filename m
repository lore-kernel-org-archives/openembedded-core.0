Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0A301731BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:47:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 08 Sep 2016 08:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; d="scan'208";a="1047394557"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2016 08:47:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0517B6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:46:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 18:46:54 +0300
Message-Id: <1473349614-5497-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
References: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] libical: fix build failure after changing machine
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
X-List-Received-Date: Thu, 08 Sep 2016 15:47:15 -0000

libical build QA fails when libical is built for e.g. qemux86-64 already, and
is then built for generic86-64 in a way that install is re-run:

$ MACHINE=qemux86-64 bitbake libical
$ MACHINE=genericx86-64 bitbake -f -Cinstall libical

ERROR: libical-2.0.0-r0 do_populate_sysroot: QA Issue: libical.pc failed
sanity test (tmpdir) in path

[YOCTO #10223]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...txt-libical.pc.in-fix-iculibs-remove-full.patch | 44 ++++++++++++++++++++++
 meta/recipes-support/libical/libical_2.0.0.bb      | 10 +----
 2 files changed, 46 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch

diff --git a/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch b/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
new file mode 100644
index 0000000..6db75f5
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
@@ -0,0 +1,44 @@
+From 1a41069c0dc054e59cd76fc3d8cf7cc2a78b5e8d Mon Sep 17 00:00:00 2001
+From: Allen Winter <allen.winter@kdab.com>
+Date: Sat, 3 Sep 2016 16:56:29 -0400
+Subject: [PATCH] CMakeLists.txt, libical.pc.in - fix iculibs (remove full path) ISSUE: 227
+
+Upstream-Status: Backport
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+----
+diff -Naur libical-2.0.0-orig/CMakeLists.txt libical-2.0.0/CMakeLists.txt
+--- libical-2.0.0-orig/CMakeLists.txt	2016-09-08 18:05:06.166049345 +0300
++++ libical-2.0.0/CMakeLists.txt	2016-09-08 18:05:45.201561334 +0300
+@@ -128,6 +128,7 @@
+ #  RSCALE info at http://tools.ietf.org/html/rfc7529
+ find_package(ICU)
+ if(ICU_FOUND)
++  set(ICUUC_LIBS "-licuuc") #for libical.pc
+   set(HAVE_LIBICU 1)
+   if(ICU_MAJOR_VERSION VERSION_GREATER 50)
+     set(HAVE_ICU_DANGI TRUE)
+@@ -137,6 +138,7 @@
+ endif()
+ if(ICU_I18N_FOUND)
+   set(HAVE_LIBICU_I18N 1)
++  set(ICUI18N_LIBS "-licui18n") #for libical.pc
+ endif()
+ 
+ # MSVC specific definitions
+diff -Naur libical-2.0.0-orig/libical.pc.in libical-2.0.0/libical.pc.in
+--- libical-2.0.0-orig/libical.pc.in	2015-12-28 23:44:53.000000000 +0200
++++ libical-2.0.0/libical.pc.in	2016-09-08 18:09:12.991963597 +0300
+@@ -3,10 +3,10 @@
+ libdir=@libdir@
+ includedir=@includedir@
+ threadslib=@PTHREAD_LIBS@
+-iculib=@ICU_LIBRARIES@ @ICU_I18N_LIBRARIES@
++iculibs=@ICUUC_LIBS@ @ICUI18N_LIBS@
+ 
+ Name: libical
+ Description: An implementation of basic iCAL protocols
+ Version: @VERSION@
+-Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib} ${iculib}
++Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib} ${iculibs}
+ Cflags: -I${includedir}
diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index 1042e6f..d4fe868 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -8,6 +8,7 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://Remove-cmake-check-for-Perl.patch \
+           file://0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch \
            "
 DEPENDS = "icu"
 
@@ -15,13 +16,6 @@ SRC_URI[md5sum] = "6bf8e5f5a3ba88baf390d0134e05d76e"
 SRC_URI[sha256sum] = "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf21456da"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
-inherit cmake
+inherit cmake pkgconfig
 
 FILES_${PN}-dev += "${libdir}/cmake/*"
-
-#
-# Turn specific library paths in the pkgconfig file into standard library entries
-#
-do_install_append () {
-	sed -i -e "s#${STAGING_LIBDIR}/lib\([a-z0-9]*\)\.so#-l\1#g" ${D}${libdir}/pkgconfig/libical.pc
-}
-- 
2.4.0


