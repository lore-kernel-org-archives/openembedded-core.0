Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9F15872FC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:34:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 14:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,191,1484035200"; d="scan'208";a="228117699"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2017 14:34:54 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 14:33:06 +0000
Message-Id: <cover.1487687412.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/2] Improvements to oe-selftest
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
X-List-Received-Date: Tue, 21 Feb 2017 22:34:53 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series includes to main improvements;
- Remove use of cleansstate tasks from tests in order to use shared
  states in the autobuilders
- Optimize use of get_bb_var to avoid calling bitbake -e over and
  over again

This has been tested in local autobuilders.

This series requires:

- https://patchwork.openembedded.org/series/5191/

This series supersedes:

- https://patchwork.openembedded.org/series/5101/
- https://patchwork.openembedded.org/series/5122/

Changes in v2:
- Use 'bitbake -c clean <recipe>' after using --force to avoid
  complains from bitbake.

The following changes since commit d9b18c28568432e0710099868576b12f23d502cf:

  insane.bbclass: Add prepare_recipe_sysroot dependency for package_qa (2017-02-21 13:52:49 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10929
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10929

Mariano Lopez (2):
  selftest: Avoid sstate corruption by calling cleansstate
  selftest: Optimize get_bb_var use

 meta/lib/oeqa/selftest/archiver.py     |  7 +--
 meta/lib/oeqa/selftest/bbtests.py      | 30 ++++++-----
 meta/lib/oeqa/selftest/buildhistory.py |  5 +-
 meta/lib/oeqa/selftest/buildoptions.py | 32 +++++------
 meta/lib/oeqa/selftest/devtool.py      | 75 +++++++++++++++++---------
 meta/lib/oeqa/selftest/eSDK.py         | 21 ++++----
 meta/lib/oeqa/selftest/liboe.py        | 21 ++++----
 meta/lib/oeqa/selftest/manifest.py     |  7 +--
 meta/lib/oeqa/selftest/oescripts.py    |  8 +--
 meta/lib/oeqa/selftest/pkgdata.py      | 11 ++--
 meta/lib/oeqa/selftest/prservice.py    | 12 ++---
 meta/lib/oeqa/selftest/recipetool.py   | 39 +++++++-------
 meta/lib/oeqa/selftest/runtime-test.py | 15 ++++--
 meta/lib/oeqa/selftest/signing.py      | 20 +++----
 meta/lib/oeqa/selftest/sstate.py       | 20 ++++---
 meta/lib/oeqa/selftest/sstatetests.py  | 98 ++++++++++++++--------------------
 meta/lib/oeqa/selftest/tinfoil.py      |  2 +-
 meta/lib/oeqa/selftest/wic.py          | 39 +++++++-------
 18 files changed, 246 insertions(+), 216 deletions(-)

-- 
2.6.6


