Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1p-00046J-GK
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265310980"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:49 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:19 +0200
Message-Id: <7577b76ffd64fab0c814ed6ab986afb6e9415af5.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
Subject: [PATCH 3/7] alsa-utils: Pass udev-rules-dir as parameter
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
X-List-Received-Date: Mon, 17 Dec 2012 09:30:30 -0000

Fix the following warning:
WARNING: QA Issue: alsa-utils: Files/directories were installed but not shipped
  /lib
  /lib/udev
  /lib/udev/rules.d
  /lib/udev/rules.d/90-alsa-restore.rules

[YOCTO #3440]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index 597e8b6..4990eb0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb61570
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
 # please close bug and remove this comment when properly fixed
 #
-EXTRA_OECONF = "--disable-xmlto"
+EXTRA_OECONF = "--disable-xmlto --with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
 inherit autotools gettext
@@ -61,7 +61,7 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${nonarch_base_libdir}/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-- 
1.7.11.7



