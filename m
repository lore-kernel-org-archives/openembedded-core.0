Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJaD-00043l-20
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:36:17 +0200
Received: by bkat8 with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IjIUsipFGu23BelWsm1hHbtpe0K1DU0qYIfXDSjqrvU=;
	b=rTSU88V3DDDovRI/JFy/M1DJ/PZLdYqQN5XvB0G8y1oDy6VaAlBZ83Fvx62z4AK+jL
	13XeKylvYd2+mIJr8FNvb3FUH42FwYF7fMFuKxiIseISU4iVacoF3jRatw0z7gjT52Jd
	PJyidp3GXO6awZMlsIcp1S1Wu9ZbZnVdpOofo=
Received: by 10.204.152.195 with SMTP id h3mr2435089bkw.1.1318505433342;
	Thu, 13 Oct 2011 04:30:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm3253619bku.9.2011.10.13.04.30.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:30:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:24 +0200
Message-Id: <cover.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [oe-core 00/20] Xorg, mesa changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:36:17 -0000

Mostly cleanup in mesa directory.

Most controversial is 
mesa-dri: introduce MACHINE_DRI_MODULES
but maybe we can use it as distro variable and keep it with default arch.
But then we cannot just add ie glamo dri module from meta-openmoko like this:
http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=b50c8d00cf764c276b0792c0623b8eda3d18d343
without distro (setting MACHINE_DRI_MODULES) depending on such bsp layer.

The following changes since commit 5ad1ca59dea6d5045f252ed7b786ad193faced64:

  xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/x11-v4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11-v4

Martin Jansa (20):
  xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
  xserver-xorg: move PE to xserver-xorg-common and bump it
  xorg-driver-common: bump PE for upgrade path for meta-oe users
  mesa-dri-glsl-native: fix LICENSE
  mesa: move common patches which could be used in both mesa-dri and
    mesa-xlib from mesa-dri to mesa
  mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
  mesa-common: MesaDemos is now separate recipes, bump PE, introduce
    INC_PR
  mesa-common: use glx-use-tls.inc instead of enabling glx-tls every
    time
  mesa-7.11: move shared DEPENDS, SRC_URI, checksums and
    do_configure_prepend to shared .inc file
  mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
  mesa: package gl/egl/osmesa to separate packages
  mesa-xlib: move shared options to .inc
  mesa-dri: move shared options to mesa-dri.inc
  mesa-dri: introduce MACHINE_DRI_MODULES
  mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging
    each lib in separate package
  mesa-dri: drop COMPATIBLE_HOST, swrast should work for everybody
  mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add
    mesa-xlib_git
  mesa-git: lower D_P a bit more then all mesa-dri
  mesa-git: upgrade from 7.7+git to 7.11+git
  mesa-git: fix LIC_FILES_CHKSUM

 meta/recipes-graphics/mesa/mesa-7.11.inc           |   14 ++
 meta/recipes-graphics/mesa/mesa-common.inc         |   36 ++++-
 .../mesa/mesa-dri-glsl-native_7.11.bb              |    2 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   24 +++
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |   46 ------
 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h |  162 --------------------
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |   50 +------
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |   59 +-------
 meta/recipes-graphics/mesa/mesa-git.inc            |   20 +++
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch   |   57 +++++++
 meta/recipes-graphics/mesa/mesa-xlib.inc           |    1 +
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |   31 +----
 meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    8 +
 .../mesa/{mesa-dri => mesa}/crossfix.patch         |    0
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +-
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    2 -
 19 files changed, 172 insertions(+), 347 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/cross2.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
 create mode 100644 meta/recipes-graphics/mesa/mesa-git.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_git.bb
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/crossfix.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)

-- 
1.7.7



