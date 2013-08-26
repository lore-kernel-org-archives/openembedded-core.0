Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id C782560990
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 09:51:10 +0000 (UTC)
Received: from aimless.elisa-laajakaista.fi
	(a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 784B326545;
	Mon, 26 Aug 2013 11:51:08 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 12:51:01 +0300
Message-Id: <1377510661-14290-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] eglibc: fix directory cleanup for 2.17
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
X-List-Received-Date: Mon, 26 Aug 2013 09:51:11 -0000

Commit e0c2dd275827a4b37b8116d0f0119333638461af broke building
eglibc 2.17, which still ships pt_chown under eglibc/ directory.

Fix by only deleting directory when pt_chown is not there.

Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index c36d16c..3adf1a9 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -75,7 +75,7 @@ do_install_append () {
 	rm -rf ${D}${localstatedir}
 
 	# remove empty eglibc dir
-	if [ -d ${D}${libdir}/eglibc ]; then
+	if [ -d ${D}${libdir}/eglibc -a ! -e ${D}${libdir}/eglibc/pt_chown ]; then
 		rmdir ${D}${libdir}/eglibc
 	fi
 	oe_multilib_header bits/syscall.h
-- 
1.8.3.1


