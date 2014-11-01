Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-07.prod.phx3.secureserver.net
	(p3plsmtpa09-07.prod.phx3.secureserver.net [173.201.193.236])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7E765C87
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 17:04:58 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-07.prod.phx3.secureserver.net with 
	id AH4w1p0070BVjqb01H4wW0; Sat, 01 Nov 2014 10:04:58 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Nov 2014 12:04:36 -0500
Message-Id: <1414861479-5493-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/3] prevent pseudo host passwd/group contamination
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
X-List-Received-Date: Sat, 01 Nov 2014 17:05:00 -0000

I don't have my -contrib accounts yet so can't do pull requests, but
these are simple.

These patches build on the following unmerged fixes for pseudo's support
for --without-passwd-fallback:

  http://patches.openembedded.org/patch/81591/
  http://patches.openembedded.org/patch/81593/
  http://patches.openembedded.org/patch/81595/

The new patches use --without-passwd-fallback, preventing contamination
from the host files during the early build stages when the target
versions from base-passwd aren't yet available.

Experimentation with adding an explicit DEPENDS="base-passwd" showed
that approach would touch a large number of recipes.  For some of those
recipes, the dependency became circular because base-passwd includes a
target utility program that can't be built without glibc and other files
that can't be installed without the ability to look up user and group
names.

The solution chosen is to use the capability in the previous patches to
install last-resort passwd and group in ${STAGING_DIR_NATIVE}, and use
those only when the files are not present in ${STAGING_DIR_TARGET}.  The
last-resort files must contain the usernames (root) and groups (root,
mail) that are specified in meta/files/fs-perms.txt so that packaging
succeeds.  Only names required for a successful build have been provided
in these fall-back files, and the id values match those in the
base-passwd files.

I've done a clean (no sstate) core-image-sato build in poky for
beaglebone+systemd with no issues.  Further, with this patch the true
host uid/username/gid/groupname contamination noted in my email last
night has been eliminated.  Unfortunately there are still cases where
the build system gid ends up as the gid of installed files.

I believe that any issues that do arise will represent a true dependency
on base-passwd that should be added to the failing recipe.

Peter A. Bigot (3):
  pseudo: default --without-passwd-fallback
  pseudo: provide fallback passwd and group files
  bitbake.conf: pseudo fall back to last-resort passwd files

 meta/conf/bitbake.conf                             |  2 +-
 meta/recipes-devtools/pseudo/files/fallback-group  |  2 ++
 meta/recipes-devtools/pseudo/files/fallback-passwd |  1 +
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       | 10 +++++++++-
 4 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-group
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-passwd

-- 
1.8.5.5


