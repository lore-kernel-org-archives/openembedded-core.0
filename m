Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3606360053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 22:48:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 30 Jun 2015 15:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,381,1432623600"; d="scan'208";a="756126805"
Received: from ashussai-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.105.108])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2015 15:48:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 30 Jun 2015 15:48:02 -0700
Message-Id: <1435704482-14423-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH] core-image-kernel-dev: Define a correct subset of TEST_SUITES to run for this image
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
X-List-Received-Date: Tue, 30 Jun 2015 22:48:04 -0000

Since this is image can be built with both poky and poky-lsb, ensure the correct
tests are run in both cases, the auto detection does not quite work right in the
poky-lsb case since not all the Posix cmdline utilites are added. Add connman and
connman test for network sanity

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index e1aa71a..6b636ed 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -4,7 +4,7 @@ sensitive to kernel updates and version changes"
 # Could also be core-image-basic, but we'll keep this small for now
 require recipes-core/images/core-image-minimal.bb
 
-KERNEL_DEV_UTILS ?= "dropbear"
+KERNEL_DEV_UTILS ?= "dropbear connman"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
 KERNEL_DEV_MODULE ?= "kernel-modules"
 
@@ -15,3 +15,6 @@ CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
 
 # We need extra space for things like kernel builds, etc.
 IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
+
+# Let's define our own subset to test, we can later add a on-target kernel build even!
+DEFAULT_TEST_SUITES = "ping ssh df connman syslog scp date dmesg parselogs"
-- 
2.1.0


