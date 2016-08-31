Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6FF07325A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:04:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 31 Aug 2016 04:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="1043860041"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2016 04:04:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 2EFAE6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 04:03:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 14:02:53 +0300
Message-Id: <829b645fd0d58fcc102552cf1071ca102091dfb2.1472641071.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 4/6] image.bbclass: put image_complete under sstate control
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
X-List-Received-Date: Wed, 31 Aug 2016 11:04:16 -0000

Adding image_complete task should make sstate machinery
to generate manifest for deployed images and do final
deployment to DEPLOY_DIR_IMAGE.

Made sure DEPLOYDIR doesn't contain images from past deployments
to prevent them to be included into sstate manifests.

Set stamp-extra-info flag for do_image_complete task. This flag
is used in the name of sstate manifest. Setting it to predetermined
value for image_complete should help to get correct manifest
filenames when processing runQueueTask events.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2e75e70..9b6c739 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -74,7 +74,7 @@ IMAGE_INSTALL[type] = "list"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
-DEPLOYDIR = "${DEPLOY_DIR_IMAGE}"
+DEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
@@ -264,6 +264,7 @@ fakeroot python do_image () {
 }
 do_image[dirs] = "${TOPDIR}"
 do_image[umask] = "022"
+do_image[cleandirs] = "${DEPLOYDIR}"
 addtask do_image after do_rootfs before do_build
 
 fakeroot python do_image_complete () {
@@ -275,6 +276,11 @@ fakeroot python do_image_complete () {
 }
 do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
+SSTATETASKS += "do_image_complete"
+SSTATE_SKIP_CREATION_task-image-complete = '1'
+do_image_complete[sstate-inputdirs] = "${DEPLOYDIR}"
+do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_image_complete[stamp-extra-info] = "${MACHINE}"
 addtask do_image_complete after do_image before do_build
 
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
-- 
2.1.4


