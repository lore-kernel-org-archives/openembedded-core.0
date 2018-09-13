Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id DA68479861
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:25:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2018 00:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,368,1531810800"; d="scan'208";a="89618883"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.20])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2018 00:25:49 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 15:25:47 +0800
Message-Id: <20180913072547.12321-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Thu, 13 Sep 2018 07:25:50 -0000

Fixes warnings in builds using core2-32 tune:

warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.syscall [bit 11]
warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.lm [bit 29]

when executing postinsts using qemu-i386.

i386 target doesn't enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1]
while cpu choice of core2duo that we use for core2-32 TUNE does [2].
Use n270 cpu instead to use with qemu which supports SSSE3 and doesn't
have these bits enabled [3].

[1] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L739
[2] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1439
[3] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1603

Fixes [YOCTO #12916]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/tune-core2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index c686bb4682..ddde719bde 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
 BASE_LIB_tune-core2-32 = "lib"
 TUNE_PKGARCH_tune-core2-32 = "core2-32"
 PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686} core2-32"
-QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
+QEMU_EXTRAOPTIONS_core2-32 = " -cpu n270"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
-- 
2.17.1


