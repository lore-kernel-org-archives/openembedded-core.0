Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 92F0D731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:58:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2016 01:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,266,1470726000"; d="scan'208";a="874005405"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 01 Sep 2016 01:58:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id BB6FD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 01:57:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 11:56:01 +0300
Message-Id: <1a8447e67fd570e46494d6110f60c42c9720f8d5.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 4/6] image.bbclass: put image_complete under sstate control
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
X-List-Received-Date: Thu, 01 Sep 2016 08:58:14 -0000

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
 meta/classes/image.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2e75e70..eb47f58 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -74,7 +74,7 @@ IMAGE_INSTALL[type] = "list"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
-DEPLOYDIR = "${DEPLOY_DIR_IMAGE}"
+DEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
@@ -251,7 +251,7 @@ fakeroot python do_rootfs () {
     progress_reporter.finish()
 }
 do_rootfs[dirs] = "${TOPDIR}"
-do_rootfs[cleandirs] += "${S}"
+do_rootfs[cleandirs] += "${S} ${DEPLOYDIR}"
 do_rootfs[umask] = "022"
 addtask rootfs before do_build
 
@@ -275,6 +275,11 @@ fakeroot python do_image_complete () {
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


