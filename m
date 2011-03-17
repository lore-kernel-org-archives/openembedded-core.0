Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwm-000260-JN
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:12 +0100
Received: by mail-yi0-f47.google.com with SMTP id 13so1172612yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=4cuh4oatcnaVK04DOMQeI2JVxvCmuGbbuLNaZLsCmwk=;
	b=dE9zeZV4e9pXhee6cw//tsnXqOzMDBYyvjFOmzeLdZgfK4CF+OERK4cWjasKoNxaHD
	iKAlv9q98Ar0iAj95dldhZZ9z+GvYMd2H4ABhD3zjqxYSZ4OtCKbmvNTJ/L+KxwMlNOa
	MQqpTylGz5jcoAEkVua2OXnSzraFzO7kVrU+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bA9x7KDki9xjCXrwyI/LtAYefB4NoQxjur5TfO5Ip60v0wSdpuUe0sYVNf1rKNBvRo
	Aj9PIbYAFm+8VU5VTha/1ZGzvB04WDzO+1dfiivNTQi3+BUqnsxP0ZGAre7QQqHH/n16
	jTxYEuJA7bq1g4FfJYm9WN8pub4+J0KB778xA=
Received: by 10.236.153.162 with SMTP id f22mr472021yhk.225.1300378769515;
	Thu, 17 Mar 2011 09:19:29 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:28 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:09 -0700
Message-Id: <52c22927925ee8e3c2e5e6381e33d1116b0897dc.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 11/12] image.bbclass: switch to OE's IMAGE_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:12 -0000

From: Chris Larson <chris_larson@mentor.com>

Currently, all image features are assumed to be package groups defined with
oe.packagegroup (PACKAGE_GROUP_<group> = "<list of packages>").

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass                         |   41 +++++++++-
 meta/classes/poky-image.bbclass                    |   88 +++++---------------
 meta/conf/bitbake.conf                             |    1 +
 meta/recipes-core/images/poky-image-minimal-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    2 +-
 meta/recipes-sato/images/poky-image-sato-dev.bb    |    2 +-
 meta/recipes-sato/images/poky-image-sato-sdk.bb    |    2 +-
 8 files changed, 67 insertions(+), 73 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2cc17e1..5d89598 100644
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
 
 # We need to recursively follow RDEPENDS and RRECOMMENDS for images
 do_rootfs[recrdeptask] += "do_deploy do_populate_sysroot"
diff --git a/meta/classes/poky-image.bbclass b/meta/classes/poky-image.bbclass
index a261a6a..567d493 100644
--- a/meta/classes/poky-image.bbclass
+++ b/meta/classes/poky-image.bbclass
@@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # Available IMAGE_FEATURES:
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
@@ -26,73 +26,29 @@ LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - nfs-server          - NFS server (exports / over NFS to everybody)
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
-# - dev-pkgs            - development packages
-# - dbg-pkgs            - debug packages
+# - dev                 - development packages
+# - dbg                 - debug packages
 #
