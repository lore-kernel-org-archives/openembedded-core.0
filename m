Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3C40C76D84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 23:49:52 +0000 (UTC)
Received: by wiae7 with SMTP id e7so10565773wia.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jjqUjOeBFsA85kOkq7pJ2in6U3EeDLP9OdNBkMlASdo=;
	b=LUYxRpbc2t9DuPJ0no8vNgfZI0ZtigJVmLnM1foj67GgxLx+I40n7KPKdFSjefUIsj
	KfXGuqio5nPbg2r1jO3Cb3R804EG/V90tJNKxLu7GeZPa2Wv9GRafwh5kxKs4/WN44c3
	hBdEEXPCt0I6Uf9517i4IJcLjED/vj8+xZk8eHc4iMilgXQwrJ1Enj17/yxX4skMxZp1
	muW6gbV9A766lUOEDYo+6/LTnEROBPAP6gQF6iZZdFFsA1zfDSJWvBLwgT4HaqkdZNr7
	vLHS2c3QWC+v2bUMyCzRkwO2cpQFaNVFAN4lV0+OQ6o+1zuRZnFZ/gx7dWiGFLYlYVrL
	UYdQ==
X-Gm-Message-State: ALoCoQmUe2Vd30Bh1yrRsoH6B0G0jJNte6/1A1BpNrFXUN6ef/iEMu1PEsQT8Uxm/QTRSXqERd7d
X-Received: by 10.194.95.41 with SMTP id dh9mr13863996wjb.55.1440805792427;
	Fri, 28 Aug 2015 16:49:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 4sm10185674wjt.46.2015.08.28.16.49.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Aug 2015 16:49:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Aug 2015 00:43:16 +0100
Message-Id: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] oeqa/runtime/multilib: add test for libc
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
X-List-Received-Date: Fri, 28 Aug 2015 23:49:55 -0000

Add a basic test to verify that /lib/libc.so.6 and /lib32/libc.so.6 have the
right ELF class.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/multilib.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 1c1729b..e1bcc42 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -20,8 +20,25 @@ class MultilibTest(oeRuntimeTest):
         else:
             self.fail("Cannot parse readelf output\n" + s)
 
-    @testcase('279')
     @skipUnlessPassed('test_ssh')
+    def test_check_multilib_libc(self):
+        """
+        Check that a multilib image has both 32-bit and 64-bit libc in.
+        """
+
+        (status, output) = self.target.run("readelf -h /lib/libc.so.6")
+        self.assertEqual(status, 0, "Failed to readelf /lib/libc.so.6")
+        class32 = self.parse(output)
+
+        (status, output) = self.target.run("readelf -h /lib64/libc.so.6")
+        self.assertEqual(status, 0, "Failed to readelf /lib64/libc.so.6")
+        class64 = self.parse(output)
+
+        self.assertEqual(class32, "ELF32", msg="/lib/libc.so.6 isn't ELF32 (is %s)" % class32)
+        self.assertEqual(class64, "ELF64", msg="/lib64/libc.so.6 isn't ELF64 (is %s)" % class64)
+
+    @testcase('279')
+    @skipUnlessPassed('test_check_multilib_libc')
     def test_file_connman(self):
         self.assertTrue(oeRuntimeTest.hasPackage('lib32-connman-gnome'), msg="This test assumes lib32-connman-gnome is installed")
 
-- 
2.1.4


