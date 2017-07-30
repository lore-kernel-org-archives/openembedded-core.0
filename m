Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A641F77F90
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 10:53:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jul 2017 03:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,436,1496127600"; d="scan'208";a="117349854"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2017 03:53:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EBBA75803BE;
	Sun, 30 Jul 2017 03:53:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 13:30:56 +0300
Message-Id: <1501410656-29278-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] x86-base.inc: enable live image type
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
X-List-Received-Date: Sun, 30 Jul 2017 10:53:49 -0000

live image type was replaced by hddimg recently. This made
NOHDD and NOISO options ineffective as they only influence
live builds. It also causes image building failure for
image sizes >4Gb

Returned back live image type and disabled building iso image.
This doesn't change result (hddimg is built), but it makes
NOHDD and NOISO working as expected.

[YOCTO #11842]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/machine/include/x86-base.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index a29641a..bc0c27b 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -10,7 +10,8 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
-IMAGE_FSTYPES ?= "hddimg"
+IMAGE_FSTYPES ?= "live"
+NOISO ?= "1"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-- 
2.1.4


