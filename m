Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F156E70100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:02:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 00:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,405,1496127600"; d="scan'208";a="1175799641"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2017 00:02:25 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 16:51:54 -0700
Message-Id: <cover.1500848692.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [poky][master][PATCH 0/3] core-image-minimal-initramfs: use initramfs-framework for initialization by default
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
X-List-Received-Date: Mon, 24 Jul 2017 07:02:35 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

These patches is to initialize initramfs-framework by default. The initramfs-framework
is able to boot up live image and enable the installation mechanism.

For the configuration to boot up live image, a new scriplet named setup-live module has been created
to handle the removeable media detection and assign the rootfs.img. This is because the current rootfs
module has no support for rootfs images, only rootfs partitions. A new initramfs-module-setup-live
recipe is being created and added udev-extraconf rdepends on this module because it is needed for
automounting process.

For the installation mechanism, it used the existing init-install-efi.sh script in the
initrdscript and install a new module named initramfs-module-install-efi in the recipe.

This changes has been verified with build test, boot up test and
installation test on Minnowboard Max platform.

Please review and provide feedback if you have any.
The patches are targeted for merging into poky master branch.

Thanks and regards,
Wei Tee

The following changes since commit 15901164ee71dec0906dadaff08f3365a66feb05:

  dev-manual, ref-manual: Eliminated pre-built section (2017-07-22 09:19:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib weiteeng/initramfs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=weiteeng/initramfs

Ng, Wei Tee (3):
  initramfs-framework: module to support boot live image
  initramfs-framework: include install-efi module in recipe for
    installation
  core-image-minimal-initramfs: use initramfs-framework by default

 .../images/core-image-minimal-initramfs.bb         |   2 +-
 .../initramfs-framework/install-efi.sh             | 276 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework/setup-live   |  66 +++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  28 ++-
 4 files changed, 368 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

-- 
2.7.4


