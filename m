Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuU-0002zm-Hi
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125510"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:21 -0700
Message-Id: <aec4cdc6efda430a0965d6b3b4f84c7943390273.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 10/32] quilt: move empty quiltrc to native sysconfdir
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
X-List-Received-Date: Thu, 24 May 2012 21:49:31 -0000

From: Saul Wold <sgw@linux.intel.com>

patch.bbclass orignally pointed at /usr/bin/quiltrc for an empty
version to ensure that no user setting were picked up, change this
to /etc/quiltrc in the Native sysroot since we now have a native
sysconfdir.

Make sure that the quiltrc is actually installed in the Native
sysconfdir, not the target, so fix this after the recipe split.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/patch.bbclass                       |    2 +-
 meta/recipes-devtools/quilt/quilt-0.51.inc       |    5 -----
 meta/recipes-devtools/quilt/quilt-native.inc     |    6 ++++++
 meta/recipes-devtools/quilt/quilt-native_0.51.bb |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb        |    2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 31db9e3..3c4d997 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -1,7 +1,7 @@
 # Copyright (C) 2006  OpenedHand LTD
 
 # Point to an empty file so any user's custom settings don't break things
-QUILTRCFILE ?= "${STAGING_BINDIR_NATIVE}/quiltrc"
+QUILTRCFILE ?= "${STAGING_ETCDIR_NATIVE}/quiltrc"
 
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
diff --git a/meta/recipes-devtools/quilt/quilt-0.51.inc b/meta/recipes-devtools/quilt/quilt-0.51.inc
index e89013a..824e624 100644
--- a/meta/recipes-devtools/quilt/quilt-0.51.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.51.inc
@@ -24,11 +24,6 @@ RDEPENDS_${PN} = "bash"
 # quilt ignores DESTDIR
 do_install () {
 	oe_runmake 'BUILD_ROOT=${D}' install
-	if [ "${BUILD_ARCH}" == "${HOST_ARCH}" ]; then
-		# Dummy quiltrc file for patch.bbclass
-		install -d ${D}${bindir}/
-		touch ${D}${bindir}/quiltrc
-	fi
 	# cleanup unpackaged files
 	rm -rf ${D}/${datadir}/emacs
 }
diff --git a/meta/recipes-devtools/quilt/quilt-native.inc b/meta/recipes-devtools/quilt/quilt-native.inc
index 7efea02..9345d88 100644
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ b/meta/recipes-devtools/quilt/quilt-native.inc
@@ -11,3 +11,9 @@ EXTRA_OECONF = "--disable-nls"
 do_configure () {
 	oe_runconf
 }
+
+do_install_append () {
+	# Dummy quiltrc file for patch.bbclass
+	install -d ${D}${sysconfdir}/
+	touch ${D}${sysconfdir}/quiltrc
+}
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.51.bb b/meta/recipes-devtools/quilt/quilt-native_0.51.bb
index b99b9b6..1494bf2 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.51.bb
@@ -1,4 +1,4 @@
 require quilt-${PV}.inc
 require quilt-native.inc
 
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
index bc62161..6865cd8 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.51.bb
@@ -4,4 +4,4 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r2"
+PR = "r3"
-- 
1.7.9.5



