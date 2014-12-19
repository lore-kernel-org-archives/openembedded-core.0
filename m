Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4505E728FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244361"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:42 +0000
Message-Id: <cover.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 00/15] Developer workflow tools
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:08 -0000

I've been looking at how to make it easier for application and system
component developers to get their work done using the tools we provide,
and I believe this patchset is a piece of the solution. There's still a
number of other pieces to come, but this should be usable on its own.

The first part of this patchset makes some changes to OE to accommodate
the tools. One of these is to extend the PATCHTOOL = "git" code to
ensure that we're able to apply all patches even if "git am" and
"git apply" can't handle them, that we do a commit to the repository per
patch, and that there is a way to track these commits back to the patch
from which they were added. There are also some additions to shared
library code that may well be useful for other tools.

I've then added a new recipe auto-creation script, recipetool, which can
take a source tree or URL and create a skeleton recipe to build it.
(In case anyone is wondering about the existing scripts/create-recipe,
frankly I consider it a dead end - it's written in Perl, which makes it
a bit difficult to integrate with the rest of our code; it's also
GPLv3-only which makes any such integration pretty much impossible from
another angle.)

Then we add devtool. This allows you to:

 * Add a new piece of software (auto-create the skeleton of a recipe
   using the aforementioned recipetool and point the build to an
   external source tree)
 * Modify the source for an existing recipe (point the build to an
   external source tree, possibly creating that tree in the same step
   and managing it with git)
 * Deploy the installed files from a recipe from ${D} to a target using
   scp.
 * Apply any modifications to the commits in the external source tree
   back to the recipe (by updating/adding/removing patches and updating
   SRC_URI within the recipe).

There will obviously be extensions to these tools, but I hope they are
already functional enough to be useful at the state they are in at the
moment.

(Note that this series depends on another series of patches to BitBake 
sent at the same time - these can be found on the paule/devtool-bb2
branch on poky-contrib.)


Changes since the earlier RFC:

For those that looked at the earlier RFC series, there have been quite a
few improvements since that, almost too many to list - but other than
what's visible in the actual commits, here goes:

* recipetool now uses autoscan to pick up dependencies from Makefile-only
  software
* recipetool is much smarter about library dependencies (making use of
  collected shared lib provider and pkgdata information rather than a
  limited hardcoded map) and detects more licenses.
* devtool now creates  workspace layer as needed if it doesn't exist
* devtool can now write back commits to patches next to the original
  recipe
* Compilation of recipes in the workspace now happens every time rather
  than just once, and causes dependent tasks (e.g. images) to be rebuilt
  as well.
* recipetool: if we can't find any license files at all, set LICENSE to
  "CLOSED" (with a comment warning it needs to be set more appropriately)
  so that the user can at least start building the recipe.
* devtool can extract the source for linux-yocto but externalsrc usage
  may still be problematic - something that still needs to be addressed.
* Branch and tag the external source git repository
* Improved error reporting, help and general messages

(Thanks to Trevor Woerner and others for earlier testing & feedback.)


The following changes since commit 8d0e56a850579f9a6d501266deeef9b257ce4780:

  serf: readded md5sum (2014-12-11 11:34:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool

Junchun Guan (1):
  scripts/devtool: Support deploy/undeploy function

Paul Eggleton (14):
  meta-environment: don't mark tasks as nostamp
  classes/package: move read_shlib_providers() to a common unit
  lib/oe/patch: fall back to patch if git apply fails
  lib/oe/patch: auto-commit when falling back from git am
  lib/oe/patch: use --keep-cr with git am
  lib/oe/patch.py: abort "git am" if it fails
  lib/oe/patch: add support for extracting patches from git tree
  lib/oe: add recipeutils module
  oeqa/utils: make get_bb_var() more reliable
  classes/externalsrc: set do_compile as nostamp
  scripts/recipetool: Add a recipe auto-creation script
  scripts: add scriptutils module
  scripts/devtool: add development helper tool
  devtool: add QA tests

 meta/classes/externalsrc.bbclass           |   3 +
 meta/classes/package.bbclass               |  24 +-
 meta/lib/oe/package.py                     |  26 ++
 meta/lib/oe/patch.py                       | 158 ++++++++-
 meta/lib/oe/recipeutils.py                 | 279 +++++++++++++++
 meta/lib/oeqa/selftest/devtool.py          | 239 +++++++++++++
 meta/lib/oeqa/utils/commands.py            |   4 +-
 meta/recipes-core/meta/meta-environment.bb |   2 -
 scripts/devtool                            | 255 ++++++++++++++
 scripts/lib/devtool/__init__.py            |  78 +++++
 scripts/lib/devtool/deploy.py              | 100 ++++++
 scripts/lib/devtool/standard.py            | 545 +++++++++++++++++++++++++++++
 scripts/lib/recipetool/__init__.py         |   0
 scripts/lib/recipetool/create.py           | 413 ++++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys.py  | 319 +++++++++++++++++
 scripts/lib/scriptutils.py                 |  60 ++++
 scripts/recipetool                         |  99 ++++++
 17 files changed, 2572 insertions(+), 32 deletions(-)
 create mode 100644 meta/lib/oe/recipeutils.py
 create mode 100644 meta/lib/oeqa/selftest/devtool.py
 create mode 100755 scripts/devtool
 create mode 100644 scripts/lib/devtool/__init__.py
 create mode 100644 scripts/lib/devtool/deploy.py
 create mode 100644 scripts/lib/devtool/standard.py
 create mode 100644 scripts/lib/recipetool/__init__.py
 create mode 100644 scripts/lib/recipetool/create.py
 create mode 100644 scripts/lib/recipetool/create_buildsys.py
 create mode 100644 scripts/lib/scriptutils.py
 create mode 100755 scripts/recipetool

-- 
1.9.3


