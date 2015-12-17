Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id F30706FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B8E6E2652D0
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 16:09:15 +0000
Message-Id: <1450368555-20921-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
Subject: [PATCH] oeqa/selftest/wic: add test case for sparse images
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
X-List-Received-Date: Thu, 17 Dec 2015 16:09:18 -0000

Add a testcase to build a directdisk image and check that the
used disk size is less than the apparent size, as wic now
assembles images as sparse files.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/lib/oeqa/selftest/wic.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 55f6f82..e85363c 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -264,3 +264,15 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test_sparseness(self):
+        """Test that assembled images are sparse; apparent size > disk usage"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal").status)
+        images = glob(self.resultdir + "directdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        path = images.pop()
+        used = int(runCmd("du %s | awk '{print $1}'" % path).output)
+        apparent = int(runCmd("du --apparent-size %s | awk '{print $1}'" % path).output)
+        self.assertLess(used, apparent)
-- 
2.5.0


