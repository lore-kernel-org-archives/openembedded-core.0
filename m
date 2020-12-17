Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web09.1984.1608233282526221677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 11:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=V9ttQxL+;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id D74041943494
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:28:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Dec 2020 14:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=StOdMqOgiCLozdNv8zrMjaL66Winm8jcaQ2a7yHdgEk=; b=V9ttQxL+
	qtz1/KPFi4kreexAoza9Wu0Ta8hcawGdr8Qu4N9gXeLMewkybcCHD9pXX2Yf93F1
	JUangE2nxmjseS1QdJ5KUmxMZ07jGD01HqGXwwP/UxxlUw7RGW0KB0viY31THcrV
	87oz2Yle6O8u2T8ykbilXfq7mE9eCCcDIs5xePsaUlD9LRUV9aak9U1njLWUTpKW
	weCPC6Sg7gbVPdNt8vYdFhSgBdFzrjVNJCKhYTIUC7GwadpFqAdSdKHvAghtufy3
	4oabiz5ZlMDeTEccNjYgLM2xwfpIaxsop+8qxOATP0KOE5wVKV6u8+vOoBdVfAy/
	4oys9CmY/xE71Q==
X-ME-Sender: <xms:QbHbX9WYq5P9dFLLWuiaQfFbNUoEswo2ZzxxCAz03m_EDn8DllxSaA>
    <xme:QbHbX9mMse2eebhFTprwMBrXQC8g7UXm1BIKLa7ISOZdwnlPUEAbIffZxbGVvl_MQ
    j6KgKuTbiVCdmo_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
    ihdrfhhiqeenucggtffrrghtthgvrhhnpedvgfeggfekkeehteffteefhfekgfeukeejve
    elueeiudevfeejveehgefgtdffieenucffohhmrghinhepthigthdrihhtpdhfrhgvvggu
    vghskhhtohhprdhorhhgnecukfhppedukeekrdduvdeirdekledrhedvnecuufhprghmkf
    hppfgvthifohhrkhepudekkedruddviedrkeelrdehvdenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:QbHbX5ZGkLbcxjHPKwWFsZ8vzfMSwkf17hl24_KLoW4_M4CFWmvXbQ>
    <xmx:QbHbXwU-BMbig69gcnISHt4uyySWRRb9tnWqMF1vrD17_8Kpr4PNTQ>
    <xmx:QbHbX3mqZt4BOBzOwwv_bHuUOpLt_7Lty-c2vb3SP-QvKfOH4MjU0w>
    <xmx:QbHbXzxpJItCSlliDgKjMLDIgbA4nRx9KeXVKmOHGWKWEVfPNO7rCw>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 329B8108005F
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:28:01 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] pulseaudio: switch build system from Autotools to Meson
Date: Thu, 17 Dec 2020 21:27:38 +0200
Message-Id: <20201217192738.14311-5-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217192738.14311-1-tanuk@iki.fi>
References: <20201217192738.14311-1-tanuk@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream is moving from Autotools to Meson, Autotools support will be
dropped in 15.0.

I dropped some configure options:
 * --enable-tcpwrap=no doesn't (currently) have a counterpart in Meson,
   TCP Wrappers support is always disabled.
 * --disable-esound doesn't have a counterpart in Meson, EsounD support
   is always disabled.
 * --disable-gconf doesn't have a counterpart in Meson, GConf support is
   always disabled.

I backported a patch that implements support for the -Dvalgrind=disabled
option.

I checked with buildhistory what the differences are before and after
this patch (with qemuarm with neon removed from TUNE_FEATURES, all
PACKAGECONFIGs enabled):
 * Obvious differences in DEPENDS: Autotools stuff removed and Meson
   stuff added. There wasn't anything strange here.
 * Packages have superfluous RDEPENDS removed from them. With Autotools
   something caused for example X11 libraries to be added to RDEPENDS of
   packages that don't have anything to do with X11.
 * The pulseaudio-src package had MMX and SSE related files removed and
   Neon related files added. I don't know why the ARM build previously
   had MMX and SSE files included, the addition of Neon files is
   explained by the fact that with Meson the Neon optimizations can't be
   disabled if the compiler supports Neon (see below).
 * libfoo.so symlinks changed to point to libfoo.so.X rather than
   directly to libfoo.so.X.Y.Z. To my understading that's fine, since
   libfoo.so.X is a symlink that points to libfoo.so.X.Y.Z.
 * There were various file size changes, which I didn't investigate.

