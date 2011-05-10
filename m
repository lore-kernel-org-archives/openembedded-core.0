Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX9-0005rA-Oe
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:32 +0200
Received: by rex (Postfix, from userid 1000)
	id D3DDD20D44; Tue, 10 May 2011 15:00:40 +0100 (BST)
Message-Id: <2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 14:41:05 +0100
Date: Tue, 10 May 2011 15:00:40 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Tue, 10 May 2011 14:03:32 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf              |    1 +
 meta/conf/distro/include/default-distrovars.inc |   43 ++++++++++++++++++++
 meta/conf/distro/poky.conf                      |   48 +----------------------
 3 files changed, 46 insertions(+), 46 deletions(-)
 create mode 100644 meta/conf/distro/include/default-distrovars.inc

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index af5ef7b..8da6c0a 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,5 +1,6 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
+include conf/distro/include/default-distrovars.inc
 include conf/distro/include/world-broken.inc
 
 TARGET_VENDOR ?= "-oecore"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
new file mode 100644
index 0000000..ab26a30
--- /dev/null
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -0,0 +1,43 @@
+QA_LOGFILE = "${TMPDIR}/qa.log"
+
+IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
+
+OEINCLUDELOGS ?= "yes"
+KERNEL_CONSOLE ?= "ttyS0"
+
+require conf/distro/include/preferred-xorg-versions.inc
+
+PCMCIA_MANAGER ?= "pcmciautils"
+
+IMAGE_LINGUAS ?= "en-us en-gb"
+LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
+ENABLE_BINARY_LOCALE_GENERATION ?= "1"
+LOCALE_UTF8_ONLY ?= "0"
+
+DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
+
+DISTRO_EXTRA_RDEPENDS += "task-core-boot"
+DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
+
+IMAGE_FEATURES ?= ""
+
+# This is a list of packages that are used by the build system to build the distribution, they are not
+# directly part of the distribution. 
+HOSTTOOLS_WHITELIST_GPLv3 ?= ""
+WHITELIST_GPLv3 ?= "less"
+LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc gcc-runtime" 
+
+# This is a list of packages that require a commercial license to ship
+# product. If shipped as part of an image these packages may have 
+# implications so they are disabled by default
+COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
+COMMERCIAL_AUDIO_PLUGINS ?= ""
+# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
+COMMERCIAL_VIDEO_PLUGINS ?= ""
+# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
+COMMERCIAL_QT ?= ""
+# COMMERCIAL_QT ?= "qmmp"
+# Set of common licenses used for license.bbclass
+COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
+
+BB_GENERATE_MIRROR_TARBALLS ??= "0"
diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 3a66a76..fd0a936 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -8,59 +8,13 @@ MAINTAINER = "Poky <poky@yoctoproject.org>"
 
 TARGET_VENDOR = "-poky"
 
-QA_LOGFILE = "${TMPDIR}/qa.log"
-
-IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
-
 LOCALCONF_VERSION = "1"
 
-OEINCLUDELOGS = "yes"
-KERNEL_CONSOLE = "ttyS0"
-
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
 SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
 
-require conf/distro/include/preferred-xorg-versions.inc
-
-PCMCIA_MANAGER ?= "pcmciautils"
-
-IMAGE_LINGUAS ?= "en-us en-gb"
-LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
-ENABLE_BINARY_LOCALE_GENERATION ?= "1"
-LOCALE_UTF8_ONLY = "0"
-
-DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
-
-POKY_EXTRA_RDEPENDS = "task-core-boot"
-
-DISTRO_EXTRA_RDEPENDS += "${POKY_EXTRA_RDEPENDS}"
-DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
-
-IMAGE_FEATURES ?= ""
-
 EXTRAOPKGCONFIG = "poky-feed-config-opkg"
 
-# This is a list of packages that are used by poky to build the distribution, they are not
-# directly part of the distribution. 
-HOSTTOOLS_WHITELIST_GPLv3 ?= ""
-WHITELIST_GPLv3 ?= "less"
-LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc gcc-runtime" 
-
-# This is a list of packages that require a commercial license to ship
-# product. If shipped as part of an image these packages may have 
-# implications so they are disabled by default
-COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
-COMMERCIAL_AUDIO_PLUGINS ?= ""
-# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-COMMERCIAL_VIDEO_PLUGINS ?= ""
-# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
-COMMERCIAL_QT ?= ""
-# COMMERCIAL_QT ?= "qmmp"
-# Set of common licenses used for license.bbclass
-COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
-
-BB_GENERATE_MIRROR_TARBALLS ??= "0"
-
 QEMU_TARGETS ?= "arm i386 mips mipsel ppc x86_64"
 # Other QEMU_TARGETS "mips64 mips64el sh4"
 
@@ -79,3 +33,5 @@ ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
 http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
 https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"
 
+
+
-- 
1.7.4.1



