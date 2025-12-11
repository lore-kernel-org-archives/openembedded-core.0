Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C5FD41D6D
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:56:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16058.1765475791870241545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42CEB1688
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2006E3F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/8] recipes: remove *.la from FILES for recipes using meson
Date: Thu, 11 Dec 2025 17:55:41 +0000
Message-ID: <20251211175547.3944470-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211175547.3944470-1-ross.burton@arm.com>
References: <20251211175547.3944470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227553

These recipes no longer use libtool to build libraries, so they don't
ship .la files anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.80.1.bb | 1 -
 meta/recipes-core/systemd/systemd_258.1.bb                  | 2 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb           | 3 +--
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc         | 1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc           | 2 +-
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index a4396af39b8..8bdbab03a6a 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -36,7 +36,6 @@ FILES:${PN} +=3D "\
                 ${datadir}/dbus-1/services/ \
                 ${systemd_user_unitdir} \
                 "
-FILES:${PN}-dev +=3D "${libdir}/gio/modules/libgio*.la"
 FILES:${PN}-staticdev +=3D "${libdir}/gio/modules/libgio*.a"
=20
 RDEPENDS:${PN}-ptest +=3D "bash"
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
index 68b22265f29..dcbd4d92f33 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -709,7 +709,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.home1.conf \
                "
=20
-FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
+FILES:${PN}-dev +=3D "${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/ma=
cros.systemd"
=20
 RDEPENDS:${PN} +=3D "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-=
linux-umount udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agett=
y util-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} +=3D "systemd-serialgetty"
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
index 08b72190ca5..dd30c1237d7 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
@@ -44,8 +44,7 @@ do_install:append() {
 }
=20
 FILES:${PN}-icu =3D "${libdir}/libharfbuzz-icu.so.*"
-FILES:${PN}-icu-dev =3D "${libdir}/libharfbuzz-icu.la \
-                       ${libdir}/libharfbuzz-icu.so \
+FILES:${PN}-icu-dev =3D "${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
 FILES:${PN}-subset =3D "${libdir}/libharfbuzz-subset.so.*"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index 0dece7bba3e..164eee8ffe2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -85,7 +85,6 @@ RDEPENDS:${PN}-xvfb +=3D "xkeyboard-config"
 RDEPENDS:${PN}-module-exa =3D "${PN} (=3D ${EXTENDPKGV})"
=20
 FILES:${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${l=
ibdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/x=
org/modules/input/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xor=
g/protocol.txt ${datadir}/X11/xorg.conf.d"
-FILES:${PN}-dev +=3D "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules=
/*/*.la"
 FILES:${PN}-doc +=3D "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/READ=
ME.compiled ${localstatedir}/lib/xkb/README.compiled"
 FILES:${PN}-sdl =3D "${bindir}/Xsdl"
 FILES:${PN}-fbdev =3D "${bindir}/Xfbdev"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 246d3363eb8..fd5a1163b10 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -192,7 +192,7 @@ FILES:libpulse =3D "${libdir}/libpulse.so.* ${sysconf=
dir}/pulse/client.conf"
 FILES:libpulse-simple =3D "${libdir}/libpulse-simple.so.*"
 FILES:libpulse-mainloop-glib =3D "${libdir}/libpulse-mainloop-glib.so.*"
=20
-FILES:${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala=
"
+FILES:${PN}-dev +=3D "${datadir}/vala"
 FILES:${PN}-bin +=3D "${sysconfdir}/default/volatiles/04_pulse"
 FILES:${PN}-pa-info =3D "${bindir}/pa-info"
 FILES:${PN}-server =3D "${bindir}/pulseaudio ${bindir}/start-* ${sysconf=
dir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${sy=
stemd_user_unitdir}/*"
--=20
2.43.0


