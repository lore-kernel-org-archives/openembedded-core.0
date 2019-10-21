Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 185277C7A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 98C451835B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CmV5Y0KYJybe
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 93EDE1832C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AA5C1E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E69A1E07A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by seth.se.axis.com (Postfix) with ESMTP id 61A2DE2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 5B52B40AAF; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:26 +0200
Message-Id: <20191021103034.12200-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/9] oeqa/selftest/recipetool: Use with to control file handle lifetime
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:35 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 1c701a40bf..c1562c63b2 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -685,7 +685,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
         self._test_appendsrcfile(testrecipe, filepath, srcdir=subdir)
         bitbake('%s:do_unpack' % testrecipe)
-        self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
+        with open(self.testfile, 'r') as testfile:
+            with open(os.path.join(srcdir, filepath), 'r') as makefilein:
+                self.assertEqual(testfile.read(), makefilein.read())
 
     def test_recipetool_appendsrcfiles_basic(self, destdir=None):
         newfiles = [self.testfile]
-- 
2.11.0


