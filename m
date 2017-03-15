Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D3DD471998
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 19:21:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Mar 2017 12:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1108849228"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 12:21:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 12:21:16 -0700
Message-Id: <1489605676-14693-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] runqemu: independent network and rootfs setup
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
X-List-Received-Date: Wed, 15 Mar 2017 19:21:26 -0000

Presently, runqemu sets up rootfs as part of network setup.
In case there is no network desired we will end up without rootfs
as well.
This patch sets up network and rootfs independently.
It is also possible to bypass setup of rootfs if QB_ROOTFS is set to "none".

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/runqemu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c5fa88e..3e21724 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -935,6 +935,9 @@ class BaseConfig(object):
         else:
             self.setup_tap()
 
+    def setup_rootfs(self):
+        if self.get('QB_ROOTFS') == 'none':
+            return
         rootfs_format = self.fstype if self.fstype in ('vmdk', 'qcow2', 'vdi') else 'raw'
 
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
@@ -1167,6 +1170,7 @@ def main():
     config.print_config()
     try:
         config.setup_network()
+        config.setup_rootfs()
         config.setup_final()
         config.start_qemu()
     finally:
-- 
2.7.4


