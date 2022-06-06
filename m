Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31293C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.31132.1654516902782616671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WyQEL7AK;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id q26so9187958wra.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GAcwu5nbMwK8cDfC6lnFm5Lht1mRYKy6J799/UojQa4=;
        b=WyQEL7AKFvDnoD7j4b9Z5ajUnrSu829ZOnFfC2YJFVYq1GwCvI9D2pvjVn2/9YtwUY
         YbwIb6HFq+t4fwdg7Z2V06bnXOiHw9bkGieE8jFNSKsEIG/Fj8FX5mrqE2gafVXDDs86
         AinW4z3u8CxopFhmDJo9Q5FXzV5CS3yMuH9VtL3l9kwf/752xhSiGVzlo7JL4PH227Gf
         nw1BBZpMgn1hYBKmw4DLl1ZblMSrN9rCVMRRYH/TaMSvM3J4F0FsZx0LbV/ilppZO8oD
         W6W9oaOwHkezXX5k3XcBYl169yrG2NGfaE9YwZ+9/2d2UjFJU/V8zAm8mTbcZjzpeCg4
         AlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GAcwu5nbMwK8cDfC6lnFm5Lht1mRYKy6J799/UojQa4=;
        b=MACyU35p+R8SDHoXKH7Htf1fYcn2q9m8lNoNDem+MLeVNToCuII1FG4odqevXHUjke
         tnYkbAabcM5puhcTxC1pb18ymL9uC2FSUg8kgsz3SwA7a/s4dh4o6jTIKetbXGdspnph
         I1q6uI45nKgeJW/zEcujEvbunB+52izpDAk4D/mjltbB/cDJl+OgIoh6VJbHZbrI8InO
         6L53K3X3U127CyB8s+/h4+NirquGFEeBzpSx3uLhX6w2YQ4gJ4KZg0IBCR3A014I5k43
         8syCK5yC349BAvMC638X75S+tMEaQQmqyPVWs3b95bfgFtC1PfP+rnUBALqvs0WL5Yst
         KsDA==
X-Gm-Message-State: AOAM533liPXqP613w1auH+0VN1QjWDS9grnaplXPySpMreBVzv+3XEoN
	iNGjQy8UDUuxrhERbPHDOpFbbnMIjtbfBg==
X-Google-Smtp-Source: 
 ABdhPJywJ/JJUc4GVXgUXc/2YArV2RzCUQzT74IyUcIWpRjkyo4etI/pztxhO1wQVTP6VJHeUKg1Cg==
X-Received: by 2002:adf:e2c9:0:b0:20c:dbc2:a411 with SMTP id
 d9-20020adfe2c9000000b0020cdbc2a411mr21009344wrj.391.1654516901381;
        Mon, 06 Jun 2022 05:01:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/21] alsa-utils-scripts: merge into alsa-utils
Date: Mon,  6 Jun 2022 14:01:18 +0200
Message-Id: <20220606120126.3381438-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166606

There is no reason to keep the recipe separate: bash dependency is not a
problem until the alsa-utils-scripts package is explicitly installed into a target image.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../alsa/alsa-utils-scripts_1.2.6.bb          |  25 ----
 meta/recipes-multimedia/alsa/alsa-utils.inc   | 108 ----------------
 .../alsa/alsa-utils_1.2.6.bb                  | 120 +++++++++++++++++-
 4 files changed, 119 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils.inc

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index de3fb7474c..6ab2ed9a9f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -38,7 +38,6 @@ RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael.opdenacker@bootli
 RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-utils-scripts = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb
