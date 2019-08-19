Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D36C17E544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 03:22:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7J3MmSj010089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2019 20:22:48 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 18 Aug 2019 20:22:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2019 11:22:28 +0800
Message-ID: <1566184948-97753-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] populate_sdk: fix populate_sdk failed error
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
X-List-Received-Date: Mon, 19 Aug 2019 03:22:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Configuration:
IMAGE_INSTALL_append = " bash"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

Reproduce cmd:
bitbake core-image-minimal -c populate_sdk

Error info:
--> Finished dependency resolution
Error:
 Problem: package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with /bin/sh provided by bash-5.0-r0.core2_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with bash provided by bash-5.0-r0.core2_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with /bin/bash provided by bash-5.0-r0.core2_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target obsoletes bash provided by bash-5.0-r0.core2_64
  - cannot install the best candidate for the job
  - conflicting requests

when do_populate_sdk, package target-sdk-provides-dummy provides
dummy /bin/sh, ... and package bash also provides this, we append
dummy arch sdk-provides-dummy-target to the end of ALL_MULTILIB_PACKAGE_ARCHS,
then reverted sdk-provides-dummy-target to the first arch
for dnf config  etc/dnf/vars/arch to make it high priority.

when multilib is enabled, below statement will not work as expected.
ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"

Eg:
For lib32 variant, PACKAGE_ARCHS is:
all any noarch x86 qemux86_64 sdk-provides-dummy-target

For lib64 variant, PACKAGE_ARCHS is:
all any noarch x86_64 core2-64 qemux86_64 sdk-provides-dummy-target

Then:
ALL_MULTILIB_PACKAGE_ARCHS will be
x86 qemux86_64 sdk-provides-dummy-target x86_64 core2-64

Fixed by append sdk-provides-dummy-target during do_populate_sdk

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 59920a5..3362656 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -21,7 +21,6 @@ def complementary_globs(featurevar, d):
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
-PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
 SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
 # List of locales to install, or "all" for all of them, or unset for none.
@@ -130,6 +129,7 @@ def populate_sdk_common(d):
     inst_pkgs = (d.getVar("PACKAGE_INSTALL") or "").split()
     inst_attempt_pkgs = (d.getVar("PACKAGE_INSTALL_ATTEMPTONLY") or "").split()
 
+    d.appendVar('ALL_MULTILIB_PACKAGE_ARCHS', ' sdk-provides-dummy-target')
     d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
     d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' '.join(inst_attempt_pkgs))
 
-- 
2.7.4


