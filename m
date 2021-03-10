Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web08.5494.1615360138743657987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 23:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=RXA6UFaS;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4DwNV02HzwzQjwN
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 08:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:message-id:date:date
	:subject:subject:from:from:received; s=mail20150812; t=
	1615360131; bh=cKh7hOqFdmuMpU36exxNLaudEbhSFac234szDOsXhbM=; b=R
	XA6UFaS2yveCvxImOSFd5Qz+D4YG5tNef9UPP/IbO8jSrEAr3Kk1iLszAvTYeOTP
	cmMpg4+kIptmFE7WmD1F/wSkvWnb48J3P37FXlqYLDfZcQEku1ECdXEjGDISmjw5
	0Zu1VzDKr08z4bW1v0+vq45QQlwF8eYSwJ1JWIp95ve0sqptqyEeENPj5eIgxh1a
	pHTel1EWrxMGp1roYaWWFVgqGIB2MjTZAPkT++GlHJfsQUMNsOD0G1MAq4b0fJV6
	eaYc43JTC432Evi849yDAKehdInLSpjab8OLTVUY6xwhKmKuaHf6mM46MWdNDYOr
	dByDpziOdqe7oBFKdRI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1615360134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q1yeBfdMD066ksOAz4hCvfwfIsinKwKHm9sbEhIbox8=;
	b=EM1h0SKSJjthP+e91etqntBswzFw/T5RM65tmyFhN8eWL1hzZQxk0Gr9eUzgKkCN4rIQnv
	SlYRY5JEIN1vXTvG22MHwsC9822myvAniZqoyZjSCBLpiX//86S60Qi68iVfTuwkE7ExD1
	3vH8654XTTOet4sF2557/ReyBtvXXphTKQW74hNIqDq0Nl+CBZNVBk8aC8Ihger30IS50w
	J4I2IcdafBcNe5eO3hXnG8FAQwIOW+IyYvhqZVgsT1eU+GqUDgs4vUUUYFmUJqpo1wri+b
	Df6HMkJ1bTZlM48oKBWEf6Bg2m86H7dZ9stTLbFsLQ/ObJqCFXAWhFFrzSMCAg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
	with ESMTP id 08DneESuumLN
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Mar 2021 08:08:51 +0100 (CET)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pipewire: add recipe from meta-openembedded and upgrade to 0.3.23
Date: Wed, 10 Mar 2021 08:08:10 +0100
Message-Id: <20210310070810.20295-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.53 / 15.00 / 15.00
X-Rspamd-Queue-Id: 0DD351862
X-Rspamd-UID: 66349c
Content-Transfer-Encoding: quoted-printable

PipeWire is a new multimedia daemon that aims to be a replacement for
both JACK and PulseAudio. Additionally, it provides IO and routing
functionality for video. It also has PulseAudio shim to act as a drop-in
replacement.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../pipewire/pipewire_0.3.23.bb               | 272 ++++++++++++++++++
 1 file changed, 272 insertions(+)
 create mode 100644 meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb

