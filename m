Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313B2C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:41:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.567.1788284512744649830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qQuk6xne;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C21D1A193B
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4CB06053C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239A811C792B9;
	Tue,  1 Sep 2026 19:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788284510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kBrepcuKJmdhY237oE+x/Cox9y6bTbDRatLAjmlBukg=;
	b=qQuk6xneJQcujcM569uyfPijNQaZaSkXVnVHJl3WxOsR9dcj3hqpBFHbFhK0cynwd8hRSj
	vTX8YQuaPaEe0NAdWoAbp5PblRgmCx59ST6UEfhY+TA9gmMxtibfY4TO3fgFwQSdwxaoEC
	Ye/LIIDOa4nIxIjZLDpm7uPJZAiyc9TA/MPRoMnghsjVRHbS0Q4GDcd+ATkVIW1AQ5s/fx
	rztHvMa/oqpJeUsk4aPqIrgEXMOxIRqCuF/xvN82biNGsEAfugHWW7/zaPg3Zzy5gqcfY4
	d4WikLK6iEn/KmE1MdjM36xgdoZWFvHXYH2ijGlBml6Dt17KTt/YC4o109xlGA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 01 Sep 2026 19:41:45 +0200
Subject: [PATCH 2/2] oeqa/selftest/reproducible: Use a fake time during
 build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mathieu-reproducible-faketime-v1-2-eac182548422@bootlin.com>
References: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com>
In-Reply-To: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788284507; l=4009;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=H0hdbqp6LLmIXrOFb4+cn3PznxLSTEVhRdW6+5NvEqs=;
 b=w/Tzx8K3LK2O9Ikj5ILVPiqRjmzxomoAOIbD78/5cJwE6unUkSxbPtBmMfl0Lx6kLgbHZdOAy
 5cXNZ8z6tuwBlbU2+lx6Qx/VHoKUKNR7T70UPUiumMYa+qHjLqsibSz
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244843

Use a fake time during the second build, ensuring the build time is way
different from the first build.

Fixes [YOCTO #13509]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7adeaacd4f53..1a71b9832e34 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -229,7 +229,7 @@ class ReproducibleTests(OESelftestTestCase):
         bb.utils.mkdirhier(os.path.dirname(dest))
         shutil.copyfile(source, dest)
 
-    def do_test_build(self, name, use_sstate):
+    def do_test_build(self, name, use_sstate, use_faketime, libfaketime_sysroot):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
         tmpdir = os.path.join(self.topdir, name, 'tmp')
@@ -295,7 +295,17 @@ class ReproducibleTests(OESelftestTestCase):
         d = get_bb_vars(capture_vars)
         try:
             # targets used to be called images
-            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)))
+            targets = ' '.join(getattr(self, 'images', self.targets))
+            if use_faketime:
+                # 397 days: one year and 31/32 days: this will always be a
+                # different year, month and day of week.
+                # 2 hours, 2 minutes and 2 seconds: different values, even if we
+                # have some DST or leap second involved.
+                timespecs = "+397days +2hours +2minutes +2seconds"
+                runCmd(f"faketime '{timespecs}' bitbake --continue {targets}",
+                       native_sysroot=libfaketime_sysroot)
+            else:
+                bitbake(f"--continue {targets}")
         except AssertionError as e:
             bitbake_failure_count += 1
             self.logger.error("Bitbake failed! but keep going... Log:")
@@ -320,9 +330,10 @@ class ReproducibleTests(OESelftestTestCase):
 
         # Build native utilities
         self.write_config('')
-        bitbake("diffoscope-native diffutils-native -c addto_recipe_sysroot")
+        bitbake("diffoscope-native diffutils-native libfaketime-native -c addto_recipe_sysroot")
         diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
         diffoscope_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffoscope-native")
+        libfaketime_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "libfaketime-native")
 
         if self.save_results:
             os.makedirs(self.save_results, exist_ok=True)
@@ -338,10 +349,13 @@ class ReproducibleTests(OESelftestTestCase):
         fails = []
         vars_list = [None, None]
 
-        for i, (name, use_sstate) in enumerate(
-                                 (('reproducibleA', self.build_from_sstate),
-                                 ('reproducibleB-extended', False))):
-            (variables, bitbake_failure_count) = self.do_test_build(name, use_sstate)
+        for i, (name, use_sstate, use_faketime) in enumerate(
+                                 (('reproducibleA', self.build_from_sstate, False),
+                                 ('reproducibleB-extended', False, True))):
+            (variables, bitbake_failure_count) = self.do_test_build(name,
+                                                                    use_sstate,
+                                                                    use_faketime,
+                                                                    libfaketime_sysroot)
             if bitbake_failure_count > 0:
                 self.logger.error('%s build failed. Trying to compute built packages differences but the test will fail.' % name)
                 fails.append("Bitbake %s failure" % name)

-- 
2.47.3


