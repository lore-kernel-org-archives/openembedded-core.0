Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B435A7D2E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:48:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45lQ5T6T2Xz23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562917694;
	bh=D5kXC+LQmlbjp71jiDIqjd2/6g+BZ/PiWi63o5M/3Ms=;
	h=From:To:Subject:Date:From;
	b=FpVZRc+nvUPSrfHHaTwGq/xlPYYYIuhxdCCF9PQDRnYCxI48HlA0RWNBhzLbTU/ml
	KPEbyuHpZS9F9ZZ4/WJZ2WGnnHHlqssSJ2fhphmx3bhTFVTaqE4yNawikDBdHRN8M0
	3cJUiTHLahXyHnLdvjlD/O1j9SOqob9ySt5iTK7djh6fldOabfDfQ4xfC8Wl3r2VrZ
	M/4R3GAHZomM0ZqxrR1OtmAnhpxoryd9M8ptWXGSDEx7LfIRoLfAVWg1eS51cLna9b
	NouEOaE1s36aznBFyHHgdCS5UhR3Y3LLtM8sjIYNE4+v9nFRm/diiBKsC+okP8ADvu
	HcyzgFtShskdbe1Nc9WYdZEa5l3sM2XAf+FEv638UJlrdcgGpBjl48h7CVSYrgBI2R
	NTyaXvklS3AnrA7nwIFvWk0XoEhsdP4llplYsyDjNwdQINqfNPwVOG0BtyMaHx691f
	mkRYqQvyI9LqfEFiIyIcTQ1W8XCEPutEeVnQ2Iu6LJazZw7del7C/AM9IjqwQSOgRL
	SGOruDyA2mCaAtmEMlo0nJ3xhK1Ah1Yiw6G1fhvtEI6dh9+kadfdKY92NEoSEmO4Sz
	MTfh4R9+J7PX2GLvduix3yWWZ3ngjYT0d0gx1wKVqRl17N6IrSZaYGZwLNJ4dHo04U
	D/L3NdZf0Og3CAeUg88gvcm4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 10:48:13 +0300
Message-Id: <20190712074813.15131-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove remnants of bluez4 support
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
X-List-Received-Date: Fri, 12 Jul 2019 07:48:14 -0000

bluez4 was removed from meta-oe 2 years ago.

Simplfy the setup of the two level bluetooth and bluez4/bluez5
distro features by removing the bluez4/bluez5 distro features.

This also removes the no longer required bluetooth class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Documentation changes will be sent separately.
Users in meta-openembedded have already been fixed.
---
 meta/classes/bluetooth.bbclass                     | 14 --------------
 meta/conf/bitbake.conf                             |  2 +-
 meta/conf/distro/include/default-providers.inc     |  2 +-
 meta/recipes-connectivity/bluez5/bluez5_5.50.bb    |  2 --
 meta/recipes-connectivity/connman/connman.inc      |  4 ++--
 meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb |  4 ++--
 meta/recipes-connectivity/neard/neard_0.16.bb      |  4 ++--
 meta/recipes-connectivity/ofono/ofono.inc          |  4 ++--
 .../packagegroups/packagegroup-base.bb             |  4 +---
 meta/recipes-devtools/qemu/qemu.inc                |  4 ++--
 meta/recipes-devtools/strace/strace_4.26.bb        |  4 ++--
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb   |  4 ++--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  5 ++---
 13 files changed, 19 insertions(+), 38 deletions(-)
 delete mode 100644 meta/classes/bluetooth.bbclass

diff --git a/meta/classes/bluetooth.bbclass b/meta/classes/bluetooth.bbclass
deleted file mode 100644
index f88b4ae5b8..0000000000
--- a/meta/classes/bluetooth.bbclass
+++ /dev/null
@@ -1,14 +0,0 @@
-# Avoid code duplication in bluetooth-dependent recipes.
-
-# Define a variable that expands to the recipe (package) providing core
-# bluetooth support on the platform:
-# "" if bluetooth is not in DISTRO_FEATURES
-# else "bluez5" if bluez5 is in DISTRO_FEATURES
-# else "bluez4"
-
-# Use this with:
-#  inherit bluetooth
-#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
-#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
-
-BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5e93f5c223..140f45b895 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -839,7 +839,7 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 2be3378773..7d3be8f4e1 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -44,7 +44,7 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
-PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
+PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb b/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
index 66271432fe..4e443e5fb0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
@@ -1,7 +1,5 @@
 require bluez5.inc
 