diff --git a/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb b/meta/r=
ecipes-multimedia/pipewire/pipewire_0.3.23.bb
new file mode 100644
index 0000000000..1c226b3faf
--- /dev/null
+++ b/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
@@ -0,0 +1,272 @@
+SUMMARY =3D "Multimedia processing server for Linux"
+DESCRIPTION =3D "Linux server for handling and routing audio and video s=
treams between applications and multimedia I/O devices"
+HOMEPAGE =3D "https://pipewire.org/"
+BUGTRACKER  =3D "https://gitlab.freedesktop.org/pipewire/pipewire/issues=
"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \
+    file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
+"
+SECTION =3D "multimedia"
+
+DEPENDS =3D "dbus"
+
+SRCREV =3D "68f6c75caed047af32320ab4de0c06457457be54"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd manpages gettext useradd
+
+USERADD_PACKAGES =3D "${PN}"
+
+GROUPADD_PARAM_${PN} =3D "--system pipewire"
+
+USERADD_PARAM_${PN} =3D "--system --home / --no-create-home \
+                       --comment 'PipeWire multimedia daemon' \
+                       --gid pipewire --groups audio,video \
+                       pipewire"
+
+# For "EVL", look up https://evlproject.org/ . It involves
+# a specially prepared kernel, and is currently unavailable
+# in Yocto.
+# FFmpeg and Vulkan aren't really supported - at the current
+# stage (version 0.3.23), these are just experiments, not
+# actual features.
+# libcamera support currently does not build successfully.
+# systemd user service files are disabled because per-user
+# PipeWire instances aren't really something that makes
+# much sense in an embedded environment. A system-wide
+# instance does.
+EXTRA_OEMESON +=3D " \
+    -Daudiotestsrc=3Dtrue \
+    -Devl=3Dfalse \
+    -Dsystemd-user-service=3Dfalse \
+    -Dtests=3Dfalse \
+    -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
+    -Dvideotestsrc=3Dtrue \
+    -Dffmpeg=3Dfalse \
+    -Dvulkan=3Dfalse \
+    -Dlibcamera=3Dfalse \
+"
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
+    gstreamer jack v4l2 \
+"
+
+# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
+# since "jack" imports libjack, and "pipewire-jack" generates
+# libjack.so* files, thus colliding with the libpack package. This
+# is why these two are marked in their respective packageconfigs
+# as being in conflict.
+
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib udev"
+PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sbc"
+PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen"
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gli=
b-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewire-ja=
ck"
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
+PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
+PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd-system-service=3D=
true ,-Dsystemd=3Dfalse -Dsystemd-system-service=3Dfalse,systemd"
+PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev"
+PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Dtrue,-Dpipewire-alsa=
=3Dfalse,alsa-lib"
+PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Dtrue -Dlibjack-path=3D=
${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Dfalse,jack,,,jack"
+
+PACKAGESPLITFUNCS_prepend =3D " split_dynamic_packages "
+PACKAGESPLITFUNCS_append =3D " set_dynamic_metapkg_rdepends "
+
+SPA_SUBDIR =3D "spa-0.2"
+PW_MODULE_SUBDIR =3D "pipewire-0.3"
+
+remove_unused_installed_files() {
+    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
+    # Remove it if pipewire-jack is not built to avoid creating the
+    # pipewire-jack package.
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', '=
true', d)}; then
+        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
+    fi
+}
+
+do_install[postfuncs] +=3D "remove_unused_installed_files"
+
+python split_dynamic_packages () {
+    # Create packages for each SPA plugin. These plugins are located
+    # in individual subdirectories, so a recursive search is needed.
+    spa_libdir =3D d.expand('${libdir}/${SPA_SUBDIR}')
+    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${P=
N}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends=3D'', re=
cursive=3DTrue)
+
+    # Create packages for each PipeWire module.
+    pw_module_libdir =3D d.expand('${libdir}/${PW_MODULE_SUBDIR}')
+    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.s=
o$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends=3D=
'', recursive=3DFalse)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated SPA plugin and PipeWire module packages
+    # (excluding the main package and the -meta package itself) and
+    # add them to the -meta package as RDEPENDS.
+
+    base_pn =3D d.getVar('PN')
+
+    spa_pn =3D base_pn + '-spa-plugins'
+    spa_metapkg =3D  spa_pn + '-meta'
+
+    pw_module_pn =3D base_pn + '-modules'
+    pw_module_metapkg =3D  pw_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
+    d.setVar('FILES_' + spa_metapkg, "")
+
+    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
+    d.setVar('FILES_' + pw_module_metapkg, "")
+
+    blacklist =3D [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg=
 ]
