Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 81AFB77BC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:59:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 27 Jun 2017 02:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="117879266"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jun 2017 02:59:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 75379580351
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 02:59:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:57:34 +0300
Message-Id: <cover.1498557396.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7] #11662 - wic should mount /boot
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
X-List-Received-Date: Tue, 27 Jun 2017 09:59:46 -0000

Hi,

This patchset adds /boot to the /etc/fstab of root partition, making
it mounted on boot. It also fixes reporting and testing issues
caused by this change.

The patchset also fixes long standing bug: wic updated fstab
inplace in rootfs directory. This causes other tasks working with
rootfs directory to produce incorrect results or crash. This is
fixed by copying rootfs to the temporary directory before updating
fstab.

The following changes since commit 8bb669387c70d5df7ade90287e8e63add1948cf3:

  image_types.bbclass: get rid of IMAGE_DEPENDS (2017-06-26 13:57:37 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/test
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/test

Ed Bartosh (7):
  wic: copy rootfs directory before changing fstab
  wic: use correct rootfs in the report
  wic: use absolute paths in rootfs plugin
  wic: rootfs: fix rootfs path reporting
  wic: rootfs: make copied rootfs unique
  wic: add /boot mount point to fstab by default
  oe-selftest: wic: fix test_quemu

 meta/lib/oeqa/selftest/cases/wic.py      |  2 +-
 scripts/lib/wic/plugins/imager/direct.py | 31 ++++++++++++++++++++-----------
 scripts/lib/wic/plugins/source/rootfs.py | 16 +++++++---------
 3 files changed, 28 insertions(+), 21 deletions(-)

--
Regards,
Ed

