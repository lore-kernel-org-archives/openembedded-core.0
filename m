Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B62C26F58D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311071"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:10 +0000
Message-Id: <ae4ad31103798e84d90eb552940c3ae47eaeb621.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] Rename PACKAGE_GROUP variable to FEATURE_PACKAGES
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:27 -0000

Since tasks were renamed to packagegroups some time ago, this variable
name implies that its usage is necessarily related to them which is not
the case. Rename the variable to more closely represent what it does
(whilst still providing backwards-compatibility with a warning for
PACKAGE_GROUP).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass | 26 +++++++++++++-------------
 meta/classes/image.bbclass      |  7 +++++--
 meta/lib/oe/packagegroup.py     | 25 ++++++++++++++++---------
 3 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 0958702..7475d7d 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -32,19 +32,19 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 #
-PACKAGE_GROUP_x11 = "packagegroup-core-x11"
-PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
-PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
-PACKAGE_GROUP_tools-debug = "packagegroup-core-tools-debug"
-PACKAGE_GROUP_eclipse-debug = "packagegroup-core-eclipse-debug"
-PACKAGE_GROUP_tools-profile = "packagegroup-core-tools-profile"
-PACKAGE_GROUP_tools-testapps = "packagegroup-core-tools-testapps"
-PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
-PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
-PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
-PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
-PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
-PACKAGE_GROUP_hwcodecs = "${MACHINE_HWCODECS}"
+FEATURE_PACKAGES_x11 = "packagegroup-core-x11"
+FEATURE_PACKAGES_x11-base = "packagegroup-core-x11-base"
+FEATURE_PACKAGES_x11-sato = "packagegroup-core-x11-sato"
+FEATURE_PACKAGES_tools-debug = "packagegroup-core-tools-debug"
+FEATURE_PACKAGES_eclipse-debug = "packagegroup-core-eclipse-debug"
+FEATURE_PACKAGES_tools-profile = "packagegroup-core-tools-profile"
+FEATURE_PACKAGES_tools-testapps = "packagegroup-core-tools-testapps"
+FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
+FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
+FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
+FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
+FEATURE_PACKAGES_qt4-pkgs = "packagegroup-core-qt-demoapps"
+FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 
 
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7529212..51d16d7 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -32,9 +32,9 @@ FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_v
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 
 # Define some very basic feature package groups
-PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
+FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
 SPLASH ?= "psplash"
-PACKAGE_GROUP_splash = "${SPLASH}"
+FEATURE_PACKAGES_splash = "${SPLASH}"
 
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
 
@@ -43,7 +43,10 @@ def check_image_features(d):
     valid_features += d.getVarFlags('COMPLEMENTARY_GLOB').keys()
     for var in d:
        if var.startswith("PACKAGE_GROUP_"):
+           bb.warn("PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead")
            valid_features.append(var[14:])
+       elif var.startswith("FEATURE_PACKAGES_"):
+           valid_features.append(var[17:])
     valid_features.sort()
 
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index b04c45a..12eb421 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -1,19 +1,26 @@
 import itertools
 
-def is_optional(group, d):
-    return bool(d.getVarFlag("PACKAGE_GROUP_%s" % group, "optional"))
+def is_optional(feature, d):
+    packages = d.getVar("FEATURE_PACKAGES_%s" % feature, True)
+    if packages:
+        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
+    else:
+        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional"))
 
-def packages(groups, d):
-    for group in groups:
-        for pkg in (d.getVar("PACKAGE_GROUP_%s" % group, True) or "").split():
+def packages(features, d):
+    for feature in features:
+        packages = d.getVar("FEATURE_PACKAGES_%s" % feature, True)
+        if not packages:
+            packages = d.getVar("PACKAGE_GROUP_%s" % feature, True)
+        for pkg in (packages or "").split():
             yield pkg
 
-def required_packages(groups, d):
-    req = filter(lambda group: not is_optional(group, d), groups)
+def required_packages(features, d):
+    req = filter(lambda feature: not is_optional(feature, d), features)
     return packages(req, d)
 
-def optional_packages(groups, d):
-    opt = filter(lambda group: is_optional(group, d), groups)
+def optional_packages(features, d):
+    opt = filter(lambda feature: is_optional(feature, d), features)
     return packages(opt, d)
 
 def active_packages(features, d):
-- 
1.8.5.3


