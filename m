Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTwl-00053H-5d
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:44:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2013 09:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="300003063"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2013 09:24:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 17:24:25 +0100
Message-Id: <edbe33f45ad5f07beb7ffdc38bb95f424bb2ab3a.1368116511.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368116511.git.paul.eggleton@linux.intel.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368116511.git.paul.eggleton@linux.intel.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/image: show an error on invalid IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:44:28 -0000
X-List-Received-Date: Thu, 09 May 2013 16:44:28 -0000

If the user specifies an invalid feature in IMAGE_FEATURES, show an
error during parsing. Valid IMAGE_FEATURES are drawn from
PACKAGE_GROUP_ definitions, COMPLEMENTARY_GLOBS and a new 'validitems'
varflag on IMAGE_FEATURES (so that additional non-package group features
can be added elsewhere.)

Implements [YOCTO #3308].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 251bc9a..2b42e12 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -19,6 +19,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
@@ -62,6 +63,19 @@ IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
+def check_image_features(d):
+    valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems', True) or "").split()
+    valid_features += d.getVarFlags('COMPLEMENTARY_GLOB').keys()
+    for var in d:
+       if var.startswith("PACKAGE_GROUP_"):
+           valid_features.append(var[14:])
+    valid_features.sort()
+
+    features = set(oe.data.typed_value('IMAGE_FEATURES', d))
+    for feature in features:
+        if feature not in valid_features:
+            bb.fatal("'%s' in IMAGE_FEATURES is not a valid image feature. Valid features: %s" % (feature, ' '.join(valid_features)))
+
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
@@ -129,6 +143,8 @@ python () {
             vendor = localdata.getVar("TARGET_VENDOR_virtclass-multilib-" + eext[1], False)
             ml_vendor_list += " " + vendor
     d.setVar('MULTILIB_VENDORS', ml_vendor_list)
+
+    check_image_features(d)
 }
 
 #
-- 
1.8.1.2



