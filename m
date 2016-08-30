Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8900275EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 02:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1049075850"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2016 02:31:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id C1DA06A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:31:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:49 +0300
Message-Id: <2f719175c9cc0e70ba7154592c6df9c2cb450d3e.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 16/18] image: populate_sdk_base: skip sstate creation
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:21 -0000

Set SSTATE_SKIP_CREATION variable to '1' for image_complete and
populate_sdk tasks as we don't want to put images and sdk installer
into sstate due to their big size. We added these tasks under sstate
control only for two reasons:
 - to generate sstate manifest
 - to make final deployments

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass             | 1 +
 meta/classes/populate_sdk_base.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bbdfd8a..8e84b1b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -267,6 +267,7 @@ addtask do_image after do_rootfs before do_build
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_image_complete"
+SSTATE_SKIP_CREATION_task-image-complete = '1'
 
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c1dac39..1914a3b 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -28,6 +28,7 @@ SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_populate_sdk"
+SSTATE_SKIP_CREATION_task-populate-sdk = '1'
 
 B_task-populate-sdk = "${SDK_DIR}"
 
-- 
2.1.4


