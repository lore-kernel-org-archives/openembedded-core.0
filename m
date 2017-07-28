Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE9378416
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:52:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2017 02:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,425,1496127600"; d="scan'208";a="883719890"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2017 02:52:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4615B5801BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 02:52:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 12:29:21 +0300
Message-Id: <cover.1501233796.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v5 0/7] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 28 Jul 2017 09:52:33 -0000

Hi,

This patchset adds /boot to the /etc/fstab of root partition, making
it mounted on boot. It also fixes reporting and testing issues
caused by this change.

The patchset also fixes long standing bug: wic updated fstab
inplace in rootfs directory. This causes other tasks working with
rootfs directory to produce incorrect results or crash. This is
fixed by hadlinking rootfs content to the temporary directory before
updating fstab.

This approach caused do_image_tar to fail with the error "file changed as we read it"
as hardlinking changes files ctime. In order to solve this we had to
modify do_image_tar to ignore file changes.

Changes in v2: squashed patches by reviewer's request
Changes in v3: unlink /etc/fstab in rootfs copy before updating it
Changes in v4: used 'cp -a' instead of copyhardlinktree to avoid
               do_image_tar failure due to changed ctime
Changes in v5: back to hardlinking. ignored tar exit code 1.

The following changes since commit b73f5e088a543775a2a94b60302f750edfffbd10:

  wic-tools: add dependency to e2fsprogs-native (2017-07-27 16:07:26 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (7):
  image_types.bbclass: ignore tar exit code 1
  wic: copy rootfs directory before changing fstab
  wic: use absolute paths in rootfs plugin
  wic: rootfs: fix rootfs path reporting
  wic: rootfs: make copied rootfs unique
  wic: add /boot mount point to fstab by default
  oe-selftest: wic: fix test_quemu

 meta/classes/image_types.bbclass         |  3 ++-
 meta/lib/oeqa/selftest/cases/wic.py      |  2 +-
 scripts/lib/wic/plugins/imager/direct.py | 26 ++++++++++++++++----------
 scripts/lib/wic/plugins/source/rootfs.py | 16 +++++++---------
 4 files changed, 26 insertions(+), 21 deletions(-)

-- 
2.1.4


