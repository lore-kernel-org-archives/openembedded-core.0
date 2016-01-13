Return-Path: <dmitry.rozhkov@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 842296FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:45:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 13 Jan 2016 00:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,288,1449561600"; d="scan'208";a="632670283"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.163])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2016 00:45:55 -0800
From: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 10:43:12 +0200
Message-Id: <1452674592-13387-1-git-send-email-dmitry.rozhkov@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] libarchive: Add bsdtar and bsdcpio packages
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
X-List-Received-Date: Wed, 13 Jan 2016 08:45:56 -0000

Some products might need to use a tar replacement that

1. supports xattrs and
2. has more permissive license than GNU tar.

And the bsdtar binary produced from libarchive meets these
requirements.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 716db9a..202507d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -39,7 +39,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
 SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
 
-inherit autotools lib_package pkgconfig
+inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
 
@@ -50,4 +50,20 @@ do_configure_prepend() {
 	cp -R ${STAGING_INCDIR_NATIVE}/ext2fs ${WORKDIR}/extra-includes/
 }
 
+ALTERNATIVE_PRIORITY = "100"
+
+PACKAGES =+ "bsdtar"
+FILES_bsdtar = "${bindir}/bsdtar"
+
+ALTERNATIVE_bsdtar = "tar"
+ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
+ALTERNATIVE_TARGET[tar] = "${bindir}/bsdtar"
+
+PACKAGES =+ "bsdcpio"
+FILES_bsdcpio = "${bindir}/bsdcpio"
+
+ALTERNATIVE_bsdcpio = "cpio"
+ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
+ALTERNATIVE_TARGET[cpio] = "${bindir}/bsdcpio"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.5.0

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


