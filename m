Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 20D4D76FFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 17:52:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2016 10:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023818339"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 10:52:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 20:50:54 +0300
Message-Id: <20160901175054.2857-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] mips: disable QEMU usermode usage when building with n32 ABI
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
X-List-Received-Date: Thu, 01 Sep 2016 17:52:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 89d17e7..d3e83d1 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -20,6 +20,9 @@ TUNECONFLICTS[n32] = "o32 n64"
 ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'n32', '' ,d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
 
+# user mode qemu doesn't support mips64 n32: "Invalid ELF image for this architecture"
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
+
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n64', ' -mabi=64', '', d)}"
-- 
2.9.3


