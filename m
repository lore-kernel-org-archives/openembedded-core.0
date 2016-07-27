Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 08D6C606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:27:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 06:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="146297187"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 06:27:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id DFD246A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:27:44 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 15:51:20 +0300
Message-Id: <cover.1469623667.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 0/4] image creation improvements
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
X-List-Received-Date: Wed, 27 Jul 2016 13:28:00 -0000

Hi,

This patchset contains various improvements for the image creation functionality
made by Patchick Ohly during his work on bug #9076:
 - fixed dependency calculation for conversion chaining
 - renamed COMPRESSION variables to CONVERSION as the term "compression" is no longer accurate
 - prioritized specialized image creation methods over using conversion chaining
 - support converting masked types

The changes look reasonable to me. However, it would be good to hear other
people opinions as some changes are quite complex.

Changes in v2: rebased on top of master-next
               returned image_getdepends back to image_types.bbclass
Changes in v3: rebased on top of recent master
Changes in v4: rebased on top of recent master

The following changes since commit 039f47ad197a9a53109c9f3deadd9c35e62c056d:

  uclibc: remove meta-yocto-bsp append (2016-07-26 08:56:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/image-type-9076
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/image-type-9076

Patrick Ohly (4):
  image.bbclass: fix dependency calculation when using conversion chaining
  image creation: support converting masked types
  image.bbclass: rename COMPRESS(ION) to CONVERSION
  image.bbclass: prefer specialized image creation methods over chaining

 meta/classes/image-live.bbclass                    |   2 +-
 meta/classes/image-vm.bbclass                      |  33 +----
 meta/classes/image.bbclass                         | 119 +++++++++++-------
 meta/classes/image_types.bbclass                   | 140 ++++++++++++++-------
 meta/classes/image_types_uboot.bbclass             |  18 +--
 meta/conf/documentation.conf                       |   1 -
 .../images/build-appliance-image_15.0.0.bb         |   6 +-
 7 files changed, 181 insertions(+), 138 deletions(-)

-- 
2.1.4


