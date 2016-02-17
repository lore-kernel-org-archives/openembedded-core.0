Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 63487731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 16:56:27 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 291EA2065A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:28 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute6.internal (MEProxy); Wed, 17 Feb 2016 11:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=yIukm0CWt+cuxaayKx4dplaSJVA=; b=VFUGb
	epHBZjlK3lCBs5iMgnUmzqDddPAmwpuEmXX1ZgVllDQVn1PaWGHNY9RffwKbSfEP
	4i2WGh8sko1xSmTAFai6PD4OGEVBs7cDpMOPkl8aae7CAnrvCuLCL48PkNzrWqVZ
	iCeicLvBTLBb0NN0VVT7VXBDut+aYyXuQFcx+I=
X-Sasl-enc: cjIagoHUIVyb738M3rOgR6Y0TzFM+Cvg+NWp2j4wCZtD 1455728187
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0F238C00012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:26 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 18:56:14 +0200
Message-Id: <bba8be4f916f363bbf0de130c1e95dda4d929a84.1455727967.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
Subject: [PATCH 2/4] alsa-utils: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Wed, 17 Feb 2016 16:56:27 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v1.1.0

This release introduces two new tools:
 - alsatplg for converting topology data from text representation to a
   binary format consumed by the kernel
 - alsabat; "bat" stands for "basic audio tester"

Backported a patch from upstream that renames bat to alsabat.

Rebased patch "0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch".

