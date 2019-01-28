Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7238A7C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so17880473wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iH5XhSbYQieQiN2JdDKz8q+EWymmNFu9V+yNOmr9eEs=;
	b=CKV6ynUfKpi629xAQe08zzr9e6j5esLUvGORf3ElPpii0VK5H9SvLdUPIduQnqJiNs
	YO17mwndOqqDQWzxU9izqTcStiBLDj1GRKm7Xt7eY72iPxoxKzK1w9fu0Ax4s8k4zd16
	orjF6zy8AmNweXR5nUQvMDHKpBYaRPWh2q7cuXfc1f6ofblVnRmWFFMudVJsix49uLqB
	xutthb7aDUzVqGGTzRbCulaUDrFGbkr0CW8U9WwLVM2eCOZYuvtJa68d3k9tQTRtcUGv
	Xo9bWEtcf55vc8kQxXm1rXwwg+4bAHjWrq4x0h5yNzVRJEf9WDTZVQ5EEx328NfYkOIy
	C/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iH5XhSbYQieQiN2JdDKz8q+EWymmNFu9V+yNOmr9eEs=;
	b=Qn8F331UbJ+UYR4WmC5faLtr8MohArRPROZdxdk10uT8Lz//zlbI9fJ+1LAlPEzBH2
	YbI0n2rLJMj2ORDM7ZW40WN1kBvyrXViuKnL5YLF8bcW5ete7dOjh/I1zwHmFRIeFYY3
	34DCZ598rI7YaY531aL3uUwfwhbZ4mRLvo9mHMdhaPIM5XTzzulHwpLD5X0Th7fw59Hs
	lio7c6ejwuFhMgn24aV0lImZaoylW8J0mLq1uy/ala2D9JtfFrTarvJckI5yI+wGy2La
	CCRdeb5NpZUtFEARZaiT8ai1O9KvjilogGlc98K0uDKF7QKRANXKKCs8KTOuKYjjg/sO
	iFeQ==
X-Gm-Message-State: AJcUukfeMP8C9vkIHcXmCTtsg3qkb4HjPg9J/flgW2pnpu5algTAfuZf
	qqi2zoOYGFgw2/MwP9XWc3K2WTlH
X-Google-Smtp-Source: ALg8bN66m+/PerNyiT2ZM42VwuLTKAGm7M9/oXxK03SXvlr2k4rVPj/+/s9JccbDbv2o2uju4T0TeQ==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr20671307wrv.87.1548679627429; 
	Mon, 28 Jan 2019 04:47:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:31 +0100
Message-Id: <cover.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 00/24] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:07 -0000

V2 changes: addressed feedback from the first review round
V3 changes:
- better fix for missing qemu X11 include, as discussed with upstream
- maintainers.inc entry for virglrenderer
- egl-headless support (see below for details)
- improvements to kmscube recipe
- fix to vte-native to allow building it with gcc 4.8
V4 changes
- address failures uncovered by yocto autobuilder

Why this? Why now?

1. I think we are heading towards a reality where some kind of working
GL is a 'must' for any kind of UI work.
2. Typically people build images and then transfer them to the NUC or
even target boards for testing - using qemu would be less awkward.
3. Current qemu configuration is basically useless here, as it only
provides a very slow software GL driver from mesa.

0. TLDR:

a) Gtk UI frontend

$ . oe-init-build-env build-virgl
$ bitbake core-image-sato-sdk
$ runqemu kvm gl
$$ run glxgears or any other GL-capable binary inside qemu

b) egl-headless

$ . oe-init-build-env build-virgl
$ bitbake core-image-sato-sdk
$ runqemu kvm egl-headless publicvnc
$ <connect with a vnc viewer to 127.0.0.1:5900>
$$ run glxgears or any other GL-capable binary inside qemu

