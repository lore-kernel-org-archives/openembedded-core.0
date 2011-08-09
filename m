Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqnYp-0000VN-36
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:45:39 +0200
Received: by yia28 with SMTP id 28so44782yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zh9adM2GkC9+E3AbAbsxVs5IkSidIYOGj/wXx230I24=;
	b=YkI1eGFagXys/jZK4zgGBRwIZqVWwoTrTw/qEz4WmBXDy6P4xc9mZxwoGv4y+2t137
	GKzT8P8vRY0SMjkU5v/Is5sfYIDZmGH9zWm2LJpTdjUk+rgsF3yjvzSsmPlr0JU8POWx
	Z8Cd4IoSUYCxGvf0b97NSFFPX4gDqOjfkPBsg=
Received: by 10.236.161.199 with SMTP id w47mr2835588yhk.129.1312900869330;
	Tue, 09 Aug 2011 07:41:09 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id w1sm6579291yhi.65.2011.08.09.07.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 07:41:08 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 07:40:54 -0700
Message-Id: <218a98621cc5423b1553c7da8efbad1b895a3a31.1312900463.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] core-image: adjust to use the new IMAGE_FEATURES support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2011 14:45:39 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/core-image.bbclass |   77 +++++++++------------------------------
 1 files changed, 17 insertions(+), 60 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index c8c6a57..507d6a6 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -26,73 +26,30 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - nfs-server          - NFS server (exports / over NFS to everybody)
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
-# - dev-pkgs            - development packages
-# - dbg-pkgs            - debug packages
 #
+PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
+PACKAGE_GROUP_x11-base = "task-core-x11-base"
+PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
+PACKAGE_GROUP_x11-netbook = "task-core-x11-netbook"
+PACKAGE_GROUP_apps-x11-core = "task-core-apps-x11-core"
+PACKAGE_GROUP_apps-x11-games = "task-core-apps-x11-games"
+PACKAGE_GROUP_apps-x11-pimlico = "task-core-apps-x11-pimlico"
+PACKAGE_GROUP_tools-debug = "task-core-tools-debug"
+PACKAGE_GROUP_tools-profile = "task-core-tools-profile"
+PACKAGE_GROUP_tools-testapps = "task-core-tools-testapps"
+PACKAGE_GROUP_tools-sdk = "task-core-sdk task-core-standalone-sdk-target"
+PACKAGE_GROUP_nfs-server = "task-core-nfs-server"
+PACKAGE_GROUP_ssh-server-dropbear = "task-core-ssh-dropbear"
+PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
+PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
+PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
 
 POKY_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
-    ${@base_contains("IMAGE_FEATURES", "dbg-pkgs", "task-core-boot-dbg task-base-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", "dev-pkgs", "task-core-boot-dev task-base-dev", "",d)} \
     \
-    ${@base_contains("IMAGE_FEATURES", "apps-console-core", "task-core-apps-console", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dbg-pkgs"], "task-core-apps-console-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dev-pkgs"], "task-core-apps-console-dev", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     \
-    ${@base_contains("IMAGE_FEATURES", "x11-base", "task-core-x11-base", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dbg-pkgs"], "task-core-x11-base-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dev-pkgs"], "task-core-x11-base-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "x11-sato", "task-core-x11-sato", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dbg-pkgs"], "task-core-x11-sato-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dev-pkgs"], "task-core-x11-sato-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "x11-netbook", "task-core-x11-netbook", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-netbook", "dbg-pkgs"], "task-core-x11-netbook-dbg", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-netbook", "dev-pkgs"], "task-core-x11-netbook-dev", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-core", "task-core-apps-x11-core", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-core", "dbg-pkgs"], "task-core-apps-x11-core-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-core", "dev-pkgs"], "task-core-apps-x11-core-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-games", "task-core-apps-x11-games", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-games", "dbg-pkgs"], "task-core-apps-x11-games-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-games", "dev-pkgs"], "task-core-apps-x11-games-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-pimlico", "task-core-apps-x11-pimlico", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-pimlico", "dbg-pkgs"], "task-core-apps-x11-pimlico-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-pimlico", "dev-pkgs"], "task-core-apps-x11-pimlico-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-debug", "task-core-tools-debug", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-debug", "dbg-pkgs"], "task-core-tools-debug-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-debug", "dev-pkgs"], "task-core-tools-debug-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-profile", "task-core-tools-profile", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-profile", "dbg-pkgs"], "task-core-tools-profile-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-profile", "dev-pkgs"], "task-core-tools-profile-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-testapps", "task-core-tools-testapps", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-testapps", "dbg-pkgs"], "task-core-tools-testapps-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-testapps", "dev-pkgs"], "task-core-tools-testapps-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-sdk", "task-core-sdk task-core-standalone-sdk-target", "",d)} \    
-    ${@base_contains("IMAGE_FEATURES", ["tools-sdk", "dbg-pkgs"], "task-core-sdk-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-sdk", "dev-pkgs"], "task-core-sdk-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "nfs-server", "task-core-nfs-server", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dbg-pkgs"], "task-core-nfs-server-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dev-pkgs"], "task-core-nfs-server-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "ssh-server-dropbear", "task-core-ssh-dropbear", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-dropbear", "dbg-pkgs"], "task-core-ssh-dropbear-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-dropbear", "dev-pkgs"], "task-core-ssh-dropbear-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "ssh-server-openssh", "task-core-ssh-openssh", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-openssh", "dbg-pkgs"], "task-core-ssh-openssh-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-openssh", "dev-pkgs"], "task-core-ssh-openssh-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "package-management", "${ROOTFS_PKGMANAGE}", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
-    ${@base_contains("IMAGE_FEATURES", "qt4-pkgs", "task-core-qt-demos", "",d)} \
     ${POKY_EXTRA_INSTALL} \
     '
 
-- 
1.7.4.1