Previously the recipe disabled ARM Neon optimizations when "neon" was
not in TUNE_FEATURES. That was originally added in commit
4e7b91b5a2613b957b08aefbee1aac28fdd19598 at a time when PulseAudio's
build system didn't check the availability of the arm_neon.h header,
causing compilation errors when the header wasn't available. That issue
was fixed a long time ago, so there was little need for the
TUNE_FEATURES check, although it was still possible to make the build
fail if non-neon -mfpu was passed in CFLAGS, so the TUNE_FEATURES check
still had some theoretical benefit (theoretical, because generally OE
passes -mfpu in CC instead of CFLAGS, so OE's -mfpu option appears very
early in the compiler command line, which doesn't trip up PulseAudio's
current Autotools build system).

With Meson there's no option for disabling Neon optimizations if the
compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
because the build system adds -mfpu=neon at the end of the compiler
command line, overriding any earlier -mfpu options. This shouldn't be
a problem, because PulseAudio detects at runtime whether the CPU
supports Neon instructions.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../pulseaudio/pulseaudio.inc                 | 64 ++++++++----------
 ...-option-for-enabling-disabling-Valgr.patch | 67 +++++++++++++++++++
 .../pulseaudio/pulseaudio_14.0.bb             |  1 +
 3 files changed, 97 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 48759bca62..cf4be7ed40 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -56,49 +56,47 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
                     file://src/pulsecore/filter/biquad.h;beginline=1;endline=4;md5=6d46d1365206528a20137355924233c1 \
 "
 
+# libtool is needed for libltdl, used in module loading.
 DEPENDS = "libatomic-ops libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
-inherit autotools bash-completion pkgconfig useradd gettext perlnative systemd manpages gsettings
+inherit bash-completion meson pkgconfig useradd gettext perlnative systemd manpages gsettings
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
 USE_NLS = "yes"
 
-EXTRA_OECONF = "\
-		--disable-hal-compat \
-		--disable-orc \
-		--enable-tcpwrap=no \
-		--with-access-group=audio \
-		--disable-openssl \
-		--with-database=simple \
-		--without-zsh-completion-dir \
-		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
-		ac_cv_header_valgrind_memcheck_h=no \
-		--disable-tests \
-		--disable-running-from-build-tree \
-		--disable-esound \
-		--disable-gconf \
+EXTRA_OEMESON = "\
+		-Dhal-compat=false \
+		-Dorc=disabled \
+		-Daccess_group=audio \
+		-Dopenssl=disabled \
+		-Ddatabase=simple \
+		-Dzshcompletiondir=no \
+		-Dudevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
+		-Dvalgrind=disabled \
+		-Dtests=false \
+		-Drunning-from-build-tree=false \
 "
 
 # soxr (the SoX Resampler library) doesn't seem to be currently packaged in
 # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
-EXTRA_OECONF += "--without-soxr"
+EXTRA_OEMESON += "-Dsoxr=disabled"
 
 # The FFTW dependency (for module-equalizer-sink) was removed in commit
 # ddbd713293 without explaining why it was not made a PACKAGECONFIG item
 # instead. Oh well, let's keep it disabled until someone expresses some
 # interest in having it enabled.
-EXTRA_OECONF += "--without-fftw"
+EXTRA_OEMESON += "-Dfftw=disabled"
 
 # The "adrian" echo canceller implementation has a non-standard license
 # (src/modules/echo-cancel/adrian-license.txt). It's a permissive license, so
 # the licensing terms are probably not problematic, but it would be an extra
 # hassle to add the license to OE-Core's set of licenses. The canceller isn't
 # very good anyway, better alternatives exist (such as the webrtc canceller).
