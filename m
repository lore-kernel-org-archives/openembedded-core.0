Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B723C4332F
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:55:22 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.8301.1653051314220056578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout08.t-online.de (Postfix) with SMTP id 4C30356E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 14:54:31 +0200 (CEST)
Received: from localhost.localdomain ([84.154.173.254]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ns29G-3AtqF70; Fri, 20 May 2022 14:54:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv3 1/3] allow to build more native packages
Date: Fri, 20 May 2022 14:54:17 +0200
Message-Id: <20220520125419.4115417-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653051270-0001606D-B5005B2E/0/0 CLEAN NORMAL
X-TOI-MSGID: cd28057f-ed4d-4b23-8c37-c17632e5c11b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:55:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165938

basically this would fix build for pipewire-native, libpam-native and ope=
nssh-native.
Hopefully without breaking things ;)
---
 .../openssh/openssh_9.0p1.bb                  |  2 +-
 meta/recipes-core/udev/eudev_3.2.11.bb        |  2 ++
 meta/recipes-extended/pam/libpam_1.5.2.bb     | 24 +++++++++++--------
 .../recipes-graphics/xorg-lib/libxv_1.0.11.bb |  1 +
 meta/recipes-multimedia/flac/flac_1.3.4.bb    |  1 +
 .../gstreamer1.0-plugins-base_1.20.1.bb       |  2 ++
 .../gstreamer/gstreamer1.0_1.20.1.bb          |  2 ++
 .../recipes-multimedia/libogg/libogg_1.3.5.bb |  2 ++
 .../libsamplerate/libsamplerate0_0.2.2.bb     |  2 ++
 .../libsndfile/libsndfile1_1.1.0.bb           |  2 ++
 .../libtheora/libtheora_1.1.1.bb              |  2 ++
 .../libvorbis/libvorbis_1.3.7.bb              |  2 ++
 .../iso-codes/iso-codes_4.9.0.bb              |  2 ++
 13 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.0p1.bb
index b63ea2b137..d2cf8a6cf8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -180,4 +180,4 @@ ALTERNATIVE_PRIORITY =3D "90"
 ALTERNATIVE:${PN}-scp =3D "scp"
 ALTERNATIVE:${PN}-ssh =3D "ssh"
