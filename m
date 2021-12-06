Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C39C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:35:37 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.53117.1638804936355119600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 9AA37240017;
	Mon,  6 Dec 2021 15:35:34 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/4] rename core-image-testmaster* to core-image-testgolden
Date: Mon,  6 Dec 2021 16:35:08 +0100
Message-Id: <20211206153511.34838-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206153511.34838-1-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159243

"golden" has a more explicit meaning than master in addition to not
being an issue wrt inclusivity.

Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
---
 meta/conf/distro/include/distro_alias.inc                   | 4 ++--
 meta/conf/distro/include/maintainers.inc                    | 4 ++--
 meta/lib/oeqa/controllers/masterimage.py                    | 6 +++---
 ...ster-initramfs.bb => core-image-testgolden-initramfs.bb} | 2 +-
 .../{core-image-testmaster.bb => core-image-testgolden.bb}  | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/images/{core-image-testmaster-initramfs.bb => core-image-testgolden-initramfs.bb} (92%)
 rename meta/recipes-extended/images/{core-image-testmaster.bb => core-image-testgolden.bb} (80%)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 44bc3bf1315..2649a21474b 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -42,8 +42,8 @@ DISTRO_PN_ALIAS:pn-core-image-rt-sdk = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato-dev = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato-sdk = "OE-Core"
-DISTRO_PN_ALIAS:pn-core-image-testmaster = "OE-Core"
-DISTRO_PN_ALIAS:pn-core-image-testmaster-initramfs = "OE-Core"
+DISTRO_PN_ALIAS:pn-core-image-testgolden = "OE-Core"
+DISTRO_PN_ALIAS:pn-core-image-testgolden-initramfs = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-weston = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-x11 = "OE-Core"
 DISTRO_PN_ALIAS:pn-createrepo-c = "Fedora=createrepo_c Clear=createrepo_c"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 97ba2ce79c8..61572247560 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -112,8 +112,8 @@ RECIPE_MAINTAINER:pn-core-image-ptest-all = "Richard Purdie <richard.purdie@linu
 RECIPE_MAINTAINER:pn-core-image-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-testmaster-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-testgolden-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-testgolden = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 0bf5917e481..2eff6d05ef9 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -3,13 +3,13 @@
 # SPDX-License-Identifier: MIT
 #
 # This module adds support to testimage.bbclass to deploy images and run
-# tests using a "master image" - this is a "known good" image that is
+# tests using a "golden image" - this is a "known good" image that is
 # installed onto the device as part of initial setup and will be booted into
 # with no interaction; we can then use it to deploy the image to be tested
 # to a second partition before running the tests.
 #
-# For an example master image, see core-image-testmaster
-# (meta/recipes-extended/images/core-image-testmaster.bb)
+# For an example golden image, see core-image-testgolden
+# (meta/recipes-extended/images/core-image-testgolden.bb)
 
 import os
 import bb
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testgolden-initramfs.bb
similarity index 92%
rename from meta/recipes-extended/images/core-image-testmaster-initramfs.bb
rename to meta/recipes-extended/images/core-image-testgolden-initramfs.bb
index 1a2e0af27ba..5495e3d12e0 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testgolden-initramfs.bb
@@ -7,7 +7,7 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
-export IMAGE_BASENAME = "core-image-testmaster-initramfs"
+export IMAGE_BASENAME = "core-image-testgolden-initramfs"
 IMAGE_NAME_SUFFIX ?= ""
 IMAGE_LINGUAS = ""
 
diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testgolden.bb
similarity index 80%
rename from meta/recipes-extended/images/core-image-testmaster.bb
rename to meta/recipes-extended/images/core-image-testgolden.bb
index 0faf18f5a4e..f4cab1491d4 100644
--- a/meta/recipes-extended/images/core-image-testmaster.bb
+++ b/meta/recipes-extended/images/core-image-testgolden.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A master image to be deployed on a target useful for testing other images"
+DESCRIPTION = "A golden image to be deployed on a target useful for testing other images"
 
 IMAGE_FEATURES += "ssh-server-openssh package-management"
 
@@ -14,5 +14,5 @@ IMAGE_INSTALL += "\
 # we need a particular initramfs for live images
 # that pulls custom install scripts which take
 # care of partitioning for us
-INITRD_IMAGE = "core-image-testmaster-initramfs"
+INITRD_IMAGE = "core-image-testgolden-initramfs"
 
-- 
2.33.1


