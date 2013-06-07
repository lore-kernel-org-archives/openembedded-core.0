Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CA4D56A88D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 16:35:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2013 09:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,823,1363158000"; d="scan'208";a="252034844"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.224])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jun 2013 09:35:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 17:35:18 +0100
Message-Id: <1370622918-26073-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/buildhistory: split SDK data by IMAGE_NAME
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
X-List-Received-Date: Fri, 07 Jun 2013 16:35:42 -0000

Data from SDKs produced from different images or different
meta-toolchain style recipes should go into separate directories,
since SDK_NAME doesn't include anything to differentiate these by
default (only pieces for the distro name and architectures).

Note you should delete or move existing data under the buildhistory/sdk/
directory manually after this change.

Fixes [YOCTO #4622].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b12da4a..450eb7c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -11,7 +11,7 @@ BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
-BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}"
+BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
-- 
1.8.1.2


