Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2D75576802
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:24:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2016 09:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="957348556"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2016 09:24:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id B61EC6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 10:11:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 19:24:13 +0300
Message-Id: <cover.1463588057.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/6] image creation improvements
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
X-List-Received-Date: Wed, 18 May 2016 16:24:27 -0000

Hi,

This patchset contains various improvements for the image creation functionality
made by Patchick Ohly during his work on bug #9076:
 - fixed dependency calculation for conversion chaining
 - converted vmdk/vdi/qcow2 image types into conversion commands
 - renamed COMPRESSION variables to CONVERSION as the term "compression"
   is no longer accurate
 - prioritized specialized image creation methods over using conversion chaining

The changes look reasonable to me. However, it would be good to hear other
people opinions as some changes are quite complex.

Changes in v2: rebased on top of master-next
               returned image_getdepends back to image_types.bbclass

The following changes since commit a037ad93640d3d6373fe1db35f64307e9fbed4e9:

  bitbake: bb.codeparser: track variable flag references (2016-05-17 23:23:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/image-type-9076
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/image-type-9076

Patrick Ohly (6):
  image.bbclass: support duplicate compression types
  image.bbclass: fix dependency calculation when using conversion
    chaining
  image.bbclass: additional output in create_symlinks
  image creation: support converting masked types
  image.bbclass: rename COMPRESS(ION) to CONVERSION
  image.bbclass: prefer specialized image creation methods over chaining

 meta/classes/image-live.bbclass                    |   2 +-
 meta/classes/image-vm.bbclass                      |  33 +----
 meta/classes/image.bbclass                         | 133 ++++++++++++-------
 meta/classes/image_types.bbclass                   | 147 ++++++++++++++-------
 meta/classes/image_types_uboot.bbclass             |  18 +--
 meta/conf/documentation.conf                       |   1 -
 .../images/build-appliance-image_14.0.0.bb         |   6 +-
 7 files changed, 199 insertions(+), 141 deletions(-)

--
Regards,
Ed

