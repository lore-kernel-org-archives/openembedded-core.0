Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1D67D391
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6A5FE9C045C;
	Tue, 22 Oct 2019 05:04:00 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id a6dI9RMRihW3; Tue, 22 Oct 2019 05:03:59 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 86D6B9C0440;
	Tue, 22 Oct 2019 05:03:59 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id VMiNs5ntggvt; Tue, 22 Oct 2019 05:03:59 -0400 (EDT)
Received: from sulaco.home (lfbn-1-7821-217.w92-167.abo.wanadoo.fr
	[92.167.224.217])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C9EB79C043E;
	Tue, 22 Oct 2019 05:03:58 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 11:03:47 +0200
Message-Id: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com
Subject: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Tue, 22 Oct 2019 09:11:20 -0000
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

Jean-Marie LEMETAYER (6):
  npm.bbclass: refactor the npm class
  devtool: update command line options for npm
  recipetool/create_npm.py: refactor the npm recipe creation handler
  devtool/standard.py: update the append file for the npm recipes
  recipetool/create.py: replace 'latest' keyword for npm
  recipetool/create.py: remove the 'noverify' url parameter

 meta/classes/npm.bbclass             | 210 +++++++++----
 scripts/lib/devtool/standard.py      |  22 +-
 scripts/lib/recipetool/create.py     |  16 +-
 scripts/lib/recipetool/create_npm.py | 444 ++++++++++-----------------
 4 files changed, 331 insertions(+), 361 deletions(-)

--
2.20.1


