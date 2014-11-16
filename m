Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id 147147210A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:06:02 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id G0611p00N0BVjqb01062z9; Sat, 15 Nov 2014 17:06:02 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 18:05:44 -0600
Message-Id: <cover.1416081855.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH V2 0/7] prevent pseudo host passwd/group contamination
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
X-List-Received-Date: Sun, 16 Nov 2014 00:06:04 -0000

For background see:

 http://lists.openembedded.org/pipermail/openembedded-core/2014-November/098465.html
 http://lists.openembedded.org/pipermail/openembedded-core/2014-November/098467.html

Changes in V2:

* Correct faulty assumption that ${STAGING_DIR_TARGET} was ever a valid
  fallback source

* Correct pseudo patch header to remove reference to faulty assumption

* Install fallback files read-only and note that in no circumstance
  should they ever be modified

* Add a new patch that ensures useradd.bbclass informs pseudo of the
  directory in which it expects to find the files that it wants to
  modify

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pabigot/pseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/pseudo

Peter A. Bigot (7):
  pseudo: support --without-passwd-fallback configuration option
  pseudo: support multiple search directories in PSEUDO_PASSWD
  image.bbclass: search both rootfs and native staging for passwd files
  pseudo: default --without-passwd-fallback
  pseudo: provide fallback passwd and group files
  bitbake.conf: pseudo fall back to last-resort passwd files
  useradd.bbclass: set PSEUDO_PASSWD consistent with root directory

 meta/classes/image.bbclass                         |   4 +-
 meta/classes/useradd.bbclass                       |   2 +
 meta/conf/bitbake.conf                             |   2 +-
 meta/recipes-devtools/pseudo/files/fallback-group  |   2 +
 meta/recipes-devtools/pseudo/files/fallback-passwd |   1 +
 ...do_client.c-protect-pwd_lck-against-magic.patch |  56 ++++++++++
 ..._util-modify-interface-to-pseudo_etc_file.patch |  70 +++++++++++++
 ...nt.c-support-multiple-directories-in-PSEU.patch | 116 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       |  14 ++-
 9 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-group
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-passwd
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch

-- 
1.8.5.5


