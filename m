Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266D-000284-Gb
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056467"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:31 -0800
Message-Id: <097825b03af8787d04835bd7c30a992485a28da7.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 13/13] distro_tracking: Account for updates and Manual Checking
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:06 -0000

Updates:

sqlite3
psmisc
boost
file
util-linux
tiff
mkfonddir
mkfontscale
libdrm
xf86-video-intel

Manual Checks:
libcheck
libcap
console-tools
zip
unzip
sysfsutils
less
usbutils
sysstat
cracklib
libexif
qemugl
glew
squashfs-tools
lsb

Fixup:
bzip2

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  106 ++++++++++----------
 1 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 686bdf7..1579450 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -528,10 +528,10 @@ RECIPE_INTEL_SECTION_pn-popt = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 
 RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
-RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.9"
-RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Nov 01, 2011"
-RECIPE_LAST_UPDATE_pn-sqlite3 = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Jan 09, 2012"
+RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.10"
+RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Jan 16, 2012"
+RECIPE_LAST_UPDATE_pn-sqlite3 = "Feb 27, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
@@ -559,7 +559,7 @@ RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
 RECIPE_LATEST_VERSION_pn-libcap = "2.22"
 RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
@@ -616,7 +616,7 @@ RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -1325,9 +1325,9 @@ RECIPE_MAINTAINER_pn-consolekit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-console-tools = "red"
 RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
-RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Jan 09, 2012"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
@@ -1366,17 +1366,17 @@ RECIPE_LAST_UPDATE_pn-pm-utils = "Nov 18, 2010"
 RECIPE_MAINTAINER_pn-pm-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psmisc = "red"
-RECIPE_LATEST_VERSION_pn-psmisc = "22.14"
-RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Jun 20, 2011"
-RECIPE_LAST_UPDATE_pn-psmisc = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Jan 09, 2012"
+RECIPE_LATEST_VERSION_pn-psmisc = "22.16"
+RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Feb 25, 2012"
+RECIPE_LAST_UPDATE_pn-psmisc = "Feb 27, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost = "yellow"
-RECIPE_LATEST_VERSION_pn-boost = "1.48.0"
-RECIPE_LATEST_RELEASE_DATE_pn-boost = "Nov 15, 2011"
-RECIPE_LAST_UPDATE_pn-boost = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-boost = "Jan 09, 2012"
+RECIPE_LATEST_VERSION_pn-boost = "1.49.0"
+RECIPE_LATEST_RELEASE_DATE_pn-boost = "Feb 24, 2012"
+RECIPE_LAST_UPDATE_pn-boost = "Feb 27, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "green"
@@ -1425,7 +1425,7 @@ RECIPE_INTEL_SECTION_pn-bzip2 = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bzip2 = "12 months"
 RECIPE_LATEST_RELEASE_DATE_pn-bzip2 = "Mar 01, 2008"
 RECIPE_COMMENTS_pn-bzip2 = "bzip2 license is 3-clause BSD plus an renaming clause"
-RECIPE_MANUAL_CHECK_DATE_pn-bzip = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-bzip2 = "May 24, 2011"
 
 RECIPE_STATUS_pn-portmap = "yellow"
 RECIPE_LAST_UPDATE_pn-portmap = "Aug 27, 2007"
@@ -1523,7 +1523,7 @@ RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Feb 26, 2012"
 RECIPE_COMMENTS_pn-sysfsutils = "No update on kernel.org"
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1576,7 +1576,7 @@ RECIPE_STATUS_pn-less = "green"
 RECIPE_LATEST_VERSION_pn-less = "444"
 RECIPE_LATEST_RELEASE_DATE_pn-less = "Jun 9, 2011"
 RECIPE_LAST_UPDATE_pn-less = "Dec 01, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-less = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1607,9 +1607,9 @@ RECIPE_LATEST_RELEASE_DATE_pn-findutils = "Jun 01, 2009"
 RECIPE_COMMENTS_pn-findutils = ""
 
 RECIPE_STATUS_pn-file = "green"
-RECIPE_LATEST_VERSION_pn-file = "5.15"
-RECIPE_LATEST_RELEASE_DATE_pn-file = "Sep 16, 2011"
-RECIPE_LAST_UPDATE_pn-file = "Feb 02, 2012"
+RECIPE_LATEST_VERSION_pn-file = "5.11"
+RECIPE_LATEST_RELEASE_DATE_pn-file = "Feb 21, 2012"
+RECIPE_LAST_UPDATE_pn-file = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
@@ -1617,7 +1617,7 @@ RECIPE_PATCH_pn-file+filesystems = "some other new magic data"
 RECIPE_INTEL_SECTION_pn-file = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-file = "1-3 months"
 RECIPE_COMMENTS_pn-file = "2-clause BSD"
-RECIPE_MANUAL_CHECK_DATE_pn-file = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-file = "Feb 27, 2012"
 
 RECIPE_STATUS_pn-rsync = "green"
 RECIPE_LAST_UPDATE_pn-rsync = "Jul 6, 2010"
@@ -1723,7 +1723,7 @@ RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Feb 26, 2012"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1734,7 +1734,7 @@ RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Feb 26, 2012"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1821,19 +1821,18 @@ RECIPE_INTEL_SECTION_pn-shared-mime-info = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "Feb 01, 2010"
 
 RECIPE_STATUS_pn-util-linux = "green"
