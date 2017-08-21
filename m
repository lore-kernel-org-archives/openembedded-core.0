Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 61BD573068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:40:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 20 Aug 2017 22:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228168"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:39 +1200
Message-Id: <cover.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 00/10] devtool/recipetool fixes rollup
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
X-List-Received-Date: Mon, 21 Aug 2017 05:40:33 -0000

This patchset rolls up a few of the pending patches with minimal
changes and introduces a couple of mine.

Leo's import/export patches have had the file change function patch
squashed into the import patch, and I also made it use DevtoolError
instead of logger.error()+sys.exit() in a couple of places, used
with... to ensure the tarfile got closed in the import module and
tweaked the commit messages.

In Rebecca's devtool upgrade patch I removed an unnecessary sys.exit()
after raise DevtoolError(...).


These patches have passed oe-selftest devtool/recipetool tests locally.



The following changes since commit 5c9ef0734d23909b5694ed43cdbb205c2ba9ca95:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool28-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool28-oe

Chang Rebecca Swee Fun (3):
  recipetool: create: disable PREMIRRORS and MIRRORS by default
  recipetool: create: being able to set branch when revision is provided
  devtool: upgrade: enable branch checking when revision is provided

Leonardo Sandoval (3):
  devtool: export: new plugin to export the devtool workspace
  devtool: append md5sum only if not already present
  devtool: import: new plugin to import the devtool workspace

Paul Eggleton (2):
  recipetool: allow plugins to set PN / PV more easily
  recipetool: allow plugins to set LICENSE and LIC_FILES_CHKSUM

Stanley Phoong (2):
  recipetool: create: handle git URLs specifying only a tag
  recipetool: create: replacing PV in SRCURI

 scripts/lib/devtool/__init__.py      |  36 ++++++
 scripts/lib/devtool/export.py        | 119 ++++++++++++++++++++
 scripts/lib/devtool/import.py        | 144 ++++++++++++++++++++++++
 scripts/lib/devtool/standard.py      |   7 +-
 scripts/lib/devtool/upgrade.py       |  27 ++++-
 scripts/lib/recipetool/create.py     | 205 +++++++++++++++++++++++++++--------
 scripts/lib/recipetool/create_npm.py |  44 +-------
 scripts/lib/scriptutils.py           |   9 +-
 8 files changed, 495 insertions(+), 96 deletions(-)
 create mode 100644 scripts/lib/devtool/export.py
 create mode 100644 scripts/lib/devtool/import.py

-- 
2.9.5


