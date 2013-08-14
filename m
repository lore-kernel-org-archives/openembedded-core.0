Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2992461DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:25:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Aug 2013 13:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,879,1367996400"; d="scan'208";a="282080772"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Aug 2013 13:25:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:25:05 -0700
Message-Id: <1376511905-21183-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] texinfo: add perl RDEPENDS and fix up packaging
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
X-List-Received-Date: Wed, 14 Aug 2013 20:25:06 -0000

This new version of texinfo uses perl for the conversion process.

The perl modules are installed in ${datadir}/texinfo which was getting
pulled into the -doc package, since FILE_${PN} is a full override, add
it back.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/texinfo/texinfo_5.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.1.bb b/meta/recipes-extended/texinfo/texinfo_5.1.bb
index 0f4b4af..5b38fcc 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.1.bb
@@ -53,8 +53,9 @@ FILES_info-doc = "${infodir}/info.info ${infodir}/dir ${infodir}/info-*.info \
                   ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
                   ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
 
-FILES_${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi"
-FILES_${PN}-doc = "${datadir}/texinfo ${infodir}/texinfo* \
+FILES_${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
+RDEPENDS_${PN} = "perl"
+FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
-- 
1.8.1.4


