Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BDDF578443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 06:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="1210392886"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2017 06:42:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 104B158048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:35 +0300
Message-Id: <cover.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] #11278 - wic: create an option to use entire disk
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:02 -0000

Hi,

This patchset implements wic write [--expand auto|<partnum>:<size>]
subcommand to write partitioned image to the target media or file with the optional
possibility to expand partitions to either fill the target media(--expand auto)
or using specified partition sizes (--expand <partnum>:<size>)

'wic write' uses bmaptool API, so it's much faster than dd.
It doesn't require root privileges, just write permissions for the target file or
device.

'wic write' can also be used to flash unpartitioned images.

Please, review.

The following changes since commit a087e0bc765ade6386720f22d842e2fc0bd5f128:

  maintainers.inc: assign newly added recipes (2017-08-24 16:49:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (10):
  wic: add help and usage content for 'wic write'
  wic: add 'wic write' command
  wic: reimplement getting paths of used tools
  wic: get more info from the 'parted print' output
  wic: convert partition number to int
  wic: added 'fstypes' parameter to Disk.__init__
  wic: extend list of used tools
  wic: implement 'wic write' command
  wic: always read image partitions
  wic: setlftest: test expanding MBR image

 meta/lib/oeqa/selftest/cases/wic.py |  53 +++++++++
 meta/recipes-core/meta/wic-tools.bb |   3 +-
 scripts/lib/wic/engine.py           | 210 ++++++++++++++++++++++++++++++------
 scripts/lib/wic/help.py             |  40 +++++++
 scripts/wic                         |  55 ++++++++++
 5 files changed, 326 insertions(+), 35 deletions(-)

--
Regards,
Ed


