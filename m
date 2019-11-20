Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8731F7F700
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9ECE99C0200;
	Wed, 20 Nov 2019 04:34:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id sbbvCNAaRRMp; Wed, 20 Nov 2019 04:34:05 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 740549C027E;
	Wed, 20 Nov 2019 04:34:05 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id daEzUIwZOyWw; Wed, 20 Nov 2019 04:34:05 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 249169C0200;
	Wed, 20 Nov 2019 04:34:04 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:41 +0100
Message-Id: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:06 -0000
Content-Transfer-Encoding: quoted-printable

The current NPM support have several issues:
 - The current NPM fetcher downloads the dependency tree but not the othe=
r
   fetchers. The 'subdir' parameter was used to fix this issue.
 - They are multiple issues with package names (uppercase, exotic charact=
ers,
   scoped packages) even if they are inside the dependencies.
 - The lockdown file generation have issues. When a package depends on
   multiple version of the same package (all versions have the same check=
sum).

This patchset refactors the NPM support in Yocto:
 - As the NPM algorithm for dependency management is hard to handle, the =
new
   NPM fetcher downloads only the package source (and not the dependencie=
s,
   like the other fetchers) (patch submitted in the bitbake-devel list).
 - The NPM class handles the dependencies using NPM (and not manually).
 - The NPM recipe creation is simplified to avoid issues.
 - The lockdown file is no more used as it is no longer relevant compared=
 to the
   latest shrinkwrap file format.

This patchset may remove some features (lockdown file, license management=
 for
dependencies) but fixes the majority of the NPM issues. All of these issu=
es
from the bugzilla.yoctoproject.org are resolved by this patchset:
#10237, #10760, #11028, #11728, #11902, #12534

The fetcher and recipetool are now aware of a 'latest' keyword for the ve=
rsion
which allow to build the latest version available on the registry. This f=
eature
fixes the two issues: #10515, #11029

Moreover the issue #13415 should also be fixed but I cannot test it.

I have tested the recipe creation and builds using a self made example to
generate build failures:
 - https://github.com/savoirfairelinux/node-server-example
 - https://npmjs.com/package/@savoirfairelinux/node-server-example

The test steps are these ones:
  $ source poky/oe-init-build-env
  $ bitbake-layers add-layer ../meta-openembedded/meta-oe
  $ devtool add "npm://registry.npmjs.org;name=3D@savoirfairelinux/node-s=
erver-example;version=3Dlatest"
  $ devtool build savoirfairelinux-node-server-example
  $ bitbake-layers create-layer ../meta-test
  $ bitbake-layers add-layer ../meta-test
  $ devtool finish savoirfairelinux-node-server-example ../meta-test
  $ echo IMAGE_INSTALL_append =3D '" savoirfairelinux-node-server-example=
"' >> conf/local.conf
  $ bitbake core-image-minimal

Also the 'devtool add' url could be one of these:
 - npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example;=
version=3Dlatest
   This url uses the new npm fetcher and request the latest version avail=
able on
   the registry.
 - npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example;=
version=3D1.0.0
   This url uses the new npm fetcher and request a fixed version.
 - git://github.com/savoirfairelinux/node-server-example.git;protocol=3Dh=
ttps
   This url uses the git fetcher. As the dependencies are managed by the =
NPM
   class, any fetcher can be used.

When this patchset will be merged, I have planned to update the NPM wiki:
  https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM

This patchset is also the base work for the full Angular support in Yocto=
 that I
am preparing. These applications have a huge dependency tree which is ide=
al to
test the NPM support.

--- V2

 - Add the 'check_network_access' function before each network access to =
check
   for 'BB_NO_NETWORK' and 'BB_ALLOWED_NETWORKS' variables.

 - Add a 'recipetool.RecipetoolTests.test_recipetool_create_npm' test cas=
e for
   'oe-selftest' to test the npm recipe creation.

 - Update the 'npm.bbclass' to fetch the dependencies in the 'do_fetch' t=
ask.
   The dependencies are cached in a npm cache stored in '${DL_DIR}/npm_ca=
che'
   allowing the dependencies to be saved in the download directory and ve=
rify
   on insertion and extraction [1]:
      "All data that passes through the cache is fully verified
       for integrity on both insertion and extraction."

1: https://docs.npmjs.com/cli/cache.html

--- V3

 - Add a test regarding the 'devtool add' and 'devtool build' command:
     - devtool.DevtoolAddTests.test_devtool_add_npm

 - Add the license management for dependencies.

 - Split the npm workflow to use the bitbake default tasks (do_fetch, do_=
unpack,
   do_compile, do_install). Make sure that only the do_fetch task require=
s
   network access.

 - Split the commits for better understanding.

 - Force the rebuild of prebuild addons.

 - Use ${nonarch_libdir} instead of ${libdir} in the do_install task.

  - These patches can be found here:
     - https://github.com/savoirfairelinux/openembedded-core/tree/npm-ref=
actoring-v3
     - https://github.com/savoirfairelinux/poky/tree/npm-refactoring-v3

Jean-Marie LEMETAYER (17):
  devtool: npm: update command line options
  npm.bbclass: refactor the npm class
  recipetool/create_npm.py: refactor the npm recipe creation handler
  lib/oe/package.py: remove unneeded npm_split_package_dirs function
  devtool/standard.py: npm: update the append file
  recipetool/create.py: npm: remove the 'noverify' url parameter
  recipetool/create.py: npm: replace the 'latest' keyword
  npm.bbclass: split the do_compile task
  devtool/standard.py: npm: exclude the node_modules directory
  recipetool/create_npm.py: handle the licenses of the dependencies
  npm.bbclass: restrict the build to be offline
  npm.bbclass: use the local node headers
  recipetool/create_npm.py: convert the shrinkwrap file
  npm.bbclass: force to rebuild the prebuild addons
  devtool/standard.py: npm: configure the NPM_CACHE_DIR to be persistent
  oeqa/selftest/recipetool: add npm recipe creation test
  oeqa/selftest/devtool: add npm recipe build test

 meta/classes/npm.bbclass                   | 224 +++++---
 meta/lib/oe/package.py                     |  33 --
 meta/lib/oeqa/selftest/cases/devtool.py    |  20 +
 meta/lib/oeqa/selftest/cases/recipetool.py |  21 +
 scripts/lib/devtool/standard.py            |  31 +-
 scripts/lib/recipetool/create.py           |  16 +-
 scripts/lib/recipetool/create_npm.py       | 565 +++++++++++----------
 7 files changed, 510 insertions(+), 400 deletions(-)

--
2.20.1