+    spa_metapkg_rdepends =3D []
+    pw_module_metapkg_rdepends =3D []
+    pkgdest =3D d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_spa_pkg =3D pkg.startswith(spa_pn)
+        is_pw_module_pkg =3D pkg.startswith(pw_module_pn)
+        if not is_spa_pkg and not is_pw_module_pkg:
+            continue
+
+        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepe=
nds:
+            continue
+
+        # See if the package is empty by looking at the contents of its
+        # PKGDEST subdirectory. If this subdirectory is empty, then then
+        # package is empty as well. Empty packages do not get added to
+        # the meta package's RDEPENDS.
+        pkgdir =3D os.path.join(pkgdest, pkg)
+        if os.path.exists(pkgdir):
+            dir_contents =3D os.listdir(pkgdir) or []
+        else:
+            dir_contents =3D []
+        is_empty =3D len(dir_contents) =3D=3D 0
+        if not is_empty:
+            if is_spa_pkg:
+                spa_metapkg_rdepends.append(pkg)
+            if is_pw_module_pkg:
+                pw_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
+
+    d.setVar('RDEPENDS_' + pw_module_metapkg, ' '.join(pw_module_metapkg=
_rdepends))
+    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta p=
ackage')
+}
+
+PACKAGES =3D+ "\
+    libpipewire \
+    ${PN}-tools \
+    ${PN}-pulse \
+    ${PN}-alsa \
+    ${PN}-jack \
+    ${PN}-media-session \
+    ${PN}-spa-plugins \
+    ${PN}-spa-plugins-meta \
+    ${PN}-spa-tools \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+    ${PN}-alsa-card-profile \
+    gstreamer1.0-pipewire \
+"
+
+PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-modules.*"
+
+SYSTEMD_SERVICE_${PN} =3D "pipewire.service"
+CONFFILES_${PN} +=3D "${sysconfdir}/pipewire/pipewire.conf"
+FILES_${PN} =3D " \
+    ${sysconfdir}/pipewire/pipewire.conf \
+    ${systemd_system_unitdir}/pipewire.* \
+    ${bindir}/pipewire \
+"
+
+FILES_${PN}-dev +=3D " \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
+"
+
+CONFFILES_libpipewire +=3D "${sysconfdir}/pipewire/client.conf"
+FILES_libpipewire =3D " \
+    ${sysconfdir}/pipewire/client.conf \
+    ${libdir}/libpipewire-*.so.* \
+"
+# Add the bare minimum modules and plugins required to be able
+# to use libpipewire. Without these, it is essentially unusable.
+RDEPENDS_libpipewire +=3D " \
+    ${PN}-modules-client-node \
+    ${PN}-modules-protocol-native \
+    ${PN}-spa-plugins-support \
+"
+
+FILES_${PN}-tools =3D " \
+    ${bindir}/pw-* \
+"
+
+# This is a shim daemon that is intended to be used as a
+# drop-in PulseAudio replacement, providing a pulseaudio-compatible
+# socket that can be used by applications that use libpulse.
+CONFFILES_${PN}-pulse +=3D "${sysconfdir}/pipewire/pipewire-pulse.conf"
+FILES_${PN}-pulse =3D " \
+    ${sysconfdir}/pipewire/pipewire-pulse.conf \
+    ${bindir}/pipewire-pulse \
+"
+RDEPENDS_${PN}-pulse +=3D " \
+    ${PN}-modules-protocol-pulse \
+"
+
+# alsa plugin to redirect audio to pipewire
+FILES_${PN}-alsa =3D "\
+    ${libdir}/alsa-lib/* \
+    ${datadir}/alsa/alsa.conf.d/* \
+"
+
+# jack drop-in libraries to redirect audio to pipewire
+CONFFILES_${PN}-jack =3D "${sysconfdir}/pipewire/jack.conf"
+FILES_${PN}-jack =3D "\
+    ${sysconfdir}/pipewire/jack.conf \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
+"
+
+# Example session manager. Not intended for use in production.
+CONFFILES_${PN}-media-session =3D "${sysconfdir}/pipewire/media-session.=
d/*"
+FILES_${PN}-media-session =3D " \
+    ${bindir}/pipewire-media-session \
+    ${sysconfdir}/pipewire/media-session.d/* \
+"
+RPROVIDES_${PN}-media-session =3D "virtual/pipewire-sessionmanager"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-spa-plugins =3D ""
+RRECOMMENDS_${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
+
+FILES_${PN}-spa-tools =3D " \
+    ${bindir}/spa-* \
+"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-modules =3D ""
+RRECOMMENDS_${PN}-modules +=3D "${PN}-modules-meta"
+
+CONFFILES_${PN}-modules-rtkit =3D "${sysconfdir}/pipewire/client-rt.conf=
"
+FILES_${PN}-modules-rtkit +=3D " \
+    ${sysconfdir}/pipewire/client-rt.conf \
+    "
+
+FILES_${PN}-alsa-card-profile =3D " \
+    ${datadir}/alsa-card-profile/* \
+    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
+"
+
+FILES_gstreamer1.0-pipewire =3D " \
+    ${libdir}/gstreamer-1.0/* \
+"
--=20
2.25.1

