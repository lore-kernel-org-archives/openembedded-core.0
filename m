Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYZU2-0001WH-Vi
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:42:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Nov 2012 01:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,249,1352102400"; d="scan'208";a="217517400"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 14 Nov 2012 01:28:12 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 11:27:57 +0200
Message-Id: <cover.1352884713.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 00/12] xorg upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 09:42:13 -0000

Changes in v2:
 * changes to yocto BSP related files were separated and will be sent to the
   appropriate list;
 * added RPROVIDES/RREPLACES/RCONFLICTS where applicable (libdrm, xserver-xorg
   and xf86-video-omap recipes). Had a little help from Ross with these, thanks!

Hi,

This patchset contains, mainly, xorg server/drivers upgrades and an unrelated
one: mdadm. The yocto autobuilder nightlies (x86/x86_64/ppc/arm/mips) compiled
successfully. Compilations were done on top of the following commit:
78983e939ab17f02f8911c8b0d0e326b419856b9.

The tests done were basic functionality tests in qemu. xf86-input-synaptics and
xf86-video-omap were not tested due to lack of hardware. If anybody is willing
to give them a try, they're welcome.

Thanks,
Laurentiu

The following changes since commit 78983e939ab17f02f8911c8b0d0e326b419856b9:

  lib/oe/classextend: Ensure we don't extend expressions more than once (2012-11-06 09:34:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (12):
  xf86-video-vesa: upgrade to 2.3.2
  xf86-video-intel: upgrade to 2.20.12
  xf86-input-mouse: upgrade to 1.8.1
  xkeyboard-config: upgrade to 2.7
  xcb-proto: upgrade to 1.8
  fontconfig: upgrade to 2.10.1
  libdrm: upgrade to 2.4.40
  xserver-xorg: upgrade to 1.13.0
  mdadm: upgrade to 3.2.6
  xf86-video-vmware: Add compat API
  xf86-input-synaptics: add mtdev dependency
  xf86-video-omapfb: upgrade to 0.4.2

 meta/conf/machine/include/ia32-base.inc            |    5 +-
 .../mdadm/{mdadm_3.2.5.bb => mdadm_3.2.6.bb}       |    6 +-
 meta/recipes-graphics/drm/libdrm.inc               |   18 +-
 .../drm/libdrm/disable-cairo.patch                 |   74 ---
 .../drm/{libdrm_2.4.39.bb => libdrm_2.4.40.bb}     |    5 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    4 +-
 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    0
 ...native_2.9.0.bb => fontconfig-native_2.10.1.bb} |    0
 .../{fontconfig_2.9.0.bb => fontconfig_2.10.1.bb}  |    7 +-
 .../xcb/{xcb-proto_1.7.1.bb => xcb-proto_1.8.bb}   |    4 +-
 ...ut-mouse_1.7.2.bb => xf86-input-mouse_1.8.1.bb} |    7 +-
 .../xorg-driver/xf86-input-synaptics_1.6.2.bb      |    4 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |    4 +-
 ...intel_2.20.8.bb => xf86-video-intel_2.20.12.bb} |    6 +-
 ...-video-omapfb_git.bb => xf86-video-omap_git.bb} |   27 +-
 ...ideo-vesa_2.3.1.bb => xf86-video-vesa_2.3.2.bb} |    6 +-
 ...ware-port-vmware-driver-to-new-compat-API.patch |  655 ++++++++++++++++++++
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    3 +-
 ...board-config_2.1.bb => xkeyboard-config_2.7.bb} |   10 +-
 .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 ---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |   28 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   32 +-
 ...erver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} |    5 +-
 27 files changed, 751 insertions(+), 229 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.5.bb => mdadm_3.2.6.bb} (86%)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/disable-cairo.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.39.bb => libdrm_2.4.40.bb} (44%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.9.0 => fontconfig-2.10.1}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.9.0 => fontconfig-2.10.1}/fix-pkgconfig.patch (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.9.0.bb => fontconfig-native_2.10.1.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.9.0.bb => fontconfig_2.10.1.bb} (91%)
 rename meta/recipes-graphics/xcb/{xcb-proto_1.7.1.bb => xcb-proto_1.8.bb} (61%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.2.bb => xf86-input-mouse_1.8.1.bb} (64%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.8.bb => xf86-video-intel_2.20.12.bb} (84%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb => xf86-video-omap_git.bb} (43%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.1.bb => xf86-video-vesa_2.3.2.bb} (80%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmware-port-vmware-driver-to-new-compat-API.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.1.bb => xkeyboard-config_2.7.bb} (75%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/mips64-compiler.patch (42%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} (56%)

-- 
1.7.9.5



