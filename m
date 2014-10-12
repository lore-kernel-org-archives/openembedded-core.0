Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id C5A837190D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:50:10 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id 2Pq71p0040BVjqb01Pq867; Sun, 12 Oct 2014 16:50:10 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 18:49:52 -0500
Message-Id: <1413157795-1346-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/3] pseudo+image.bbclass: changes to avoid host contamination
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
X-List-Received-Date: Sun, 12 Oct 2014 23:50:11 -0000

While determining that an anomaly was self-induced, I found some issues
with pseudo that, with low probability, could result in mis-use of the
build host /etc/passwd and /etc/group to resolve target uid/gid/names.

The red herring I was fishing was that pseudo, in its default
configuration, will fall back to the build host passwd/group files if it
can't access ones in the chroot or specified by PSEUDO_PASSWD.  To rule
out this as a cause of my anomaly, I added --without-passwd-fallback to
the pseudo configuration.

This unexpectedly resulted in failed builds that I tracked down to
pseudo adding an unnecessary directory prefix to the .pwd.lck file,
causing failures in the attempt to lock /etc/passwd.  The first patch
fixes pseudo to support --without-passwd-fallback.

The next problem is that pseudo required the fallback path to be
specified when pseudo itself was configured, and only allowed a single
runtime-specified path.  This breaks image formation: the preferred path
should be ${IMAGE_ROOT}, but etc/passwd doesn't exist in that path until
base-passwd runs pkg_postinst.  Until that happens the version in
${STAGING_DIR_TARGET} should be used as fallback.  The second patch
enhances pseudo with the ability to specify multiple search paths, and
the third uses the feature in image.bbclass to search both ${IMAGE_ROOT}
and ${STAGING_DIR_TARGET} for passwd/group files.

I believe OE should add --without-passwd-fallback to the pseudo 1.6.2
configuration flags early in the 1.8 development cycle, to ensure there
are no host contamination issues.  I can think of no reason why the
build host passwd and group files should ever be considered suitable for
use in determining target user/group characteristics.

However, if this is done various recipes that do things like "chown
root:root files" in their install fail because they don't currently
DEPEND on base-passwd.  How to cleanly add that dependency is a topic
for discussion, and I've left that final step out of the series for now.

Peter

Peter A. Bigot (3):
  pseudo: support --without-passwd-fallback configuration option
  pseudo: support multiple search directories in PSEUDO_PASSWD
  image.bbclass: search both rootfs and staging dir for passwd files

 meta/classes/image.bbclass                         |   4 +-
 ...do_client.c-protect-pwd_lck-against-magic.patch |  56 ++++++++++
 ..._util-modify-interface-to-pseudo_etc_file.patch |  70 +++++++++++++
 ...nt.c-support-multiple-directories-in-PSEU.patch | 115 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       |   3 +
 5 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch

-- 
1.8.5.5


