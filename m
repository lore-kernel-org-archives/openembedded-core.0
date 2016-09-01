Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDC7607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:56:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 01 Sep 2016 01:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,266,1470726000"; d="scan'208";a="755872927"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2016 01:56:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 5792E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 01:55:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 11:55:57 +0300
Message-Id: <cover.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/6] Provide list of deployment artifacts
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
X-List-Received-Date: Thu, 01 Sep 2016 08:56:16 -0000

Hi,

This is a fix for Bug #9869 - Provide a per-target manifest of files which were, or would have been, produced

The list of artifacts produced by deployment tasks (do_deploy, do_image_complete and do_populate_sdk[_ext] is
obtained from sstate manifests and fired as a TaskArtifacts metadata event. This should allow Toaster to
handle artifacts in simple way and remove a lot of current Toaster code doing guess work.

To generate manifests for do_image_complete and do_populate_sdk they have been put under sstate control.

To avoid storing big files(images and sdk installer) in sstate new variable SSTATE_SKIP_CREATION has been
set in image.bbclass and populate_sdk_base.bbclass and sstate code was modified to avoid adding files
to sstate if SSTATE_SKIP_CREATION is set.

Changes in v2: Reorganized patchset to make it bisectable (Thanks Richard)
               Used task in the name of DEPLOYDIR to avoid using the same directory for different tasks of the same recipe

Changes in v3: Fixed bug that caused deletion of image manifest

The following changes since commit 087c580b286816265f487e02746bfa6e26081554:

  init-install: Fixes the install script failing when not finding any mmcblk devices (2016-08-30 07:57:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/artifacts-9869
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/artifacts-9869

Ed Bartosh (6):
  image: populate_sdk_base: add DEPLOYDIR variable
  sstate.bbclass: skip packaging if SSTATE_SKIP_CREATION is set
  image: populate_sdk: deploy images to DEPLOYDIR
  image.bbclass: put image_complete under sstate control
  populate_sdk_base: put populate_sdk under sstate control
  toaster: fire TaskArtifacts event

 meta/classes/image-live.bbclass                    | 12 +++---
 meta/classes/image-vm.bbclass                      | 22 +++++------
 meta/classes/image.bbclass                         | 15 ++++++--
 meta/classes/image_types.bbclass                   | 44 +++++++++++-----------
 meta/classes/image_types_uboot.bbclass             |  2 +-
 meta/classes/populate_sdk_base.bbclass             | 27 ++++++++-----
 meta/classes/rootfs-postcommands.bbclass           |  4 +-
 meta/classes/sstate.bbclass                        |  2 +
 meta/classes/syslinux.bbclass                      |  2 +-
 meta/classes/toaster.bbclass                       | 17 +++++++++
 meta/lib/oe/rootfs.py                              |  6 +--
 meta/lib/oeqa/selftest/imagefeatures.py            |  4 +-
 .../images/build-appliance-image_15.0.0.bb         |  8 ++--
 13 files changed, 99 insertions(+), 66 deletions(-)

--
Ed

