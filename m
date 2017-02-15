Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECD0171985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="934089556"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Feb 2017 01:01:09 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DEC0C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:06 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:23 +0200
Message-Id: <cover.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] wic refactoring (almost done)
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:10 -0000

Hi,

This patchset takes care of logging and error handling:
- remove custom msger module in favor of standard python logging
- raise WicError exception instead of calling sys.exit

This is the one of the last changes for this time.

I'm thinking about refactoring wic plugin system, but haven't decided yet
if it makes sense to do right now or not. Other than that I'm happy with
the state of the wic codebase for now. There are still many things to improve,
but it looks and feels much better now.

The following changes since commit 10d1f08f71a623ca6d45cf0ae1afa2e880591a09:

  wic: direct: move creation of PartitionedImage to __init__ (2017-02-10 16:44:03 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (11):
  wic: setup logging in the main wic module
  wic: use wic logger in core modules
  wic: use wic logger in imager direct plugin
  wic: use wic logger in wic source plugins
  wic: remove msger module
  wic: move errors module
  wic: raise WicError in main module
  wic: raise WicError in core modules
  wic: raise WicError in wic plugins
  wic: raise WicError instead of ImageError and CreatorError
  wic: move WicError to lib/wic/__init__.py

 scripts/lib/wic/__init__.py                        |  20 ++
 scripts/lib/wic/engine.py                          |  28 ++-
 scripts/lib/wic/help.py                            |   8 +-
 scripts/lib/wic/ksparser.py                        |   7 +-
 scripts/lib/wic/msger.py                           | 209 ---------------------
 scripts/lib/wic/partition.py                       |  68 +++----
 scripts/lib/wic/plugin.py                          |  24 +--
 scripts/lib/wic/pluginbase.py                      |  12 +-
 scripts/lib/wic/plugins/imager/direct.py           |  87 ++++-----
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  52 ++---
 .../lib/wic/plugins/source/bootimg-partition.py    |  25 +--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  41 ++--
 scripts/lib/wic/plugins/source/fsimage.py          |  14 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  79 ++++----
 scripts/lib/wic/plugins/source/rawcopy.py          |  12 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  21 ++-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  54 +++---
 scripts/lib/wic/utils/errors.py                    |  29 ---
 scripts/lib/wic/utils/misc.py                      |  34 ++--
 scripts/lib/wic/utils/runner.py                    |  12 +-
 scripts/wic                                        | 104 +++++-----
 21 files changed, 378 insertions(+), 562 deletions(-)
 delete mode 100644 scripts/lib/wic/msger.py
 delete mode 100644 scripts/lib/wic/utils/errors.py

--
Regards,
Ed


