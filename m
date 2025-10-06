Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7990CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 19:11:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.671.1759777864531831429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 12:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=bTxvrGRd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025100619110050926844bd000207ab-sw_jjr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025100619110050926844bd000207ab
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 21:11:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7bVAOyo+N+zo7GksLNCFxng8UKtHeOZxRKY+jMO73P8=;
 b=bTxvrGRdc5v77gAAnA7QUJ4I3Btf/KW8EqhCAKAJ6X7xNk7y2DEf3LltoAtup+1knJFORt
 dnbMtyff8wMqfMDYqAv3EXSjMPWb/SgDZIWpZqgA6+gDgLuRymk6QCNs0OJFHl685/mz9FA9
 kllyvn+mzhraiVVWvxdmGo0vGPDBP7kj6cpiTPF4F0jiwzoIrNSauDvUktvbyt0KuldclaMj
 YbxpUqa5I27RHTpP2yIRas6GgxiXOVD2Adasjcfx9QfOA+j1nTCLA88FKHgutdHgPk664+Mu
 /bCSJiTWBEeKhuo3Z8Ts4dvL5nF/sC0cUBViohaxUYOBQrjHUMke924A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] toolchain-scripts.bbclass: fix bitbake-setup compatibility
Date: Mon,  6 Oct 2025 21:10:55 +0200
Message-ID: <20251006191055.729066-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 19:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224501

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Pass the BITBAKEDIR parameter to oe-init-build-env when called from the
environment-setup script. This fixes compatibility with bitbake-setup,
which places bitbake in a different directory structure than the
standard poky repository layout where bitbake is located alongside
oe-init-build-env.

The issue was discovered when running the oe-selftest test
DevtoolIdeSdkTests.test_devtool_ide_sdk_shared_sysroots, which failed
because the environment-setup script was not able to find bitbake.

File ".../openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
  line 2955, in test_devtool_ide_sdk_shared_sysroots
  self.assertExists(cmake_native)
  ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
File ".../openembedded-core/meta/lib/oeqa/selftest/case.py", line 251,
  in assertExists
  raise self.failureException(msg)
AssertionError: 'Error: The bitbake directory (/tmp/devtoolqah9ndff2x/bitbake)
  does not exist!  Please ensure a copy of bitbake exists at this location or
  specify an alternative path on the command line\n
  .../build-st/tmp/sysroots/x86_64/usr/bin/cmake' does not exist

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5d28df845b..ec040b5ebb 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -87,11 +87,12 @@ toolchain_create_sdk_env_script () {
 # Caller must ensure CONFIG_SITE is setup
 toolchain_create_tree_env_script () {
 	script=${B}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
+	bitbakedir=$(readlink -f ${BITBAKEPATH}/..)
 	rm -f $script
 	touch $script
 	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
 	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
-	echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
+	echo "orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR} $bitbakedir; cd \$orig" >> $script
 	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
 	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
-- 
2.51.0


