Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3856E247
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 22:17:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2013 14:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,860,1378882800"; d="scan'208";a="447251179"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.207])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2013 14:16:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 14:16:39 -0800
Message-Id: <1386627399-19027-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] binutils: Add embedspu to standard binutils package
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
X-List-Received-Date: Mon, 09 Dec 2013 22:17:09 -0000

This is only built for PPC, fixes the following QA Error

ERROR: QA Issue: binutils: Files/directories were installed but not shipped
  /usr/bin/embedspu

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 17c66bc..cf13c4f 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -18,7 +18,8 @@ inherit autotools gettext multilib_header
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*-*.so \
-	${prefix}/${TARGET_SYS}/bin/*"
+	${prefix}/${TARGET_SYS}/bin/* \
+        ${bindir}/embedspu"
 
 RPROVIDES_${PN} += "${PN}-symlinks"
 
@@ -140,11 +141,6 @@ do_install () {
 	oe_multilib_header bfd.h
 }
 
-do_install_append_class-target_powerpc () {
-        # we dont really care about embedspu for ppc so remove it
-        rm -f ${D}/${bindir}/embedspu || :
-}
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
1.8.3.1


