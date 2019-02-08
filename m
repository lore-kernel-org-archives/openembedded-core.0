Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60AD87C5B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so3704312wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=yEXv8u7PdsL8cjm9ixZlhhxSJ9TMfjHFundmragyAXU=;
	b=Mm+8PRbEuUxA8+Ja32GCOKMF2mkfPb6hc/Yi7feNRdP7HjqYXutApIwaucsqF8HpZy
	8aRpyMrMhwsb2LWEyoxf6epf8QmAIRHW5t80pOjmig+AYGyJXjWPOCBd7oMFfhBsgrWm
	wW6YahZKfiZAWjexlPQU7fgEWiTScTtGk5sbzNWwN6Sf6R8B62ICmU7jl1eoJ+kJdEpv
	ofHbKYNgOZslgELig6dRil11c59uHroM0ZnrXZdi2e6H9UbGUayOciMAKgjzYZzioJZE
	dwS0x4LU4QdeLdPYxBlTzJp7okI/5I7NZtuKg4CrTIQX4evP5NjxmaiI2dkAfGyF0ITc
	8CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yEXv8u7PdsL8cjm9ixZlhhxSJ9TMfjHFundmragyAXU=;
	b=lIOickpaqU0X/ipA8lJ8+gT1wOb9NKmx9OAK6X/zgErt57GOzLn2JXJ31dSQR0Lg4j
	WsMzObSOiLqsk/cFugUmWjYcmUsC9D45b/yZ6EYreVqcujAzQmud9GeQC0iuhk5dfZAo
	4UHZGwkUFVpcD+bKs7QtScQ6JcWjbz8mLEkNS/l5uJTxRwj5+sNF5HeP1yBk3CDAw1Wd
	JRnEFehKSVW9tx4dd7g8zUq3TkEX1JBAZyiAsIcCSbzznR+7m866dHVQYzZYYddj/pOo
	YzuklUfgWSsa+2GYAM8m7xEok//0cH+HrVvnjxxlPy2CgCVPbjrJJz/zdzpfbrz8lpZz
	2PMg==
X-Gm-Message-State: AHQUAuYk0dA6sEAKCIdpNMkA03oEiC1GWmnPIbYkBef0hbKDO9KBhjIj
	yDcUY7j3sEF70MbPP1L8npi9Ib9d
X-Google-Smtp-Source: AHgI3IaZvJ5WcfdPjAqQfi2Yzpbtbxw5QIz+6HSi9LJWcKjQvjG90wh+wGm+ej+0QZKIguYk3mhbPA==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr12517271wmg.53.1549637160384; 
	Fri, 08 Feb 2019 06:46:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.45.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:45:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:41 +0100
Message-Id: <cover.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 00/12] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:00 -0000

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
V6 changes
- again rebase to master
- tweak oe-selftest to remove unnecessary re-builds of qemu-native

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

The following changes since commit 29099c8a49bf9d35514bbc1e77657655598a80cc:

  maintainers.inc: replace Changhyeok Bae's @lge email address with a personal one (2019-02-08 10:57:19 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (12):
  virglrenderer: add a recipe
  qemu: enable virglrenderer and glx options for native/nativesdk builds
  local.conf.sample: adjust the qemu config to enable gtk+ instead of
    sdl
  qemu: build target variant with gtk+, and nativesdk variant without
    sdl
  qemu: remove support for building against host sdl
  qemu: add a gettext-native dependency to gtk option
  qemu: add a patch to avoid a missing definition error
  qemu: add environment variable wrappers to make qemu look good with
    gtk frontend
  qemu: add a backported patch to fix egl-headless support
  runqemu: add options for enabling virgl GL acceleration
  runqemu: do not check for GL libraries
  selftest: add tests for virgl GL acceleration

 meta-poky/conf/local.conf.sample              |  9 +--
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 28 ++++++++
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 52 +++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           | 41 +++++++-----
 .../qemu/0001-Add-a-missing-X11-include.patch | 65 +++++++++++++++++++
 ...-egl-headless-add-egl_create_context.patch | 50 ++++++++++++++
 ...x-libcap-header-issue-on-some-distro.patch |  2 +-
 ...-messages-when-qemi_cpu_kick_thread-.patch |  2 +-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |  2 +
 .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++
 .../virglrenderer/virglrenderer_git.bb        | 19 ++++++
 scripts/runqemu                               | 58 +++++++----------
 13 files changed, 309 insertions(+), 58 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

-- 
2.17.1


