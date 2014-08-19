Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 724BA60030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCal5j004759 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:36:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gv73JaJwqQI5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:36:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCajcZ004755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:36:46 +0100
Message-ID: <1408451805.1669.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:36:45 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] packagegroup: Move inherit packagegroup to after PACKAGE_ARCH
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
X-List-Received-Date: Tue, 19 Aug 2014 12:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This means these classes now avoid the allarch inherit entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 13a4fe4..f4b2cd5 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -2,6 +2,11 @@ SUMMARY = "Merge machine and distro options to create a basic machine task/packa
 LICENSE = "MIT"
 PR = "r83"
 
+#
+# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
+#
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
@@ -39,11 +44,6 @@ PACKAGES = ' \
             \
             '
 
-#
-# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
-#
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 # Override by distro if needed
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index bdc4a1d..886c334 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -7,10 +7,10 @@ DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
 PR = "r17"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 #
 # Set by the machine configuration with packages essential for device bootup
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 8c9dd8b..41d2548 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -7,10 +7,10 @@ LICENSE = "MIT"
 
 PR = "r3"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 15ed7f9..33a3eee 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -7,10 +7,10 @@ LICENSE = "MIT"
 
 PR = "r2"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # kexec-tools doesn't work on Mips
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index f595a54..2d68e97 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -6,10 +6,10 @@ SUMMARY = "X11 display server"
 LICENSE = "MIT"
 PR = "r40"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 XSERVERCODECS ?= ""
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 2d23fe4..bc3e0fd 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -6,10 +6,10 @@ SUMMARY = "Sato desktop"
 LICENSE = "MIT"
 PR = "r33"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
 
 RDEPENDS_${PN} = "\



