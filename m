Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web08.12744.1626104171794569809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=pHYibghY;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 2xyamPTUyOQhv2xybmEj9z; Mon, 12 Jul 2021 16:36:10 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=e_q4qTt1xDgA:10 a=-An2I_7KAAAA:8 a=T9JUtYPXkN-NqOx8j4EA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=k+lNAziUKVkrV096SHUbb3BBAKEcYucQVyGwKiZENi8=; b=pH
	YibghYD4t2ZSmNNCOHFcCH/GzpkfbHJmLYe4Z9UbznFOTnt8uCiWGIee7z1uR2lJBNb4AiRogSqSF
	azZHW/vhmsUzR5OzULxgr/bHii9GHvV7HtwJI80kJy7xdO48YMY6q4tciIztpm38bvFyTx+zKvCQy
	ybS8nprqCpBI6W1xoZV3YvQNrWeqogQPTJX0RxyhyIYpzMQI6I5JI/5TSrLnx9koMVAx/HXQ9yYHI
	GYs0TBmsr8sQ9W7hsIYfQxTWknoyWaZMbboK7af404TfO1TIjIjpv4GG89ZNtphmgQTE/L+5qC5No
	Zr0YdW02pgbYwlhjojfaTYk2bhKJ7Gqg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m2xyZ-000641-FA; Mon, 12 Jul 2021 16:36:07 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] licence_image: Add lic-pkgs IMAGE_FEATURE
Date: Mon, 12 Jul 2021 16:35:58 +0100
Message-Id: <20210712153558.2628745-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNbPrYpsAJW7k3uw7zrdvZ/yQKZkx5ParizAqwJ7JL3Belu1FI5ovJUNDZ7EmJ5I0a4CDXbC+vIl6L4HDYRO9RAS3dNDDc+E3KNi1A03OIesIMS6AIK/
 sm7al0VKOMS7XtWY7pAjZISLyU1e26kJkxR0W7CD9h7SNC+VQ/+o+5/Dy+fDD+c6yOVa5h4x8tByLg==
Content-Transfer-Encoding: 8bit

Installing license packages is similar to installing -dev or -dbg
packages, so let's invent a "lic-pkgs" IMAGE_FEATURE that does so and
document it in core-image.bbclass.

This image feature only works if LICENSE_CREATE_PACKAGE is set, so
refuse to generate an image if the lic-pkgs feature is enabled without
LICENSE_CREATE_PACKAGE.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/core-image.bbclass    |  2 ++
 meta/classes/license_image.bbclass | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index d81f68bd2e..84fd3eeb38 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -31,6 +31,8 @@
 #   - post-install-logging
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
+# - lic-pkgs            - license packages for all installed pacakges in the rootfs, requires
+#                         LICENSE_CREATE_PACKAGE="1" to be set when building packages too
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
 # - bash-completion-pkgs - bash-completion packages for recipes using bash-completion bbclass
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 73cebb4d55..5dbec288a4 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,5 +1,15 @@
 ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
 
+# This requires LICENSE_CREATE_PACKAGE=1 to work too
+COMPLEMENTARY_GLOB[lic-pkgs] = "*-lic"
+
+python() {
+    if not oe.data.typed_value('LICENSE_CREATE_PACKAGE', d):
+        features = set(oe.data.typed_value('IMAGE_FEATURES', d))
+        if 'lic-pkgs' in features:
+            bb.error("'lic-pkgs' in IMAGE_FEATURES but LICENSE_CREATE_PACKAGE not enabled to generate -lic packages")
+}
+
 python write_package_manifest() {
     # Get list of installed packages
     license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
-- 
2.30.2

