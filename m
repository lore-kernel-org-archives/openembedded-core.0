Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81C4F78A06
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:37:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w85Cb2Mw024626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 05:37:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:37:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 5 Sep 2018 08:36:02 -0400
Message-ID: <1536150963-173280-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
References: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] opkg-keyrings: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:37:02 -0000
Content-Type: text/plain

Since `229f4e9 package.bbclass: add support for
pkg_postinst_ontarget()' applied in oe-core, use
pkg_postinst_ontarget to run postinst at first boot.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
index 18d6abd..a20e316 100644
--- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
@@ -35,14 +35,6 @@ FILES_${PN} = "${datadir}/opkg/keyrings"
 # We need 'opkg-key' to run the postinst script
 RDEPENDS_${PN} = "opkg"
 
-pkg_postinst_${PN} () {
-#! /bin/sh
-set -e
-
-if [ x"$D" = "x" ]; then
-    # On target
-    opkg-key populate
-else
-    exit 1
-fi
+pkg_postinst_ontarget_${PN} () {
+opkg-key populate
 }
-- 
2.8.1


