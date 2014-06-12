Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83AA965E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147318"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:19 -0700
Message-Id: <cover.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [RFC - WIP v2 00/10] conf-files: New recipe to consolidate config file
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

This is a little further along, I would really like to get some
feedback on the direction I am taking this.

The idea is that a block of anonymous code will generate all the
metadata and do_install() function for the existing config files
such that a .bbappend can be created to override specific files
from a single recipe instead of from 10-12 different .bbappends.

[YOCTO #4011]


The following changes since commit b5a928af721026795be7b7f68b2dd577408afbe5:

  bitbake: toaster: add Project class models to orm (2014-06-11 10:35:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgw/one-config
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/one-config

Saul Wold (10):
  conf-files: New recipe to create single recipe for config files
  apmd: convert to use conf-files
  alsa-state: convert to use conf-files
  formfactor: convert to conf-files
  connman: convert to use conf-files
  init-ifupdown: convert to use conf-files
  pointer: convert to conf-files and remove
  xserver-xf86-config: convert to use conf-files and remove
  pointercal-xinput: convert to conf-files and remove
  xorg-config: move xorg.conf files into conf-files as bbappend

 .../conf-files/conf-files}/genericx86-64/xorg.conf |   0
 .../conf-files/conf-files}/genericx86/xorg.conf    |   0
 .../conf-files/conf-files_%.bbappend}              |   0
 meta/classes/conf-files.bbclass                    |   3 +
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   9 +--
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |   5 +-
 .../conf-files}/apmd_proxy.conf                    |   0
 .../conf-files}/asound.conf                        |   0
 .../conf-files/conf-files}/interfaces              |   0
 .../files => conf-files/conf-files}/machconfig     |   0
 .../conf-files}/pointercal                         |   0
 .../conf-files/conf-files}/pointercal.xinput       |   0
 .../conf-files/conf-files}/qemuall/wired-setup     |   0
 .../conf-files/conf-files}/qemuall/wired.config    |   0
 .../conf-files/conf-files}/qemuarm/interfaces      |   0
 .../conf-files}/qemuarm/machconfig                 |   0
 .../conf-files}/qemuarm/pointercal                 |   0
 .../conf-files/conf-files}/qemuarm/xorg.conf       |   0
 .../conf-files/conf-files}/qemuarmv6/interfaces    |   0
 .../conf-files}/qemuarmv6/machconfig               |   0
 .../conf-files}/qemuarmv6/pointercal               |   0
 .../conf-files/conf-files}/qemuarmv7/interfaces    |   0
 .../conf-files}/qemuarmv7/machconfig               |   0
 .../conf-files}/qemuarmv7/pointercal               |   0
 .../conf-files/conf-files}/qemumips/interfaces     |   0
 .../conf-files}/qemumips/machconfig                |   0
 .../conf-files}/qemumips/pointercal                |   0
 .../conf-files/conf-files}/qemumips/xorg.conf      |   0
 .../conf-files/conf-files}/qemumips64/interfaces   |   0
 .../conf-files/conf-files}/qemumips64/xorg.conf    |   0
 .../conf-files/conf-files}/qemuppc/interfaces      |   0
 .../conf-files}/qemuppc/machconfig                 |   0
 .../conf-files}/qemuppc/pointercal                 | Bin
 .../conf-files/conf-files}/qemuppc/xorg.conf       |   0
 .../conf-files/conf-files}/qemush4/interfaces      |   0
 .../conf-files/conf-files}/qemush4/xorg.conf       |   0
 .../conf-files/conf-files}/qemux86-64/interfaces   |   0
 .../conf-files}/qemux86-64/machconfig              |   0
 .../conf-files}/qemux86-64/pointercal              |   0
 .../conf-files/conf-files}/qemux86-64/xorg.conf    |   0
 .../conf-files/conf-files}/qemux86/interfaces      |   0
 .../conf-files}/qemux86/machconfig                 |   0
 .../conf-files}/qemux86/pointercal                 |   0
 .../conf-files/conf-files}/qemux86/xorg.conf       |   0
 .../conf-files/conf-files}/xorg.conf               |   0
 meta/recipes-bsp/conf-files/conf-files_1.0.bb      |  84 +++++++++++++++++++++
 meta/recipes-bsp/formfactor/formfactor_0.0.bb      |   7 +-
 meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 -
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 ------
 meta/recipes-connectivity/connman/connman-conf.bb  |  24 ------
 meta/recipes-connectivity/connman/connman.inc      |   2 +-
 meta/recipes-connectivity/connman/connman_1.23.bb  |   2 +-
 .../init-ifupdown/init-ifupdown_1.0.bb             |   6 +-
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |  20 -----
 .../xinput-calibrator/xinput-calibrator_git.bb     |   3 +-
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |  20 -----
 56 files changed, 98 insertions(+), 111 deletions(-)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/genericx86-64/xorg.conf (100%)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/genericx86/xorg.conf (100%)
 rename meta-yocto-bsp/{recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend => recipes-bsp/conf-files/conf-files_%.bbappend} (100%)
 create mode 100644 meta/classes/conf-files.bbclass
 rename meta/recipes-bsp/{apmd/apmd-3.2.2-14 => conf-files/conf-files}/apmd_proxy.conf (100%)
 rename meta/recipes-bsp/{alsa-state/alsa-state => conf-files/conf-files}/asound.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/pointercal (100%)
 rename meta/{recipes-graphics/xinput-calibrator/pointercal-xinput => recipes-bsp/conf-files/conf-files}/pointercal.xinput (100%)
 rename meta/{recipes-connectivity/connman/connman-conf => recipes-bsp/conf-files/conf-files}/qemuall/wired-setup (100%)
 rename meta/{recipes-connectivity/connman/connman-conf => recipes-bsp/conf-files/conf-files}/qemuall/wired.config (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarm/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarm/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarm/pointercal (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemuarm/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarmv6/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarmv6/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarmv6/pointercal (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuarmv7/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuarmv7/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuarmv7/pointercal (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemumips/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemumips/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemumips/pointercal (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemumips/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemumips64/interfaces (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemumips64/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemuppc/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemuppc/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemuppc/pointercal (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemuppc/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemush4/interfaces (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemush4/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemux86-64/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemux86-64/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemux86-64/pointercal (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemux86-64/xorg.conf (100%)
 rename meta/{recipes-core/init-ifupdown/init-ifupdown-1.0 => recipes-bsp/conf-files/conf-files}/qemux86/interfaces (100%)
 rename meta/recipes-bsp/{formfactor/files => conf-files/conf-files}/qemux86/machconfig (100%)
 rename meta/recipes-bsp/{pointercal/pointercal => conf-files/conf-files}/qemux86/pointercal (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/qemux86/xorg.conf (100%)
 rename meta/{recipes-graphics/xorg-xserver/xserver-xf86-config => recipes-bsp/conf-files/conf-files}/xorg.conf (100%)
 create mode 100644 meta/recipes-bsp/conf-files/conf-files_1.0.bb
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 delete mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb

-- 
1.8.3.2


