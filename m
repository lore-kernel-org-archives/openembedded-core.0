Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 80B987D68F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 07:11:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 00:11:53 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 00:11:52 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 14:40:58 +0800
Message-Id: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Wed, 08 May 2019 07:11:52 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Existing installable image (hddimg/ISO) has limit of 4GB size, so to build larger installable image, we can build it in wic based image.

2 partition needed for installable image
 - first partition build using source plugin bootimg-efi and configure to run install
 - second partition build with root.img, systemd-boot and kernel to be install on target machine (this partition build using new source plugin installer-partition)

These patches:
 - add new source plugin for second partition
 - add new .wks
 - add new wic dependency and set default value for required variable
 - allow source plugin bootimg-efi to configure to install


To build the image, set WKS_FILE="wic-installer.wks.in" in local.conf.


Chee Yang Lee (4):
  wic: add new installer-partition plugin
  wic: bootimg-efi: add label source parameter
  wic: add new wic-installer.wks for wic based image installer
  image_types_wic: add dependency for wic based image installer

 meta/classes/image_types_wic.bbclass               |   6 +
 scripts/lib/wic/canned-wks/wic-installer.wks.in    |   7 +
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  20 ++-
 .../lib/wic/plugins/source/installer-partition.py  | 192 +++++++++++++++++++++
 4 files changed, 220 insertions(+), 5 deletions(-)
 create mode 100644 scripts/lib/wic/canned-wks/wic-installer.wks.in
 create mode 100644 scripts/lib/wic/plugins/source/installer-partition.py

-- 
2.7.4


