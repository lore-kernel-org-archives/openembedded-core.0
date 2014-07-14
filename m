Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1FB70496
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:24:51 +0000 (UTC)
Received: from [69.196.158.250] (port=46846 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6fJM-0006Wi-LI for openembedded-core@lists.openembedded.org;
	Mon, 14 Jul 2014 08:24:52 -0400
Date: Mon, 14 Jul 2014 08:24:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407140823370.21467@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Remove long-deprecated "task-core" backward compat for packagegroups.
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
X-List-Received-Date: Mon, 14 Jul 2014 12:24:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  a few notes:

  * seems valid as i'm rebuilding a core-image-minimal for qemux86 so
the recipes seem to parse properly

  * almost all of this is simple variable assignment deletion but for
that first patch, which is just the python code which does the same
thing

  * there is also removal of some assignments that relate to similar
stuff over in meta-oe -- that will be removed in a separate patch


diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 16f3a51..13a4fe4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -124,13 +124,6 @@ python __anonymous () {

     if "nfc" in distro_features and not "nfc" in machine_features and ("usbhost" in machine_features):
         d.setVar("ADD_NFC", "packagegroup-base-nfc")
-
-    # For backwards compatibility after rename
-    packages = d.getVar("PACKAGES", True).split()
-    for pkg in packages:
-        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
-        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
-        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-", "task-"))
 }

 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index c8bc362..bdc4a1d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -17,11 +17,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-boot"
-RREPLACES_${PN} = "task-core-boot"
-RCONFLICTS_${PN} = "task-core-boot"
-
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "busybox"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 24c98c4..247a30e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -10,11 +10,6 @@ inherit packagegroup

 PACKAGES = "${PN}-server"

-# For backwards compatibility after rename
-RPROVIDES_${PN}-server = "task-core-nfs-server"
-RREPLACES_${PN}-server = "task-core-nfs-server"
-RCONFLICTS_${PN}-server = "task-core-nfs-server"
-
 SUMMARY_${PN}-server = "NFS server"
 RDEPENDS_${PN}-server = "\
     nfs-utils \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 1723989..a544bbd 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -10,11 +10,6 @@ inherit packagegroup

 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'

-# For backwards compatibility after rename
-RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
-RREPLACES_packagegroup-core-sdk = "task-core-sdk"
-RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"
-
 RDEPENDS_packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 458d8fa..e99946f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,9 +4,4 @@ PR = "r1"

 inherit packagegroup

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-ssh-dropbear"
-RREPLACES_${PN} = "task-core-ssh-dropbear"
-RCONFLICTS_${PN} = "task-core-ssh-dropbear"
-
 RDEPENDS_${PN} = "dropbear"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index df70962..32d20e6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -4,9 +4,4 @@ PR = "r1"

 inherit packagegroup

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-ssh-openssh"
-RREPLACES_${PN} = "task-core-ssh-openssh"
-RCONFLICTS_${PN} = "task-core-ssh-openssh"
-
 RDEPENDS_${PN} = "openssh"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 3325ef6..5d1ce97 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -4,14 +4,6 @@ LICENSE = "MIT"

 inherit packagegroup

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-standalone-sdk-target"
-RREPLACES_${PN} = "task-core-standalone-sdk-target"
-RCONFLICTS_${PN} = "task-core-standalone-sdk-target"
-RPROVIDES_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
-RREPLACES_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
-RCONFLICTS_${PN}-dbg = "task-core-standalone-sdk-target-dbg"
-
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index f72aae4..79bedfb 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -11,11 +11,6 @@ PR = "r2"

 PACKAGE_ARCH = "${MACHINE_ARCH}"

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-tools-debug"
-RREPLACES_${PN} = "task-core-tools-debug"
-RCONFLICTS_${PN} = "task-core-tools-debug"
-
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 7832c89..8c9dd8b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -11,11 +11,6 @@ inherit packagegroup

 PACKAGE_ARCH = "${MACHINE_ARCH}"

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-tools-profile"
-RREPLACES_${PN} = "task-core-tools-profile"
-RCONFLICTS_${PN} = "task-core-tools-profile"
-
 PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index c766754..15ed7f9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -11,11 +11,6 @@ inherit packagegroup

 PACKAGE_ARCH = "${MACHINE_ARCH}"

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-tools-testapps"
-RREPLACES_${PN} = "task-core-tools-testapps"
-RCONFLICTS_${PN} = "task-core-tools-testapps"
-
 # kexec-tools doesn't work on Mips
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 0c9d4dc..30b6e15 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -25,7 +25,6 @@ PACKAGES = "\
     "


-RPROVIDES_packagegroup-core-lsb = "task-core-lsb"
 RDEPENDS_packagegroup-core-lsb = "\
     packagegroup-core-sys-extended \
     packagegroup-core-db \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index cb2aba0..7540821 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -13,11 +13,6 @@ PACKAGES = "\
     ${PN}-core \
     "

-# For backwards compatibility after rename
-RPROVIDES_${PN}-core = "task-core-clutter-core"
-RREPLACES_${PN}-core = "task-core-clutter-core"
-RCONFLICTS_${PN}-core = "task-core-clutter-core"
-
 SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
     clutter-1.0 \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index a5d02ed..2eff371 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -5,11 +5,6 @@ PR = "r1"

 inherit packagegroup

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-x11-mini task-core-x11-base"
-RREPLACES_${PN} = "task-core-x11-mini task-core-x11-base"
-RCONFLICTS_${PN} = "task-core-x11-mini task-core-x11-base"
-
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index d58f743..f595a54 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -17,8 +17,3 @@ RDEPENDS_${PN} = "\
     ${XSERVER} \
     ${XSERVERCODECS} \
     "
-
-# Allow replacing task-x11-server in meta-oe
-RPROVIDES_${PN} = "task-x11-server task-xserver"
-RREPLACES_${PN} = "task-x11-server task-xserver"
-RCONFLICTS_${PN} = "task-x11-server task-xserver"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 1a51428..fde5144 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -30,11 +30,3 @@ RDEPENDS_${PN}-utils = "\
     xset \
     xrandr \
     "
-
-# Allow replacing task-x11* in meta-oe
-RPROVIDES_${PN} = "task-x11"
-RREPLACES_${PN} = "task-x11"
-RCONFLICTS_${PN} = "task-x11"
-RPROVIDES_${PN}-utils = "task-x11-utils"
-RREPLACES_${PN}-utils = "task-x11-utils"
-RCONFLICTS_${PN}-utils = "task-x11-utils"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 15dec8e..d28e032 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -13,11 +13,6 @@ inherit packagegroup

 PACKAGES = "${PN}-demoapps"

-# For backwards compatibility after rename
-RPROVIDES_${PN}-demoapps = "task-core-qt-demos"
-RREPLACES_${PN}-demoapps = "task-core-qt-demos"
-RCONFLICTS_${PN}-demoapps = "task-core-qt-demos"
-
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"

 SUMMARY_${PN}-demoapps = "Qt demo applications"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 02a649b..d7a457c 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -7,11 +7,6 @@ COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"

 inherit packagegroup

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-qt4e-base"
-RREPLACES_${PN} = "task-qt4e-base"
-RCONFLICTS_${PN} = "task-qt4e-base"
-
 TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'

 RDEPENDS_${PN} = " \
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 4ec5e89..2d23fe4 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -12,11 +12,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"

 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"

-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-x11-sato"
-RREPLACES_${PN} = "task-core-x11-sato"
-RCONFLICTS_${PN} = "task-core-x11-sato"
-
 RDEPENDS_${PN} = "\
     ${PN}-base \
     ${PN}-apps \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

