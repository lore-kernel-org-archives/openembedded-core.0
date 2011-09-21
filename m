Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6Hyq-0006ak-Ec
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 10:16:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2011 01:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,415,1312182000"; d="scan'208";a="19118362"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2011 01:11:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 16:18:09 +0800
Message-Id: <299817d13d36871907df84623b600ca90961ac67.1316592963.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1316592963.git.dongxiao.xu@intel.com>
References: <cover.1316592963.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1316592963.git.dongxiao.xu@intel.com>
References: <cover.1316592963.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] libpng: avoid dangling link in libpng package
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
X-List-Received-Date: Wed, 21 Sep 2011 08:16:32 -0000

As for libpng recipe, the libpng.pc is a symbol link to libpng12.pc,
if packaging them into two different packages, we will get a dangling
link for libpng.pc, and when calculating rpm dependency with that file,
we will get nothing.

Only keep one version of dev package to fix the issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.2.46.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
index 57d9037..0a28709 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
                     file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
 DEPENDS = "zlib"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
@@ -15,11 +15,9 @@ SRC_URI[sha256sum] = "a5e796e1802b2e221498bda09ff9850bc7ec9068b6788948cc2c42af21
 
 inherit autotools binconfig pkgconfig
 
-PACKAGES =+ "${PN}12-dbg ${PN}12 ${PN}12-dev"
+PACKAGES =+ "${PN}12"
 
-FILES_${PN}12-dbg = "${libdir}/.debug/libpng12*"
 FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-FILES_${PN}12-dev = "${libdir}/libpng12.* ${includedir}/libpng12 ${libdir}/pkgconfig/libpng12.pc"
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-dev += " ${bindir} ${sbindir}"
 
-- 
1.7.1



