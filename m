Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzW-0001xK-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:16 +0200
Received: by pzk36 with SMTP id 36so927077pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=BPhufpnFhH/5MbJoKGnXbQmmNcNXX/fL+4UzkI0EBeo=;
	b=uwzvJiQwbViikr7JP9AJY0bJnrNoy3ddoytjn6xlwwjORPloQvCvCEAeC2Ec+Pz39X
	pQrQ7SG30D9YMnGp/Zd5n0VIIeyuWuB83NjiONdNXmWuk9xbViSYs2NxTQ8VlnR/VMow
	B2ahw5tJPVUjhq9HnnvVmiEpE7WLSU5ysSRp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WAr5RmuB0k3ii+T3bc+sTTw0t2zZDCCK7tazgDj/TWKzNanlNutThIr/TvNDBky+G8
	RhLYSbxr06k5/EJK7usllR7g8pSO2YSKWX77O/nfa2fVWIGvbENJa335XHyreNioSfc8
	8F1CewA+YdEJSVf635DdKbJPBqSiYE/4lnOlE=
Received: by 10.68.5.106 with SMTP id r10mr3297736pbr.405.1305752779352;
	Wed, 18 May 2011 14:06:19 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:18 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:05 -0700
Message-Id: <b7564c32452e9ce33d9790465b986471ef5a3cba.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] image.bbclass: switch to OE's IMAGE_FEATURES
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
X-List-Received-Date: Wed, 18 May 2011 21:09:16 -0000

From: Chris Larson <chris_larson@mentor.com>

Currently, all image features are assumed to be package groups defined with
oe.packagegroup (PACKAGE_GROUP_<group> = "<list of packages>").

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/core-image.bbclass |  112 ++++++++++++++-------------------------
 meta/classes/image.bbclass      |   41 ++++++++++++++-
 meta/conf/bitbake.conf          |    1 +
 3 files changed, 79 insertions(+), 75 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index c8c6a57..fcfce71 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -5,18 +5,16 @@
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-# IMAGE_FEATURES control content of the core reference images
-# 
 # By default we install task-core-boot and task-base packages - this gives us
 # working (console only) rootfs.
 #
-# Available IMAGE_FEATURES:
+# Additional IMAGE_FEATURES:
 #
 # - apps-console-core
-# - x11-base            - X11 server + minimal desktop	
-# - x11-sato            - OpenedHand Sato environment
-# - x11-netbook         - Metacity based environment for netbooks
-# - apps-x11-core       - X Terminal, file manager, file editor
+# - x11-base          - X11 server + minimal desktop
+# - x11-sato          - OpenedHand Sato environment
+# - x11-netbook       - Metacity based environment for netbooks
+# - apps-x11-core     - X Terminal, file manager, file editor
 # - apps-x11-games
 # - apps-x11-pimlico    - OpenedHand Pimlico apps
 # - tools-sdk           - SDK
@@ -26,75 +24,43 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
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
+PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
+PACKAGE_GROUP_package-management-bootstrap = "${ROOTFS_PKGMANAGE_BOOTSTRAP}"
+PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
+PACKAGE_GROUP_ssh-server-dropbear = "task-core-ssh-dropbear"
+PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
+
+python handle_rootfs_pkgmanage_bootstrap() {
+    if not isinstance(e, bb.event.RecipeParsed):
+        return
+
+    d = e.data
+    features = d.getVar('IMAGE_FEATURES', True).split()
+    if 'package-management' not in features:
+        features.append('package-management-bootstrap')
+        d.setVar('IMAGE_FEATURES', ' '.join(features))
+}
+addhandler handle_rootfs_pkgmanage_bootstrap
+
 POKY_BASE_INSTALL = '\
-    task-core-boot \
-    task-base-extended \
-    ${@base_contains("IMAGE_FEATURES", "dbg-pkgs", "task-core-boot-dbg task-base-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", "dev-pkgs", "task-core-boot-dev task-base-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-console-core", "task-core-apps-console", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dbg-pkgs"], "task-core-apps-console-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dev-pkgs"], "task-core-apps-console-dev", "",d)} \
-    \
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
-    ${POKY_EXTRA_INSTALL} \
-    '
+     task-core-boot \
+     task-base-extended \
+     ${POKY_EXTRA_INSTALL} \
+     '
 
 POKY_EXTRA_INSTALL ?= ""
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..3c62688 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -11,8 +11,45 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
-export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}"
-PACKAGE_INSTALL_ATTEMPTONLY ?= ""
+
+PACKAGE_INSTALL = "${@' '.join(oe.packagegroup.required_packages('${IMAGE_FEATURES}'.split(), d))}"
+PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(oe.packagegroup.optional_packages('${IMAGE_FEATURES}'.split(), d))}"
+RDEPENDS += "${@' '.join(oe.packagegroup.active_packages('${IMAGE_FEATURES}'.split(), d))}"
+
+
+IMAGE_FEATURES ?= ""
+IMAGE_FEATURES[type] = "list"
+IMAGE_FEATURES_prepend = "image_base "
+
+# Define our always included package group
+PACKAGE_GROUP_image_base = "${IMAGE_INSTALL}"
+
+# The following package groups allow one to add debugging, development, and
+# documentation files for all packages installed in the image.
+
+def string_set(iterable):
+    return ' '.join(set(iterable))
+
+def image_features_noextras(d):
+    for f in d.getVar("IMAGE_FEATURES", True).split():
+        if not f in ('dbg', 'dev', 'doc'):
+            yield f
+
+def dbg_packages(d):
+    from itertools import chain
+
+    features = image_features_noextras(d)
+    return string_set("%s-dbg" % pkg
+                      for pkg in chain(oe.packagegroup.active_packages(features, d),
+                                       oe.packagegroup.active_recipes(features, d)))
+
+PACKAGE_GROUP_dbg = "${@dbg_packages(d)}"
+PACKAGE_GROUP_dbg[optional] = "1"
+PACKAGE_GROUP_dev = "${@string_set('%s-dev' % pn for pn in oe.packagegroup.active_recipes(image_features_noextras(d), d))}"
+PACKAGE_GROUP_dev[optional] = "1"
+PACKAGE_GROUP_doc = "${@string_set('%s-doc' % pn for pn in oe.packagegroup.active_recipes(image_features_noextras(d), d))}"
+PACKAGE_GROUP_doc[optional] = "1"
+
 
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0af672..f282960 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -675,6 +675,7 @@ MACHINE_EXTRA_RDEPENDS ?= ""
 MACHINE_EXTRA_RRECOMMENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
+EXTRA_IMAGE_FEATURES ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 COMBINED_FEATURES = "\
-- 
1.7.1



