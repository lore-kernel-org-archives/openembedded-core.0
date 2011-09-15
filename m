Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R4Ki3-0005n8-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 00:47:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2011 15:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48916282"
Received: from unknown (HELO localhost) ([10.7.199.145])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2011 15:41:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 15:41:36 -0700
Message-Id: <cover.1316126173.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] initrd contamination and explict PATH
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
X-List-Received-Date: Thu, 15 Sep 2011 22:47:08 -0000

I ran into a bit of a nasty issue where EXTRA_IMAGE_FEATURES set in my
local.conf was causing core-image-initramfs to pull a bunch of files into
my initrd, including bash and a 100+MB vmlinux image. The 85M initrd caused
some strange initial boot behavior, and bash in the initrd caused our init
scripts to fail as bash has a different default PATH than busybox.

The following patches address these issues.

Live boot tested on 32 bit x86.

The following changes since commit bb4a5c44da23a1bb363f1f081cf1644fd7975957:

  linux-yocto: remove emenlow from meta-yocto bbappend (2.6.37 version) (2011-09-15 11:27:22 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/initrdscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/initrdscripts

Darren Hart (2):
  Set an explicit path for the initrd scripts
  Prevent IMAGE_FEATURES from contaminating initrd

 .../images/core-image-minimal-initramfs.bb         |    3 +++
 meta/recipes-core/initrdscripts/files/init-boot.sh |    2 ++
 .../initrdscripts/files/init-install.sh            |    2 ++
 meta/recipes-core/initrdscripts/files/init-live.sh |    4 +++-
 4 files changed, 10 insertions(+), 1 deletions(-)

-- 
1.7.6



