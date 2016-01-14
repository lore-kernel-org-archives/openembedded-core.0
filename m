Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BEB227317F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:09:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jan 2016 06:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="726922704"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 14 Jan 2016 06:09:32 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 3E4C16A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 06:57:29 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:50 +0200
Message-Id: <cover.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/9] Reimplement kickstart parser
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
X-List-Received-Date: Thu, 14 Jan 2016 14:09:36 -0000

Hi,

This patchset contains reimplementation of .ks file parser.
New parser code is much smaller (around 4K) than complex pykickstart parser
from Fedora (around 170K). I hope it's much more clean and mainainable too.

Getting rid of dependency to pykickstart was in my TODO list since March 2015
when I first looked at wic codebase. When I started to work on #8848 (sharing a
single Kickstart partition layout definition (.wks) between several images) I
decided to implement new parser instead of tweaking complicated pykickstart
condebase.

As as side effect of this work test coverage report for wic codebase looks shorter
and coverage is increased from 58% to 63%:

Name                                                 Stmts   Miss Branch BrMiss  Cover
-------------------------------------------------------------------------------------
scripts/lib/wic/__init__                                3      0      0      0   100%
scripts/lib/wic/conf                                   45      4     12      5    84%
scripts/lib/wic/creator                                61     19     29     15    62%
scripts/lib/wic/engine                                102     61     56     44    34%
scripts/lib/wic/help                                   49      4     18      3    90%
scripts/lib/wic/imager/__init__                         0      0      0      0   100%
scripts/lib/wic/imager/baseimager                      73     15     26     10    75%
scripts/lib/wic/imager/direct                         171     25     79     24    80%
scripts/lib/wic/kickstart                              67     18     20     12    66%
scripts/lib/wic/msger                                 187    101     86     54    43%
scripts/lib/wic/partition                             199     95     50     36    47%
scripts/lib/wic/plugin                                 84      7     34      6    89%
scripts/lib/wic/pluginbase                             34      4     12      5    80%
scripts/lib/wic/plugins/imager/direct_plugin           36      3      4      1    90%
scripts/lib/wic/plugins/source/bootimg-efi            119     17     26     13    79%
scripts/lib/wic/plugins/source/bootimg-partition       56     45     24     24    14%
scripts/lib/wic/plugins/source/bootimg-pcbios         103      8     30     10    86%
scripts/lib/wic/plugins/source/fsimage                 22     13      6      6    32%
scripts/lib/wic/plugins/source/isoimage-isohybrid     294     95    107     67    60%
scripts/lib/wic/plugins/source/rawcopy                 31     22     10     10    22%
scripts/lib/wic/plugins/source/rootfs                  31     10     12      5    65%
scripts/lib/wic/plugins/source/rootfs_pcbios_ext       73     59     24     24    14%
scripts/lib/wic/utils/__init__                          0      0      0      0   100%
scripts/lib/wic/utils/errors                            8      0      0      0   100%
scripts/lib/wic/utils/fs_related                       41      9      6      3    74%
scripts/lib/wic/utils/misc                             41      4     24      9    80%
scripts/lib/wic/utils/oe/__init__                       0      0      0      0   100%
scripts/lib/wic/utils/oe/misc                         112     20     47     15    78%
scripts/lib/wic/utils/partitionedfs                   151     23     79     24    80%
scripts/lib/wic/utils/runner                           57     16     26     12    66%
scripts/lib/wic/utils/syslinux                         18     15     12     12    10%
scripts/wic                                           170     53     78     30    67%
-------------------------------------------------------------------------------------
TOTAL                                                2438    765    937    479    63%


The following changes since commit da43a56d3533db37592a1698777af08f51a5800f:

  bitbake: Revert "fetch2/local.py: avoid using PREMIRROR" (2016-01-13 09:47:28 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/get-rid-of-ks-parser
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/get-rid-of-ks-parser

Ed Bartosh (9):
  wic: add partition module
  wic: add kickstart parser module
  wic: use new kickstart parser
  wic: remove pykickstart code
  wic: adjust code for new data structure
  wic: get rid of get_timeout getter
  wic: get rid of get_rootfs and set_rootfs
  wic: get rid of set_size and set_source_file setters
  wic: get rid of 2 getters

 scripts/lib/wic/3rdparty/pykickstart/__init__.py   |   0
 scripts/lib/wic/3rdparty/pykickstart/base.py       | 466 ----------------
 .../wic/3rdparty/pykickstart/commands/__init__.py  |  20 -
 .../3rdparty/pykickstart/commands/bootloader.py    | 216 -------
 .../wic/3rdparty/pykickstart/commands/partition.py | 314 -----------
 scripts/lib/wic/3rdparty/pykickstart/constants.py  |  57 --
 scripts/lib/wic/3rdparty/pykickstart/errors.py     | 103 ----
 .../wic/3rdparty/pykickstart/handlers/__init__.py  |   0
 .../wic/3rdparty/pykickstart/handlers/control.py   |  46 --
 .../lib/wic/3rdparty/pykickstart/handlers/f16.py   |  24 -
 scripts/lib/wic/3rdparty/pykickstart/ko.py         |  37 --
 scripts/lib/wic/3rdparty/pykickstart/options.py    | 223 --------
 scripts/lib/wic/3rdparty/pykickstart/parser.py     | 619 ---------------------
 scripts/lib/wic/3rdparty/pykickstart/sections.py   | 244 --------
 scripts/lib/wic/3rdparty/pykickstart/version.py    | 168 ------
 scripts/lib/wic/conf.py                            |   4 +-
 scripts/lib/wic/imager/baseimager.py               |   2 +-
 scripts/lib/wic/imager/direct.py                   |  26 +-
 scripts/lib/wic/kickstart.py                       | 120 ++++
 scripts/lib/wic/kickstart/__init__.py              | 129 -----
 .../lib/wic/kickstart/custom_commands/__init__.py  |   7 -
 .../lib/wic/kickstart/custom_commands/wicboot.py   |  65 ---
 .../{kickstart/custom_commands => }/partition.py   | 170 +-----
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  28 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  24 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  36 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  14 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  11 +-
 28 files changed, 212 insertions(+), 2961 deletions(-)
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/__init__.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/base.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/commands/__init__.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/commands/bootloader.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/constants.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/errors.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/handlers/__init__.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/handlers/control.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/handlers/f16.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/ko.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/options.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/parser.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/sections.py
 delete mode 100644 scripts/lib/wic/3rdparty/pykickstart/version.py
 create mode 100644 scripts/lib/wic/kickstart.py
 delete mode 100644 scripts/lib/wic/kickstart/__init__.py
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/__init__.py
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/wicboot.py
 rename scripts/lib/wic/{kickstart/custom_commands => }/partition.py (73%)

--
Regards,
Ed


