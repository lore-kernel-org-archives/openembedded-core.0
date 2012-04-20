Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7C-0005g2-24
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167922"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:29 -0700
Message-Id: <64ccaa20d275b54963973f68f53a31b4f6e044c4.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 38/43] quilt: move empty quiltrc to native sysconfdir
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:22 -0000

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
1.7.7.6



