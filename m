Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id AB5417213E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:06:03 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id G0611p00N0BVjqb01063zD; Sat, 15 Nov 2014 17:06:04 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 18:05:47 -0600
Message-Id: <489320bd2e3d79efcab7f0b0c21dddd94c68bbb8.1416081855.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
Subject: [PATCH V2 3/7] image.bbclass: search both rootfs and native staging for passwd files
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
X-List-Received-Date: Sun, 16 Nov 2014 00:06:05 -0000

When pseudo is configured to disallow fallback to the build host
/etc/hosts and /etc/group, the selection of ${IMAGE_ROOT} for
PSEUDO_PASSWD is insufficient as the necessary files will not be
available until base-passwd has been installed and its pkg_postinst
script run.  Fall back to the ${STAGING_DIR_NATIVE} version of those
files until the rootfs versions are available.  (The native copies are
never modified by the build; the ones in ${STAGING_DIR_TARGET} are
updated and may contain settings not consistent with what would be
created by post-install useradd/groupadd commands invoked in the image
rootfs.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
v2 change: fallback to ${STAGING_DIR_NATIVE} instead of ${STAGING_DIR_TARGET}.

 meta/classes/image.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fc08653..6bbfaf8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -175,7 +175,9 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', True).split()))}"
 
-PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
+# Prefer image, but use the fallback files for lookups if the image ones
+# aren't yet available.
+PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
-- 
1.8.5.5


