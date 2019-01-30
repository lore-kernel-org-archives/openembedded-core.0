Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC7B6006E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so25515688wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jkVwJQVbOvoV9va4DYe3h4VC2fAv1WyyueLJJgo9EDc=;
	b=oot4vZTOMb1e2xGpUPEwcAic44+oyGJRr0JQc8fKzW4luukHR9yPZraYzvBaZ31WCZ
	wx6tSGWZ5rbkxk3HiIt0261eqwwwLxf2Rl0hp0eoa1FFMmYLzBh2L//NMTBewjr+aoMc
	D2PK0Lvx3fGq8JfuDLqoe87+E1MLkyDaKdfmB8gBPr6ZkKE93sgK6MUK6BAdPu/g5Cx/
	rSKJGFLoFlkmOU8wYg7L7k8twMDRYvo2SA0vr5EG0FgfKy7U1v4o6Ks/D/V/CZX601ko
	i0G0yJNww4FiPxbULzWfr0+kaas6NN2MtLyMs8xA198H1zGoDMiz1O9m8Muk5kCj1mHG
	T+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jkVwJQVbOvoV9va4DYe3h4VC2fAv1WyyueLJJgo9EDc=;
	b=raAsc4+0k2UFMKNAYv6wPzewVTaVnO97S2Nba/FOMEg3mxZPt0zdMYRtA4sl8LWOer
	yoogTRJ4P2Gm6jhRNh/4yQnFd8Ik3eSrL4cF9pv7st0dOds2E3i+ipdXNEMBu7RHzKJS
	XuHePuLpO0lX8N9bi5Hk4Bur+636ikxc/5WwhaQ6hrNPR0j0An2gz1DVaMLcl4KH8uRj
	xrSM0+1EdsZ6M85AviQgNPR34tnFyQa4iEHcijl7mJwQuRoPjRfDKRxJjh5FWXkY+Bvk
	8GZRwqWh8saig/dakEShTtmxUMJ8YwR7BjhuFoi6hnR9V8ezxVbx+N1IVBHahxNoDIRs
	baqA==
X-Gm-Message-State: AJcUukcneoLQCNQTcJJS4Za5raw3BBAv5RpXsUsehPKYN8jKljp2OtxD
	DExpiNaV5VV7V0pjmpciZtUPJuaX
X-Google-Smtp-Source: ALg8bN6FqHMMYsaAE6ObrgGTn730M3Qe0BKpZO9xStwRqcQ7CBEfQUqJHv8l6MmTf2wlANW8KTMY+Q==
X-Received: by 2002:adf:d1d2:: with SMTP id m18mr30795462wri.138.1548845989646;
	Wed, 30 Jan 2019 02:59:49 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:23 +0100
Message-Id: <cover.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 00/20] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:49 -0000

V2 changes: addressed feedback from the first review round
V3 changes:
- better fix for missing qemu X11 include, as discussed with upstream
- maintainers.inc entry for virglrenderer
- egl-headless support (see below for details)
- improvements to kmscube recipe
- fix to vte-native to allow building it with gcc 4.8
V4 changes
- address failures uncovered by yocto autobuilder
V5 changes
- remove patches that have been merged to master
- replace BBCLASSEXTEND_remove with PREFERRED_PROVIDER for mesa
recipe variants

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

The following changes since commit a7774aced031de1c8e42d0559182e802df8bcaa8:

  bitbake: gitsm: The fetcher did not process some recursive submodules properly. (2019-01-28 23:14:27 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (20):
  gtk+3: enable native/nativesdk variant
  gtk+3: remove the gtk-icon-utils-native recipe
  mesa: enable native and nativesdk variants
  default-providers: set mesa as default provider for nativesdk-mesa
  virglrenderer: add a recipe
  qemu: enable virglrenderer and glx options for native/nativesdk builds
  qemu: drop --with-gtkabi option, as it is no longer supported
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
 .../conf/distro/include/default-providers.inc |   2 +
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  50 +++++++++
 meta/recipes-devtools/qemu/qemu.inc           |  41 ++++---
 .../qemu/0001-Add-a-missing-X11-include.patch |  65 +++++++++++
 ...-egl-headless-add-egl_create_context.patch |  50 +++++++++
 ...x-libcap-header-issue-on-some-distro.patch |   2 +-
 ...-messages-when-qemi_cpu_kick_thread-.patch |   2 +-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |   2 +
 meta/recipes-gnome/gtk+/gtk+3.inc             |  28 ++++-
 .../gtk+/gtk-icon-utils-native_3.22.30.bb     |  63 -----------
 ...endency-from-gtk-encode-symbolic-svg.patch | 102 ------------------
 .../jpeg/libjpeg-turbo_2.0.1.bb               |   1 +
 meta/recipes-graphics/mesa/mesa.inc           |  20 ++--
 .../0001-vtest-add-missing-includes.patch     |  38 +++++++
 .../virglrenderer/virglrenderer_git.bb        |  19 ++++
 meta/recipes-support/atk/atk_2.30.0.bb        |   2 +
 ...chool-asignment-to-avoid-gcc-4.8-err.patch |  27 +++++
 meta/recipes-support/vte/vte_0.52.2.bb        |   5 +-
 scripts/runqemu                               |  58 ++++------
 22 files changed, 381 insertions(+), 234 deletions(-)
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


