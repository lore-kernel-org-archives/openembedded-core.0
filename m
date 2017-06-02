Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BEDC377E66
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:20:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 10:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="108507568"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 02 Jun 2017 10:20:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 769B458061A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:20:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 20:19:59 +0300
Message-Id: <cover.1496423753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] #11283: wic rm
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
X-List-Received-Date: Fri, 02 Jun 2017 17:20:59 -0000

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

The following changes since commit 4cf2ac543ee3646332e8dac847d23429b492494c:

  image_types_wic: schedule prepare_wic_build correctly (2017-06-02 11:21:49 +0300)

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

 meta/lib/oeqa/selftest/wic.py | 28 ++++++++++++++++++++
 scripts/lib/wic/engine.py     | 35 +++++++++++++++++++++++++
 scripts/lib/wic/help.py       | 59 ++++++++++++++++++++++++++++++++++++++++++-
 scripts/wic                   | 20 +++++++++++++++
 4 files changed, 141 insertions(+), 1 deletion(-)

-- 
2.1.4


