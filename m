Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fB4-0006Tm-5n
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:50:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086831"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:06 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:34:54 +0200
Message-Id: <cover.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/8] Generate fonts cache on host and other fixes
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
X-List-Received-Date: Tue, 05 Feb 2013 09:50:59 -0000

Hi all,

The main addition of this patchset is the ability to generate the fonts cache
on host, at do_rootfs time. For that, a new feature has been added to fc-cache
and fc-cat in fontconfig package (a --sysroot option basically) and you can find
more info on how to use this feature in the comment of the patch itself. I'm
working with the fontconfig maintainers to merge this upstream. Also, a new class
(fontcache.bbclass) has been added that needs to be included by all font packages,
so that the postinst/postrm scriptlets are generated correctly.

Other fixes:
* fix pulseaudio postinstall;
* remove the debugging option from package_ipk/rootfs_ipk bbclass'es because it
  generates a lot of 'noise' in the log.do_rootfs;
* add a meaningful error message if an intercept hook script fails;

NOTE: the /var/cache directory must NOT be in volatiles in order for the fonts cache
to be deployed on target. I sent a patchset yesterday that does exactly that.

Thanks,
Laurentiu

The following changes since commit 7e9cb437b1b720e656f4a33f73c07c5dc7356a2c:

  dropbear: fix RPROVIDES (2013-02-04 23:31:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/fc-rebased
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/fc-rebased

Laurentiu Palcu (8):
  add fontcache.bbclass
  add qemuwrapper-cross recipe
  qemu.bbclass: return qemuwrapper instead of qemu-allarch
  image.bbclass: add a proper error message if hook script fails
  fontconfig: add sysroot option to fc-cache and fc-cat
  liberation-fonts: use the new fontcache.bbclass
  package_ipk, rootfs_ipk: remove the "set -x"
  pulseaudio: do not postpone postinstall

 meta/classes/fontcache.bbclass                     |   47 ++
 meta/classes/image.bbclass                         |    4 +
 meta/classes/package_ipk.bbclass                   |    2 +-
 meta/classes/qemu.bbclass                          |    6 +-
 meta/classes/rootfs_ipk.bbclass                    |    2 +-
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   14 +
 .../fontconfig/fontconfig-2.10.2/97_fontconfig     |    1 -
 ...Add-sysroot-option-to-fc-cache-and-fc-cat.patch |  731 ++++++++++++++++++++
 .../fontconfig/fontconfig_2.10.2.bb                |   13 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |   14 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    7 +-
 11 files changed, 812 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/fontcache.bbclass
 create mode 100644 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/97_fontconfig
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/Add-sysroot-option-to-fc-cache-and-fc-cat.patch

-- 
1.7.9.5



