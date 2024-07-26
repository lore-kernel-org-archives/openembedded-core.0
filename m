Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E812C52D1D
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.64841.1722010961012389009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcno026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:40 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 5/8] create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests
Date: Fri, 26 Jul 2024 11:22:35 -0500
Message-Id: <1722010958-23635-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202554

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, "tarball" sdk based recipes don't generate SPDX manifests as they
don't include the rootfs generation classes. Split the SPDX 3.0 image class into
two so the SDK components can be included where needed.

To do this, introduce an SDK_CLASSES variable similar to IMAGE_CLASSES which
the SDK code can use.

Migrate testsdk usage to this.

Also move the image/sdk spdx classes to classes-recipe rather than the general classes
directory since they'd never be included on a global level.

For buildtools-tarball, it has its own testsdk functions so disable the class there as
a deferred inherit would overwrite it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 662396533177b72cc1d83e95841b27f7e42dcb20)

Eliminate spdx-3.0 items, not applicable to Scarthgap.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 3 +++
 meta/classes-recipe/testimage.bbclass         | 2 --
 meta/recipes-core/meta/buildtools-tarball.bb  | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 6cb43ad..a103e7b 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+SDK_CLASSES += "${@bb.utils.contains("IMAGE_CLASSES", "testimage", "testsdk", "", d)}"
+inherit_defer ${SDK_CLASSES}
+
 PACKAGES = ""
 
 # This exists as an optimization for SPDX processing to only run in image and
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index ed0d87b..2f68f83 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -483,5 +483,3 @@ python () {
     if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
-
-inherit testsdk
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 92fbda3..e2ce5b3 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -112,6 +112,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 # Directory in testsdk that contains testcases
 TESTSDK_CASES = "buildtools-cases"
 
+# We have our own code, avoid deferred inherit
+SDK_CLASSES:remove = "testsdk"
+
 python do_testsdk() {
     import oeqa.sdk.testsdk
     testsdk = oeqa.sdk.testsdk.TestSDK()
-- 
1.8.3.1


