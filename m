Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4476E78302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 11:49:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 25 Jul 2017 04:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="1155138997"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2017 04:49:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 543CE5808F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:49:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 14:26:35 +0300
Message-Id: <cover.1500981812.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/6] #11662 - wic should mount /boot
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
X-List-Received-Date: Tue, 25 Jul 2017 11:49:17 -0000

Hi,

This patchset adds /boot to the /etc/fstab of root partition, making
it mounted on boot. It also fixes reporting and testing issues
caused by this change.

The patchset also fixes long standing bug: wic updated fstab
inplace in rootfs directory. This causes other tasks working with
rootfs directory to produce incorrect results or crash. This is
fixed by harlinking rootfs content to the temporary directory before
updating fstab.

Changes in v2: squashed patches by reviewer's request
Changes in v3: unlink /etc/fstab in rootfs copy before updating it

The following changes since commit be281d536c6ac9cafa8357ced4b1e5ce2e0db501:

  wic: add 'wic write' command (2017-07-25 14:19:37 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (6):
  wic: copy rootfs directory before changing fstab
  wic: use absolute paths in rootfs plugin
  wic: rootfs: fix rootfs path reporting
  wic: rootfs: make copied rootfs unique
  wic: add /boot mount point to fstab by default
  oe-selftest: wic: fix test_quemu

 meta/lib/oeqa/selftest/cases/wic.py      |  2 +-
 scripts/lib/wic/plugins/imager/direct.py | 26 ++++++++++++++++----------
 scripts/lib/wic/plugins/source/rootfs.py | 16 +++++++---------
 3 files changed, 24 insertions(+), 20 deletions(-)

--
Regards,
Ed


