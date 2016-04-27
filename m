Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BDB7F60249
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:44:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2016 05:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="693113580"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2016 05:44:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 15:44:48 +0300
Message-Id: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] arch-powerpc64.inc: disable the use of qemu usermode on ppc64
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
X-List-Received-Date: Wed, 27 Apr 2016 12:44:26 -0000

It simply does not work at all:
https://lists.yoctoproject.org/pipermail/yocto/2016-April/029698.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 49419b6..f751c6b 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -7,6 +7,9 @@ TUNECONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
 TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
 
+# user mode qemu doesn't support ppc64
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
+
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
-- 
2.8.0.rc3


