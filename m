Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 767DA6AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 19:10:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 20 May 2015 12:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,465,1427785200"; d="scan'208";a="496212259"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 20 May 2015 12:10:45 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 22:09:22 +0300
Message-Id: <cover.1432147061.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] xserver-xorg upgrade
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
X-List-Received-Date: Wed, 20 May 2015 19:10:45 -0000

The last commit does three things:
 * removes xf86-video-modesetting recipe
 * upgrades xserver-xorg (which now includes modesetting driver)
 * updates OELAYOUT_ABI (to avoid sanity check freaking out from the
   previous two)
The combination seems logically atomic to me but let me know if I should
divide it into separate commits instead.

Also, I'm not totally familiar with the tmp/sysroots/ layout so would
appreciate advice on the sanity.bbclass changes.

First commit fixes a sanity.bbclass bug that would be triggered by the
actual patch.

I've tested the ABI upgrade to the best of my ability (including wiping
tmp/, building an image from master, then building this branch). 

The following changes since commit 16caaabfcc678b03a0cd88aaeac15f9b8d1c3dad:

  bitbake: bitbake-user-manual-customization.xsl: Pointing to mirrors for XSL files. (2015-05-19 22:09:36 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg

Jussi Kukkonen (2):
  sanity.bbclass: import subprocess in correct function
  xserver-xorg: Upgrade 1.16.3 -> 1.17.1 (OELAYOUT_ABI change)

 meta-yocto/conf/distro/poky.conf                   |   2 +-
 meta/classes/sanity.bbclass                        |  10 +-
 meta/conf/abi_version.conf                         |   2 +-
 .../xorg-driver/xf86-video-modesetting_0.9.0.bb    |   8 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   9 +-
 ...Check-strings-length-against-request-size.patch | 145 ---------------------
 ...wap-XkbSetGeometry-data-in-the-input-buff.patch | 109 ----------------
 .../Fix-subwindow-in-Xi-emulated-events.patch      |  41 ------
 .../xserver-xorg/xshmfence-option.patch            |  57 --------
 ...erver-xorg_1.16.3.bb => xserver-xorg_1.17.1.bb} |   8 +-
 10 files changed, 19 insertions(+), 372 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.9.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.16.3.bb => xserver-xorg_1.17.1.bb} (74%)

-- 
2.1.4