-EXTRA_OECONF += "--disable-adrian-aec"
+EXTRA_OEMESON += "-Dadrian-aec=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
@@ -107,26 +105,22 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5'
                    dbus gsettings \
                    "
 
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
-PACKAGECONFIG[gsettings] = "--enable-gsettings,--disable-gsettings,glib-2.0-native glib-2.0"
-PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
-PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enable-systemd-journal --with-systemduserunitdir=${systemd_user_unitdir},--disable-systemd-daemon --disable-systemd-login --disable-systemd-journal,systemd"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
-PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
-PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
+PACKAGECONFIG[bluez5] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
+PACKAGECONFIG[gsettings] = "-Dgsettings=enabled,-Dgsettings=disabled,glib-2.0-native glib-2.0"
+PACKAGECONFIG[ofono] = "-Dbluez5-ofono-headset=true,-Dbluez5-ofono-headset=false,ofono"
+PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemduserunitdir=${systemd_user_unitdir},-Dsystemd=disabled,systemd"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxtst libice libsm libxcb"
+PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
+PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
 # Since many embedded systems don't have non-root users, it's useful to be
 # able to use pulseaudio autospawn for root as well.
 PACKAGECONFIG[autospawn-for-root] = ",,,"
-PACKAGECONFIG[lirc] = "--enable-lirc,--disable-lirc,lirc"
-PACKAGECONFIG[webrtc] = "--enable-webrtc-aec,--disable-webrtc-aec,webrtc-audio-processing"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, "
-
-EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
-EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
-
+PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
+PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing"
+PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
 
 export TARGET_PFPU = "${TARGET_FPU}"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
new file mode 100644
index 0000000000..d60a9a211f
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
@@ -0,0 +1,67 @@
+From 6d202833a5ae241eeb648631cf95090c452198f9 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 14 Feb 2020 07:29:33 +0200
+Subject: [PATCH] build-sys: Add an option for enabling/disabling Valgrind
+
+In OpenEmbedded the PulseAudio recipe currently disables Valgrind
+support by passing "ac_cv_header_valgrind_memcheck_h=no" to the
+configure script (this was added to make it deterministic whether
+Valgrdind support gets enabled or not). I'm converting the PulseAudio
+recipe to use Meson, and I needed an option to disable Valgrind.
+
+Upstream-Status: Backport
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 3 +++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 658eeee57..258962724 100644
+--- a/meson.build
++++ b/meson.build
+@@ -220,7 +220,6 @@ check_headers = [
+   'sys/un.h',
+   'sys/wait.h',
+   'syslog.h',
+-  'valgrind/memcheck.h',
+   'xlocale.h',
+ ]
+ 
+@@ -231,6 +230,10 @@ foreach h : check_headers
+   endif
+ endforeach
+ 
++if cc.has_header('valgrind/memcheck.h', required: get_option('valgrind'))
++  cdata.set('HAVE_VALGRIND_MEMCHECK_H', 1)
++endif
++
+ # FIXME: move this to the above set
+ if cc.has_header('pthread.h')
+   cdata.set('HAVE_PTHREAD', 1)
+@@ -841,6 +844,7 @@ summary = [
+   'Enable SoXR (resampler):       @0@'.format(soxr_dep.found()),
+   'Enable WebRTC echo canceller:  @0@'.format(webrtc_dep.found()),
+   'Enable Gcov coverage:          @0@'.format(get_option('gcov')),
++  'Enable Valgrind:               @0@'.format(cdata.has('HAVE_VALGRIND_MEMCHECK_H')),
+   'Enable man pages:              @0@'.format(get_option('man')),
+   'Enable unit tests:             @0@'.format(get_option('tests')),
+   '',
+diff --git a/meson_options.txt b/meson_options.txt
+index 824f24e08..115cc84af 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -138,6 +138,9 @@ option('systemd',
+ option('udev',
+        type : 'feature', value : 'auto',
+        description : 'Optional udev support')
++option('valgrind',
++       type : 'feature', value : 'auto',
++       description : 'Optional Valgrind support')
+ option('x11',
+        type : 'feature', value : 'auto',
+        description : 'Optional X11 support')
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
index ac0c82e37d..63ef3a9c12 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
@@ -3,6 +3,7 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
+           file://0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "84a7776e63dd55c40db8fbd7c7e2e18e"
-- 
2.20.1

