Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EB3DB782EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:25:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 07:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="132677737"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2017 07:25:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BA184580571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:25:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:02:41 +0300
Message-Id: <cover.1501162988.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 0/6] #11662 - wic should mount /boot
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
X-List-Received-Date: Thu, 27 Jul 2017 14:25:33 -0000

Hi,

This patchset adds /boot to the /etc/fstab of root partition, making
it mounted on boot. It also fixes reporting and testing issues
caused by this change.

The patchset also fixes long standing bug: wic updated fstab
inplace in rootfs directory. This causes other tasks working with
rootfs directory to produce incorrect results or crash. This is
fixed by copying rootfs content to the temporary directory before
updating fstab.

In previous versions of this patchset temporary rootfs directory
was created using copyhardlinktree API. This broke do_image_tar
as creating hardlinks changes file ctime and causes tar to exit
with the error "file changed as we read it". It's fixes in v4
by using copying instead of hardlinking. This is slower, but
it shouldn't influence overall build time too much as even for
a rootfs size 500Mb it takes only 1.5 sec

Changes in v2: squashed patches by reviewer's request
Changes in v3: unlink /etc/fstab in rootfs copy before updating it
Changes in v4: used 'cp -a' instead of copyhardlinktree to avoid
               do_image_tar failure due to changed ctime

The following changes since commit b73f5e088a543775a2a94b60302f750edfffbd10:

  wic-tools: add dependency to e2fsprogs-native (2017-07-27 16:07:26 +0300)

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
 scripts/lib/wic/plugins/imager/direct.py | 24 ++++++++++++++----------
 scripts/lib/wic/plugins/source/rootfs.py | 16 +++++++---------
 3 files changed, 22 insertions(+), 20 deletions(-)

--
Regards,
Ed

