Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC9E67680D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24GBR028058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:13 -0700
Message-ID: <500f789ce6811f73a2ee887a047fb5b41baff7f4.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] populate_sdk_base.bbclass: fix SDKTARGETSYSROOT when populate mlprefix SDK
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:17 -0000
Content-Type: text/plain

Fixed when populate multlib sdk:
$ bitbake lib32-core-image-minimal -cpopulate_sdk

When extract sdk, there was a sysroots/core2-64-pokymllib32-linux, but the
SDKTARGETSYSROOT path in environment-setup-x86-pokymllib32-linux was
sysroots/core2-64-poky-linux, so it was incorrect, install sysroot to
sysroots/core2-64-poky-linux would fix the problem since:
1) We install both 32 and 64 bit toolchains
2) The meta-environment is a nativesdk recipe which doesn't have
   multilib extend, so we can't or hard to fix from meta-environment.

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass          |    1 +
 meta/classes/populate_sdk_base.bbclass |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 465e208..fd54b69 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -28,6 +28,7 @@ python multilib_virtclass_handler () {
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
         target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
         if target_vendor:
+            e.data.setVar("TARGET_VENDOR_MULTILIB_ORIGINAL", e.data.getVar("TARGET_VENDOR", True))
             e.data.setVar("TARGET_VENDOR", target_vendor)
         return
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index aa7a9a5..9c5a360 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -28,7 +28,11 @@ SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
 B_task-populate-sdk = "${SDK_DIR}"
 
-SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
+# Install toolchain to the path with TARGET_VENDOR_MULTILIB_ORIGINAL since:
+# 1) Both toolchains (32 and 64 bits) are installed
+# 2) The environment-setup-* doesn't contain mllib
+TARGET_VENDOR_MULTILIB_ORIGINAL ??= "${TARGET_VENDOR}"
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}"
 
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
-- 
1.7.9.5


