Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7E45A72F56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489757615; x=1521293615; h=from:to:subject:date:message-id;
	bh=XBmEhHveOYpJmnRJqKz/oAOTba5mRYvxNkKnNvdhnCc=;
	b=ak9Ip1NcKFmdGJLwdXGHahtWmZLZbIdpeBp7AkOkmsNZsFNY9i8xoZHY
	akKWRANbFI1Xxqj/hHquK2Vs63klFQ==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="1143747856"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2017 06:33:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 57D202C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:33:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:18:31 +0200
Message-Id: <cover.1489755821.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] #10833: fix testing of wic images by testimage
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
X-List-Received-Date: Fri, 17 Mar 2017 13:33:33 -0000

Hi,

It was not possible to test wic images with testimage as this framework configured
guest networking by passing "ip=<host ip>::<guest ip>:<netmask>" to the kernel.
This approach doesn't work for wic images as kernel is run by bootloader and the
kernel command line is defined when image is built.

This patchset implements networking configuration by running commands on guests's
serial console. runqemu script was modified to output IP addresses and netmask to
be able to get these parameters from its output in testimage code.

The following changes since commit 8e9769773fd6d04402581c005bb423530a726457:

  meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86 BSPs (2017-03-16 22:12:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/tap-networking-wic-10833
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/tap-networking-wic-10833

Ed Bartosh (4):
  runqemu: output network configuration
  qemurunner: get network params from runqemu output
  qemurunner: configure guest networking
  bitbake.conf: add sudo to HOSTTOOLS_NONFATAL

 meta/conf/bitbake.conf            |  2 +-
 meta/lib/oeqa/utils/qemurunner.py | 49 ++++++++++++++++++++++++++++-----------
 scripts/runqemu                   |  4 +++-
 3 files changed, 39 insertions(+), 16 deletions(-)

--
Regards,
Ed


