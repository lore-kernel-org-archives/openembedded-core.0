Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B3DBF7320F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272580"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:47 +1300
Message-Id: <cover.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/14] Extensible SDK improvements redux
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:05 -0000

* Fixes around ensuring pkgdata is present to help find dependencies
* Fixes for the SDK update process
* Add the ability to install prebuilt items into the SDK (from sstate)
* Fix a few other issues I noticed in the process

Note that the world pkgdata implementation relies on a BitBake patch I
just sent.


The following changes since commit 8084c185c43cb7e7f5e29d31939dfd308f8a0f93:

  udev: Add 2 patches to support 4.4 kernel (2016-01-20 09:20:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes5-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes5-oe

Paul Eggleton (14):
  classes/populate_sdk_ext: add option to bring in pkgdata for world
  devtool: build: ensure pkgdata is written out
  devtool: sdk-update: improve temp directory handling
  devtool: sdk-update: improve SDK update process robustness
  devtool: add sdk-install subcommand
  classes/populate_sdk_ext: drop ext-sdk-prepare.py when installing
  classes/populate_sdk*: add dependencies on script files
  toolchain-shar-extract.sh: improve behaviour when xz is not installed
  gen-lockedsig-cache: copy correct native sstate into ext SDK
  recipetool: create: strip quotes from values extracted from
    CMakeLists.txt
  devtool / recipetool: support specifying a subdirectory within the
    fetched source
  recipetool: create: extract SRC_URI from local git repositories
  recipetool: create: fix extraction of name from URLs ending in /
  recipetool: create: better fix for fetch error handling

 meta/classes/populate_sdk_base.bbclass       |   3 +
 meta/classes/populate_sdk_ext.bbclass        |  46 +++++-
 meta/files/toolchain-shar-extract.sh         |   7 +-
 meta/lib/oe/copy_buildsystem.py              |  61 +++++++-
 meta/lib/oeqa/selftest/devtool.py            |   7 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb |  50 +++++++
 scripts/gen-lockedsig-cache                  |   6 +-
 scripts/lib/devtool/build.py                 |  16 +-
 scripts/lib/devtool/sdk.py                   | 212 ++++++++++++++++++++-------
 scripts/lib/devtool/standard.py              |   6 +
 scripts/lib/recipetool/create.py             |  47 ++++--
 scripts/lib/recipetool/create_buildsys.py    |  13 +-
 12 files changed, 392 insertions(+), 82 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-pkgdata.bb

-- 
2.5.0


