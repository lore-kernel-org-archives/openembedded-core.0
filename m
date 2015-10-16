Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 438537715A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:45:14 +0000 (UTC)
Received: by wijq8 with SMTP id q8so17109458wij.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uPcwZpapqHHidRBMoWOYcsQFdckJrv8wGOV9JyvScDA=;
	b=kafPwsaXwuQ0qmwqc+Aw3upFGaR6GVIxcfnwMgFmWYJoQQIFN7DbUuG+Lq3kMLsCCu
	gixAcA9SNgryoPnE5pb3a8zqXpi/rr248IunXR20W5sFBSyCmXPvg36SjOxwtQy7wDww
	mFvDxLiF9mdYZk6H3zTKOrq+b7ibpDu6bGs5cbfPmHXABxprpqJ6jdETUKdZWhOEq/Hw
	gzF4pzFmLX37S+qFjpc1GZPQsHt1DNXhffuSLT3LxuCsTDcVo9A0Pnifjh1DUfv2/ue3
	s7O3aVypPfFsTEl6gmTwLFt9+9yl96KS0JaGKvDGZFqdiOQyBZPn96wRKJC68ToaCk13
	iFJQ==
X-Gm-Message-State: ALoCoQlpe+Vie/DlHxyM/gTZzhmrIAI6DjEeGiTuzWynl88PXX9bfORLfiFagJvXM4xW5atb7A/y
X-Received: by 10.180.88.198 with SMTP id bi6mr5740413wib.75.1445010314472;
	Fri, 16 Oct 2015 08:45:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	it4sm23211577wjb.0.2015.10.16.08.45.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 08:45:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:37:39 +0100
Message-Id: <1445009861-5993-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] oeqa/selftest/wic: fix cleaning
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
X-List-Received-Date: Fri, 16 Oct 2015 15:45:16 -0000

In some situations the native tools built in setUpClass() are wiped from the
sysroot by the time the tests are executed, likely due to the cleanup performed
in the base setUp() method.

Avoid this by doing all of the preparatory building in setUpLocal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f4c22f7..a0464ad 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -38,22 +38,20 @@ class Wic(oeSelfTest):
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
+        # Do this here instead of in setUpClass as the base setUp does some
+        # clean up which can result in the native tools built earlier in
+        # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            # build core-image-minimal with required features
+            features = 'IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n'
+            self.append_config(features)
+
+            bitbake('syslinux syslinux-native parted-native gptfdisk-native '
+                    'dosfstools-native mtools-native')
             bitbake('core-image-minimal')
-            # set this class variable to avoid buiding image many times
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
-- 
2.1.4


