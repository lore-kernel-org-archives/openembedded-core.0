Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EEDE571DCF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:10:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 01 Feb 2017 06:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="220098776"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2017 06:10:53 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9AFCE6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:09:53 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:07 +0200
Message-Id: <cover.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/18] #10619: refactor wic codebase (start)
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
X-List-Received-Date: Wed, 01 Feb 2017 14:10:55 -0000

Hi,

This patchset consolidates wic APIs in a more maintainable way,
removes unused APIs and cleans up wic code.

This is a first series of a refactoring work. The changes in this patchset are
relatively simple. They're a preparation for upcoming heavy work on making wic
codebase less complex and more maintainable.

The following changes since commit ec3d83f9a90288403b96be25da855fa280aadd8d:

  xmlto: Don't hardcode the path to tail (2017-01-31 23:47:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/refactoring-10619
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/refactoring-10619

Ed Bartosh (18):
  wic: creator: stop using config manager
  wic: direct_plugin: stop using config manager
  wic: removed conf.py and empty config file.
  wic: moved content of direct.py to direct_plugin
  wic: get rid of __rootfs_dir_to_dict method
  wic: improve naming in direct_plugin classes
  wic: pylinted direct_plugin
  wic: simplified code of direct_plugin
  wic: renamd direct_plugin.py -> direct.py
  wic: removed test file
  wic: partition: simlify calling plugin methods
  wci: misc: removed build_name API
  wic: move 2 APIs to wic.engine
  wic: move oe/misc.py one level up
  wic: removed code from __init__.py
  wic: msger.py: remove unused APIs
  wic: code cleanup
  wic: remove syslinux.py

 scripts/lib/wic/__init__.py                        |   4 -
 scripts/lib/wic/__version__.py                     |   1 -
 scripts/lib/wic/conf.py                            | 103 --------
 scripts/lib/wic/config/wic.conf                    |   6 -
 scripts/lib/wic/creator.py                         |  19 --
 scripts/lib/wic/engine.py                          |  39 ++-
 scripts/lib/wic/help.py                            |   4 +-
 scripts/lib/wic/imager/__init__.py                 |   0
 scripts/lib/wic/ksparser.py                        |   2 +-
 scripts/lib/wic/msger.py                           |  26 --
 scripts/lib/wic/partition.py                       |  66 ++---
 scripts/lib/wic/plugin.py                          |   5 +-
 scripts/lib/wic/pluginbase.py                      |   1 -
 scripts/lib/wic/{ => plugins}/imager/direct.py     | 139 ++++++-----
 scripts/lib/wic/plugins/imager/direct_plugin.py    | 103 --------
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  20 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |   6 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  12 +-
 scripts/lib/wic/plugins/source/fsimage.py          |   2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  15 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   3 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   6 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  46 +++-
 scripts/lib/wic/test                               |   1 -
 scripts/lib/wic/utils/misc.py                      | 274 +++++++++++++++------
 scripts/lib/wic/utils/oe/misc.py                   | 247 -------------------
 scripts/lib/wic/utils/partitionedfs.py             |   7 +-
 scripts/lib/wic/utils/syslinux.py                  |  58 -----
 scripts/wic                                        |   2 +-
 29 files changed, 426 insertions(+), 791 deletions(-)
 delete mode 100644 scripts/lib/wic/__version__.py
 delete mode 100644 scripts/lib/wic/conf.py
 delete mode 100644 scripts/lib/wic/config/wic.conf
 delete mode 100644 scripts/lib/wic/imager/__init__.py
 rename scripts/lib/wic/{ => plugins}/imager/direct.py (80%)
 delete mode 100644 scripts/lib/wic/plugins/imager/direct_plugin.py
 delete mode 100644 scripts/lib/wic/test
 delete mode 100644 scripts/lib/wic/utils/oe/misc.py
 delete mode 100644 scripts/lib/wic/utils/syslinux.py

-- 
2.1.4


