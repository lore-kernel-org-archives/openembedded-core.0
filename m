Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eballetbo@gmail.com>) id 1S9dwb-0007B3-1I
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 15:52:21 +0100
Received: by wera1 with SMTP id a1so5961463wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:43:29 -0700 (PDT)
Received: by 10.180.88.67 with SMTP id be3mr20337451wib.20.1332168209757;
	Mon, 19 Mar 2012 07:43:29 -0700 (PDT)
Received: from localhost.localdomain (249.Red-80-33-164.staticIP.rima-tde.net.
	[80.33.164.249])
	by mx.google.com with ESMTPS id n8sm41986361wix.10.2012.03.19.07.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:43:29 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2012 15:43:27 +0100
Message-Id: <1332168207-18894-1-git-send-email-eballetbo@iseebcn.com>
X-Mailer: git-send-email 1.7.1
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH] alsa-utils: move ${datadir}/init files to alsactl package.
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
X-List-Received-Date: Mon, 19 Mar 2012 14:52:21 -0000

The alsa-utils-speakertest contains some files from ${datadir} directory
that are not correct, the files from  ${datadir}/init directory should
be included in alsa-utils-alsactl package instead.

This patch moves the ${datadir}/init files to alsactl package and fixes
following error at boot stage:

  /usr/sbin/alsactl: parse:1655: Unable to open file '/usr/share/alsa/init/00main': No such file or directory

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index 879a117..fa11479 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -56,12 +56,12 @@ FILES_${PN} = ""
 FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
 FILES_alsa-utils-amixer      = "${bindir}/amixer"
 FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
-FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/"
+FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
 FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${base_libdir}/systemd ${localstatedir}/lib/alsa"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${base_libdir}/systemd ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-- 
1.7.1



