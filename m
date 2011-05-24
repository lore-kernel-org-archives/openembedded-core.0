Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOlJh-0000Ef-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 08:42:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2011 23:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,260,1304319600"; 
   d="scan'208";a="6647274"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 23:38:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 23:38:02 -0700
Message-Id: <cover.1306218459.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [RFC 0/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Tue, 24 May 2011 06:42:11 -0000

This RFC is still in the works, I would like to have folks look at it.

Previously, IMAGE_ROOTFS_SIZE was being set with _ext2 or _ext3 in 
various places, this caused problem, because it was not easily overriden.
By removing all the overrides, it allows the default mechanism to work 
correctly.

Currently that default mechanism takes a du of the rootfs image and then
adds in an overhead factor (IMAGE_OVERHEAD_FACTOR) or 1.3x of the du size,
in most cases this should be sufficent.  I am still testing this, and I
heard that there might be a post-install issue with RPM DB being larger.

This additional addresses a couple of other issues, by clearing all the bad
overrides, it allows Image or Layer overrides to work correctly either by 
setting IMAGE_ROOTFS_SIZE to some arbitray number or by allowing some extra
space be added above the existing overhead via the IMAGE_ROOTFS_EXTRA_SPACE
option.

The base default is now 64M (maybe I need to only set the one in
bitbake.conf, comments abou tthat?) with the minimal images base as 8M
(currently qemux86 sizes up to 9.9M used on an 11M rootfs).

There will be a corresponding patch for meta-yocto to remove the 
IMAGE_ROOTFS_SIZE defaults in atom-pc.conf and routerstationpro.conf

I welcome comments.

Thanks
	Sau!

The following changes since commit ad72ffadca975166cd8a416e4bf7b7fe33616d39:

  Merge branch 'master', remote-tracking branch 'origin/master' (2011-05-23 23:00:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib.git sgw/rootfs_size
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/rootfs_size

Saul Wold (2):
  IMAGE_ROOTFS_SIZE Cleanup
  image_types: add IMAGE_ROOTFS_EXTRA_SPACE

 meta/classes/image_types.bbclass                   |    9 ++++++---
 meta/conf/bitbake.conf                             |    4 ++++
 meta/conf/distro/include/default-distrovars.inc    |    2 --
 meta/conf/machine/include/qemu.inc                 |    2 --
 .../images/core-image-minimal-initramfs.bb         |    2 ++
 meta/recipes-core/images/core-image-minimal.bb     |    2 ++
 6 files changed, 14 insertions(+), 7 deletions(-)

-- 
1.7.3.4



