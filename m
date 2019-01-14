Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1950F7A076
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so9273326wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=S2ouEanyZWdLg+0dgJsqB248edXZCBKI7Nx9rua8S9c=;
	b=qxVn4Xfr3AAP05qy3Z3fu04D5txcJ0v016e5Tw3Vw/ItKjFg1nCBShXT/MYO5tfVzn
	q14I76dqJOri6jHsh3V2A3Wvx7dnFegHvDKJg/rGTameUYtenSBbNI1lqkLiFj0frjb3
	WEsGRMWklwbjItuj2Jtu5JBAEipi7bEioEmXIBv3EYscUBiF654aYGoIUbeokRQBH8rd
	u7nv1NSt299LHNLTGhyb1wKi4KCHMIRFI8wJ9YYYsFo2REFs4V7ppoSjePQVfrifu9n7
	NCaT4HpQI1DO7gQia0CmfWwlpzUStd8/OShCA0pxV2OVWVUIBnNzIhzCpRqWmSo96iTo
	Gj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S2ouEanyZWdLg+0dgJsqB248edXZCBKI7Nx9rua8S9c=;
	b=ly7K1pKWDvEtDxmEMv5V01UKvTC5pZ00XskuzxvY1vEXnoHeHYF3O/9f68W8Ft1TcN
	IvZyT86hv8bCI7v6mHLPvtb4kAba8ZvYvL4qXgfjIi0imaY9lG8A7lj6Q3Wq9x2tNEw+
	CjUg2cJPkXnPaG3hKwIfN8+XnbjSxQpYyP7xCE/+LZBxS7dJC6jtfWAli6nhKzOCeUBH
	hlRoD0QK0YwY3nhPnak55R3TaMBMA8Y1dHZoOAYZihbLQvFMW2FY9ygNox07yCaPMeR5
	NW/yTFQzfN3GMyB7XAjGEFGczRAb8O/a3nX0bSEigoS2gcOh36gX1WfXj0cv4nzJYvZl
	WneA==
X-Gm-Message-State: AJcUukfW+94PCdfW3jUnjQwO09UdwoXyuFqY82utlI4T0Z7vsnAiWs/T
	NjUInxVdpipsOqrNbPYkPL6U8rdj
X-Google-Smtp-Source: ALg8bN6bTjYQt8slsFUftt5Z1oTgzFyx1Tq/F+F0VXHMHT8t3zveLPHK/qoTJ1cVrHivKtwLGc7afw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr11920698wme.1.1547478205254;
	Mon, 14 Jan 2019 07:03:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:02:56 +0100
Message-Id: <cover.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 00/23] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:25 -0000

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

The following changes since commit 0c9f6e9bb18b2a52b5a5e828772a9619ee4d8515:

  strace: add lost Upstream-Status (2019-01-14 11:49:07 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (23):
  gtk+3: enable native/nativesdk variant
  gtk+3: remove the gtk-icon-utils-native recipe
  shared-mime-info: update the database also in native builds
  gtk+: drop support for choosing between 2.x and 3.x implementations of
    gtk-update-icon-cache
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
  qemu: add a gettext-native dependency
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
 meta/recipes-devtools/qemu/qemu.inc           |  40 ++++---
 .../qemu/0001-Add-a-missing-X11-include.patch |  23 ++++
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |   1 +
 .../gdk-pixbuf/gdk-pixbuf_2.36.11.bb          |   2 +-
 .../gnome/adwaita-icon-theme_3.28.0.bb        |   2 +
 meta/recipes-gnome/gtk+/gtk+.inc              |   5 +-
 meta/recipes-gnome/gtk+/gtk+3.inc             |  29 +++--
 .../gtk+/gtk-icon-utils-native_3.22.30.bb     |  63 -----------
 ...endency-from-gtk-encode-symbolic-svg.patch | 102 ------------------
 .../hicolor-icon-theme_0.17.bb                |   2 +
 meta/recipes-graphics/cairo/cairo_1.14.12.bb  |   2 +-
 .../harfbuzz/harfbuzz_2.2.0.bb                |   2 +-
 .../jpeg/libjpeg-turbo_2.0.1.bb               |   3 +-
 .../libepoxy/libepoxy_1.5.3.bb                |  12 +++
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
 scripts/runqemu                               |  46 ++------
 34 files changed, 193 insertions(+), 244 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

-- 
2.17.1


