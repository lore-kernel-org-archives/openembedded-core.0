Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 94095601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:20:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jun 2016 07:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,433,1459839600"; d="scan'208";a="970637533"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2016 07:18:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 4E81D6A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:06:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 17:17:52 +0300
Message-Id: <cover.1465308900.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/4] image creation improvements
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
X-List-Received-Date: Tue, 07 Jun 2016 14:20:31 -0000

Hi,

This patchset contains various improvements for the image creation functionality
made by Patchick Ohly during his work on bug #9076:
 - fixed dependency calculation for conversion chaining
 - renamed COMPRESSION variables to CONVERSION as the term "compression"
   is no longer accurate
 - prioritized specialized image creation methods over using conversion chaining

The changes look reasonable to me. However, it would be good to hear other
people opinions as some changes are quite complex.

Changes in v2: rebased on top of master-next
               returned image_getdepends back to image_types.bbclass
Changes in v3: rebased on top of recent master

The following changes since commit 9c75c64cb99a3d5103b7bb4e2a700e5bb5af516b:

  kernel-dev: Fix the locations of .config and source directory (2016-06-06 22:53:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/image-type-9076
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/image-type-9076

Patrick Ohly (4):
  image.bbclass: fix dependency calculation when using conversion
    chaining
  image creation: support converting masked types
  image.bbclass: rename COMPRESS(ION) to CONVERSION
  image.bbclass: prefer specialized image creation methods over chaining

 meta/classes/image-live.bbclass                    |   2 +-
 meta/classes/image-vm.bbclass                      |  33 +----
 meta/classes/image.bbclass                         | 119 ++++++++++-------
 meta/classes/image_types.bbclass                   | 147 ++++++++++++++-------
 meta/classes/image_types_uboot.bbclass             |  18 +--
 meta/conf/documentation.conf                       |   1 -
 .../images/build-appliance-image_15.0.0.bb         |   6 +-
 7 files changed, 187 insertions(+), 139 deletions(-)

-- 
2.1.4


