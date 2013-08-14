Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5B5761DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTJoV021920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:19 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:18 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:29:59 -0500
Message-ID: <1376512209-11622-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 01/11] image.bbclass: Add basic support for PACKAGE_EXCLUDE
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:19 -0000
Content-Type: text/plain

Add the foundation for the PACKAGE_EXCLUDE support.

As part of this work, it was noticed that the PACKAGE_INSTALL and
PACKAGE_INSTALL_ATTEMPTONLY were still using he 'normal' version for
dependencies.  This should no longer be necessary as of the change in the way
the complementary package groups (dev, dbg, ptest and others) are defined.
By making this change the dependency tree is more correct than before, and
gives the ability for manipulating PACKAGE_INSTALL and
PACKAGE_INSTALL_ATTEMPTONLY, while adjusting the dependencies at the same
time.

Warning messages will be generated if the user is trying to exclude a
package that was previously in the PACKAGE_INSTALL or
PACKAGE_INSTALL_ATTEMPTONLY variables.

(See additional commits for package manager specific support.)

Add documentation on PACKAGE_EXCLUDE and related variables.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass   | 39 +++++++++++++++++++++++++++------------
 meta/conf/documentation.conf |  6 ++++++
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4aae3a7..fb6fcef 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -11,8 +11,8 @@ inherit gzipnative
 LICENSE = "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
-RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
+RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
+RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -28,16 +28,6 @@ ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-manageme
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 
-# packages to install from features, excluding dev/dbg/doc/ptest
-NORMAL_FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(normal_groups(d), d))}"
-NORMAL_FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(normal_groups(d), d))}"
-
-def normal_groups(d):
-    """Return all the IMAGE_FEATURES, with the exception of our special package groups"""
-    extras = set(d.getVarFlags('COMPLEMENTARY_GLOB').keys())
-    features = set(oe.data.typed_value('IMAGE_FEATURES', d))
-    return features.difference(extras)
-
 # Define some very basic feature package groups
 SPLASH ?= "psplash"
 PACKAGE_GROUP_splash = "${SPLASH}"
@@ -265,6 +255,31 @@ read_only_rootfs_hook () {
 	fi
 }
 
+PACKAGE_EXCLUDE ??= ""
+PACKAGE_EXCLUDE[type] = "list"
+
+python rootfs_process_ignore() {
+    excl_pkgs = d.getVar("PACKAGE_EXCLUDE", True).split()
+    inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
+    inst_attempt_pkgs = d.getVar("PACKAGE_INSTALL_ATTEMPTONLY", True).split()
+
+    d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
+    d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' '.join(inst_attempt_pkgs))
+
+    for pkg in excl_pkgs:
+        if pkg in inst_pkgs:
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN', True), inst_pkgs))
+            inst_pkgs.remove(pkg)
+
+        if pkg in inst_attempt_pkgs:
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVar('PN', True), inst_pkgs))
+            inst_attempt_pkgs.remove(pkg)
+
+    d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
+    d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", ' '.join(inst_attempt_pkgs))
+}
+do_rootfs[prefuncs] += "rootfs_process_ignore"
+
 # We have to delay the runtime_mapping_rename until just before rootfs runs
 # otherwise, the multilib renaming could step in and squash any fixups that
 # may have occurred.
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 2c4b8af..b930611 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -114,6 +114,12 @@ SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the
 IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
 FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy dir as an adhoc feed (bogofeed). Set to base URL of the dir as exported by HTTP. Set of adhoc feed configs will be generated in image."
 
+IMAGE_INSTALL[doc] = "Used by an image recipe to list the packages to be installed.  See PACKAGE_INSTALL."
+
+PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation, if required an error will be generated."
+PACKAGE_INSTALL[doc] = "Generally not user defined.  List of the packages to be installed into the image, uses IMAGE_INSTALL as part of the list."
+PACKAGE_INSTALL_ATTEMPTONLY[doc] = "Generally not user defined.  List of packages that will be attempted to be installed, but no error will generate if any of them fail to install."
+
 # palmtop build class
 PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to yes, if you want to build qt apps with CONFIG+=thread"
 
-- 
1.8.1.2.545.g2f19ada


