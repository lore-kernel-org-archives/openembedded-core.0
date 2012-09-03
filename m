Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8G-0004vG-TJ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497188"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:29 +0100
Message-Id: <db4a2a413fc2e9062aead23d1d0745769ad52404.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/28] packagegroup-*: change to inherit from packagegroup.bbclass
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:54 -0000

Also clean out items already handled by that class (dev/dbg packages,
ALLOW_EMPTY, etc.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nativesdk-packagegroup-sdk-host.bb             |    5 ++---
 .../packagegroups/packagegroup-base.bb             |    2 --
 .../packagegroups/packagegroup-core-boot.bb        |   16 ++++++---------
 .../packagegroups/packagegroup-core-console.bb     |    8 +-------
 .../packagegroups/packagegroup-core-nfs.bb         |   10 +++-------
 .../packagegroups/packagegroup-core-sdk.bb         |    8 ++------
 .../packagegroup-core-ssh-dropbear.bb              |   12 ++---------
 .../packagegroups/packagegroup-core-ssh-openssh.bb |   12 ++---------
 .../packagegroup-core-standalone-sdk-target.bb     |    5 +++--
 .../packagegroups/packagegroup-core-tools-debug.bb |    8 +-------
 .../packagegroup-core-tools-profile.bb             |    8 +-------
 .../packagegroup-core-tools-testapps.bb            |    8 +-------
 .../packagegroups/packagegroup-cross-canadian.bb   |    6 +++---
 .../packagegroups/packagegroup-self-hosted.bb      |    4 ++--
 .../packagegroups/packagegroup-core-basic.bb       |   21 ++------------------
 .../packagegroups/packagegroup-core-lsb.bb         |   16 ++-------------
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    4 ++--
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    4 ++--
 .../packagegroups/packagegroup-core-clutter.bb     |   10 ++--------
 .../packagegroup-core-gtk-directfb.bb              |    6 ++----
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |    1 -
 .../packagegroups/packagegroup-core-qt.bb          |   11 +++-------
 meta/recipes-qt/packagegroups/packagegroup-qt4e.bb |    6 ++----
 .../packagegroup-qte-toolchain-target.bb           |    5 ++++-
 .../packagegroups/packagegroup-core-x11-mini.bb    |    8 +-------
 .../packagegroups/packagegroup-core-x11-sato.bb    |    8 +-------
 .../packagegroups/packagegroup-core-x11.bb         |   10 ++--------
 27 files changed, 54 insertions(+), 168 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index ea054bc..ef05004 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -5,14 +5,13 @@
 DESCRIPTION = "Host packages for the standalone SDK or external toolchain"
 PR = "r11"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit nativesdk
+inherit nativesdk packagegroup
 
-PACKAGES = "${PN}"
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 85acd1f..7e2bd69 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -40,8 +40,6 @@ PACKAGES = ' \
             \
             '
 
-ALLOW_EMPTY = "1"
-
 #
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 7e80fff..b49fb3f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -6,11 +6,13 @@ DESCRIPTION = "Task for OpenedHand Poky - minimal bootable image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
-ALLOW_EMPTY = "1"
 PR = "r9"
 
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 #
 # Set by the machine configuration with packages essential for device bootup
 #
@@ -24,13 +26,7 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-PACKAGES = "\
-    packagegroup-core-boot \
-    packagegroup-core-boot-dbg \
-    packagegroup-core-boot-dev \
-"
-
-RDEPENDS_packagegroup-core-boot = "\
+RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
     busybox \
@@ -45,5 +41,5 @@ RDEPENDS_packagegroup-core-boot = "\
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-RRECOMMENDS_packagegroup-core-boot = "\
+RRECOMMENDS_${PN} = "\
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-console.bb b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
index fd8eb25..63003d0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-console.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
@@ -8,16 +8,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r35"
 
-PACKAGES = "\
-    packagegroup-core-apps-console \
-    packagegroup-core-apps-console-dbg \
-    packagegroup-core-apps-console-dev \
-    "
+inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ALLOW_EMPTY = "1"
-
 SPLASH ?= "psplash"
 
 RDEPENDS_packagegroup-core-apps-console = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 4b1059c..8b2318e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -8,15 +8,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
-PACKAGES = "\
-    packagegroup-core-nfs-server \
-    packagegroup-core-nfs-server-dbg \
-    packagegroup-core-nfs-server-dev \
-    "
+inherit packagegroup
 
-ALLOW_EMPTY = "1"
+PACKAGES = "${PN}-server"
 
-RDEPENDS_packagegroup-core-nfs-server = "\
+RDEPENDS_${PN}-server = "\
     nfs-utils \
     nfs-utils-client \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 663f705..4ee802f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -9,13 +9,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 DEPENDS = "packagegroup-core-console"
 PR = "r8"
 
-ALLOW_EMPTY = "1"
-#PACKAGEFUNCS =+ 'generate_sdk_pkgs'
+inherit packagegroup
 
-PACKAGES = "\
-    packagegroup-core-sdk \
-    packagegroup-core-sdk-dbg \
-    packagegroup-core-sdk-dev"
+#PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
 RDEPENDS_packagegroup-core-sdk = "\
     autoconf \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 9dcc342..a07e2ba 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,14 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r0"
 
-PACKAGES = "\
-    packagegroup-core-ssh-dropbear \
-    packagegroup-core-ssh-dropbear-dbg \
-    packagegroup-core-ssh-dropbear-dev \
-    "
+inherit packagegroup
 
-ALLOW_EMPTY = "1"
-
-RDEPENDS_packagegroup-core-ssh-dropbear = "dropbear"
-RDEPENDS_packagegroup-core-ssh-dropbear-dbg = "dropbear-dbg"
-RDEPENDS_packagegroup-core-ssh-dropbear-dev = "dropbear-dev"
+RDEPENDS_${PN} = "dropbear"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 7e85b29..89f8c93 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -4,14 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r0"
 
-PACKAGES = "\
-    packagegroup-core-ssh-openssh \
-    packagegroup-core-ssh-openssh-dbg \
-    packagegroup-core-ssh-openssh-dev \
-    "
+inherit packagegroup
 
-ALLOW_EMPTY = "1"
-
-RDEPENDS_packagegroup-core-ssh-openssh = "openssh"
-RDEPENDS_packagegroup-core-ssh-openssh-dbg = "openssh-dbg"
-RDEPENDS_packagegroup-core-ssh-openssh-dev = "openssh-dev"
+RDEPENDS_${PN} = "openssh"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 03628a1..4099d45 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -3,9 +3,10 @@ PR = "r7"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-ALLOW_EMPTY = "1"
 
-PACKAGES = "${PN} ${PN}-dbg"
+inherit packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
     libgcc \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index b7eff21..be424a3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -7,18 +7,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PACKAGES = "\
-    ${PN} \
-    ${PN}-dbg \
-    ${PN}-dev \
-    "
+inherit packagegroup
 
 PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ALLOW_EMPTY = "1"
-
 MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 30776ef..24a99c7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -7,16 +7,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PACKAGES = "\
-    ${PN} \
-    ${PN}-dbg \
-    ${PN}-dev \
-    "
+inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ALLOW_EMPTY = "1"
-
 RRECOMMENDS_${PN} = "\
     perf \
     trace-cmd \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index bdd0d05..52c278a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -7,16 +7,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PACKAGES = "\
-    ${PN} \
-    ${PN}-dbg \
-    ${PN}-dev \
-    "
+inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ALLOW_EMPTY = "1"
-
 # kexec-tools doesn't work on Mips
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 6ab4a95..8870ccc 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PR = "r0"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-inherit cross-canadian
 
-PACKAGES = "${PN}"
+inherit cross-canadian packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
     binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 118ff7d..7567457 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -8,6 +8,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit packagegroup
+
 PACKAGES = "\
     packagegroup-self-hosted \
     packagegroup-self-hosted-debug \
@@ -17,8 +19,6 @@ PACKAGES = "\
     packagegroup-self-hosted-host-tools \
     "
 
-ALLOW_EMPTY = "1"
-
 RDEPENDS_packagegroup-self-hosted = "\
     packagegroup-self-hosted-debug \
     packagegroup-self-hosted-sdk \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index a7e3eb7..95edd78 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -8,38 +8,21 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit packagegroup
+
 PACKAGES = "\
     packagegroup-core-basic \
     packagegroup-core-base-utils \
-    packagegroup-core-base-utils-dbg \
-    packagegroup-core-base-utils-dev \
     packagegroup-core-basic-libs \
-    packagegroup-core-basic-libs-dbg \
-    packagegroup-core-basic-libs-dev \
     packagegroup-core-basic-utils \
-    packagegroup-core-basic-utils-dbg \
-    packagegroup-core-basic-utils-dev \
     packagegroup-core-basic-extended \
-    packagegroup-core-basic-extended-dbg \
-    packagegroup-core-basic-extended-dev \
     packagegroup-core-dev-utils \
-    packagegroup-core-dev-utils-dbg \
-    packagegroup-core-dev-utils-dev \
     packagegroup-core-multiuser \
-    packagegroup-core-multiuser-dbg \
-    packagegroup-core-multiuser-dev \
     packagegroup-core-initscripts \
-    packagegroup-core-initscripts-dbg \
-    packagegroup-core-initscripts-dev \
     packagegroup-core-rpm \
-    packagegroup-core-rpm-dbg \
-    packagegroup-core-rpm-dev \
     packagegroup-core-sys-services \
-    packagegroup-core-sys-services-dbg \
-    packagegroup-core-sys-services-dev \
     "
 
-ALLOW_EMPTY = "1"
 
 RDEPENDS_packagegroup-core-basic = "\
     packagegroup-core-base-utils \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 984ed36..558db00 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -8,26 +8,16 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit packagegroup
+
 PACKAGES = "\
     packagegroup-core-lsb \
     packagegroup-core-sys-extended \
-    packagegroup-core-sys-extended-dbg \
-    packagegroup-core-sys-extended-dev \
     packagegroup-core-db \
-    packagegroup-core-db-dbg \
-    packagegroup-core-db-dev \
     packagegroup-core-misc \
-    packagegroup-core-misc-dbg \
-    packagegroup-core-misc-dev \
     packagegroup-core-perl \
-    packagegroup-core-perl-dbg \
-    packagegroup-core-perl-dev \
     packagegroup-core-python \
-    packagegroup-core-python-dbg \
-    packagegroup-core-python-dev \
     packagegroup-core-tcl \
-    packagegroup-core-tcl-dbg \
-    packagegroup-core-tcl-dev \
     packagegroup-core-lsb-perl-add \
     packagegroup-core-lsb-python-add \
     packagegroup-core-lsb-graphic-add \
@@ -36,8 +26,6 @@ PACKAGES = "\
     "
 
 
-ALLOW_EMPTY = "1"
-
 RDEPENDS_packagegroup-core-lsb = "\
     packagegroup-core-sys-extended \
     packagegroup-core-db \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index a00ca36..45cffa4 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r12"
 
-ALLOW_EMPTY = "1"
+inherit packagegroup
 
 require packagegroup-sdk-gmae.inc
 
-PACKAGES = "${PN}"
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 3b2abdd..79b3253 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r14"
 
-ALLOW_EMPTY = "1"
+inherit packagegroup
 
 require packagegroup-sdk-gmae.inc
 
-PACKAGES = "${PN} ${PN}-dbg"
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 039f5c6..d6ac4f3 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -9,20 +9,14 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r4"
 
+inherit packagegroup
+
 PACKAGES = "\
     packagegroup-core-clutter-core \
-    packagegroup-core-clutter-core-dbg \
-    packagegroup-core-clutter-core-dev \
     packagegroup-core-clutter-apps \
-    packagegroup-core-clutter-apps-dbg \
-    packagegroup-core-clutter-apps-dev \
     packagegroup-core-clutter-tests \
-    packagegroup-core-clutter-tests-dbg \
-    packagegroup-core-clutter-tests-dev \
     "
 
-ALLOW_EMPTY = "1"
-
 RDEPENDS_packagegroup-core-clutter-core = "\
     clutter-1.8 \
     clutter-gst-1.8 \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 8609013..0c47b6f 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit packagegroup
 
-TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+PACKAGES = "${PN}-base"
 
-PACKAGES += " \
-	${PN}-base \
-"
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN}-base = " \
 		directfb \
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
index 1c53a9c..a3c275f 100644
--- a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
@@ -2,6 +2,5 @@ require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
 
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
 
 RDEPENDS_${PN} += "nativesdk-qt4-tools"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 4fe07c6..ec5e94b 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -8,15 +8,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r3"
 
