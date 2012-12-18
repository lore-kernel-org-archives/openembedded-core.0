Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvtu-0006aP-3F
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:03:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889648"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:13 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:43 +0200
Message-Id: <b08c8dc29efa286f20a93883acba3fe84b415e88.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 3/7] alsa-utils: Pass udev-rules-dir as parameter
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
X-List-Received-Date: Tue, 18 Dec 2012 12:03:58 -0000

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



