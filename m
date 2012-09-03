Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8K-0004wr-L2
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497257"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:48 +0100
Message-Id: <f3203e390d170049d981912b7f39bb9a0aa8952f.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 28/28] packagegroup-*: add RPROVIDES for backwards compatibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

Allow references to the old task packages to continue to work. This does
not add RPROVIDES for everything, just those packages that are likely to
have been referred to.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-base.bb             |    9 +++++++++
 .../packagegroups/packagegroup-core-boot.bb        |    3 +++
 .../packagegroups/packagegroup-core-nfs.bb         |    3 +++
 .../packagegroups/packagegroup-core-sdk.bb         |    3 +++
 .../packagegroup-core-ssh-dropbear.bb              |    3 +++
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    3 +++
 .../packagegroup-core-standalone-sdk-target.bb     |    3 +++
 .../packagegroups/packagegroup-core-tools-debug.bb |    3 +++
 .../packagegroup-core-tools-profile.bb             |    3 +++
 .../packagegroup-core-tools-testapps.bb            |    3 +++
 .../packagegroups/packagegroup-cross-canadian.bb   |    3 +++
 .../packagegroups/packagegroup-core-basic.bb       |    7 +++++++
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    3 +++
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    3 +++
 .../packagegroups/packagegroup-core-clutter.bb     |    3 +++
 .../packagegroup-core-gtk-directfb.bb              |    3 +++
 .../packagegroups/packagegroup-core-x11-base.bb    |    3 +++
 .../packagegroups/packagegroup-core-qt.bb          |    3 +++
 .../packagegroups/packagegroup-core-qt4e.bb        |    3 +++
 .../packagegroups/packagegroup-core-x11-sato.bb    |    3 +++
 21 files changed, 71 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f151591..2178308 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -114,6 +114,15 @@ python __anonymous () {
 
     if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
         d.setVar("ADD_3G", "packagegroup-base-3g")
+
+    # For backwards compatibility after rename
+    packages = d.getVar("PACKAGES", True).split()
+    packages.remove("packagegroup-distro-base")
+    packages.remove("packagegroup-machine-base")
+    for pkg in packages:
+        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-base", "task-base"))
+    d.appendVar("RPROVIDES_packagegroup-distro-base", "task-distro-base")
+    d.appendVar("RPROVIDES_packagegroup-machine-base", "task-machine-base")
 }
 
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 4b1208e..d29dc2b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -18,6 +18,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-boot"
+
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 09414069..03f9c12 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -10,6 +10,9 @@ inherit packagegroup
 
 PACKAGES = "${PN}-server"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN}-server = "task-core-nfs-server"
+
 SUMMARY_${PN}-server = "NFS server"
 RDEPENDS_${PN}-server = "\
     nfs-utils \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index c79f092..f05e099 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -10,6 +10,9 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+# For backwards compatibility after rename
+RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
+
 RDEPENDS_packagegroup-core-sdk = "\
     autoconf \
     automake \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 7d71c0c..7fa06e9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,4 +4,7 @@ PR = "r0"
 
 inherit packagegroup
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-ssh-dropbear"
+
 RDEPENDS_${PN} = "dropbear"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index f97b010..3221e8b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -4,4 +4,7 @@ PR = "r0"
 
 inherit packagegroup
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-ssh-openssh"
+
 RDEPENDS_${PN} = "openssh"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 078e7dd..b7b5a29 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -6,6 +6,9 @@ inherit packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-standalone-sdk-target"
+
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index a6da660..6687b32 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -11,6 +11,9 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-tools-debug"
+
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 6a69363..931984e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -9,6 +9,9 @@ inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-tools-profile"
+
 RRECOMMENDS_${PN} = "\
     perf \
     trace-cmd \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1aca97d..9720e5a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -9,6 +9,9 @@ inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-tools-testapps"
+
 # kexec-tools doesn't work on Mips
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index f8e527b..cb2fb1a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -7,6 +7,9 @@ inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
 RDEPENDS_${PN} = "\
     binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
     gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 4e4bcf5..30b66c5 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -19,6 +19,13 @@ PACKAGES = "\
     packagegroup-core-sys-services \
     "
 
+python __anonymous () {
+    # For backwards compatibility after rename
+    packages = d.getVar("PACKAGES", True).split()
+    for pkg in packages:
+        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
+}
+
 
 RDEPENDS_packagegroup-core-basic = "\
     packagegroup-core-basic-libs \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 707ccc1..120326f 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -25,6 +25,7 @@ PACKAGES = "\
     "
 
 
+RPROVIDES_packagegroup-core-lsb = "task-core-lsb"
 RDEPENDS_packagegroup-core-lsb = "\
     packagegroup-core-sys-extended \
     packagegroup-core-db \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index 64b572d..e959c5b 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -12,6 +12,9 @@ require packagegroup-sdk-gmae.inc
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-sdk-gmae"
+
 RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
     libglade-dev \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 95067c4..69c5340 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -12,6 +12,9 @@ require packagegroup-sdk-gmae.inc
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-standalone-gmae-sdk-target"
+
 RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
     libglade-dev \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 08dd090..37e9a87 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -13,6 +13,9 @@ PACKAGES = "\
     ${PN}-core \
     "
 
+# For backwards compatibility after rename
+RPROVIDES_${PN}-core = "task-core-clutter-core"
+
 SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
     clutter-1.8 \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 6d92a38..d6c2985 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -4,6 +4,9 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-gtk-directfb-base"
+
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN} = " \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 75574c1..ebae741 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -5,6 +5,9 @@ PR = "r0"
 
 inherit packagegroup
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-x11-mini task-core-x11-base"
+
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 623a48f..ed13354 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -10,6 +10,9 @@ inherit packagegroup
 
 PACKAGES = "${PN}-demoapps"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN}-demoapps = "task-core-qt-demos"
+
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
 
 SUMMARY_${PN}-demoapps = "Qt demo applications"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 74ae7dd..042efb8 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -4,6 +4,9 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-qt4e-base"
+
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN} = " \
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index b3b84e2..5d781ae 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -12,6 +12,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "task-core-x11-sato"
+
 RDEPENDS_${PN} = "\
     ${PN}-base \
     ${PN}-apps \
-- 
1.7.9.5



