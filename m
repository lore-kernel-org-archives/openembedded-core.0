Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E036F77AAE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 10:43:18 +0000 (UTC)
Received: from hex.int.rpsys.net ([192.168.3.34])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id w56AhH2r022856; 
	Wed, 6 Jun 2018 11:43:18 +0100
Received: by hex.int.rpsys.net (Postfix, from userid 1000)
	id 669E53344528; Wed,  6 Jun 2018 11:43:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 11:43:16 +0100
Message-Id: <20180606104316.29529-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] oeqa/runtime/dnf: Fix test error when static libs are enabled
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
X-List-Received-Date: Wed, 06 Jun 2018 10:43:19 -0000

The test works by excluding curl-dev which curl-staticdev depends upon.
When static libraries aren't disabled, this leads to an odd looking test
failure.

Simply exclude curl-staticdev as well in case its enabled to make sure
the test always works.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 7da31cbf88d..67484bc9f95 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -157,7 +157,7 @@ class DnfRepoTest(DnfTest):
         #check curl-dev is not installed adter removing all curl occurrences
         status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
         self.assertEqual(1, status, "%s was not removed,  is listed as installed"%excludepkg)
-        self.dnf_with_repo('install -y --exclude=%s curl*' % excludepkg)
+        self.dnf_with_repo('install -y --exclude=%s --exclude=curl-staticdev curl*' % excludepkg)
         #check curl-dev is not installed after being excluded
         status, output = self.target.run('dnf list --installed | grep %s'% excludepkg , 1500)
         self.assertEqual(1, status, "%s was not excluded, is listed as installed"%excludepkg)
-- 
2.17.1


