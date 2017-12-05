Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF1B600EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181355752"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:09 +1300
Message-Id: <cover.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 00/12] devtool improvements
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:28 -0000

A set of improvements for devtool, mostly aimed at improving the
handling of recipes that fetch multiple source trees (i.e. have multiple
tarballs or repositories in SRC_URI), with a couple of other fixes
thrown in.


The following changes since commit a7cd9d1183be603777fc9c8c448281fe01224f7b:

  lib/oe/utils: remove param_bool() (2017-12-02 11:24:38 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool32-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool32-oe

Paul Eggleton (12):
  devtool: refactor return for _extract_source()
  devtool: reset: delete bbappend file if _check_preserve() doesn't
  devtool: finish: fix erroneously creating bbappend for relative paths
  devtool: deploy-target: don't specify ssh/scp port unless user does
  devtool: extract: fix usage with kern-tools-native
  devtool: modify: pick up commits from previously created source tree
  lib/oe/recipeutils: allow patch_recipe_file() to be re-called
  devtool: support extracting multiple source trees
  devtool: fix handling of linux-yocto after multisrc changes
  oe-selftest: devtool: fix kernel test for multisrc changes
  oe-selftest: devtool: add test for multiple source trees
  lib/oe/recipeutils: add .txz extension to archive list

 .../devtool/devtool-test-multisrc-subdir_1.0.bb    |  13 +
 .../devtool-test-multisrc/example-files.tar.gz     | Bin 0 -> 236 bytes
 .../devtool/devtool-test-multisrc/example.patch    |   7 +
 .../devtool-test-multisrc/mypackage-1.0.tar.gz     | Bin 0 -> 903 bytes
 .../devtool/devtool-test-multisrc_1.0.bb           |  11 +
 meta/classes/devtool-source.bbclass                |  63 ++-
 meta/classes/externalsrc.bbclass                   |   2 +-
 meta/classes/kernel-yocto.bbclass                  |   7 +-
 meta/lib/oe/recipeutils.py                         |  15 +-
 meta/lib/oe/utils.py                               |  24 ++
 meta/lib/oeqa/selftest/cases/devtool.py            | 124 +++++-
 scripts/devtool                                    |  61 ++-
 scripts/lib/devtool/__init__.py                    |  14 +
 scripts/lib/devtool/deploy.py                      |  12 +-
 scripts/lib/devtool/standard.py                    | 426 ++++++++++++++-------
 scripts/lib/devtool/upgrade.py                     |   4 +-
 16 files changed, 601 insertions(+), 182 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc-subdir_1.0.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/example-files.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/example.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc/mypackage-1.0.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multisrc_1.0.bb

-- 
2.9.5