-REQUIRED_DISTRO_FEATURES = "bluez5"
-
 SRC_URI[md5sum] = "8e35c67c81a55d3ad4c9f22280dae178"
 SRC_URI[sha256sum] = "5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ae67079c71..ee00479926 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit autotools pkgconfig systemd update-rc.d bluetooth update-alternatives
+inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 DEPENDS  = "dbus glib-2.0 ppp readline"
 
@@ -42,7 +42,7 @@ PACKAGECONFIG ??= "wispr \
 
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
+PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5, bluez5"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
index 78361561e6..77bc31af7e 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
 SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
 SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
 
-inherit autotools binconfig-disabled pkgconfig bluetooth
+inherit autotools binconfig-disabled pkgconfig
 
 BINCONFIG = "${bindir}/pcap-config"
 
@@ -29,7 +29,7 @@ EXTRA_OECONF = " \
                  "
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"
diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index cc6af4e1ca..7c124a3c0b 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 
-inherit autotools pkgconfig systemd update-rc.d bluetooth
+inherit autotools pkgconfig systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
@@ -40,7 +40,7 @@ RDEPENDS_${PN} = "dbus"
 
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS_${PN} = "\
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
                     "
 
diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index e1185c6e6b..03d0fd53a6 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 
-inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-introspection-data
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
 DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     "
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
+PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 
 EXTRA_OECONF += "--enable-test --enable-external-ell"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index d05403635c..1f802da09b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -7,7 +7,6 @@ PR = "r83"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
-inherit bluetooth
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
@@ -199,8 +198,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
 
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
-    ${BLUEZ} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', bb.utils.contains('BLUEZ', 'bluez4', 'libasound-module-bluez', '', d), '',d)} \
+    bluez5 \
     "
 
 RRECOMMENDS_packagegroup-base-bluetooth = "\
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ac475a8e2a..32379708e4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit pkgconfig bluetooth ptest
+inherit pkgconfig ptest
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -148,7 +148,7 @@ PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez5"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
 PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
 PACKAGECONFIG[virglrenderer] = "--enable-virglrenderer,--disable-virglrenderer,virglrenderer"
diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
index 3b61fc3eef..2688724e66 100644
--- a/meta/recipes-devtools/strace/strace_4.26.bb
+++ b/meta/recipes-devtools/strace/strace_4.26.bb
@@ -20,13 +20,13 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
 SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
 SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
 
-inherit autotools ptest bluetooth
+inherit autotools ptest
 
 PACKAGECONFIG_class-target ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
 
-PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
+PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
 EXTRA_OECONF += "--enable-mpers=no"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
index 5af01a37ce..f9289e92d2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gettext bluetooth gobject-introspection
+inherit gettext gobject-introspection
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
@@ -35,7 +35,7 @@ PACKAGECONFIG ??= " \
 # not add GL dependencies here, since these are taken care of in -base.
 
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
-PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez5"
 PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 9a95e7c65b..e245be7f77 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -61,7 +61,7 @@ DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
 DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
-inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages gsettings
+inherit autotools bash-completion pkgconfig useradd gettext perlnative systemd manpages gsettings
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
@@ -98,7 +98,7 @@ EXTRA_OECONF += "--without-fftw"
 # very good anyway, better alternatives exist (such as the webrtc canceller).
 EXTRA_OECONF += "--disable-adrian-aec"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x11', d)} \
@@ -106,7 +106,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
                    "
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[gconf] = "--enable-gconf,--disable-gconf,gconf"
 PACKAGECONFIG[gsettings] = "--enable-gsettings,--disable-gsettings,glib-2.0-native glib-2.0"
-- 
2.17.1


