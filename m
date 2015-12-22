Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6E37317D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 20:04:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978791"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:02:53 +1300
Message-Id: <cover.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/26] devtool/recipetool improvements
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:09 -0000

Apologies for the flood of patches today, this is the last one.

There are quite a few changes here, but the common theme is making
devtool (and recipetool) a bit easier to use, as well as making
"devtool add" and "recipetool create" more effective at picking up
things from the specified source tree.

I also extended the argparse fix to show the help text on error to all
of the command-line utilities that use it.


The following changes since commit 2a1edfd9cfa16ec334c0758b47677d4fee5e79a8:

  bitbake.conf: Add filename and lineno to BB_SIGNATURE_EXCLUDE_FLAGS (2015-12-22 00:01:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool11

Paul Eggleton (26):
  scripts: print usage in argparse-using scripts when a command-line error occurs
  recipetool: create: handle https://....git URLs
  recipetool: create: avoid traceback on fetch error
  recipetool: create: fix do_install handling for makefile-only software
  recipetool: create: minor fix for potential issue in python handling
  recipetool: create: prevent attempting to unpack entire DL_DIR
  recipetool: create: detect when specified URL returns a web page
  recipetool: create: set up priority system for recipe handlers
  recipetool: create: support extracting name and version from build scripts
  recipetool: create: basic extraction of name/version from filename
  devtool: edit-recipe: add new subcommand
  devtool: add: tweak help text
  devtool: split out function for naming bbappend
  devtool: update-recipe: use correct method to get bbappend filename
  scripts/lib/argparse_oe: handle intermixing of optional positional arguments
  devtool: add: allow source tree to be omitted
  devtool: add: figure out recipe name from recipetool
  devtool: add: allow specifying URL as positional argument
  devtool: modify: default source tree path
  devtool: status: list recipe file within workspace if one exists
  devtool: reset: print message about leaving source tree behind
  devtool: sync: tweak help / messages
  recipetool: create: improve autotools support
  recipetool: create: fix error when extracting source to a specified directory
  oe-selftest: add tests for simple devtool add / recipetool create URL case
  oe-selftest: devtool: add more explicit check for ls output

 meta/lib/oeqa/selftest/devtool.py                |  82 +++++-
 meta/lib/oeqa/selftest/recipetool.py             |  21 +-
 scripts/contrib/devtool-stress.py                |   5 +-
 scripts/devtool                                  |  13 +-
 scripts/lib/argparse_oe.py                       |  66 +++++
 scripts/lib/devtool/__init__.py                  |  15 ++
 scripts/lib/devtool/standard.py                  | 315 +++++++++++++++++------
 scripts/lib/recipetool/create.py                 | 206 ++++++++++++---
 scripts/lib/recipetool/create_buildsys.py        | 296 +++++++++++++++++----
 scripts/lib/recipetool/create_buildsys_python.py |   7 +-
 scripts/lib/scriptutils.py                       |   5 +
 scripts/oe-pkgdata-util                          |   5 +-
 scripts/oe-publish-sdk                           |   5 +-
 scripts/oe-selftest                              |   3 +-
 scripts/recipetool                               |   7 +-
 scripts/send-error-report                        |   6 +-
 scripts/test-remote-image                        |   3 +-
 17 files changed, 872 insertions(+), 188 deletions(-)
 create mode 100644 scripts/lib/argparse_oe.py

-- 
2.5.0