1. For the local UI, qemu is switched over to use gtk frontend. I simply 
couldn't get SDL frontend to work properly, it only displays a blank black 
window or doesn't start at all. Same thing happens with qemu binaries provided 
by Fedora and opensuse (Ubuntu's qemu lacks virgl support). Seems like SDL support 
has regressed.

2. What is egl-headless?

In this variant, Qemu does not open a UI window at all. Instead, it renders
all graphics, including GL, into a memory buffer, which can be seen with
a vnc or spice client (over a TCP socket). This has the following advantages:

- no need to be physically present at the host machine, output (including GL bits!) 
can be seen remotely
- no need for the host machine to run an X session

3. While the components are built against the most minimum necessary 
mesa-native set (gbm, egl, dri with no drivers), libepoxy loads and uses the 
host GL implementation (through a chrpath hack). This is both to save build 
times, and because the host is likely to have a set of drivers more 
appropriate for the physical machine (e.g. proprietary nvidia stack, 
although I didn't test that).

4. I tested this with
- glamor X server
- weston compositor with drm backend (build core-image-weston, then edit 
  weston.ini in the image to use drm backed instead of fbdev).
- kmscube
- glxgears
- https://www.geeks3d.com/gputest/

The latter two show FPS that is similar to running them directly on the host.

5. Some things I am not sure about:

 - how much of a 'default' should this be for running qemu. It works for me, 
but other people might find it less stable compared to the existing 
sdl-vmware-swrast setup.

- what other tests and demos could be run

- how could this be tested on the autobuilder. I wrote two oe-selftests for 
this (gtk, egl-headless), but one of them does require an X session, and both 
require ability to create opengl contexts on the host.

The following changes since commit ecfe26834922861ab69602b8c1aa404080f0fb0c:

  libtool: Fix ignoring compiler-rt libs (2019-01-27 13:05:17 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (24):
  gtk+3: enable native/nativesdk variant
  gtk+3: remove the gtk-icon-utils-native recipe
  shared-mime-info: update the database also in native builds
  pixbufcache.bbclass: remove a dependency loop introduced by enabling
    gtk+3-native
  meta: add native and nativesdk variants to various recipes to enable
    gtk+3-native/nativesdk
  libepoxy: enable native/nativesdk variants
  mesa: enable native and nativesdk variants
  virglrenderer: add a recipe
  qemu: enable virglrenderer and glx options for native/nativesdk builds
  qemu: drop --with-gtkabi option, as it is no longer supported
  mesa-gl: do not enable nativesdk variant to avoid clashes with main
    mesa recipe
  local.conf.sample: adjust the qemu config to enable gtk+ instead of
    sdl
  qemu: build target variant with gtk+, and nativesdk variant without
    sdl
  qemu: remove support for building against host sdl
  atk: disable gobject-introspection for nativesdk
  qemu: add a gettext-native dependency to gtk option
  libjpeg-turbo: fix nativesdk build in same way as native builds are
  qemu: add a patch to avoid a missing definition error
  qemu: add environment variable wrappers to make qemu look good with
    gtk frontend
  qemu: add a backported patch to fix egl-headless support
  runqemu: add options for enabling virgl GL acceleration
  runqemu: do not check for GL libraries
  selftest: add tests for virgl GL acceleration
  vte: allow building vte-native with gcc 4.8

 meta-poky/conf/local.conf.sample              |   9 +-
 meta-selftest/lib/oeqa/runtime/cases/virgl.py |  28 +++++
 meta/classes/pixbufcache.bbclass              |   2 +-
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  50 +++++++++
 meta/recipes-devtools/qemu/qemu.inc           |  41 ++++---
 .../qemu/0001-Add-a-missing-X11-include.patch |  65 +++++++++++
 ...-egl-headless-add-egl_create_context.patch |  50 +++++++++
 ...x-libcap-header-issue-on-some-distro.patch |   2 +-
 ...-messages-when-qemi_cpu_kick_thread-.patch |   2 +-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |   2 +
 .../gdk-pixbuf/gdk-pixbuf_2.36.11.bb          |   2 +-
 .../gnome/adwaita-icon-theme_3.28.0.bb        |   2 +
 meta/recipes-gnome/gtk+/gtk+3.inc             |  28 ++++-
 .../gtk+/gtk-icon-utils-native_3.22.30.bb     |  63 -----------
 ...endency-from-gtk-encode-symbolic-svg.patch | 102 ------------------
 .../hicolor-icon-theme_0.17.bb                |   2 +
 meta/recipes-graphics/cairo/cairo_1.14.12.bb  |   2 +-
 .../harfbuzz/harfbuzz_2.2.0.bb                |   2 +-
 .../jpeg/libjpeg-turbo_2.0.1.bb               |   3 +-
 .../libepoxy/libepoxy_1.5.3.bb                |  16 +++
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb  |   2 +
 meta/recipes-graphics/mesa/mesa.inc           |  20 ++--
 meta/recipes-graphics/pango/pango_1.42.4.bb   |   2 +-
 .../ttf-fonts/liberation-fonts_2.00.1.bb      |   2 +
 .../0001-vtest-add-missing-includes.patch     |  38 +++++++
 .../virglrenderer/virglrenderer_git.bb        |  19 ++++
 .../xorg-lib/libxcomposite_0.4.4.bb           |   2 +-
 .../xorg-lib/libxdamage_1.1.4.bb              |   2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb |   2 +
 .../xorg-lib/libxtst_1.2.3.bb                 |   1 +
 .../recipes-support/atk/at-spi2-atk_2.30.0.bb |   2 +
 .../atk/at-spi2-core_2.30.0.bb                |   1 +
 meta/recipes-support/atk/atk_2.30.0.bb        |   4 +-
 .../shared-mime-info/shared-mime-info.inc     |   2 +
 ...chool-asignment-to-avoid-gcc-4.8-err.patch |  27 +++++
 meta/recipes-support/vte/vte_0.52.2.bb        |   7 +-
 scripts/runqemu                               |  58 ++++------
 38 files changed, 422 insertions(+), 243 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
 create mode 100644 meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch

-- 
2.17.1


