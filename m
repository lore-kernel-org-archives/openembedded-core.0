Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFB677D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490891271; x=1522427271;
	h=from:to:cc:subject:date:message-id;
	bh=LkZNnaNXXExrLMvHyf86dJ0fV4/p+PYI7+874SpnQAw=;
	b=Coyi7y1Sq1DBDN9hSvqppC1Bo+mKDmr/8+hSg5DFhUMCwmlRbJZSE/F2
	G1ef6iLLWcSbyZuZG7x9ma7jVXJhNQ==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 09:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; d="scan'208";a="949863984"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.113.228])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2017 09:27:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 30 Mar 2017 09:27:46 -0700
Message-Id: <1490891266-8602-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] i386 machine.cfg: Explicitly disable 64BIT
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
X-List-Received-Date: Thu, 30 Mar 2017 16:27:49 -0000

Since we do not set the 64 bit flags, newer kernels seem to build 64bit
config files by default. This is due to a hard-coded uname -m check that
selects the KBUILD_DEFCONFIG based on the host, not the cross target.

Similar to e9ec769926b2378e63380bd7762ce7ce201af151 in the yocto-kernel-cache repo

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../substrate/target/arch/i386/recipes-kernel/linux/files/machine.cfg  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine.cfg b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine.cfg
index 3b168b7..fe5b882 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine.cfg
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine.cfg
@@ -1,5 +1,8 @@
 # yocto-bsp-filename {{=machine}}.cfg
 CONFIG_X86_32=y
+# Must explicitly disable 64BIT
+# CONFIG_64BIT is not set
+
 CONFIG_MATOM=y
 CONFIG_PRINTK=y
 
-- 
2.7.4


