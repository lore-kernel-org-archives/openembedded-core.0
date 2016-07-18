Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96F4171951
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:34:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jul 2016 06:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="1023935236"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2016 06:34:19 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:33:56 +0300
Message-Id: <cover.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/9] Upgrade mesa, wayland
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
X-List-Received-Date: Mon, 18 Jul 2016 13:34:25 -0000

Changes since V1:
* wayland: Added Khems musl build fix patch
* weston: Added a musl build fix patch
* mesa-demos (new patch): require X11 distro feature

Issues:
* gbm fails to load drivers with musl: "Error relocating
  /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not found"


Original cover letter follows:

Major releases of wayland components and especially mesa. The X
upgrades are all fairly small ones.

Mesa has been tested with piglit (looks pretty good). I did not have
a modern test device at hand so have not verified the OpenGL 4.3
support. Wayland was just smoke tested: seems to work fine.

Jussi

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/graphics
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/graphics

Jussi Kukkonen (9):
  mesa-demos: Require X11 distro feature
  mesa: Upgrade 11.2.2 -> 12.0.1
  wayland-protocols: Upgrade 1.3 -> 1.4
  wayland: Upgrade 1.10.0 -> 1.11.0
  weston: Upgrade 1.10.0 -> 1.11.0
  libxfixes: Upgrade 5.0.1 -> 5.0.2
  xkeyboard-config: Upgrade 2.17 -> 2.18
  xf86-input-evdev: Upgrade 2.10.2 -> 2.10.3
  xf86-input-libinput: Upgrade 0.16.0 -> 0.19.0

 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb     |  4 +-
 .../mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb}        |  4 +-
 .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 ---------
 ...d-protocols_1.3.bb => wayland-protocols_1.4.bb} |  6 +-
 ...0001-scanner-Use-unit32_t-instead-of-uint.patch | 30 ++++++++++
 .../{wayland_1.10.0.bb => wayland_1.11.0.bb}       |  8 ++-
 ...1-configure.ac-Fix-wayland-protocols-path.patch |  4 +-
 .../0001-shared-include-stdint.h-for-int32_t.patch | 28 +++++++++
 ...ch-Provide-a-default-version-that-doesn-t.patch | 68 +++++++++++-----------
 .../make-libwebp-explicitly-configurable.patch     | 37 ------------
 .../wayland/{weston_1.10.0.bb => weston_1.11.0.bb} |  8 +--
 ...-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb} |  4 +-
 ...put_0.16.0.bb => xf86-input-libinput_0.19.0.bb} |  4 +-
 .../{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb}     |  4 +-
 ...ard-config_2.17.bb => xkeyboard-config_2.18.bb} |  4 +-
 17 files changed, 120 insertions(+), 124 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.3.bb => wayland-protocols_1.4.bb} (80%)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
 rename meta/recipes-graphics/wayland/{wayland_1.10.0.bb => wayland_1.11.0.bb} (87%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.10.0.bb => weston_1.11.0.bb} (95%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.16.0.bb => xf86-input-libinput_0.19.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.17.bb => xkeyboard-config_2.18.bb} (88%)

-- 
2.1.4


