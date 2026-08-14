Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223A2C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 16:27:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16754.1786724824953950588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=p2i3t5sX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 514DE1A1644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:27:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 257276046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D4CE11C4EED5;
	Fri, 14 Aug 2026 18:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786724818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DrK3ac2VDEAIzW8bouD7ulQYoEbKWAxRBAQw4XxRzrY=;
	b=p2i3t5sXP9S1tvwLipFNyAqP1Rc/Llva15UJOymKGl77US43xxPin9JVB7145t51QU2BCT
	qsRNCroLRlf61nv0S3w2ow2v9U1CQABasaG27rlJ6h72a5pC1Pyx7YC1ckwKe0oSrLWdZV
	TSpOEISyX6a6UjOd6e8SeLZ85KM7dq/3kHrkTwkCzDjPxYxIDjLQod0rOuWs+9oohCs/qY
	zE0wtACrn96woWb29TlP/NLF7myWMguEfoEzAL9QT6odS2O8uSzuC7HSmxraFIEm1d58hy
	WqdizInIT2p8K/hxiBXsdF1NbM65DI0GiivZJ/PC8lodqszqiPI1tAyGW7Ew5g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 18:26:37 +0200
Subject: [PATCH 4/4] oe-selftest: devtool: Add test for add/finish workflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-devtool-v1-4-985e81a17bb3@bootlin.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
In-Reply-To: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786724798; l=3950;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=7ZyUfoKwljGF40yGKBzlodOipzmrSCVSl9rUt9qn9xs=;
 b=9zIXu8TrKCms7qFA7PAOGRVvnkdJJEf5xyMSt9Ob6W8WS+3Qvk3UOXAJM5YBiXPcyAs5d6Qql
 D7Sc8j22FFnAo7Vz61Hlbri++jILEZO3RMAs6mqx737FC+LTEVhOeRR
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243463

Add test for devtool add/build/finish workflow, inclusing a test for
finish --force.
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