deleted file mode 100644
index 000e984a7d..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require alsa-utils.inc
-
-SUMMARY = "Shell scripts that show help info and create ALSA configuration files"
-PROVIDES = "alsa-utils-alsaconf"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/alsa-utils:"
-
-PACKAGES = "${PN}"
-RDEPENDS:${PN} += "bash"
-
-FILES:${PN} = "${sbindir}/alsaconf \
-               ${sbindir}/alsa-info.sh \
-               ${sbindir}/alsabat-test.sh \
-              "
-
-S = "${WORKDIR}/alsa-utils-${PV}"
-
-do_install() {
-	install -d ${D}${sbindir}
-	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
-	install -m 0755 ${S}/alsa-info/alsa-info.sh ${D}${sbindir}/
-	if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'true', 'false', d)}; then
-		install -m 0755 ${S}/bat/alsabat-test.sh ${D}${sbindir}/
-	fi
-}
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
deleted file mode 100644
index bca7cdd3bd..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ /dev/null
@@ -1,108 +0,0 @@
-SUMMARY = "ALSA sound utilities"
-DESCRIPTION = "collection of small and often extremely powerful applications \
-designed to allow users to control the various parts of the ALSA system."
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
-SECTION = "console/utils"
-# Some parts are GPL-2.0-or-later, some are GPL-2.0-only (e.g. axfer, alsactl)
-# so result is GPL-2.0-only
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
-DEPENDS = "alsa-lib ncurses libsamplerate0"
-
-PACKAGECONFIG ??= "udev"
-
-# alsabat can be built also without fftw support (with reduced functionality).
-# It would be better to always enable alsabat, but provide an option for
-# enabling/disabling fftw. The configure script doesn't support that, however
-# (at least in any obvious way), so for now we only support alsabat with fftw
-# or no alsabat at all.
-PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
-
-PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,--with-udev-rules-dir=/unwanted/rules.d,udev"
-PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-
-# alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d"
-
-# On build machines with python-docutils (not python3-docutils !!) installed
-# rst2man (not rst2man.py) is detected and compile fails with
-# | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.
-# Avoid this by disabling expicitly
-EXTRA_OECONF = "--disable-rst2man"
-
-inherit autotools gettext pkgconfig manpages
-
-# This are all packages that we need to make. Also, the now empty alsa-utils
-# ipk depends on them.
-
-ALSA_UTILS_PKGS = "\
-             ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'alsa-utils-alsabat', '', d)} \
-             alsa-utils-alsamixer \
-             alsa-utils-alsatplg \
-             alsa-utils-midi \
-             alsa-utils-aplay \
-             alsa-utils-amixer \
-             alsa-utils-aconnect \
-             alsa-utils-iecset \
-             alsa-utils-speakertest \
-             alsa-utils-aseqnet \
-             alsa-utils-aseqdump \
-             alsa-utils-alsactl \
-             alsa-utils-alsaloop \
-             alsa-utils-alsaucm \
-            "
-
-PACKAGES += "${ALSA_UTILS_PKGS}"
-RDEPENDS:${PN} += "${ALSA_UTILS_PKGS}"
-
-FILES:${PN} = ""
-ALLOW_EMPTY:alsa-utils = "1"
-FILES:alsa-utils-alsabat     = "${bindir}/alsabat"
-FILES:alsa-utils-alsatplg    = "${bindir}/alsatplg"
-FILES:alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
-FILES:alsa-utils-amixer      = "${bindir}/amixer"
-FILES:alsa-utils-alsamixer   = "${bindir}/alsamixer"
-FILES:alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
-FILES:alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
-FILES:alsa-utils-aconnect    = "${bindir}/aconnect"
-FILES:alsa-utils-aseqnet     = "${bindir}/aseqnet"
-FILES:alsa-utils-iecset      = "${bindir}/iecset"
-FILES:alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
-FILES:alsa-utils-aseqdump    = "${bindir}/aseqdump"
-FILES:alsa-utils-alsaloop    = "${bindir}/alsaloop"
-FILES:alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
-
-SUMMARY:alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
-SUMMARY:alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
-SUMMARY:alsa-utils-aplay        = "Play (and record) sound files using ALSA"
-SUMMARY:alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
-SUMMARY:alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
-SUMMARY:alsa-utils-speakertest  = "ALSA surround speaker test utility"
-SUMMARY:alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
-SUMMARY:alsa-utils-aconnect     = "ALSA sequencer connection manager"
-SUMMARY:alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
-SUMMARY:alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
-SUMMARY:alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
-SUMMARY:alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
-SUMMARY:alsa-utils-alsaloop     = "ALSA PCM loopback utility"
-SUMMARY:alsa-utils-alsaucm      = "ALSA Use Case Manager"
-
-RRECOMMENDS:alsa-utils-alsactl = "alsa-states"
-
-do_install() {
-	autotools_do_install
-
-	# We don't ship this here because it requires a dependency on bash.
-	# See alsa-utils-scripts_${PV}.bb
-	rm ${D}${sbindir}/alsaconf
-	rm ${D}${sbindir}/alsa-info.sh
-	rm -f ${D}${sbindir}/alsabat-test.sh
-
-	# If udev is disabled, we told configure to install the rules
-	# in /unwanted, so we can remove them now. If udev is enabled,
-	# then /unwanted won't exist and this will have no effect.
-	rm -rf ${D}/unwanted
-}
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
index 3430288da4..6bb4e3158d 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
@@ -1,2 +1,120 @@
-require alsa-utils.inc
+SUMMARY = "ALSA sound utilities"
+DESCRIPTION = "collection of small and often extremely powerful applications \
+designed to allow users to control the various parts of the ALSA system."
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+SECTION = "console/utils"
+# Some parts are GPL-2.0-or-later, some are GPL-2.0-only (e.g. axfer, alsactl)
+# so result is GPL-2.0-only
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
+DEPENDS = "alsa-lib ncurses libsamplerate0"
 
