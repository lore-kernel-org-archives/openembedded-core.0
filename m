Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC026DF64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:41:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2013 08:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,825,1378882800"; d="scan'208";a="438491194"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2013 08:40:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:40:26 +0000
Message-Id: <6bcb5e2c3d4c32c41a4e7c616a8acbf151513e0c.1386175183.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] gpgme: remove pth handling
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
X-List-Received-Date: Wed, 04 Dec 2013 16:41:20 -0000

pth support was removed from gpgpme in 1.3.2 according to the upstream
changelog, so drop all mention of it from the recipe.

Fixes the configure warning:
WARNING: QA Issue: gpgme: configure was passed unrecognised options: --without-pth-test --with-pth

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.4.3.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index aacd923..78182c0 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -15,16 +15,12 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
 
-DEPENDS = "libgpg-error libassuan ${PTH}"
-PTH_libc-uclibc = "npth"
-PTH = "pth"
+DEPENDS = "libgpg-error libassuan"
 
-EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
-                --with-gpg=${bindir}/gpg --without-gpgsm"
+EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm"
 
 inherit autotools binconfig
 
-PACKAGES =+ "${PN}-pth ${PN}-pthread"
-FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
+PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
-- 
1.8.1.2


