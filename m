Return-Path: <info@ib-oezmert.de>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 1655F76094
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:06:04 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 597A7478D2;
	Mon,  2 Jul 2018 18:06:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id jcqqbqZ2x0Pt; Mon,  2 Jul 2018 18:06:04 +0200 (CEST)
From: =?UTF-8?q?Alp=20=C3=96zmert?= <info@ib-oezmert.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 18:05:47 +0200
Message-Id: <1530547547-18986-1-git-send-email-info@ib-oezmert.de>
Subject: [PATCH v2] Fix & extend recommendations for license packages.
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
X-List-Received-Date: Mon, 02 Jul 2018 16:06:05 -0000

Changed package recommendations so that the license package of a recipe
is recommended for all other packages of a recipe instead of for one
package given by the recipe name.

Pre-patch behaviour results in a missing recommendation when a recipe
does not have a package with the same name.
---
 meta/classes/license.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0514e91..5c44bd5 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -167,6 +167,9 @@ def add_package_and_files(d):
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES_' + pn_lic, files)
+    for pn in packages.split():
+        if pn == pn_lic:
+            continue
         rrecommends_pn = d.getVar('RRECOMMENDS_' + pn, True)
         if rrecommends_pn:
             d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
-- 
2.7.4