+PACKAGECONFIG ??= "udev"
+
+# alsabat can be built also without fftw support (with reduced functionality).
+# It would be better to always enable alsabat, but provide an option for
+# enabling/disabling fftw. The configure script doesn't support that, however
+# (at least in any obvious way), so for now we only support alsabat with fftw
+# or no alsabat at all.
+PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
+
+PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,--with-udev-rules-dir=/unwanted/rules.d,udev"
+PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+
+# alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d"
+
+# On build machines with python-docutils (not python3-docutils !!) installed
+# rst2man (not rst2man.py) is detected and compile fails with
+# | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.
+# Avoid this by disabling expicitly
+EXTRA_OECONF = "--disable-rst2man"
+
+inherit autotools gettext pkgconfig manpages
+
+# This are all packages that we need to make. Also, the now empty alsa-utils
+# ipk depends on them.
+
+ALSA_UTILS_PKGS = "\
+             ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'alsa-utils-alsabat', '', d)} \
+             alsa-utils-alsamixer \
+             alsa-utils-alsatplg \
+             alsa-utils-midi \
+             alsa-utils-aplay \
+             alsa-utils-amixer \
+             alsa-utils-aconnect \
+             alsa-utils-iecset \
+             alsa-utils-speakertest \
+             alsa-utils-aseqnet \
+             alsa-utils-aseqdump \
+             alsa-utils-alsactl \
+             alsa-utils-alsaloop \
+             alsa-utils-alsaucm \
+             alsa-utils-scripts \
+            "
+
+PACKAGES += "${ALSA_UTILS_PKGS}"
+RDEPENDS:${PN} += "${ALSA_UTILS_PKGS}"
+
+FILES:${PN} = ""
+ALLOW_EMPTY:alsa-utils = "1"
+FILES:alsa-utils-alsabat     = "${bindir}/alsabat"
+FILES:alsa-utils-alsatplg    = "${bindir}/alsatplg"
+FILES:alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
+FILES:alsa-utils-amixer      = "${bindir}/amixer"
+FILES:alsa-utils-alsamixer   = "${bindir}/alsamixer"
+FILES:alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
+FILES:alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES:alsa-utils-aconnect    = "${bindir}/aconnect"
+FILES:alsa-utils-aseqnet     = "${bindir}/aseqnet"
+FILES:alsa-utils-iecset      = "${bindir}/iecset"
+FILES:alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES:alsa-utils-aseqdump    = "${bindir}/aseqdump"
+FILES:alsa-utils-alsaloop    = "${bindir}/alsaloop"
+FILES:alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
+FILES:alsa-utils-scripts     = "${sbindir}/alsaconf \
+               ${sbindir}/alsa-info.sh \
+               ${sbindir}/alsabat-test.sh \
+              "
+
+SUMMARY:alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
+SUMMARY:alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
+SUMMARY:alsa-utils-aplay        = "Play (and record) sound files using ALSA"
+SUMMARY:alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
+SUMMARY:alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
+SUMMARY:alsa-utils-speakertest  = "ALSA surround speaker test utility"
+SUMMARY:alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
+SUMMARY:alsa-utils-aconnect     = "ALSA sequencer connection manager"
+SUMMARY:alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
+SUMMARY:alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
+SUMMARY:alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
+SUMMARY:alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
+SUMMARY:alsa-utils-alsaloop     = "ALSA PCM loopback utility"
+SUMMARY:alsa-utils-alsaucm      = "ALSA Use Case Manager"
+SUMMARY:alsa-utils-scripts      = "Shell scripts that show help info and create ALSA configuration files"
+
+RRECOMMENDS:alsa-utils-alsactl = "alsa-states"
+
+do_install() {
+	autotools_do_install
+
+	install -d ${D}${sbindir}
+	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
+	install -m 0755 ${S}/alsa-info/alsa-info.sh ${D}${sbindir}/
+	if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'true', 'false', d)}; then
+		install -m 0755 ${S}/bat/alsabat-test.sh ${D}${sbindir}/
+	fi
+
+	# If udev is disabled, we told configure to install the rules
+	# in /unwanted, so we can remove them now. If udev is enabled,
+	# then /unwanted won't exist and this will have no effect.
+	rm -rf ${D}/unwanted
+}
+
+
+PROVIDES = "alsa-utils-alsaconf alsa-utils-scripts"
+
+RDEPENDS:${PN}-scripts += "bash"
-- 
2.30.2


