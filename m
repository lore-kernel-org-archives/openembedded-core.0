Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC07CCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:51:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3030.1760601054920438083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GadKvX5a;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 975721A1415;
	Thu, 16 Oct 2025 07:50:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E9836062C;
	Thu, 16 Oct 2025 07:50:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEAD3102F22ED;
	Thu, 16 Oct 2025 09:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760601053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PlOLsFAMQsMIxF3K9fCXFMMoLgYaYpg1iGdCVCDq+IM=;
	b=GadKvX5aB9sRgp5FhwX4NlwfW476LR4/fbg1RZiX5+U2TuRjWmbILYWn6iCK+v6zjn0JA9
	+7R6H3Hl2/RgHR39tytoe01wN4thyZCNIrUalLDEYcTDMkOb/RpQb0h4GM7QVJiNyp2SNb
	oP/GAMmyl+1od81wwHk5sQL/twrHIEunShau+sWeJf3It3l55+eRuhVO2Wu3WFC9meKLvO
	7D76PcKtlSAUNn0iUt1FUDG1WKjxefRwx7vBMaBtp+PE6a3pZUCKhkpJ5I6FYTp3JrT3mj
	O6hEIUWhtdApnZOn8YMYYhCIQYjUk/8SHO8HuXkRZRWto0p7U3epUs7zvQ5BwQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 16 Oct 2025 09:50:26 +0200
Subject: [PATCH v2 2/2] oeqa: runtime: weston: Remove tear down method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-mathieu-test-clean-setup-v2-2-c4295b9334b8@bootlin.com>
References: <20251016-mathieu-test-clean-setup-v2-0-c4295b9334b8@bootlin.com>
In-Reply-To: <20251016-mathieu-test-clean-setup-v2-0-c4295b9334b8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Joshua Watt <jpewhacker@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760601050; l=2315;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=M2//hxL+C2LhzWGsGVqNgKaMuKzHrnUfTMaPmc7qjBI=;
 b=sKdmuooOJAcl3OxLPqsIrDcoinGbLBMCRCKWQGwVIYdo349Yj82YPfapKcoCUEEZZ1Fr0AKgq
 IzQyXtuY0sCBd0rO0Fex8gEXYlq4QowCT4rdIKNZ46uWvf07BL4kO0q
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224953

Tear down method is executed even when the tests are disabled. This lead
to SSH being used to run commands on the target, and as it might fail
when no SSH server is present, we had to use ignore_ssh_fails=True here.

Instead, remove log file just before it is created: it will remain on
the target after the test is run, but this should be acceptable.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index e2cecffe8353..b0dccee73bf4 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -14,10 +14,6 @@ import time
 class WestonTest(OERuntimeTestCase):
     weston_log_file = '/tmp/weston-2.log'
 
-    @classmethod
-    def tearDownClass(cls):
-        cls.tc.target.run('rm %s' % cls.weston_log_file, ignore_ssh_fails=True)
-
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['weston'])
     def test_weston_running(self):
@@ -67,6 +63,10 @@ class WestonTest(OERuntimeTestCase):
         existing_wl_processes = self.get_processes_of('weston-desktop-shell', 'existing')
         existing_weston_processes = self.get_processes_of('weston', 'existing')
 
+        # weston log file should be removed, except if test_weston_supports_xwayland() test has to be run.
+        if 'x11' not in self.td.get('DISTRO_FEATURES'):
+            self.addCleanup(self.target.run, 'rm -f %s' % self.weston_log_file)
+
         weston_thread = threading.Thread(target=self.run_weston_init)
         weston_thread.start()
         new_wl_processes, try_cnt = self.get_new_wayland_processes(existing_wl_processes)
@@ -83,6 +83,7 @@ class WestonTest(OERuntimeTestCase):
     @skipIfNotFeature('x11', 'Test requires x11 to be in DISTRO_FEATURES')
     @OEHasPackage(['weston'])
     def test_weston_supports_xwayland(self):
+        self.addCleanup(self.target.run, 'rm -f %s' % self.weston_log_file)
         cmd ='cat %s | grep "xserver listening on display"' % self.weston_log_file
         status, output = self.target.run(cmd)
         msg = ('xwayland does not appear to be running')

-- 
2.47.3


