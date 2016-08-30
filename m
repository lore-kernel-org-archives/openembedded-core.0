Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 741BB731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2016 02:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1022174751"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2016 02:31:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 5EF7C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:45 +0300
Message-Id: <2d1d350737272a75238bd15c0fcad40059ef9e32.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/18] image.bbclass: put image_complete under sstate control
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:17 -0000

Adding image_complete task should make sstate machinery
to generate manifest for deployed images and do final
deployment to DEPLOY_DIR_IMAGE.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ea3792a7..3bfc328 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -264,6 +264,9 @@ do_image[dirs] = "${TOPDIR}"
 do_image[umask] = "022"
 addtask do_image after do_rootfs before do_build
 
+DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
+SSTATETASKS += "do_image_complete"
+
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
 
@@ -273,6 +276,8 @@ fakeroot python do_image_complete () {
 }
 do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
+do_image_complete[sstate-inputdirs] = "${DEPLOYDIR}"
+do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 addtask do_image_complete after do_image before do_build
 
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
-- 
2.1.4


