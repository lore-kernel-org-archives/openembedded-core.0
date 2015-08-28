Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 564EA76E02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550250965"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:50 +0300
Message-Id: <5d3ab942b2109c1d0d4dfec29cd4891db05330f9.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/8] upstream_tracking.inc: deprecate and move contents to recipes
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

No-update reasons and manual version checks should be in the recipes
themselves because otherwise they're prone to getting out of date.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/upstream_tracking.inc         | 18 ++----------------
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb    |  2 ++
 .../recipes-devtools/python/python-pygobject_2.28.3.bb |  3 +++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb                |  2 ++
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb       |  5 +++++
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb    |  2 ++
 .../ttf-fonts/liberation-fonts_1.04.bb                 |  2 ++
 meta/recipes-multimedia/tremor/tremor_20150107.bb      |  5 +++++
 meta/recipes-support/createrepo/createrepo_0.4.11.bb   |  2 ++
 meta/recipes-support/db/db_6.0.30.bb                   |  2 ++
 10 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/upstream_tracking.inc b/meta/conf/distro/include/upstream_tracking.inc
index 996d9e0..e2a5e6c 100644
--- a/meta/conf/distro/include/upstream_tracking.inc
+++ b/meta/conf/distro/include/upstream_tracking.inc
@@ -1,3 +1,5 @@
+# NOTE: THIS FILE IS DEPRECATED. Please add new entries to the recipes themselves.
+#
 # upstream_tracking.inc - This file contains data that tracks the
 # upstream project associated with a given recipe. This list is needed
 # for recipes that version information can not be automagically discovered.
@@ -20,19 +22,3 @@
 # the information in this file.  So for existing recipes that we can get 
 # from the Recipe reporting system, the entries here can be removed.
 #
-
-# SVN support isn't implemented
-# Also a new tarball release (or SVN tag) hasn't happened in a long time
-RECIPE_UPSTREAM_VERSION_pn-unfs3="0.9.22.r495"
-RECIPE_UPSTREAM_DATE_pn-unfs3="Feb 05, 2015"
-CHECK_DATE_pn-unfs3 = "Jun 10, 2015"
-
-# NO UPDATE REASONS
-RECIPE_NO_UPDATE_REASON_pn-base-passwd = "Version 3.5.38 requires cdebconf for update-passwd utility"
-RECIPE_NO_UPDATE_REASON_pn-chkconfig = "Version 1.5 requires selinux"
-RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
-RECIPE_NO_UPDATE_REASON_pn-jpeg = "webkit-gtk 1.8.3 doesn't work with jpeg 9"
-RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "2.x depends on fontforge package, which is not yet provided in oe-core"
-RECIPE_NO_UPDATE_REASON_pn-pkgconfig = "removes glib-conf, adds circular depends"
-RECIPE_NO_UPDATE_REASON_pn-python-pygobject = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
-RECIPE_NO_UPDATE_REASON_pn-webkit-gtk = ">= 1.10.2 needs ruby"
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index a8bd7c4..ac9bd81 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -4,6 +4,8 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
+RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
+
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.gz \
            file://add_shutdown.patch \
            file://nobash.patch \
diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index f4359bb..81d37b4 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Python GObject bindings"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
+
+RECIPE_NO_UPDATE_REASON = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native libffi glib-2.0"
 DEPENDS_class-native = "python-native libffi-native glib-2.0-native"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 1f4d9d2..1f9a4bd 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -5,6 +5,8 @@ verifying, querying, and updating software packages. Each software \
 package consists of an archive of files along with information about \
 the package like its version, a description, etc."
 
+RECIPE_NO_UPDATE_REASON = "5.4.15 has a package database issue: http://lists.openembedded.org/pipermail/openembedded-core/2015-August/109187.html"
+
 SUMMARY_${PN}-libs = "Libraries for manipulating RPM packages"
 DESCRIPTION_${PN}-libs = "This package contains the RPM shared libraries."
 
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
index f87b170..45cf545 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
@@ -3,6 +3,11 @@ SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
 
+# SVN support for upstream version check isn't implemented yet
+RECIPE_UPSTREAM_VERSION = "0.9.22.r495"
+RECIPE_UPSTREAM_DATE = "Feb 05, 2015"
+CHECK_DATE = "Jun 10, 2015"
+
 DEPENDS = "flex-native bison-native flex"
 DEPENDS_append_class-nativesdk += "flex-nativesdk"
 
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 8df87f8..488847a 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -4,6 +4,8 @@ information for system services.  Chkconfig manipulates the numerous \
 symbolic links in /etc/rc.d, to relieve system administrators of some \
 of the drudgery of manually editing the symbolic links."
 
+RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
+
 HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
 
 LICENSE = "GPLv2"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index 708f59e..bda82e7 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -5,6 +5,8 @@ Arial, Times New Roman, Courier New."
 HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
 BUGTRACKER = "https://bugzilla.redhat.com/"
 
+RECIPE_NO_UPDATE_REASON = "2.x depends on fontforge package, which is not yet provided in oe-core"
+
 SECTION = "x11/fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-multimedia/tremor/tremor_20150107.bb b/meta/recipes-multimedia/tremor/tremor_20150107.bb
index 6b1776f..937894a 100644
--- a/meta/recipes-multimedia/tremor/tremor_20150107.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20150107.bb
@@ -8,6 +8,11 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r1"
 
+# SVN support for upstream version check isn't implemented yet
+RECIPE_UPSTREAM_VERSION = "20150107"
+RECIPE_UPSTREAM_DATE = "Jan 07, 2015"
+CHECK_DATE = "Aug 12, 2015"
+
 SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index adc193e..d6fe436 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -1,6 +1,8 @@
 SUMMARY = "Creates metadata indexes for RPM package repositories"
 HOMEPAGE = "http://createrepo.baseurl.org/"
 
+RECIPE_NO_UPDATE_REASON = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 9eae5c7..d49df62 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -15,6 +15,8 @@ LICENSE = "AGPL-3.0"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
+RECIPE_NO_UPDATE_REASON = "Updating to 6.1.x requires also updating rpm to 5.4.15"
+
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://fix-parallel-build.patch \
-- 
2.1.4


