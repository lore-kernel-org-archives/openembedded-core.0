Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2541560420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 02:14:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 21 May 2013 19:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="337962196"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2013 19:14:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 19:14:23 -0700
Message-Id: <1369188863-26540-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] patch: use PACKAGECONFIG to ensure correct dependency for xattr
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
X-List-Received-Date: Wed, 22 May 2013 02:14:24 -0000

This will enable or disable xattr with the correct dependency
on attr as needed.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/patch/patch_2.7.1.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
index 38df034..16e3cc4 100644
--- a/meta/recipes-devtools/patch/patch_2.7.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
@@ -9,3 +9,6 @@ SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d6
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 acpaths = "-I ${S}/m4 "
+
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
+PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr," 
-- 
1.7.10.4


