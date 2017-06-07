Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 036D971B13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:25:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 03:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,310,1493708400"; d="scan'208";a="1138849908"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2017 03:25:39 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id AA6415802EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 03:25:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 13:25:24 +0300
Message-Id: <cover.1496830884.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v2 0/6] #11283: wic rm
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
X-List-Received-Date: Wed, 07 Jun 2017 10:25:40 -0000

Hi,

This is an implementation of new wic subcommand 'wic rm'.

It removes files or directories from vfat partitions:

$ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
Volume in drive : is boot
 Volume Serial Number is 11D0-DE21
Directory for ::/

libcom32 c32    186500 2017-06-02  15:15
libutil  c32     24148 2017-06-02  15:15
syslinux cfg       209 2017-06-02  15:15
vesamenu c32     27104 2017-06-02  15:15
vmlinuz        6926384 2017-06-02  15:15
        5 files           7 164 345 bytes
                         16 582 656 bytes free

$ wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32

$ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
Volume in drive : is boot
 Volume Serial Number is 11D0-DE21
Directory for ::/

libcom32 c32    186500 2017-06-02  15:15
syslinux cfg       209 2017-06-02  15:15
vesamenu c32     27104 2017-06-02  15:15
vmlinuz        6926384 2017-06-02  15:15
        4 files           7 140 197 bytes
                         16 607 232 bytes free

The patchset also contains test case for 'wic rm' functionality.

Changes in v2: Modified test_wic_rm to fix test failure on Yocto autobuilder.

The following changes since commit 4a114a5ab10fc467c6c270b20af25b852250c78c:

  image_types_wic: schedule prepare_wic_build correctly (2017-06-07 10:42:20 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (6):
  wic: add wic_init_parser_rm
  wic: add help and usage content for 'wic rm'
  wic: add 'wic rm' command
  wic: implement removing files
  wic: implement removing directories
  selftest: add test_wic_rm test case

 meta/lib/oeqa/selftest/cases/wic.py | 30 +++++++++++++++++++
 scripts/lib/wic/engine.py           | 35 ++++++++++++++++++++++
 scripts/lib/wic/help.py             | 59 ++++++++++++++++++++++++++++++++++++-
 scripts/wic                         | 20 +++++++++++++
 4 files changed, 143 insertions(+), 1 deletion(-)

-- 
2.12.0


