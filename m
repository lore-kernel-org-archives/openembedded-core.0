Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Rkgw6-0008Ob-BE
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:00:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Jan 2012 10:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94412659"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 10 Jan 2012 10:53:10 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 02:53:10 +0800
Message-Id: <cover.1326221405.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RFC PATCH 0/1] [RFC] enhance boot-directdisk.bbclass to generate .vmdk image
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
X-List-Received-Date: Tue, 10 Jan 2012 19:00:42 -0000

[RFC][PATCH] enhance boot-directdisk.bbclass to generate .vmdk image

The self-hosted-image work needs a live-bootable and r/w-able image format. The existing .iso isn't ok since it's readonly.
The existing .hddimg is not a good choice, since it has a two-option(boot,install) syslinux function that we don't need: we don't hope a user be potentially able to "install", and I think it may be not suitble to hack build_hddimg to hide the "install"? Moreever, .hddimg is not that compatibible with some devices and we hope to have the most compatibility.

So I think the .hdddirect format is a good choice and I made this patch to adopt it and also enhanced boot-directdisk.bbclass to generate .vmdk image so we can run it on vmware, too.
BTW, currently self-hosted-image is the only user of boot-directdisk.bbclass; with the adoption of .hdddirect and .vmdk formats, a user can still use "IMAGE_FSTYPES += 'live'" to generate the .iso and .hddimg format.

Please give comment. Thanks!

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:

  command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v7
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v7

Dexuan Cui (1):
  self-hosted-image: generate the .hdddirect and .vmdk image files

 meta/classes/boot-directdisk.bbclass          |   10 +++++++++-
 meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
1.7.6



