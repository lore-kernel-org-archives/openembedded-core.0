Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9546C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:10:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2067.1788372598225009216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Mapqn+19;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85B8C4E414D2
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A2006053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB5C211C795A7;
	Wed,  2 Sep 2026 20:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788372596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2TpUnUgQxi+auKMeRFjBlMMHu7ob2NDptH6NVykENKY=;
	b=Mapqn+19RSxktMyi8Ff1b5rTKlFRxLEVKIqiG5svn/U8mO1q+P8pRaiKMJRTUrbnIDgaGP
	PMJRTjrBQGnZZe1BJTzG5ecjjI0OuPA7b+nmtKXdQSVviGBezY51YILnqcr44Ntmu0ZijW
	/Imf/KNzSZkdd1oyot9r/d6DLtwpzICm2KBB1C0tIxP8o84To0WZcKfk+pgRAXR5wIkAfi
	DTeb0uAWUyPlhwgG4HP7JlFILCaJSyx5K6wk7IvYsZZP07V+4KzjFbKaY/DUaPA2MaY7vm
	8YawRAH2J1BeHu6YdPCoeiLDagPJPVCzkSBuSbuDV/YU+ds//ptOkAR4DLRuEg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 20:09:45 +0200
Subject: [PATCH v2 4/4] oeqa/selftest/reproducible: Use a fake time during
 build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-reproducible-faketime-v2-4-9496dff5bde3@bootlin.com>
References: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
In-Reply-To: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788372584; l=4009;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IRLlHcc0Hu8o3C5tnduwRSmvxs+857QemD+PSwHbLbU=;
 b=o68C3GRnE/KOmBpoxOSQ9L2URizKWKbFCzaxvYkJAWy5wolYaPfXApk0PE+YSj2DgVK2dYay1
 uk5YG1AFXCJD+5sVE8nEi06IN4pCDwPrmuIQKaxOQbkWragg28V1hbE
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244989

Use a fake time during the second build, ensuring the build time is fay
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


