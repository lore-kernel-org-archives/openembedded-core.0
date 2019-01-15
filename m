Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 828F36BE46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u4so3730987wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=gDulac0ayDjeWumD3XwSoReRpD6i1/yg0sVnGxfvwJA=;
	b=oAYDn7Dsin06u4P/nGFF0vcu7e0GYrv9bovwHmy4BowSHu51Hcy5S/thqF55l3vX0v
	uC5ogqYCJIalrUWALVv30EFydCZAYtW1mTmwRJFb3mtWwetbXoRjr+1jd03NIVyhl4iy
	f5InvpVuxeUSeUcYg1YXLqZvM/9Xunp/r0x3m2oVkXt0XxP6eF7AE1oNKYIJb74gKGKF
	pzTwK8iAoYv1NjDRt7At5bcWHh5a0YmFDnYpJEHDQwoW9FaRR1LEryPSEe4u1VqKTvEf
	5Eim/OrBkoj/hyCSfu09PMH3fsOT7YZ7prA4VSks8x4mHnrM7XmQ29iEDrOQpwNCcS3p
	dCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gDulac0ayDjeWumD3XwSoReRpD6i1/yg0sVnGxfvwJA=;
	b=p19vim2BM6E3IJP3blR1N1NU3ea/v6Kuj7kuvy9JEy7lFV/k8OyaWcwdk+8qM/YO4n
	CP/Or0fT6F8glLqG/F0EWRfNBeIq2wljhfd/pli668xCLvTpvYVeiionV+JqRQ0bncb8
	IjfNqWOMvgM1YGu6ga2OXSLtxwFV94SneyO3X3LW/UcKhxGiyPOgE3gwse+u7HRLkuCD
	y5ibhF0TMo/PN6TAhJTsEyyaiOVY+u63o51OgkceQLdvu5SPVe7YMvDHZmQwZvXUwH3s
	QZW/kwsPD/DSUvXlOd99oqEh+ELUDrKhKlOYCVDXFkS+XvWDeickxr3k3v/uGPfvDprP
	syEw==
X-Gm-Message-State: AJcUukddyjD+mVTY4vaAt8SvZ3eje93g/OrHMt/6tCvuwognEXdxujmM
	edRctvj0qvCL3MaMTYCncCl6ZFE5xyc=
X-Google-Smtp-Source: ALg8bN6VKW7RUS+HVCxdM/rsr3Yt3y5sNd7vVtOwUhUdHpIv3BHmpJ0UJmFwQegMa1sIh5ACOZ6A3Q==
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr3799311wrp.111.1547570343652; 
	Tue, 15 Jan 2019 08:39:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:35 +0100
Message-Id: <cover.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2 00/22] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:03 -0000

V2 changes: addressed feedback from the first review round

Why this? Why now?

1. I think we are heading towards a reality where some kind of working
GL is a 'must' for any kind of UI work.
2. Typically people build images and then transfer them to the NUC or
even target boards for testing - using qemu would be less awkward.
3. Current qemu configuration is basically useless here, as it only
provides a very slow software GL driver from mesa.

0. TLDR:

$ . oe-init-build-env build-virgl
$ bitbake core-image-sato-sdk
$ runqemu kvm gl
$$ run glxgears or any other GL-capable binary inside qemu

1. qemu is switched over to use gtk frontend. I simply couldn't get SDL 
frontend to work properly, it only displays a blank black window or doesn't 
start at all. Same thing happens with qemu binaries provided by Fedora and 
opensuse (Ubuntu's qemu lacks virgl support). Seems like SDL support has 
regressed.

2. While the components are built against the most minimum necessary 
mesa-native set (gbm, egl, dri with no drivers), libepoxy loads and uses the 
host GL implementation (through a chrpath hack). This is both to save build 
times, and because the host is likely to have a set of drivers more 
appropriate for the physical machine (e.g. proprietary nvidia stack, 
although I didn't test that).

3. I tested this with
- glamor X server
- weston compositor with drm backend (build core-image-weston, then edit 
  weston.ini in the image to use drm backed instead of fbdev).
- kmscube
- glxgears
- https://www.geeks3d.com/gputest/

The latter two show FPS that is similar to running them directly on the host.

4. Some things I am not sure about:

 - how much of a 'default' should this be for running qemu. It works for me, 
but other people might find it less stable compared to the existing 
sdl-vmware-swrast setup.

- what other tests and demos could be run

- how could this be tested on the autobuilder. I wrote an oe-selftest for 
this, but it does require an X session, and ability to create opengl 
contexts on the host.

The following changes since commit 1ee53881eea3a7ca4d4f6a5ca9c4c6e6488d2348:

  perl: fix yet another race failure (2019-01-14 17:38:24 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (22):
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
  qemu: add a patch to avoid a missing include error
  runqemu: add support for virgl GL acceleration
  runqemu: do not check for GL libraries
  qemu: add environment variable wrappers to make qemu look good with
    gtk frontend
  selftest: add a test for virgl GL acceleration

 meta-poky/conf/local.conf.sample              |  10 +-
 meta-selftest/lib/oeqa/runtime/cases/virgl.py |  17 +++
 meta/classes/pixbufcache.bbclass              |   2 +-
 meta/conf/machine/include/qemuboot-x86.inc    |   2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  19 ++++
 meta/recipes-devtools/qemu/qemu.inc           |  38 ++++---
 .../qemu/0001-Add-a-missing-X11-include.patch |  23 ++++
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |   1 +
 .../gdk-pixbuf/gdk-pixbuf_2.36.11.bb          |   2 +-
 .../gnome/adwaita-icon-theme_3.28.0.bb        |   2 +
 meta/recipes-gnome/gtk+/gtk+3.inc             |  31 +++++-
 .../gtk+/gtk-icon-utils-native_3.22.30.bb     |  63 -----------
 ...endency-from-gtk-encode-symbolic-svg.patch | 102 ------------------
 .../hicolor-icon-theme_0.17.bb                |   2 +
 meta/recipes-graphics/cairo/cairo_1.14.12.bb  |   2 +-
 .../harfbuzz/harfbuzz_2.2.0.bb                |   2 +-
 .../jpeg/libjpeg-turbo_2.0.1.bb               |   3 +-
 .../libepoxy/libepoxy_1.5.3.bb                |  16 +++
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb  |   2 +
 meta/recipes-graphics/mesa/mesa.inc           |  12 ++-
 meta/recipes-graphics/pango/pango_1.42.4.bb   |   2 +-
 .../ttf-fonts/liberation-fonts_2.00.1.bb      |   2 +
 .../virglrenderer/virglrenderer_git.bb        |  17 +++
 .../xorg-lib/libxcomposite_0.4.4.bb           |   2 +-
 .../xorg-lib/libxdamage_1.1.4.bb              |   2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb |   2 +
 .../xorg-lib/libxtst_1.2.3.bb                 |   1 +
 .../recipes-support/atk/at-spi2-atk_2.30.0.bb |   2 +
 .../atk/at-spi2-core_2.30.0.bb                |   1 +
 meta/recipes-support/atk/atk_2.30.0.bb        |   4 +-
 .../shared-mime-info/shared-mime-info.inc     |   2 +
 meta/recipes-support/vte/vte_0.52.2.bb        |   2 +
 scripts/runqemu                               |  43 ++------
 33 files changed, 200 insertions(+), 233 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

-- 
2.17.1


