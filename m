Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4144C6D011
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:03 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Oct 2013 07:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="378321800"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by azsmga001.ch.intel.com with ESMTP; 22 Oct 2013 07:24:04 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:23:59 -0500
Message-Id: <cover.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 00/10] wic dependency and rootfs updates
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:05 -0000

This patchset mainly removes unnecessary run-time python module and
executable dependencies for mic functionality we currently don't use.
I didn't originally hit these myself because I did development on
Fedora and Ubuntu users hit these - I've tested the resulting patchset
on both Fedora and Ubuntu with the affected packages removed and don't
see any problems.

I've kept them as a series of changes rather than glomming them all
together because at some point we will want to restore these
dependencies on a case-by-case basis and it's better to have the
changes as individually explained commits.

It also removes and unncessary pseudo export as discussed in a
previous thread, and moves the setup to the top-level rootfs
generation function.

The following changes since commit 505114c13d29799a25379f7ce720d632616d8776:

  wic: add pseudo to the populate-extfs step (2013-10-18 16:03:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-3
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-3

Tom Zanussi (10):
  wic: Remove dependency on rt_util module
  wic: eliminate module checks
  wic: Remove dependency on rpmmisc
  wic: Remove dependency on myurlgrab module
  wic: remove rpm warning code from BackendPlugin
  wic: Remove rpm and grabber dependencies from BaseImageCreator
  wic: Remove rpmmisc call from livecd
  wic: Remove binary dependencies
  wic: Make find_binary_path() more user-friendly
  wic: Update and generalize pseudo setup for rootfs generation

 scripts/lib/mic/creator.py                         |  4 ++--
 scripts/lib/mic/imager/baseimager.py               |  4 +---
 scripts/lib/mic/imager/livecd.py                   |  4 ++--
 .../lib/mic/kickstart/custom_commands/partition.py | 28 ++++++++++++----------
 scripts/lib/mic/pluginbase.py                      |  5 ----
 scripts/lib/mic/plugins/imager/direct_plugin.py    |  2 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py        |  2 +-
 scripts/lib/mic/plugins/imager/livecd_plugin.py    |  2 +-
 scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  2 +-
 scripts/lib/mic/plugins/imager/loop_plugin.py      |  2 +-
 scripts/lib/mic/plugins/imager/raw_plugin.py       |  2 +-
 scripts/lib/mic/utils/fs_related.py                |  5 +++-
 scripts/lib/mic/utils/misc.py                      |  2 --
 scripts/lib/mic/utils/partitionedfs.py             |  4 ----
 scripts/wic                                        | 10 --------
 15 files changed, 30 insertions(+), 48 deletions(-)

-- 
1.8.3.1


