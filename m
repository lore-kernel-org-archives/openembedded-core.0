Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.17643.1590940443271436944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JJXuwZ6D;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id q13so5422371edi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rz+MamEzoDjZ2ICd/XUQn+3E/9VUCRDqgZw5RkvWHXo=;
        b=JJXuwZ6DvmHbyBram4bYJYJBW6Rg0P/roZ/yklGF4CzoIJ8Bp4J23Rvt2mFW6i+v9n
         hZyTlkVqaHbYVinn4wNuYCV/LJOPwqRGG2uNC4MtWlWZMptOrd56Rce1wG6eeId7+BzU
         yySicQgaRhNgqweuj9bTtzFo5FyMm2KmpLwdhoLAjQ9V2PqKBgumIdlkdHvti+cHO/ww
         eE32Q5xfLRo9Mi1BGBCf4B/GRVZlDA9e/BGlT+S7F/ZpMBr9vDO8PtN/zRWZkIzCTL4z
         9sQ0mZrqkS8Me7z0PjdWIQZSwSc/nDx8HD1+CR7yZiadTAHPGH7wFQXmTHcen7az3UQf
         O/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rz+MamEzoDjZ2ICd/XUQn+3E/9VUCRDqgZw5RkvWHXo=;
        b=imVDbOb5iJvztddcCX/yslhOUf8opN7kca/yyUybPLR+9pMXU1cb9+MFJzhl9Hakfe
         fqIDlGhriHRvw1ugGcD5GYNYh2LWuNYbY7fRg10zSU92dMjpLnwS1iXWsZf6ckvFbimW
         Us0eAdTDN2rI84ykNo0cWnhMRZO/rZ9jpui0WIZdUUE+uVOxdSLywcD06uNq08/d96o1
         S8Nk2pMv06uxrN8O3bnyxuxDY4X1R5oUOUNS2X0I1yrIjiz5xPHD5MqT7QEwkSUPEz+6
         fs6PyKiRfjZsnN/wYTPgX/br1XtjyoBe1Iv8J74D+GSaVqWPBMZD/jIPsLJgSxV+hLKb
         yPvg==
X-Gm-Message-State: AOAM531kKZCjB3zNuraOoWj5uvNEBb2gDUmj3b5mKWVjM/GnAfUusgCr
	cibwAWRjx+uA8fMA7BADm5yKI+a0
X-Google-Smtp-Source: ABdhPJzmqRrqH0h/BgzCtK6R8zLlh2IVPaC4aL/UkoK/XhEm3PKNrjAt1YyBQdR2RaJWOI4+M+JBUg==
X-Received: by 2002:a05:6402:362:: with SMTP id s2mr1068765edw.337.1590940441265;
        Sun, 31 May 2020 08:54:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/70] alsa-utils: split the content into .inc
Date: Sun, 31 May 2020 17:52:23 +0200
Message-Id: <20200531155254.10283-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows including the .inc from alsa-utils-scripts
which unbreaks automated version updates.

Bump alsa-utils-scripts to 1.2.2 at the same time.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/alsa-utils-scripts_1.2.2.bb          |   2 +-
 meta/recipes-multimedia/alsa/alsa-utils.inc   | 105 +++++++++++++++++
 .../alsa/alsa-utils_1.2.2.bb                  | 106 +-----------------
 3 files changed, 107 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils.inc

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
index fef79d9c9c..048fef68a5 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
@@ -1,4 +1,4 @@
-require alsa-utils_${PV}.bb
+require alsa-utils.inc
 
 SUMMARY = "Shell scripts that show help info and create ALSA configuration files"
 PROVIDES = "alsa-utils-alsaconf"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
new file mode 100644
index 0000000000..8bbc5d3ef3
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -0,0 +1,105 @@
+SUMMARY = "ALSA sound utilities"
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
+DEPENDS = "alsa-lib ncurses libsamplerate0"
+
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
+SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
+SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
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
+            "
+
+PACKAGES += "${ALSA_UTILS_PKGS}"
+RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
+
+FILES_${PN} = ""
+ALLOW_EMPTY_alsa-utils = "1"
+FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
+FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
+FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
+FILES_alsa-utils-amixer      = "${bindir}/amixer"
+FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
+FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
+FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
+FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
+FILES_alsa-utils-iecset      = "${bindir}/iecset"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
+FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
+FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
+
+SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
+SUMMARY_alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
+SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
+SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
+SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
+SUMMARY_alsa-utils-speakertest  = "ALSA surround speaker test utility"
+SUMMARY_alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
+SUMMARY_alsa-utils-aconnect     = "ALSA sequencer connection manager"
+SUMMARY_alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
+SUMMARY_alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
+SUMMARY_alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
+SUMMARY_alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
+SUMMARY_alsa-utils-alsaloop     = "ALSA PCM loopback utility"
+SUMMARY_alsa-utils-alsaucm      = "ALSA Use Case Manager"
+
+RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
+
+do_install() {
+	autotools_do_install
+
+	# We don't ship this here because it requires a dependency on bash.
+	# See alsa-utils-scripts_${PV}.bb
+	rm ${D}${sbindir}/alsaconf
+	rm ${D}${sbindir}/alsa-info.sh
+	rm -f ${D}${sbindir}/alsabat-test.sh
+
+	# If udev is disabled, we told configure to install the rules
+	# in /unwanted, so we can remove them now. If udev is enabled,
+	# then /unwanted won't exist and this will have no effect.
+	rm -rf ${D}/unwanted
+}
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
index 8bbc5d3ef3..ff8945e5c7 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
@@ -1,105 +1 @@
-SUMMARY = "ALSA sound utilities"
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
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
-SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
-SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
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
-RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
-
-FILES_${PN} = ""
-ALLOW_EMPTY_alsa-utils = "1"
-FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
-FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
-FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
-FILES_alsa-utils-amixer      = "${bindir}/amixer"
-FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
-FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
-FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
-FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
-FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
-FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
-FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
-FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
-
-SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
-SUMMARY_alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
-SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
-SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
-SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
-SUMMARY_alsa-utils-speakertest  = "ALSA surround speaker test utility"
-SUMMARY_alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
-SUMMARY_alsa-utils-aconnect     = "ALSA sequencer connection manager"
-SUMMARY_alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
-SUMMARY_alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
-SUMMARY_alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
-SUMMARY_alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
-SUMMARY_alsa-utils-alsaloop     = "ALSA PCM loopback utility"
-SUMMARY_alsa-utils-alsaucm      = "ALSA Use Case Manager"
-
-RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
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
+require alsa-utils.inc
-- 
2.26.2

