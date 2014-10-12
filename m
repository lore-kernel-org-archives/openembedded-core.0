Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id 031EC718F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:50:22 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id 2Pq71p0040BVjqb01PqP7p; Sun, 12 Oct 2014 16:50:24 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 18:49:55 -0500
Message-Id: <1413157795-1346-4-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1413157795-1346-1-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 3/3] image.bbclass: search both rootfs and staging dir for passwd files
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
X-List-Received-Date: Sun, 12 Oct 2014 23:50:23 -0000

When pseudo is configured to disallow fallback to the build host
/etc/hosts and /etc/group, the selection of ${IMAGE_ROOT} for
PSEUDO_PASSWD is insufficient as the necessary files will not be
available until base-passwd has been installed and its pkg_postinst
script run.  Fall back to the ${STAGING_DIR_TARGET} version of those
files until the rootfs versions are available.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---

NOTE: This patch REQUIRES that preceding two patches to pseudo
that provide multiple path support in PSEUDO_PASSWD.

 meta/classes/image.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..18f0fdd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -186,7 +186,9 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', True).split()))}"
 
-PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
+# Prefer image, but fall back to staging dir if image files not yet
+# available.
+PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_TARGET}"
 
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
-- 
1.8.5.5


