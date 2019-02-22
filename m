Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 404647CBD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y185so9036780wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=G72aMT8ZNz484184OSPQA6NWyYmdvmlA1ym8OFtqi6Q=;
	b=ITRIoI/KoxcDCLOer1aR7SGrOkaYJvyIpQS/oQ2yc7Q9pRc8kZPM1ejlhKwLKfQlju
	uHPDje929TncZqlJcYyT+NzoIECBR3+QUnKEalbmOF9G1YDS310HbOhbdCN6osFz2HEY
	jK8dGz+aUWvWRDH77ZHP4sQ2ECvM8qk64Zlv1G+xeEPKuxeEch7sJL+CyJjFtwgdPvoS
	3MPY0J/SJPfQE885hJuQ9OityOFZpZiz7m43El/RdLLgC21T1YAPRvuqejbG+6Gx3vAB
	Y5FCqPvqGa5MKkgHn6rLbGb/vscNk2GlGDm1zueJgICHELvzGt0mHqc8GrB62Cqww36M
	qA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=G72aMT8ZNz484184OSPQA6NWyYmdvmlA1ym8OFtqi6Q=;
	b=rr9JZ4DEsLlnhD9Ykgo3pliVfC+UrR6zO+65Yq86ttDq8cww8Q06YClrBFogjQzX5p
	EGPfR8WsYj51OwLX/yjcBrg/C2azpktHctDzkuRkRNp7ciotVuJwlt0g5WkXOX5eMER2
	cC2JK2HHauo9Oh0opSrK+2hWYNV48X4xhZBjSPsMAI1a1I5ppqrj5tMMtFHLkLb/29zR
	aVu1nsun6sy9Wp9BPDS/5RrMCYyvsRMlYegvhXA8aJ+DsEyKR5FDkxp8TaXznTCW2l8x
	pBbYD79SqkEEKQeuYFmrolEJCGLcmWA+eSeGFTd59/UNFBENiQBB60GyT0MO2CKeb+MW
	E+KA==
X-Gm-Message-State: AHQUAuY+GT516BuCVjMcuIT9hcfnAC/sHwWBAxmsV4JzV+vzwxEl5kf4
	MorWWIprMsK8yrugP2/eqFcWAaiO
X-Google-Smtp-Source: AHgI3IbrYxNqCeiDtBvkjd24Tf2JxPGzeUVvffl+WSymexkACazSptzUHSfRnZ+gN0Hgpgyrc/0SGw==
X-Received: by 2002:a1c:4c1a:: with SMTP id z26mr2756074wmf.139.1550846034279; 
	Fri, 22 Feb 2019 06:33:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:35 +0100
Message-Id: <cover.1550845989.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:54 -0000

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
V7 changes
- rename virglrender_git.bb to virglrendender_0.7.0.bb
- update the status of virglrenderer patches
- further clarify the PACKAGECONFIG settings for qemu

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

The following changes since commit 47eb3d00e9d6a66aee1283dab29af8117a006d6d:

  resulttool: Improvements to allow integration to the autobuilder (2019-02-21 12:34:00 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alexander Kanavin (12):
  virglrenderer: add a recipe
  qemu: enable virglrenderer and glx options for native/nativesdk builds
  qemu: build target variant with gtk+, and nativesdk variant without
    sdl
  local.conf.sample: adjust the qemu config to enable gtk+ instead of
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
 ...efile.am-explicitly-link-with-libdrm.patch | 31 +++++++++
 .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++
 .../virglrenderer/virglrenderer_0.7.0.bb      | 19 ++++++
 scripts/runqemu                               | 58 +++++++----------
 14 files changed, 340 insertions(+), 58 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb

-- 
2.17.1


