Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 29491601DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512552"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:08:56 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:22 -0700
Message-Id: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] Support for VirtualBox VDI image format.
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:56 -0000

This series of patches implements support for VirtualBox VDI images.
Instead of a new VDI only class a new class image-vm.bbclass
was created. This class replaces the previously existing image-vmdk
class and now supports both VM image formats: VMDK and VDI.

Generally, VMDK and VDI treatment is mostly identical. Both images are
created by qemu from hdddirect image. However, VDI images need UUID to
boot, so qemu has to be built with UUID support.

Both VDI and VMDK images can be built simultaneously, as demonstrated
by the recipe core-image-minimal-vms.bb


[YOCTO #7374]


Juro Bystricky (7):
  image: Support for VDI
  qemu: Add support for UUID
  documentation.conf: Document do_vmimg
  sanity.bbclass: Prevent 'vdi' and 'live' to be built together
  boot-direct.bbclass: Add support for VDI images
  build-appliance-image: do_vmdkimg replaced by do_vmimg
  core-image-minimal-vms: new recipe to build images for VM

 meta/classes/boot-directdisk.bbclass               |  4 +--
 meta/classes/image-vm.bbclass                      | 38 ++++++++++++++++++++++
 meta/classes/image-vmdk.bbclass                    | 35 --------------------
 meta/classes/image.bbclass                         |  6 ++--
 meta/classes/image_types.bbclass                   |  5 +--
 meta/classes/sanity.bbclass                        |  5 +++
 meta/conf/documentation.conf                       |  2 +-
 meta/lib/oe/image.py                               |  4 +--
 .../images/build-appliance-image_12.0.1.bb         |  2 +-
 meta/recipes-core/images/core-image-minimal-vms.bb | 12 +++++++
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 11 files changed, 68 insertions(+), 47 deletions(-)
 create mode 100644 meta/classes/image-vm.bbclass
 delete mode 100644 meta/classes/image-vmdk.bbclass
 create mode 100644 meta/recipes-core/images/core-image-minimal-vms.bb

-- 
1.9.1


