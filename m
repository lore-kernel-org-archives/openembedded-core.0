Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3U-00065C-QD
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625125"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:44 -0700
Message-Id: <8e793bb4092c80baf441a33f348852bfbd4a4420.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/28] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:21 -0000

From: Matthew McClintock <msm@freescale.com>

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image.bbclass  |    3 ++-
 meta/conf/local.conf.sample |    6 ++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 05f4331..a2770a4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -111,7 +111,8 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-inherit image_types
+IMAGE_CLASSES ?= "image_types"
+inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 73ab9f8..aa546c7 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -141,6 +141,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
 USER_CLASSES ?= "image-mklibs image-prelink"
 
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images
+# currently an example class is image_types_uboot
+# IMAGE_CLASSES = " image_types_uboot"
+
 #
 # Runtime testing of images
 #
-- 
1.7.6.4



