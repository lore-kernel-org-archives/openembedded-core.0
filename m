Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0Ek-0006o1-88
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:54:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2012 15:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134590360"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 15:44:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Thu, 19 Apr 2012 15:44:20 -0700
Message-Id: <ad439be70f90f60d12d905c8c6546d373448ca6a.1334875218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
Subject: [PATCH 06/10] quilt: move empty quiltrc to native
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
X-List-Received-Date: Thu, 19 Apr 2012 22:54:02 -0000

The package.bbclass uses the native sysroot /usr/bin/quiltrc as an empty quiltrc
to ensure that the user quiltrc does not affect our patching scheme. This ensures
the correct file is in the correct sysroot.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/quilt/quilt-0.51.inc       |    5 -----
 meta/recipes-devtools/quilt/quilt-native.inc     |    6 ++++++
 meta/recipes-devtools/quilt/quilt-native_0.51.bb |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb        |    2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

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
index 7efea02..8a03a5d 100644
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ b/meta/recipes-devtools/quilt/quilt-native.inc
@@ -11,3 +11,9 @@ EXTRA_OECONF = "--disable-nls"
 do_configure () {
 	oe_runconf
 }
+
+do_install_append () {
+	# Dummy quiltrc file for patch.bbclass
+	install -d ${D}${bindir}/
+	touch ${D}${bindir}/quiltrc
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



