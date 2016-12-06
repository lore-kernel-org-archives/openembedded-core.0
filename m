Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AC0CC719EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:49:59 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 2ACA1B87EF8; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:29 +0100
Message-Id: <1481024991-5882-12-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 11/33] apt: use default packaging rules for base package, prepend apt-utils
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
X-List-Received-Date: Tue, 06 Dec 2016 11:49:59 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index ba49571..ec93eb8 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -2,12 +2,8 @@ DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
 require apt.inc
 
-PACKAGES += "${PN}-utils"
-FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
-	       ${bindir}/apt-config ${bindir}/apt-cache \
-	       ${libdir}/apt ${libdir}/libapt*.so.* \
-	       ${localstatedir} ${sysconfdir} \
-	       ${libdir}/dpkg"
+PACKAGES =+ "${PN}-utils"
+FILES_${PN} += "${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
 FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
@@ -54,8 +50,6 @@ PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_
 PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
 PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
 
-FILES_${PN} += "${bindir}/apt-key"
-
 do_install_append() {
     #Write the correct apt-architecture to apt.conf
     APT_CONF=${D}/etc/apt/apt.conf
-- 
2.7.4


