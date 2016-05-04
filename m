Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D980C6E666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:26:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="958805560"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2016 08:26:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 003F36A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:13:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:13 +0300
Message-Id: <cover.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 00/14] Python 3 support
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
X-List-Received-Date: Wed, 04 May 2016 15:26:20 -0000

Hi,

This is a first set of changes implementing Python 3 support for wic.
As bitbake codebase is not ported to Python 3 yet I tried to avoid
using bitbake APIs as much as possible.
With this set of changes wic can be run on both Python 2 and Python 3.

These commands work and produce rootfs of the same size:
python3.4 ../scripts/wic create my-kickstart-file.wks -e core-image-minimal -v ./tmp/sysroots/qemux86-64/imgdata/ -o img/
python2.7 ../scripts/wic create my-kickstart-file.wks -e core-image-minimal -v ./tmp/sysroots/qemux86-64/imgdata/ -o img/

Functionality that requires bb/lib such es wic -e <image> doesn't work.

The following changes since commit 7587285a21cd1e3465640bf9871f3fd65cca4e07:

  scripts/lib/bsp/kernel.py: force patching when branch is machine branch is re-use (2016-04-29 12:11:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/python3-9412
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/python3-9412

Ed Bartosh (14):
  wic: replace print statements with print function
  wic: use items instead of iteritems
  wic: don't use dict.keys and dict.has_key
  wic: don't inherit classes from object
  wic: remove with_statement imports
  wic: use new syntax of 'except' statement
  wic: remove unused functions
  wic: refactor pluginbase
  wic: don't use L suffix for integers
  wic: use find_executable in favor of bb.utils.which
  wic: use // operator instead of /
  wic: decode output of subprocess.communicate
  wic: don't encode unicode strings
  wic: use next builtin instead of .next method

 scripts/lib/wic/conf.py                |  2 +-
 scripts/lib/wic/creator.py             |  4 +-
 scripts/lib/wic/engine.py              | 20 ++++-----
 scripts/lib/wic/filemap.py             | 16 +++----
 scripts/lib/wic/help.py                |  4 +-
 scripts/lib/wic/imager/baseimager.py   |  5 +--
 scripts/lib/wic/imager/direct.py       |  2 +-
 scripts/lib/wic/ksparser.py            | 10 ++---
 scripts/lib/wic/msger.py               | 78 +---------------------------------
 scripts/lib/wic/partition.py           |  2 +-
 scripts/lib/wic/plugin.py              | 10 ++---
 scripts/lib/wic/pluginbase.py          | 42 ++++++------------
 scripts/lib/wic/utils/oe/misc.py       | 18 +++-----
 scripts/lib/wic/utils/partitionedfs.py | 14 +++---
 scripts/lib/wic/utils/runner.py        |  6 +--
 scripts/wic                            | 43 ++++++++++---------
 16 files changed, 91 insertions(+), 185 deletions(-)

-- 
2.1.4


