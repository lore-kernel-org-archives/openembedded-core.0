Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A80187714A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 108D460029B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:22:02 +0100
Message-Id: <2285ff17a391fa22f2095da701bc6f2c9615ae7b.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 41/52] oeqa/selftest/wic: fix cleaning
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:28 -0000

From: Ross Burton <ross.burton@intel.com>

In some situations the native tools built in setUpClass() are wiped from the
sysroot by the time the tests are executed, likely due to the cleanup performed
in the base setUp() method.

Avoid this by doing all of the preparatory building in setUpLocal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f4c22f7..ca9a598 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -38,22 +38,19 @@ class Wic(oeSelfTest):
     """Wic test class."""
 
     resultdir = "/var/tmp/wic/build/"
-
-    @classmethod
-    def setUpClass(cls):
-        """Build wic runtime dependencies."""
-        bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                'dosfstools-native mtools-native')
-        Wic.image_is_ready = False
+    image_is_ready = False
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        features = 'IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n'
-        self.append_config(features)
+        self.write_config('IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n')
+
+        # Do this here instead of in setUpClass as the base setUp does some
+        # clean up which can result in the native tools built earlier in
+        # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            # build core-image-minimal with required features
+            bitbake('syslinux syslinux-native parted-native gptfdisk-native '
+                    'dosfstools-native mtools-native')
             bitbake('core-image-minimal')
-            # set this class variable to avoid buiding image many times
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
-- 
2.1.4


