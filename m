Return-Path: <mei.yeen.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 858076057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:26:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 18:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,345,1444719600"; 
   d="scan'208";a="2430471"
Received: from mng4-ilbpg4.png.intel.com ([10.88.227.35])
	by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2015 18:26:45 -0800
From: Mei Yeen Ng <mei.yeen.ng@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 10:25:27 +0800
Message-Id: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Mei Yeen Ng <mei.yeen.ng@intel.com>
Subject: [PATCH 0/2] meta: fix installation issue with install-efi.sh script
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
X-List-Received-Date: Thu, 26 Nov 2015 02:26:46 -0000

From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>

Hi maintainers and communities,

These two patches fix the below two bugs:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=8709
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=8710

When running the install option in Gummiboot and GRUB boot loader results in
boot failure on target device:
 1/ After installing image to SATA using Gummiboot, image fail to boot from SATA
    due to missing root=PARTUUID= in the boot parameter. Addressed this by
    assigning the root uuid for non-grub boot loader in install-efi script.

 2/ Installing image to eMMC via GRUB and Gummiboot boot loader install option
    due to partition prefix and uuid for boot, root, and swap partition are
    are not captured for eMMC. Addressed this by referencing the another variable
    which captures the prefix assignment.

These patches are applied, build and tested on 2 different Intel platforms
The tests results passed for the following scenarios:
  GRUB loader + install to SATA = Passed
  GRUB loader + install to eMMC = Passed
  Gummiboot loader + install to SATA = Passed
  Gummiboot loader + install to eMMC = Passed

Ng, Mei Yeen (2):
  meta: fix install-efi script for gummiboot loader
  meta: fix install-efi script for emmc installation

 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--
1.9.1


