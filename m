Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5A56573259
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 17:18:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2016 10:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="98551804"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 06 May 2016 10:18:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 7DAC26A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:06:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 17:58:43 +0300
Message-Id: <cover.1462545440.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [RFC][PATCH 0/7] image creation improvements
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
X-List-Received-Date: Fri, 06 May 2016 17:18:43 -0000

Hi,

This patchset contains various improvements for the image creation functionality
made by Patchick Ohly during his work on bug #9076:
 - added support for zip compression
 - fixed dependency calculation for conversion chaining
 - converted vmdk/vdi/qcow2 image types into conversion commands
 - renamed COMPRESSION variables to CONVERSION as the term "compression"
   is no longer accurate
 - prioritized specialized image creation methods over using conversion chaining

The changes look reasonable to me. However, it would be good to hear other
people opinions as some changes are quite complex.

The following changes since commit 912e372bd3097b1475df2689f9aec88dd3198976:

  scripts/lib/bsp/kernel.py: force patching when branch is machine branch is re-use (2016-05-06 10:32:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/image-type-9076
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/image-type-9076

Patrick Ohly (7):
  image_types: add support for zip compression
  image.bbclass: support duplicate compression types
  image.bbclass: fix dependency calculation when using conversion
    chaining
  image.bbclass: additional output in create_symlinks
  image creation: support converting masked types
  image.bbclass: rename COMPRESS(ION) to CONVERSION
  image.bbclass: prefer specialized image creation methods over chaining

 meta/classes/image-live.bbclass                    |   2 +-
 meta/classes/image-vm.bbclass                      |  31 +---
 meta/classes/image.bbclass                         | 186 +++++++++++++++------
 meta/classes/image_types.bbclass                   | 104 ++++++------
 meta/classes/image_types_uboot.bbclass             |  18 +-
 meta/conf/documentation.conf                       |   1 -
 .../images/build-appliance-image_14.0.0.bb         |   6 +-
 7 files changed, 204 insertions(+), 144 deletions(-)

-- 
Regards,
Ed

