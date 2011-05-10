Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX6-0005qp-KG
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:29 +0200
Received: by rex (Postfix, from userid 1000)
	id 2CA9820C47; Tue, 10 May 2011 15:00:39 +0100 (BST)
Message-Id: <6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 12:53:25 +0100
Date: Tue, 10 May 2011 15:00:39 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
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
X-List-Received-Date: Tue, 10 May 2011 14:03:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These are the minimal defaults to allow OE-Core to function standalone with
no distro set and are constucted such that the distro can either override values,
or totally replace the include file entirely as needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                            |    3 +
 meta/conf/distro/include/default-providers.inc    |   34 ++++++++++++
 meta/conf/distro/include/default-versions.inc     |   18 ++++++
 meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
 meta/conf/distro/poky.conf                        |   59 +--------------------
 5 files changed, 56 insertions(+), 85 deletions(-)
 create mode 100644 meta/conf/distro/include/default-providers.inc
 create mode 100644 meta/conf/distro/include/default-versions.inc
 delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4a1bfa1..d843e70 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -627,6 +627,9 @@ include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
+include conf/distro/include/default-providers.inc
+include conf/distro/include/default-versions.inc
+include conf/distro/include/world-broken.inc
 include conf/distro/${DISTRO}.conf
 include conf/documentation.conf
 require conf/sanity.conf
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
new file mode 100644
index 0000000..d51ac64
--- /dev/null
+++ b/meta/conf/distro/include/default-providers.inc
@@ -0,0 +1,34 @@
+#
+# Default virtual providers
+#
+PREFERRED_PROVIDER_virtual/db ?= "db"
+PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
+PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
+
+#
+# Default virtual runtime providers
+#
+VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
+
+#
+# Default recipe providers
+#
+PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
+PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
+PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
+PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
+PREFERRED_PROVIDER_libgcc ?= "libgcc"
+PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
+PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
+PREFERRED_PROVIDER_linux-libc-headers-nativesdk ?= "linux-libc-headers-nativesdk"
+PREFERRED_PROVIDER_matchbox-panel ?= "matchbox-panel-2"
+PREFERRED_PROVIDER_opkg ?= "opkg"
+PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
+PREFERRED_PROVIDER_opkg-nativesdk ?= "opkg-nativesdk"
+
diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
new file mode 100644
index 0000000..0abbd8f
--- /dev/null
+++ b/meta/conf/distro/include/default-versions.inc
@@ -0,0 +1,18 @@
+#
+# Default preferred versions
+#
+PULSEAUDIOVERSION ?= "0.9.22"
+PULSEAUDIOVERSION_arm ?= "0.9.15"
+PREFERRED_VERSION_pulseaudio ?= "${PULSEAUDIOVERSION}"
+
+# Force the python versions in one place
+PYTHON_BASEVERSION ?= "2.6"
+PREFERRED_VERSION_python ?= "2.6.6"
+PREFERRED_VERSION_python-native ?= "2.6.6"
+
+# Force the older version of liberation-fonts until we fix the fontforge issue
+PREFERRED_VERSION_liberation-fonts ?= "1.04"
+
+
+
+
diff --git a/meta/conf/distro/include/poky-fixed-revisions.inc b/meta/conf/distro/include/poky-fixed-revisions.inc
deleted file mode 100644
index 9486080..0000000
--- a/meta/conf/distro/include/poky-fixed-revisions.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-# Preferred Versions:
-#
-PREFERRED_VERSION_libmatchbox ?= "1.9"
-PREFERRED_VERSION_matchbox-theme-sato ?= "0.1"
-PREFERRED_VERSION_elfutils ?= "0.89"
-PREFERRED_VERSION_hal ?= "0.5.14"
-PREFERRED_VERSION_hal-info ?= "20091130"
-PREFERRED_VERSION_udev ?= "164"
-PREFERRED_VERSION_wpa-supplicant ?= "0.7.3"
-PREFERRED_VERSION_pseudo = "1.0"
-PREFERRED_VERSION_pseudo-native = "1.0"
-
-PULSEAUDIOVERSION ?= "0.9.22"
-PULSEAUDIOVERSION_arm ?= "0.9.15"
-PREFERRED_VERSION_pulseaudio ?= "${PULSEAUDIOVERSION}"
-
-# Force the python versions in one place
-PYTHON_BASEVERSION ?= "2.6"
-PREFERRED_VERSION_python ?= "2.6.6"
-PREFERRED_VERSION_python-native ?= "2.6.6"
-
-# Force the older version of liberation-fonts until we fix the fontforge issue
-PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
-
-
-
diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 37fde0f..2e9d327 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -1,5 +1,3 @@
-#@TYPE: Distribution#@NAME: Poky
-#@DESCRIPTION: Distribution configuration for the Yocto Project build by Poky
 
 DISTRO = "poky"
 DISTRO_NAME = "Yocto (Built by Poky 4.0)"
@@ -28,29 +26,8 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
 
 IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
 
-#IPK_FEED_URIS += " \
-#           upgrades##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/upgrades/ \
-#upgrades-${MACHINE}##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/upgrades/${MACHINE} \
-#            machine##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/machine/${MACHINE} \
-#               base##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/base/ \
-#               libs##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/libs/ \
-#            console##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/console \
-#              devel##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/devel"
-
-#RPM_FEED_URIS += " \
-#           upgrades##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/upgrades/ \
-#upgrades-${MACHINE}##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/upgrades/${MACHINE} \
-#            machine##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/machine/${MACHINE} \
-#               base##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/base/ \
-#               libs##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/libs/ \
-#            console##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/console \
-#              devel##http://openzaurus.org/official/unstable/${DISTRO_VERSION}/feed/devel"
-
 OEINCLUDELOGS = "yes"
 KERNEL_CONSOLE = "ttyS0"
-#DEBUG_OPTIMIZATION = "-O -g3"
-#DEBUG_BUILD = "1"
-#INHIBIT_PACKAGE_STRIP = "1"
 
 # Default to TARGETOS values for EABI on arm
 GLIBCTARGETOS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
@@ -67,39 +44,7 @@ SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
 
 CACHE = "${TMPDIR}/cache/${POKYMODE}-${POKYLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
 
-#
-# Preferred providers:
-#
-
-# Virtuals:
-PREFERRED_PROVIDER_virtual/db ?= "db"
-PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
-PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
-
-VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
-
-# Others:
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
-PREFERRED_PROVIDER_linux-libc-headers-nativesdk ?= "linux-libc-headers-nativesdk"
-PREFERRED_PROVIDER_libgcc ?= "libgcc"
-PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
-PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
-PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
-PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
-PREFERRED_PROVIDER_matchbox-panel ?= "matchbox-panel-2"
-PREFERRED_PROVIDER_opkg ?= "opkg"
-PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
-PREFERRED_PROVIDER_opkg-nativesdk ?= "opkg-nativesdk"
-
-PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
-
-require conf/distro/include/poky-fixed-revisions.inc
+
 require conf/distro/include/preferred-xorg-versions.inc
 
 PCMCIA_MANAGER ?= "pcmciautils"
@@ -148,8 +93,6 @@ COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
 
 BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
-require conf/distro/include/world-broken.inc
-
 PREMIRRORS ?= "\
 bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
 cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
-- 
1.7.4.1



