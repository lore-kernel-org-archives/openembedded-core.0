Return-Path: <info@ib-oezmert.de>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jun 2018 15:51:01 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id C2FDB6076F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 15:51:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 622D040F84;
	Fri, 29 Jun 2018 17:41:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
	[80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id md9XY_47Qlos; Fri, 29 Jun 2018 17:41:27 +0200 (CEST)
From: =?UTF-8?q?Alp=20=C3=96zmert?= <info@ib-oezmert.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:41:02 +0200
Message-Id: <1530286862-35452-1-git-send-email-info@ib-oezmert.de>
MIME-Version: 1.0
Subject: [PATCH] Fix & extend recommendations for license packages.
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
X-List-Received-Date: Fri, 29 Jun 2018 15:51:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changed package recommendations so that the license package of a
recipe is recommended for all packages of a recipe instead of for one
package given by the recipe name.

Pre-patch behaviour results in a missing recommendation when a recipe
does not have a package with the same name.

Signed-off-by: Alp Özmert <info@ib-oezmert.de>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 06dd4a8..79ea7ed 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -340,6 +340,7 @@ def add_package_and_files(d):
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES_' + pn_lic, files)
+    for pn in packages.split():
         rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
         if rrecommends_pn:
             d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
-- 
2.7.4