=20
-BBCLASSEXTEND +=3D "nativesdk"
+BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/u=
dev/eudev_3.2.11.bb
index 841039f6d7..2c1c59b993 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -89,3 +89,5 @@ pkg_postinst:eudev-hwdb () {
 pkg_prerm:eudev-hwdb () {
         rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.2.bb
index 081986ef43..1b0bb0d51c 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -54,7 +54,7 @@ FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${ba=
se_libdir}/*.la ${base_libd
 FILES:${PN}-runtime =3D "${sysconfdir} ${sbindir} ${systemd_system_unitd=
ir}"
 FILES:${PN}-xtests =3D "${datadir}/Linux-PAM/xtests"
=20
-PACKAGES_DYNAMIC +=3D "^${MLPREFIX}pam-plugin-.*"
+PACKAGES_DYNAMIC:class-target +=3D "^${MLPREFIX}pam-plugin-.*"
=20
 def get_multilib_bit(d):
     baselib =3D d.getVar('baselib') or ''
@@ -65,23 +65,24 @@ libpam_suffix =3D "suffix${@get_multilib_bit(d)}"
 RPROVIDES:${PN} +=3D "${PN}-${libpam_suffix}"
 RPROVIDES:${PN}-runtime +=3D "${PN}-runtime-${libpam_suffix}"
=20
-RDEPENDS:${PN}-runtime =3D "${PN}-${libpam_suffix} \
+RDEPENDS:${PN}-xtests =3D "bash coreutils"
+
+RRECOMMENDS:${PN}-runtime =3D "${PN}-${libpam_suffix} \
+    ${PN}-runtime-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
     "
-RDEPENDS:${PN}-xtests =3D "${PN}-${libpam_suffix} \
+RRECOMMENDS:${PN}-xtests =3D "${PN}-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
-    bash coreutils"
+    "
=20
-# FIXME: Native suffix breaks here, disable it for now
-RRECOMMENDS:${PN} =3D "${PN}-runtime-${libpam_suffix}"
-RRECOMMENDS:${PN}:class-native =3D ""
+RRECOMMENDS:${PN} =3D "${PN}-runtime"
=20
 python populate_packages:prepend () {
     def pam_plugin_hook(file, pkg, pattern, format, basename):
@@ -148,6 +149,9 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/comm=
on-session
 	fi
+}
+
+do_install:append:class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}=
; then
 		install -d ${D}/${libdir}/
 		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
@@ -169,9 +173,7 @@ pkg_postinst:${PN}() {
 }
=20
 inherit features_check
-REQUIRED_DISTRO_FEATURES =3D "pam"
-
-BBCLASSEXTEND =3D "nativesdk native"
+REQUIRED_DISTRO_FEATURES:class-target =3D "pam"
=20
 CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-session"
 CONFFILES:${PN}-runtime +=3D "${sysconfdir}/pam.d/common-auth"
@@ -183,3 +185,5 @@ CONFFILES:${PN}-runtime +=3D "${sysconfdir}/security/=
limits.conf"
 UPSTREAM_CHECK_URI =3D "https://github.com/linux-pam/linux-pam/releases"
=20
 CVE_PRODUCT =3D "linux-pam"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb b/meta/recipe=
s-graphics/xorg-lib/libxv_1.0.11.bb
index 3c8bf08153..0eb8f97181 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
@@ -17,3 +17,4 @@ XORG_PN =3D "libXv"
 SRC_URI[md5sum] =3D "210b6ef30dda2256d54763136faa37b9"
 SRC_URI[sha256sum] =3D "d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4f=
f2a88db60cb0b088"
=20
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/flac/flac_1.3.4.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.3.4.bb
index 012da0a0a0..e177c90b0a 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.4.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.4.bb
@@ -43,3 +43,4 @@ FILES:libflac++ =3D "${libdir}/libFLAC++.so.*"
 FILES:liboggflac =3D "${libdir}/libOggFLAC.so.*"
 FILES:liboggflac++ =3D "${libdir}/libOggFLAC++.so.*"
=20
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.20.1.bb
index 0953261a98..b52a80d3e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.=
bb
@@ -92,3 +92,5 @@ def get_opengl_cmdline_list(switch_name, options, d):
         return ''
=20
 CVE_PRODUCT +=3D "gst-plugins-base"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
index 81b94928d9..fa5ec44a23 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
@@ -71,3 +71,5 @@ FILES:${PN}-dbg +=3D "${datadir}/gdb ${datadir}/gstream=
er-1.0/gdb"
 CVE_PRODUCT =3D "gstreamer"
=20
 PTEST_BUILD_HOST_FILES =3D ""
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb b/meta/recipe=
s-multimedia/libogg/libogg_1.3.5.bb
index b4f02e404c..87362cb6cf 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
@@ -15,3 +15,5 @@ SRC_URI[md5sum] =3D "3178c98341559657a15b185bf5d700a5"
 SRC_URI[sha256sum] =3D "c4d91be36fc8e54deae7575241e03f4211eb102afb3fc077=
5fbbc1b740016705"
=20
 inherit autotools pkgconfig
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.b=
b b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index ed2b6437dd..2ddbd411ee 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -24,3 +24,5 @@ inherit autotools pkgconfig
 # normal builds. It should be safe to ignore these, but explicitly disab=
ling
 # them adds some extra certainty that builds are deterministic.
 EXTRA_OECONF =3D "--disable-fftw --disable-alsa"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb b/me=
ta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
index 70626b3c16..85c11c7ca9 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
@@ -30,3 +30,5 @@ inherit autotools lib_package pkgconfig multilib_header
 do_install:append() {
     oe_multilib_header sndfile.h
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/=
recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 178e1a9240..45b5f5c358 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -20,3 +20,5 @@ UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+=
)\.(tar\.gz|tgz)"
 inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D "--disable-examples"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb b/meta/=
recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
index 023bce0abe..9b7e2d8ad6 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
@@ -17,3 +17,5 @@ SRC_URI[md5sum] =3D "50902641d358135f06a8392e61c9ac77"
 SRC_URI[sha256sum] =3D "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589=
d1b1e9d20f72954b"
=20
 inherit autotools pkgconfig
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb b/meta/rec=
ipes-support/iso-codes/iso-codes_4.9.0.bb
index f51edf09a4..f69e67961d 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
@@ -20,3 +20,5 @@ S =3D "${WORKDIR}/git"
 inherit allarch autotools
=20
 FILES:${PN} +=3D "${datadir}/xml/"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


