Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ACDC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8198.1786878751971172520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vNh2hlz9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 582381A1699
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E44A60352
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74DA911C4F8E9;
	Sun, 16 Aug 2026 13:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=11n2M6lvqNhIPKhw3goOivtA+FOHlPHgS3ZLSzieXmw=;
	b=vNh2hlz9al0SmuZLdqquQVYUYhO8BaEj8dPNxuSF2fLWhiZdXzXTWlxoMSLJ3Gs7VtaxgY
	FYZIFtuEJL+9CSycTF8E9cU6kjpuQxXDEE07egdAoOM/EkvGF7XtfPgDPBHGZk6f6u6FJN
	7Y9cveI3zDwrf0PLSV80YLeJ4l9GoksnAVfwNbvaJX8UAuhVP01hn23cJzCuzjrc8Ij39Y
	8VumnmQYySXoXOvAREUDBggwmCefVfnZ/x2EntuzTiMa17BhWH2ZCj7i6xCyOdxY0E9uZM
	q6ht9N0P3wtL9VFf3au7WIKvG/fsx85r3wc+59AmHexTCfYAPEv2gFoKoKKqqw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 16 Aug 2026 13:12:04 +0200
Subject: [PATCH v2 4/4] oe-selftest: devtool: Add test for add/finish
 workflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-mathieu-devtool-v2-4-13c943abf48e@bootlin.com>
References: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
In-Reply-To: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786878726; l=4026;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=dtGdvcypNB2YkFEn1oNCTykKc04Tk8Eg7PV2U4D0gng=;
 b=lqR6QFNQwZvWOmjxN5eEKWVJrSdH2DfOc8wpE7BJUL01s/wyyD+gLokUoel6VdTcGyW7LST9U
 EcM6IYHRHyIBQniCjuZKl+m6Oeu4Q6IwkZ8xX/Xb3kWM3lWAyCmNeG5
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243520

Add test for devtool add/build/finish workflow, inclusing a test for
finish --force.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d84a18e8b69b..d549be9f7965 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -713,6 +713,64 @@ class DevtoolAddTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
 
+    def test_devtool_add_build_finish(self):
+        url = 'https://ftp.gnu.org/gnu/hello/hello-2.12.3.tar.gz'
+        pn = 'hello'
+        recipe = 'hello_2.12.3.bb'
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s' % (url, ))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                          'Workspace directory not created')
+        # Test devtool build
+        result = runCmd('devtool build %s' % pn)
+        bb_vars = get_bb_vars(['D', 'bindir'], pn)
+        installdir = bb_vars['D']
+        self.assertTrue(installdir, 'Could not query installdir variable')
+        # devtool finish
+        result = runCmd('devtool finish %s meta-selftest' % pn,
+                        ignore_status=True)
+        self.assertNotEqual(result.status, 0,
+                            'devtool finish should have failed on a dirty directory. devtool output: %s' %
+                            (result.output))
+        # clean directory
+        sourcedir = os.path.join(self.workspacedir, 'sources', 'hello')
+        runCmd('git reset --hard; git clean -dxf', cwd=sourcedir)
+        # devtool finish (again)
+        self.assertExists(os.path.join(self.workspacedir, 'recipes', pn),
+                          'Recipe directory should exist before finish')
+        result = runCmd('devtool finish %s meta-selftest' % pn)
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', pn),
+                             'Recipe directory should not exist after finish')
+        # Check recipe got created as expected
+        self.assertExists(os.path.join(get_test_layer(), f'recipes-{pn}', pn, recipe),
+                          'Recipe should exist in the layer after finish')
+
+    def test_devtool_add_build_finish_force(self):
+        url = 'https://ftp.gnu.org/gnu/hello/hello-2.12.3.tar.gz'
+        pn = 'hello'
+        recipe = 'hello_2.12.3.bb'
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s' % (url, ))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                          'Workspace directory not created')
+        # Test devtool build
+        result = runCmd('devtool build %s' % pn)
+        bb_vars = get_bb_vars(['D', 'bindir'], pn)
+        installdir = bb_vars['D']
+        self.assertTrue(installdir, 'Could not query installdir variable')
+        # devtool finish
+        result = runCmd('devtool finish %s meta-selftest --force' % pn)
+        # Check recipe got created as expected
+        self.assertExists(os.path.join(get_test_layer(), f'recipes-{pn}', pn, recipe),
+                          'Recipe should exist in the layer after finish')
+
+
 class DevtoolModifyTests(DevtoolBase):
 
     def test_devtool_modify(self):

-- 
2.47.3


