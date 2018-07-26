Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 57A3178C16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:30:57 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c14-v6so1794529wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=tSuz+uWBBLD8+R9/ZsD2l42Z1zQfHCfd7N0pAJi5s1Q=;
	b=BIWMX9cd5YwRbt841nOuJtmOI6S22jkqmp+zuxc4l7vwFqjSM7H7FUdxcYd4Eu9eDe
	D6tRWBiX5jU70BgiAs7JTQILtVZeRHmckfZEEDSKDJ4ANZR2zOkH/Pze+fayZf/F6p/h
	AuA5CzkCHbabuVMKkKCbI8mK9fCY1WwPWfGIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tSuz+uWBBLD8+R9/ZsD2l42Z1zQfHCfd7N0pAJi5s1Q=;
	b=W73Xxy52eOvPfJ1fktLtAUDirAJKm1e/kmzpA8l54XcARHgSRzkg0aAAbybOdXf9Tg
	BUIeQvjZB2r4/2ibBCgW3VNFoj48VxomrI/rX0cS93eDmtcypkQJibzL2NL6YeR/o8lx
	80Q7/nQycFtMBD3fzl6dZcOyF+WTiJ3IMiBHJ+0KC/PB8abZ7Yi0Oodey/EYJ9Gliink
	2GhvK1DhIqyp+71Y2o9t/3gbyJXc5iIzQDTdv6cn4vR5xFKZeQHY4wN1VN5UnuDA58zQ
	yq5H8U2V8xGWCV1qPL6xtR636TDe+GFxjaLEzO/NxVwxyUVVf2bIOCQnE90SJVJ8/fia
	LCGw==
X-Gm-Message-State: AOUpUlH+Zh3Q1X4debYzMWxeqhZo9/tI6likZ4Pq/5y4UE2skFfwHhEe
	v5rEdIEy1xphT2ERbR17OtfcIq5dSoU3pA==
X-Google-Smtp-Source: AAOMgpcYYLTQYwJnWVIzWDaXoJC2WYbX033hTeHT6asxjSsxEiAtxyjmIS/hDiVNjgUxKHPihYoQgg==
X-Received: by 2002:a1c:c3c4:: with SMTP id
	t187-v6mr1501557wmf.123.1532608257710; 
	Thu, 26 Jul 2018 05:30:57 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l14-v6sm1946074wrw.65.2018.07.26.05.30.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 05:30:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 13:30:55 +0100
Message-Id: <20180726123055.30518-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] selftest/wic: Fix/cleanup class setup code
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
X-List-Received-Date: Thu, 26 Jul 2018 12:30:57 -0000

The code was using Wic instead of WicTestCase for image_is_ready and
native_sysroot which was confusing some tests. Fix image_is_ready.

For native_sysroot, convert the only user to just run the call itself
as there is no point in executing this for all the other tests which
don't use the value.

Whilst here, move _get_image_env_path to the base class alongside
its parent variabe and fix it to use WicTestCase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 31 ++++++++++++++---------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index cfee9d1e71d..36ee5e5a146 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -65,27 +65,24 @@ class WicTestCase(OESelftestTestCase):
     """Wic test class."""
 
     image_is_ready = False
-    native_sysroot = None
     wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = self.builddir + "/wic-tmp/"
         super(WicTestCase, self).setUpLocal()
-        if not self.native_sysroot:
-            Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
-        if not Wic.image_is_ready:
+        if not WicTestCase.image_is_ready:
             if get_bb_var('USE_NLS') == 'yes':
                 bitbake('wic-tools')
             else:
                 self.skipTest('wic-tools cannot be built due its (intltool|gettext)-native dependency and NLS disable')
 
             bitbake('core-image-minimal')
-            Wic.image_is_ready = True
+            WicTestCase.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
 
@@ -94,6 +91,16 @@ class WicTestCase(OESelftestTestCase):
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
 
+    def _get_image_env_path(self, image):
+        """Generate and obtain the path to <image>.env"""
+        if image not in WicTestCase.wicenv_cache:
+            self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
+            bb_vars = get_bb_vars(['STAGING_DIR', 'MACHINE'], image)
+            stdir = bb_vars['STAGING_DIR']
+            machine = bb_vars['MACHINE']
+            WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
+        return WicTestCase.wicenv_cache[image]
+
 class Wic(WicTestCase):
 
     @OETestID(1552)
@@ -534,16 +541,6 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
-    def _get_image_env_path(self, image):
-        """Generate and obtain the path to <image>.env"""
-        if image not in self.wicenv_cache:
-            self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
-            bb_vars = get_bb_vars(['STAGING_DIR', 'MACHINE'], image)
-            stdir = bb_vars['STAGING_DIR']
-            machine = bb_vars['MACHINE']
-            self.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
-        return self.wicenv_cache[image]
-
     @OETestID(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
@@ -683,9 +680,11 @@ class Wic2(WicTestCase):
 
         wicimg = wicout[0]
 
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
         # verify partition size with wic
         res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
-                     native_sysroot=self.native_sysroot)
+                     native_sysroot=native_sysroot)
 
         # parse parted output which looks like this:
         # BYT;\n
-- 
2.17.1


