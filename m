Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvrAZ-0001Nu-QD
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:14:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2013 06:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="192236282"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2013 06:58:52 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:58:42 +0200
Message-Id: <cover.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] Remove obsolete update-modules
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
X-List-Received-Date: Thu, 17 Jan 2013 15:14:21 -0000

All,

Working on the postinstall improvements I stumbled over update-modules
script which postponed postinstalls for all the kernel or kernel module
packages for first boot. However, after some investigations I saw that this
script is pretty much obsolete. So, this patchset will remove it from all
recipes and bbclasses it was referenced.

Here's why it's useless now:

update-modules was used mainly to create the /etc/modules.conf file, out of files
in /etc/modutils, and /etc/modules file from /etc/modules-load.d/*.conf files.
Then it just ran depmod -A.

* depmod can be run in the postinst/postrm on its own, no need to run through update-modules;
* /etc/modules.conf is not used anymore by modprobe. modprobe now looks in
  /etc/modprobe.d/ directory for *.conf files;
* /etc/modules was used by /etc/init.d/modutils.sh to automatically load
  modules at boot. However, I improved the script in order to also look into
  /etc/modules-load.d/ directory and load all the modules listed there that were not
  already loaded (in case /etc/modules existed);

I know this is a major change and will affect a lot of people. But, in order
to support RO rootfs and run all the postinstalls on host, this change was
kind of necessary. Note, though, that the update-modules recipe was not removed
yet. It will be removed eventually but, for now, I decided to leave it in place
in case some people are nostalgic and want to still use it for a while.

Feel free to review and comment on the change.

Thanks,
Laurentiu

The following changes since commit 9f263a60e3521b800121a6f527a7b30dc9b62432:

  oprofile: add AArch64 support (2013-01-16 16:10:39 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/update-modules
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/update-modules

Laurentiu Palcu (6):
  modutils-initscripts: improve modutils.sh
  orinoco-conf: remove dependencies of update-modules
  hostap-conf: remove dependencies of update-modules
  module.bbclass: do not use update-modules anymore
  kernel.bbclass: remove references to update-modules
  bitbake.conf: remove update-modules from DISTRO_FEATURES

 meta/classes/kernel.bbclass                        |   36 +++++++++-----------
 meta/classes/module.bbclass                        |   13 ++++---
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-bsp/hostap/files/hostap_cs.modalias   |   34 +++++++++---------
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |   17 ++-------
 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb       |   17 ++-------
 .../modutils-initscripts/files/modutils.sh         |   34 +++++++++++++-----
 7 files changed, 75 insertions(+), 78 deletions(-)

-- 
1.7.9.5



