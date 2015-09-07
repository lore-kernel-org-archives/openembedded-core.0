Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D1F7C60043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940013"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:16 +0100
Message-Id: <cover.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/11] Extensible SDK fixes
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:44 -0000

This rolls up a set of previously posted patches from Qi and Brendan
with some changes from me.

Changes since the previously posted versions:

* populate_sdk_ext: install the latest buildtools-tarball:
  - Avoid poky-specific path usage
* populate_sdk_ext: consider custom configuration in local.conf:
  - Allow blacklisting certain variables
  - Prevent comments and blank lines from coming through
* toolchain-shar-extract.sh: ensure extensible SDK install path obeys restrictions
  - Use grep instead of bash-specific =~ operator
* toolchain-shar-extract.sh: better default install path for extensible SDK:
  - Fix default path overriding path specified on the command line with
    the -d option when installing the extensible SDK
* oe-publish-sdk: add script:
  - Ensure errors in layer git repo setup exit immediately instead of
    continuing
  - Change some debug logging to info for more coherent output
  - Use -A option with "git add"
  - Fix command usage info in comments
* devtool: add mechanism for updating extensible SDK:
  - Allow default update server to be read from config file
  - Squash in change to write SDK_TARGETS to config file


The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk4

Brendan Le Foll (3):
  toolchain-shar-extract.sh: ensure extensible SDK install path obeys
    restrictions
  toolchain-shar-extract.sh: better default install path for extensible
    SDK
  toolchain-shar-extract.sh: explain why we cannot use sudo in
    extensible SDK

Paul Eggleton (1):
  classes/populate_sdk_ext: avoid poky-specific buildtools naming

Qi.Chen@windriver.com (7):
  populate_sdk_ext: install the latest buildtools-tarball
  copy_buildsystem: make sure bitbake directory is copied
  populate_sdk_ext: consider custom configuration in local.conf
  populate_sdk_ext: don't remove the native qemu dependencies
  Extensible SDK: allow for installation without preparing build system
  oe-publish-sdk: add script
  devtool: add mechanism for updating extensible SDK

 meta/classes/populate_sdk_base.bbclass |   2 +
 meta/classes/populate_sdk_ext.bbclass  |  59 +++++++---
 meta/files/toolchain-shar-extract.sh   |  41 +++++--
 meta/lib/oe/copy_buildsystem.py        |   7 +-
 scripts/lib/devtool/sdk.py             | 197 +++++++++++++++++++++++++++++++++
 scripts/oe-publish-sdk                 | 143 ++++++++++++++++++++++++
 6 files changed, 422 insertions(+), 27 deletions(-)
 create mode 100644 scripts/lib/devtool/sdk.py
 create mode 100755 scripts/oe-publish-sdk

-- 
2.1.0