Dropped patches "alsa-utils-aplay-interrupt-signal-handling.patch" and
"assume-storing-is-success-if-not-sound-card-device.patch", because
the issues have been fixed upstream.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...ripts_1.0.29.bb => alsa-utils-scripts_1.1.0.bb} |   0
 ...1-alsabat-rename-to-avoid-naming-conflict.patch | 153 +++++++++++++++++++++
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |  20 +--
 ...lsa-utils-aplay-interrupt-signal-handling.patch |  48 -------
 ...oring-is-success-if-not-sound-card-device.patch |  34 -----
 .../{alsa-utils_1.0.29.bb => alsa-utils_1.1.0.bb}  |  15 +-
 6 files changed, 175 insertions(+), 95 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.0.29.bb => alsa-utils-scripts_1.1.0.bb} (100%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-naming-conflict.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.29.bb => alsa-utils_1.1.0.bb} (85%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.0.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.0.29.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.0.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-naming-conflict.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-naming-conflict.patch
new file mode 100644
index 0000000..b6d7d4f
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-naming-conflict.patch
@@ -0,0 +1,153 @@
+From 28c29dece6c434e7d3d01e805555ba7ddf6fba65 Mon Sep 17 00:00:00 2001
+From: "Lu, Han" <han.lu@intel.com>
+Date: Wed, 3 Feb 2016 14:20:33 +0800
+Subject: [PATCH] alsabat: rename to avoid naming conflict
+
+alsa-utils as well as bareos-bat (as well a some Bacula packages)
+all contain a program called /usr/bin/bat, which causes conflicts on
+various distributions ("basic audio tester" vs "bareos administration
+tool"("bacula administration tool")).
+Rename to avoid conflict.
+
+Signed-off-by: Lu, Han <han.lu@intel.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream-Status: Accepted [expected in version 1.1.1]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ bat/Makefile.am          | 10 +++++-----
+ bat/{bat.1 => alsabat.1} | 43 ++++++++++++++++++++++---------------------
+ bat/bat.c                |  2 +-
+ 3 files changed, 28 insertions(+), 27 deletions(-)
+ rename bat/{bat.1 => alsabat.1} (72%)
+
+diff --git a/bat/Makefile.am b/bat/Makefile.am
+index 842ae6b..985f00c 100644
+--- a/bat/Makefile.am
++++ b/bat/Makefile.am
+@@ -1,9 +1,9 @@
+-bin_PROGRAMS = bat
+-man_MANS = bat.1
++bin_PROGRAMS = alsabat
++man_MANS = alsabat.1
+ 
+-EXTRA_DIST = bat.1
++EXTRA_DIST = alsabat.1
+ 
+-bat_SOURCES = \
++alsabat_SOURCES = \
+ 	bat.c \
+ 	common.c \
+ 	analyze.c \
+@@ -21,4 +21,4 @@ noinst_HEADERS = \
+ AM_CPPFLAGS = \
+ 	      -Wall -I$(top_srcdir)/include
+ 
+-bat_LDADD = @FFTW_LIB@
++alsabat_LDADD = @FFTW_LIB@
+diff --git a/bat/bat.1 b/bat/alsabat.1
+similarity index 72%
+rename from bat/bat.1
+rename to bat/alsabat.1
+index e00fc27..8d0b9c0 100644
+--- a/bat/bat.1
++++ b/bat/alsabat.1
+@@ -1,23 +1,23 @@
+-.TH BAT 1 "20th October 2015"
++.TH ALSABAT 1 "20th October 2015"
+ .SH NAME
+-bat \- command\-line sound tester for ALSA sound card driver
++alsabat \- command\-line sound tester for ALSA sound card driver
+ 
+ .SH SYNOPSIS
+-\fBbat\fP [\fIflags\fP]
++\fBalsabat\fP [\fIflags\fP]
+ 
+ .SH DESCRIPTION
+-\fBBAT(Basic Audio Tester)\fP is a simple command\-line utility intended
+-to help automate audio driver and sound server testing with little human
+-interaction. BAT can be used to test audio quality, stress test features
+-and test audio before and after PM state changes.
++\fBALSABAT(ALSA Basic Audio Tester)\fP is a simple command\-line utility
++intended to help automate audio driver and sound server testing with little
++human interaction. ALSABAT can be used to test audio quality, stress test
++features and test audio before and after PM state changes.
+ 
+-BAT's design is relatively simple. BAT plays an audio stream and captures
+-the same stream in either a digital or analog loop back. It then compares
+-the captured stream using a FFT to the original to determine if the test
+-case passes or fails.
++ALSABAT's design is relatively simple. ALSABAT plays an audio stream and
++captures the same stream in either a digital or analog loop back. It then
++compares the captured stream using a FFT to the original to determine if
++the test case passes or fails.
+ 
+-BAT can either run wholly on the target machine being tested (standalone
+-mode) or can run as a client/server mode where by bat client runs on the
++ALSABAT can either run wholly on the target machine being tested (standalone
++mode) or can run as a client/server mode where by alsabat client runs on the
+ target and runs as a server on a separate tester machine. The client/server
+ mode still requires some manual interaction for synchronization, but this
+ is actively being developed for future releases.
+@@ -93,8 +93,8 @@ Frequencies with amplitude larger than threshold will be recognized as a
+ peak, and the frequency with largest peak value will be recognized as a
+ detected frequency.
+ .br
+-BAT then compares the detected frequency to target frequency, to decide
+-if the detecting passes or fails.
++ALSABAT then compares the detected frequency to target frequency, to
++decide if the detecting passes or fails.
+ .br
+ The default value is 3.0.
+ .TP
+@@ -117,18 +117,19 @@ Target WAV file to save capture test content.
+ .TP
+ \fI\-\-local\fP
+ Internal loopback mode.
+-Playback, capture and analysis internal to BAT only. This is intended for
+-developers to test new BAT features as no audio is routed outside of BAT.
++Playback, capture and analysis internal to ALSABAT only. This is intended
++for developers to test new ALSABAT features as no audio is routed outside
++of ALSABAT.
+ 
+ .SH EXAMPLES
+ 
+ .TP
+-\fBbat \-P plughw:0,0 \-C plughw:0,0 \-c 2 \-f S32_LE \-F 250\fR
++\fBalsabat \-P plughw:0,0 \-C plughw:0,0 \-c 2 \-f S32_LE \-F 250\fR
+ Generate and play a sine wave of 250 Hertz with 2 channel and S32_LE format,
+ and then capture and analyze.
+ 
+ .TP
+-\fBbat \-P plughw:0,0 \-C plughw:0,0 \-\-file 500Hz.wav\fR
++\fBalsabat \-P plughw:0,0 \-C plughw:0,0 \-\-file 500Hz.wav\fR
+ Play the RIFF WAV file "500Hz.wav" which contains 500 Hertz waveform LPCM
+ data, and then capture and analyze.
+ 
+@@ -152,7 +153,7 @@ Currently only support RIFF WAV format with PCM data. Please report any bugs to
+ the alsa-devel mailing list.
+ 
+ .SH AUTHOR
+-\fBbat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bernard Gautier
+-<bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.
++\fBalsabat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bernard
++Gautier <bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.
+ This document is by Liam Girdwood <liam.r.girdwood@linux.intel.com> and Han Lu
+ <han.lu@intel.com>.
+diff --git a/bat/bat.c b/bat/bat.c
+index 086b9fa..ddb60b7 100644
+--- a/bat/bat.c
++++ b/bat/bat.c
+@@ -272,7 +272,7 @@ static void test_capture(struct bat *bat)
+ static void usage(struct bat *bat)
+ {
+ 	fprintf(bat->log,
+-_("Usage: bat [-options]...\n"
++_("Usage: alsabat [-options]...\n"
+ "\n"
+ "  -h, --help             this help\n"
+ "  -D                     pcm device for both playback and capture\n"
+-- 
+2.7.0
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index e99dd51..e578dfe 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -1,4 +1,4 @@
-From 43a56fa36a12f09ccd78b3cf5e6ae197fcab501f Mon Sep 17 00:00:00 2001
+From 8c3e0ef9625066c2bb67ee3d2b8cd37fd44eadac Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 29 Aug 2014 18:58:56 +0300
 Subject: [PATCH] alsactl: don't let systemd unit restore the volume when
@@ -12,16 +12,20 @@ Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+
+Rebased on 1.1.0.
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
  alsactl/Makefile.am             | 7 ++++---
  alsactl/alsa-restore.service.in | 1 +
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 47f06e9..b728c06 100644
+index cac8094..ff865dc 100644
 --- a/alsactl/Makefile.am
 +++ b/alsactl/Makefile.am
-@@ -43,9 +43,10 @@ install-data-hook:
+@@ -38,9 +38,10 @@ install-data-hook:
  endif
  
  edit = \
@@ -36,17 +40,17 @@ index 47f06e9..b728c06 100644
  
  alsa-state.service: alsa-state.service.in
 diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
-index 245a439..b017854 100644
+index 2884098..bac3ccc 100644
 --- a/alsactl/alsa-restore.service.in
 +++ b/alsactl/alsa-restore.service.in
-@@ -10,6 +10,7 @@ DefaultDependencies=no
+@@ -8,6 +8,7 @@ Description=Save/Restore Sound Card State
+ ConditionPathExists=!@daemonswitch@
+ ConditionPathExistsGlob=/dev/snd/control*
  After=alsa-state.service
- Before=shutdown.target
- Conflicts=shutdown.target
 +ConditionPathExists=@localstatedir@/lib/alsa/asound.state
  
  [Service]
  Type=oneshot
 -- 
-1.9.1
+2.7.0.rc3
 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch b/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
deleted file mode 100644
index 5df004a..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Pending
-
-aplay/arecord (alsa-utils v1.0.28) cannot interrupt streaming
-via CTRL-C. Fixed the issue by reverting buggy patches and
-properly handling 'in_aborting' flag in appropriate functions.
-
-Signed-off-by: Anant Agrawal <Anant_Agrawal@mentor.com>
-Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
-
---- a/aplay/aplay.c	2014-05-19 16:25:14.000000000 +0530
-+++ b/aplay/aplay.c	2014-05-20 15:17:14.364823007 +0530
-@@ -392,14 +392,22 @@
- 		putchar('\n');
- 	if (!quiet_mode)
- 		fprintf(stderr, _("Aborted by signal %s...\n"), strsignal(sig));
--	if (handle)
-+	if (stream == SND_PCM_STREAM_CAPTURE) {
-+		if (fmt_rec_table[file_type].end) {
-+			fmt_rec_table[file_type].end(fd);
-+			fd = -1;
-+		}
-+		stream = -1;
-+	}
-+	if (fd > 1) {
-+		close(fd);
-+		fd = -1;
-+	}
-+	if (handle && sig != SIGABRT) {
- 		snd_pcm_abort(handle);
--	if (sig == SIGABRT) {
--		/* do not call snd_pcm_close() and abort immediately */
- 		handle = NULL;
--		prg_exit(EXIT_FAILURE);
- 	}
--	signal(sig, signal_handler);
-+	prg_exit(EXIT_FAILURE);
- }
- 
- /* call on SIGUSR1 signal. */
-@@ -2096,7 +2104,7 @@
- 	ssize_t result = count, r;
- 	size_t size;
- 
--	while (count > 0) {
-+	while (count > 0 && !in_aborting) {
- 		size = count;
- 		if (size > chunk_bytes - buffer_pos)
- 			size = chunk_bytes - buffer_pos;
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch b/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
deleted file mode 100644
index 5309c4e..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-[PATCH] assume storing is success if not sound card device
-
-Upstream-Status: Pending
-
-Systemd will report failure when run alsa-*, if the machine has not the
-sound card. To void this annoyed message, alsa-restore/alsa-state ignore
-all the exit codes by prefixing "-" in ExecStart, like:
-
-   alsa-utils-1.0.29$ grep "=-" ./ -r|grep service.in
-   ./alsactl/alsa-restore.service.in:ExecStart=-@sbindir@/alsactl restore
-   ./alsactl/alsa-state.service.in:ExecStart=-@sbindir@/alsactl -s -n 19 -c rdaemon
-   ./alsactl/alsa-state.service.in:ExecStop=-@sbindir@/alsactl -s kill save_and_quit
-   lsa-utils-1.0.29$
-
-But alsa-store.service.in is missing, and better solution is to ignore
-the exit code 19 which means not sound card device, not all exit code
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- alsactl/alsa-store.service.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/alsactl/alsa-store.service.in b/alsactl/alsa-store.service.in
-index f1a56bb..68ca529 100644
---- a/alsactl/alsa-store.service.in
-+++ b/alsactl/alsa-store.service.in
-@@ -13,3 +13,4 @@ Before=shutdown.target
- Type=oneshot
- ExecStart=@sbindir@/alsactl store
- StandardOutput=syslog
-+SuccessExitStatus=0 19
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
similarity index 85%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
index 97fe4b2..af40488 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
@@ -8,17 +8,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
+PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftw"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
-           file://alsa-utils-aplay-interrupt-signal-handling.patch \
-           file://assume-storing-is-success-if-not-sound-card-device.patch \
+           file://0001-alsabat-rename-to-avoid-naming-conflict.patch \
           "
 
-SRC_URI[md5sum] = "6b289bf874c4c9a63f4b3973093dd404"
-SRC_URI[sha256sum] = "5160058f3e14483ced5de919dd473f93932059454530a9b7ef97dcabd6833e9b"
+SRC_URI[md5sum] = "b9d6102fbbd0b68040bb77023ed30c0c"
+SRC_URI[sha256sum] = "3b1c3135b76e14532d3dd23fb15759ddd7daf9ffbc183f7a9a0a3a86374748f1"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
@@ -32,7 +32,9 @@ inherit autotools gettext pkgconfig
 # ipk depends on them.
 
 ALSA_UTILS_PKGS = "\
+             ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'alsa-utils-alsabat', '', d)} \
              alsa-utils-alsamixer \
+             alsa-utils-alsatplg \
              alsa-utils-midi \
              alsa-utils-aplay \
              alsa-utils-amixer \
@@ -50,6 +52,8 @@ PACKAGES += "${ALSA_UTILS_PKGS}"
 RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
 
 FILES_${PN} = ""
+FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
+FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
 FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
 FILES_alsa-utils-amixer      = "${bindir}/amixer"
 FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
@@ -63,7 +67,8 @@ FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
 
-
+SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
+SUMMARY_alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
 SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
 SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
 SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
-- 
2.7.0