-RECIPE_LATEST_VERSION_pn-util-linux = "2.20.1"
-RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "Nov 07, 2011"
-RECIPE_LAST_UPDATE_pn-util-linux = "Dec 27, 2011"
+RECIPE_LATEST_VERSION_pn-util-linux = "2.21"
+RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "Feb 24, 2012"
+RECIPE_LAST_UPDATE_pn-util-linux = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
-RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Dec 01, 2011"
-RECIPE_NO_UPDATE_REASON_pn-uti-linux ="2.21 is still RC1"
+RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Feb 27, 2012"
 
 RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
@@ -1878,7 +1877,7 @@ RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.3"
 RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Nov 27, 2011"
 RECIPE_LAST_UPDATE_pn-sysstat = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
@@ -1911,7 +1910,7 @@ RECIPE_STATUS_pn-cracklib="green"
 RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 RECIPE_LATEST_RELEASE_DATE_pn-cracklib = "Aug 29, 2010"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-openobex = "red"
@@ -1986,18 +1985,18 @@ RECIPE_LAST_UPDATE_pn-ubootchart = "Nov 6, 2007"
 RECIPE_MAINTAINER_pn-ubootchart = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootchart"
 
-RECIPE_STATUS_pn-tiff = "red"
-RECIPE_LATEST_VERSION_pn-tiff = "3.9.5"
-RECIPE_LAST_UPDATE_pn-tiff = "Jul 12, 2011"
+RECIPE_STATUS_pn-tiff = "green"
+RECIPE_LATEST_VERSION_pn-tiff = "4.0.1"
+RECIPE_LATEST_RELEASE_DATE_pn-eggdbus = "Feb 18, 2012"
+RECIPE_LAST_UPDATE_pn-tiff = "Feb 27, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Jul 12, 2011"
-RECIPE_NO_UPDATE_REASON_pn-tiff = "Wait until 4.0.0 releases"
 
 RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
 RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
 RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -3424,19 +3423,18 @@ RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
 
 RECIPE_STATUS_pn-mkfontdir="green" # no update needed
-RECIPE_LATEST_VERSION_pn-mkfontdir="1.0.5"
+RECIPE_LATEST_VERSION_pn-mkfontdir="1.0.7"
 RECIPE_NO_OF_PATCHES_pn-mkfontdir="0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mkfontdir="Oct 11, 2009"
-RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="Nov 7, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="Feb 10, 2012"
 RECIPE_INTEL_SECTION_pn-mkfontdir="graphic apps"
-RECIPE_LAST_UPDATE_pn-mkfontdir = "Jan 18, 2011"
+RECIPE_LAST_UPDATE_pn-mkfontdir = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-mkfontdir="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 
 RECIPE_STATUS_pn-mkfontscale="green" # no update needed
-RECIPE_LATEST_VERSION_pn-mkfontscale="1.0.9"
-RECIPE_LATEST_RELEASE_DATE_pn-mkfontscale="Jun 29, 2011"
-RECIPE_LAST_UPDATE_pn-mkfontscale = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-mkfontscale="1.10.0"
+RECIPE_LATEST_RELEASE_DATE_pn-mkfontscale="Feb 10, 2012"
+RECIPE_LAST_UPDATE_pn-mkfontscale = "Feb 27, 2012"
 RECIPE_NO_OF_PATCHES_pn-mkfontscale="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mkfontscale="10 monthes"
 RECIPE_INTEL_SECTION_pn-mkfontscale="graphic apps"
@@ -3559,7 +3557,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Feb 26, 2012"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
@@ -3696,9 +3694,9 @@ RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm="green" # no update needed
-RECIPE_LATEST_VERSION_pn-libdrm = "2.4.30"
-RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "Jan 06, 2012"
-RECIPE_LAST_UPDATE_pn-libdrm = "Feb 02, 2012"
+RECIPE_LATEST_VERSION_pn-libdrm = "2.4.31"
+RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "Feb 06, 2012"
+RECIPE_LAST_UPDATE_pn-libdrm = "Feb 27, 2012"
 RECIPE_NO_OF_PATCHES_pn-libdrm="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
@@ -3842,8 +3840,8 @@ RECIPE_MAINTAINER_pn-xf86-input-synaptics = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-intel = "red"
 DISTRO_PN_ALIAS_pn-xf86-video-intel = "Debian=xserver-xorg-video-intel Fedora=xorg-x11-drv-intel Mandriva=x11-driver-video-intel Meego=xorg-x11-drv-intel Ubuntu=xserver-xorg-video-intel"
-RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.17.0"
-RECIPE_LAST_UPDATE_pn-xf86-video-intel = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.18.0"
+RECIPE_LAST_UPDATE_pn-xf86-video-intel = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-xf86-video-intel = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-omapfb = "red"
@@ -5850,13 +5848,13 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
@@ -5882,7 +5880,7 @@ RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Feb 26, 2012"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 RECIPE_MAINTAINER_pn-lsb = "Saul Wold <sgw@linux.intel.com>"
 
-- 
1.7.7.6



