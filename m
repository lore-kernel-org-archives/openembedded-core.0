Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D343B77BE9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 13:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BDJwrY015439; 
	Tue, 11 Apr 2017 14:20:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 50T7w0vjqq_b; Tue, 11 Apr 2017 14:20:03 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BDAp0Q014808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 14:10:52 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cxvZL-0007g2-Dc; Tue, 11 Apr 2017 14:10:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 14:10:50 +0100
Message-Id: <1491916250-29472-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] data_smart: Ensure _remove operations on newly set variables are cleared
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
X-List-Received-Date: Tue, 11 Apr 2017 13:20:05 -0000

We clear append/prepend on newly set variables, we should also clear
remove operations. If we don't do this, there is no way we can actually
delete a remove operation. Bitbake internally uses parsing=True to avoid
these side effects when making its own internal calls.

Also add a testcase to bitbake-selftest to ensure we remain consistent going
forward from here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 lib/bb/data_smart.py | 2 ++
 lib/bb/tests/data.py | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/lib/bb/data_smart.py b/lib/bb/data_smart.py
index d6dd698..7dc1c68 100644
--- a/lib/bb/data_smart.py
+++ b/lib/bb/data_smart.py
@@ -546,6 +546,8 @@ class DataSmart(MutableMapping):
                 del self.dict[var]["_append"]
             if "_prepend" in self.dict[var]:
                 del self.dict[var]["_prepend"]
+            if "_remove" in self.dict[var]:
+                del self.dict[var]["_remove"]
             if var in self.overridedata:
                 active = []
                 self.need_overrides()
diff --git a/lib/bb/tests/data.py b/lib/bb/tests/data.py
index fe947f5..a4a9dd3 100644
--- a/lib/bb/tests/data.py
+++ b/lib/bb/tests/data.py
@@ -283,6 +283,12 @@ class TestConcatOverride(unittest.TestCase):
         self.d.setVar("TEST_remove", "val")
         self.assertEqual(self.d.getVar("TEST"), "bar")
 
+    def test_remove_cleared(self):
+        self.d.setVar("TEST", "${VAL} ${BAR}")
+        self.d.setVar("TEST_remove", "val")
+        self.d.setVar("TEST", "${VAL} ${BAR}")
+        self.assertEqual(self.d.getVar("TEST"), "val bar")
+
     # Ensure the value is unchanged if we have an inactive remove override
     # (including that whitespace is preserved)
     def test_remove_inactive_override(self):
-- 
2.7.4