-PACKAGES = "\
-    packagegroup-core-qt-demos \
-    packagegroup-core-qt-demos-dbg \
-    packagegroup-core-qt-demos-dev \
-    "
+inherit packagegroup
 
-ALLOW_EMPTY = "1"
+PACKAGES = "${PN}-demos"
 
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
-#QTDEMOS_disabled = "fotowall"
 
-RDEPENDS_packagegroup-core-qt-demos = "${QTDEMOS}"
+RDEPENDS_${PN}-demos = "${QTDEMOS}"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
index 4b6d6a7..2ee7959 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit packagegroup
 
-TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+PACKAGES = "${PN}-base"
 
-PACKAGES += " \
-	${PN}-base \
-"
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN}-base = " \
 	qt4-embedded \
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
index abd6a1f..61466d9 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -1,12 +1,15 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
-ALLOW_EMPTY = "1"
 
 PR = "r5"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
 RDEPENDS_${PN} += " \
         packagegroup-core-standalone-sdk-target \
         qt4-embedded-mkspecs \
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
index 4f3bb47..432d99d 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
@@ -8,18 +8,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
-PACKAGES = "\
-    packagegroup-core-x11-mini \
-    packagegroup-core-x11-mini-dbg \
-    packagegroup-core-x11-mini-dev \
-    "
+inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
-ALLOW_EMPTY = "1"
-
 ROOTLESS_X = "1"
 
 # xserver-common, x11-common
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 380584e..f38e0d2 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -8,16 +8,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r32"
 
-PACKAGES = "\
-    packagegroup-core-x11-sato \
-    packagegroup-core-x11-sato-dbg \
-    packagegroup-core-x11-sato-dev \
-    "
+inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ALLOW_EMPTY = "1"
-
 NETWORK_MANAGER ?= "connman-gnome"
 NETWORK_MANAGER_libc-uclibc = ""
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
index 4c16c46..3fe5cae 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
@@ -8,24 +8,18 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r36"
 
+inherit packagegroup
+
 PACKAGES = "\
     packagegroup-core-apps-x11-core \
-    packagegroup-core-apps-x11-core-dbg \
-    packagegroup-core-apps-x11-core-dev \
     packagegroup-core-apps-x11-games \
-    packagegroup-core-apps-x11-games-dbg \
-    packagegroup-core-apps-x11-games-dev \
     packagegroup-core-x11-base \
-    packagegroup-core-x11-base-dbg \
-    packagegroup-core-x11-base-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
-ALLOW_EMPTY = "1"
-
 # pcmanfm doesn't work on mips/powerpc
 FILEMANAGER ?= "pcmanfm"
 FILEMANAGER_mips ?= ""
-- 
1.7.9.5



