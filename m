Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5Z-0006rk-EB
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:15:01 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 09:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803504"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:42 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 09:02:19 -0700
Message-Id: <6041a3dca147e7182cb4bb751013d09c04214ef0.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341935782.git.nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
Subject: [PATCH 19/19] gpgme: fix build with automake 1.12.x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 16:15:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake 1.12.x automatically deletes empty directories, so
the additional rmdir from the do_install_append fails.

cleanup the do_install_append for automake 1.12.x

Avoids this build issue:
| rmdir: failed to remove `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/gpgme-1.3.2-r0/image/usr/libexec': No such file or directory
| ERROR: Function failed: do_install

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.3.2.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.3.2.bb b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
index b3c1d46..f19892c5 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "libgpg-error libassuan ${PTH}"
 PTH_libc-uclibc = "npth"
 PTH = "pth"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
@@ -28,7 +28,3 @@ PACKAGES =+ "${PN}-pth ${PN}-pthread"
 FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
-
-do_install_append() {
-	rmdir ${D}/usr/libexec
-}
-- 
1.7.3.4



