Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECE660248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:11:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 02:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="16923672"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 12 Dec 2016 02:11:47 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1E1276A4006;
	Mon, 12 Dec 2016 02:10:59 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:32 +0200
Message-Id: <cover.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/12] Xorg 1.19 and related driver updates
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
X-List-Received-Date: Mon, 12 Dec 2016 10:11:48 -0000

Fairly large xorg release (it's been more than a year since 1.18), with
input and video ABI breaks.

xfont2 is what xfont is now called: it's got a new API and it is
parallel installable with the old one.

Almost all of the driver updates are required because of the ABI
changes. I've removed some git xorg driver recipes that haven't been
touched in ages.


Thanks,
  Jussi



The following changes since commit 36e178a62f04e7f2611b26964efe46b9af97189a:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.8 (2016-12-09 08:54:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg19
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg19

Jussi Kukkonen (12):
  libxfont2: Add recipe
  xserver-xorg: Upgrade 1.18.4 -> 1.19.0
  xf86-input-evdev: Upgrade 2.10.3 -> 2.10.4
  xf86-input-keyboard: Upgrade 1.8.1 -> 1.9.0
  xf86-input-keyboard: Remove git recipe
  xf86-input-mouse: Upgrade 1.9.1 -> 1.9.2
  xf86-input-mouse: Remove git recipe
  xf86-input-synaptics: Upgrade 1.8.3 -> 1.9.0
  xf86-input-synaptics: Remove git recipe
  xf86-video-omap: Upgrade 0.4.4 -> 0.4.5
  xf86-video-vmware: Upgrade 13.1.0 -> 13.2.1
  xf86-input-libinput: Upgrade 0.22 -> 0.23

 ...-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} |  4 +-
 ...board_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} |  4 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         | 16 ------
 ...put_0.22.0.bb => xf86-input-libinput_0.23.0.bb} |  4 +-
 ...ut-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} |  5 +-
 .../xorg-driver/xf86-input-mouse_git.bb            | 18 -------
 ...tics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} |  4 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        | 18 -------
 ...ideo-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} |  4 +-
 .../0002-add-option-for-vmwgfx.patch               | 37 +++++++------
 ...mware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} |  4 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb  | 22 ++++++++
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  5 +-
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 61 ++++++++++++++++++++++
 ...c-Fix-wayland-scanner-and-protocols-locat.patch | 38 ++++++++++++++
 ...erver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} |  9 ++--
 16 files changed, 165 insertions(+), 88 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} (73%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.22.0.bb => xf86-input-libinput_0.23.0.bb} (63%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.1.bb => xf86-input-mouse_1.9.2.bb} (76%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} (79%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} (89%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} (78%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} (70%)

-- 
2.1.4


