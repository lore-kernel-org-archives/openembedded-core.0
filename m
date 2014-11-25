Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23C9B7229B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:29:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2014 09:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637908684"
Received: from ksperera-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.204])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 09:29:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 17:28:40 +0000
Message-Id: <cover.1416934753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 25 Nov 2014 17:29:49 -0000

[Note: this is an RFC series for the moment, and shouldn't yet be merged.]

I've been looking at how to make it easier for application and system
component developers to get their work done using the tools we provide,
and I believe this patchset is a piece of the solution. There's still a
number of other pieces to come, but this should be usable on its own.

The first three patches extend the PATCHTOOL = "git" code to ensure that
we're able to apply all patches even if "git am" and "git apply" can't
handle them, and that we do a commit to the repository per patch. This
is needed for devtool later on.

I've then added a new recipe auto-creation script, recipetool, which can
take a source tree or URL and create a skeleton recipe to build it. 
(In case anyone is wondering about the existing scripts/create-recipe,
frankly I consider it a dead end - it's written in Perl, which makes it
a bit difficult to integrate with the rest of our code; it's also
GPLv3-only which makes any such integration pretty much impossible from
another angle.)

Then we add devtool. This allows you to:

 * Add a new piece of software (auto-create the skeleton of a recipe
   using the aforementioned recipetool and point the build to an external
   source tree)
 * Modify the source for an existing recipe (point the build to an
   external source tree, possibly creating that tree in the same step
   and managing it with git)
 * Deploy the installed files from a recipe from ${D} to a target using
   scp.

There will obviously be extensions to these tools, but I hope they are
already functional enough to be useful at the state they are in at the
moment.

Known issues:

 * "devtool modify" can't currently deal with gcc, linux-yocto or perf
   because they manage their workdir differently, this will need to be
   fixed
 * devtool's workspace layer triggers a bitbake warning when empty.
   I suspect a mechanism to disable this warning internally will need to
   be added.
 * "recipetool create" ideally needs to become smarter and fill in
   more details of the recipe. At some point we'll probably have to
   make the process interactive and possibly have it automate parts of
   the build process and examine the output; some things just can't be
   practically detected from the source tree without building.


(Note that some pieces of the code which are not essential rely on a couple
of changes to bitbake, you can find these in the paule/devtool-bb branch
in poky-contrib, or if you are happy to use poky, grab the paule/devtool
branch in poky-contrib which has everything).

Comments/questions/suggestions welcome!


The following changes since commit ff2ff155ea5273b2023a1c9834b13f10249d343f:

  gdk-pixbuf: use ptest-gnome (2014-11-25 12:58:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool

Paul Eggleton (6):
  lib/oe/patch: fall back to patch if git apply fails
  lib/oe/patch: auto-commit when falling back from git am
  lib/oe/patch: use --keep-cr with git am
  scripts/recipetool: Add a recipe auto-creation script
  lib/oe: add recipeutils module
  scripts/devtool: add development helper tool

Junchun Guan (1):
  scripts/devtool: Support deploy/undeploy function

 meta/lib/oe/patch.py                      |  94 ++++++-
 meta/lib/oe/recipeutils.py                | 264 ++++++++++++++++++++
 scripts/devtool                           | 223 +++++++++++++++++
 scripts/lib/devtool/__init__.py           |  79 ++++++
 scripts/lib/devtool/deploy.py             | 100 ++++++++
 scripts/lib/devtool/standard.py           | 390 ++++++++++++++++++++++++++++++
 scripts/lib/recipetool/__init__.py        |   0
 scripts/lib/recipetool/create.py          | 375 ++++++++++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys.py | 234 ++++++++++++++++++
 scripts/recipetool                        | 124 ++++++++++
 10 files changed, 1881 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oe/recipeutils.py
 create mode 100755 scripts/devtool
 create mode 100644 scripts/lib/devtool/__init__.py
 create mode 100644 scripts/lib/devtool/deploy.py
 create mode 100644 scripts/lib/devtool/standard.py
 create mode 100644 scripts/lib/recipetool/__init__.py
 create mode 100644 scripts/lib/recipetool/create.py
 create mode 100644 scripts/lib/recipetool/create_buildsys.py
 create mode 100755 scripts/recipetool

-- 
1.9.3


