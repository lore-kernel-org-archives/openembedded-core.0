Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8E42E6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 18:48:15 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k13so31006wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 11:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RPHUOv3AeXhFuxdrBXVjy8hd02Rez+s4+PPH7B368mQ=;
	b=BmVJyWe9auu7f41DAxSZRCKxsR+aM71EZ540RrNarBN6h1TwQQ48zY7OU6voq3/zR8
	VomjztX9n2irNAvweInNb7a5jHjsBXeZBr0309cyJhxdB8wGvbFr8IZhSQ4nB8RuNamd
	+HN1vfxuDPVlLSFcf7bjNI4mN9iLLuC5F2gYHsCQbruxnXplJ38ST3QRkFE7D0o46puS
	wOK8JEItP8oe6Pj+RffoXLxuxvPgjM+rHhAgto7RFWUOPElaTluew/Clfos+Y3wS1wUR
	jClv41CSrb9FprAMQozfuYt8W/Zn4IJ7Uz1sFbrk2dyp6ToIxwV+s56NTHqBSWknek8C
	GYmA==
X-Received: by 10.180.188.141 with SMTP id ga13mr46661151wic.9.1369334894974; 
	Thu, 23 May 2013 11:48:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm37546635wib.3.2013.05.23.11.48.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 11:48:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 19:44:59 +0100
Message-Id: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlEMd021Q8iSu2Yuh9rLNvIZDckVi6nnsoA4UB+nafBwKJviFgBj26r56FiYoytk7YnUAOQ
Subject: [PATCH 1/3] test-utils: handle import bb failing and skip the test
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
X-List-Received-Date: Thu, 23 May 2013 18:48:16 -0000

Instead of reporting an error when bb cannot be imported, skip the test
instead. This makes it a lot easier to iterate a test suite when we don't care
about this particular test.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
index 466c47e..779247a 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oe/tests/test_utils.py
@@ -1,11 +1,15 @@
 import unittest
-import bb, oe.utils
+import oe.utils
 
 class TestPackagesFilterOutSystem(unittest.TestCase):
     def test_filter(self):
         """
         Test that oe.utils.packages_filter_out_system works.
         """
+        try:
+            import bb
+        except ImportError:
+            self.skipTest("Cannot import bb")
 
         d = bb.data_smart.DataSmart()
         d.setVar("PN", "foo")
-- 
1.7.10.4