+PACKAGE_GROUP_apps-console-core = "task-poky-apps-console"
+PACKAGE_GROUP_x11-base = "task-poky-x11-base"
+PACKAGE_GROUP_x11-sato = "task-poky-x11-sato"
+PACKAGE_GROUP_x11-netbook = "task-poky-x11-netbook"
+PACKAGE_GROUP_apps-x11-core = "task-poky-apps-x11-core"
+PACKAGE_GROUP_apps-x11-games = "task-poky-apps-x11-games"
+PACKAGE_GROUP_apps-x11-pimlico = "task-poky-apps-x11-pimlico"
+PACKAGE_GROUP_tools-debug = "task-poky-tools-debug"
+PACKAGE_GROUP_tools-profile = "task-poky-tools-profile"
+PACKAGE_GROUP_tools-testapps = "task-poky-tools-testapps"
+PACKAGE_GROUP_tools-sdk = "task-poky-tools-sdk"
+PACKAGE_GROUP_nfs-server = "task-poky-nfs-server"
+PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
+PACKAGE_GROUP_qt4-pkgs = "task-poky-qt-demos"
+PACKAGE_GROUP_ssh-server-dropbear = "task-poky-ssh-dropbear"
+PACKAGE_GROUP_ssh-server-openssh = "task-poky-ssh-openssh"
 
 POKY_BASE_INSTALL = '\
     task-poky-boot \
     task-base-extended \
-    ${@base_contains("IMAGE_FEATURES", "dbg-pkgs", "task-poky-boot-dbg task-base-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", "dev-pkgs", "task-poky-boot-dev task-base-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-console-core", "task-poky-apps-console", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dbg-pkgs"], "task-poky-apps-console-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dev-pkgs"], "task-poky-apps-console-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "x11-base", "task-poky-x11-base", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dbg-pkgs"], "task-poky-x11-base-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dev-pkgs"], "task-poky-x11-base-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "x11-sato", "task-poky-x11-sato", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dbg-pkgs"], "task-poky-x11-sato-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dev-pkgs"], "task-poky-x11-sato-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "x11-netbook", "task-poky-x11-netbook", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-netbook", "dbg-pkgs"], "task-poky-x11-netbook-dbg", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", ["x11-netbook", "dev-pkgs"], "task-poky-x11-netbook-dev", "", d)} \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-core", "task-poky-apps-x11-core", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-core", "dbg-pkgs"], "task-poky-apps-x11-core-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-core", "dev-pkgs"], "task-poky-apps-x11-core-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-games", "task-poky-apps-x11-games", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-games", "dbg-pkgs"], "task-poky-apps-x11-games-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-games", "dev-pkgs"], "task-poky-apps-x11-games-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "apps-x11-pimlico", "task-poky-apps-x11-pimlico", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-pimlico", "dbg-pkgs"], "task-poky-apps-x11-pimlico-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["apps-x11-pimlico", "dev-pkgs"], "task-poky-apps-x11-pimlico-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-debug", "task-poky-tools-debug", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-debug", "dbg-pkgs"], "task-poky-tools-debug-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-debug", "dev-pkgs"], "task-poky-tools-debug-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-profile", "task-poky-tools-profile", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-profile", "dbg-pkgs"], "task-poky-tools-profile-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-profile", "dev-pkgs"], "task-poky-tools-profile-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-testapps", "task-poky-tools-testapps", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-testapps", "dbg-pkgs"], "task-poky-tools-testapps-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-testapps", "dev-pkgs"], "task-poky-tools-testapps-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "tools-sdk", "task-poky-sdk task-poky-standalone-sdk-target", "",d)} \    
-    ${@base_contains("IMAGE_FEATURES", ["tools-sdk", "dbg-pkgs"], "task-poky-sdk-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["tools-sdk", "dev-pkgs"], "task-poky-sdk-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "nfs-server", "task-poky-nfs-server", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dbg-pkgs"], "task-poky-nfs-server-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["nfs-server", "dev-pkgs"], "task-poky-nfs-server-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "ssh-server-dropbear", "task-poky-ssh-dropbear", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-dropbear", "dbg-pkgs"], "task-poky-ssh-dropbear-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-dropbear", "dev-pkgs"], "task-poky-ssh-dropbear-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "ssh-server-openssh", "task-poky-ssh-openssh", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-openssh", "dbg-pkgs"], "task-poky-ssh-openssh-dbg", "",d)} \
-    ${@base_contains("IMAGE_FEATURES", ["ssh-server-openssh", "dev-pkgs"], "task-poky-ssh-openssh-dev", "",d)} \
-    \
-    ${@base_contains("IMAGE_FEATURES", "package-management", "${ROOTFS_PKGMANAGE}", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
-    ${@base_contains("IMAGE_FEATURES", "qt4-pkgs", "task-poky-qt-demos", "",d)} \
     ${POKY_EXTRA_INSTALL} \
     '
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 42b9825..c49a737 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -726,6 +726,7 @@ MACHINE_EXTRA_RDEPENDS ?= ""
 MACHINE_EXTRA_RRECOMMENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
+EXTRA_IMAGE_FEATURES ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 COMBINED_FEATURES = "\
diff --git a/meta/recipes-core/images/poky-image-minimal-dev.bb b/meta/recipes-core/images/poky-image-minimal-dev.bb
index c64b657..e65a942 100644
--- a/meta/recipes-core/images/poky-image-minimal-dev.bb
+++ b/meta/recipes-core/images/poky-image-minimal-dev.bb
@@ -3,7 +3,7 @@
 #
 IMAGE_INSTALL = "task-poky-boot ${ROOTFS_PKGMANAGE}"
 
-IMAGE_FEATURES += "dev-pkgs"
+IMAGE_FEATURES += "dev"
 
 IMAGE_LINGUAS = " "
 
diff --git a/meta/recipes-extended/images/poky-image-lsb-dev.bb b/meta/recipes-extended/images/poky-image-lsb-dev.bb
index 578fbd0..f549ba0 100644
--- a/meta/recipes-extended/images/poky-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/poky-image-lsb-dev.bb
@@ -1,4 +1,4 @@
-IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
+IMAGE_FEATURES += "apps-console-core dev ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${POKY_BASE_INSTALL} \
diff --git a/meta/recipes-extended/images/poky-image-lsb-sdk.bb b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
index 967bb02..54a1d73 100644
--- a/meta/recipes-extended/images/poky-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
@@ -1,4 +1,4 @@
-IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev-pkgs ssh-server-openssh"
+IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${POKY_BASE_INSTALL} \
diff --git a/meta/recipes-sato/images/poky-image-sato-dev.bb b/meta/recipes-sato/images/poky-image-sato-dev.bb
index 429095e..50b3c34 100644
--- a/meta/recipes-sato/images/poky-image-sato-dev.bb
+++ b/meta/recipes-sato/images/poky-image-sato-dev.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
+IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/images/poky-image-sato-sdk.bb b/meta/recipes-sato/images/poky-image-sato-sdk.bb
index 9f8eef9..d15236e 100644
--- a/meta/recipes-sato/images/poky-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/poky-image-sato-sdk.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev-pkgs qt4-pkgs"
+IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev qt4-pkgs"
 
 LICENSE = "MIT"
 
-- 
1.7.2.3



