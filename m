Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72EFCCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:07:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.40887.1760353631696821324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CYQFMfDL;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 721EBC093AD
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:06:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63C5A606C6
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6E65102F2263;
	Mon, 13 Oct 2025 13:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760353630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DTF/nXWLZ08ucMtTr8kM0yndWzXZc3hF5jygtr8reD0=;
	b=CYQFMfDLsa4Fl0MfKzMuvQCUbEFt94FX5H+ZCHOjAO9NMaiXWL70V8d3o8WC34lxaZRjKa
	57MimX22mE/uLNmr7ZT7LSUEdz0bR0kodg5SST1ArjfmbauPUWzzVyjSwT4/LJ3KChxX1K
	huRsX90gf7EdEvsAARNUYb+fsgavBQJmQY289TxZG02ei/nvCATh1feBIMkOPOFIeX21G7
	tIo4gHqVNWHwqCb7MeTX/Ry52TxytyASWfG+4s9zA/jgXVlqjtGpjRCMWRmmJZqj8jJltD
	wWpjB0FNFitwUvxx+6Xx6PDRojcE6uFNGGlT6DRxel4xGFbjf+uTjYx7+9GZgQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 13 Oct 2025 13:06:45 +0200
Subject: [PATCH 3/3] oeqa: runtime: weston: Remove tear down method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-mathieu-test-clean-setup-v1-3-6cea9936d79b@bootlin.com>
References: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
In-Reply-To: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760353627; l=1745;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=4GZMa1sgsaI0iXccFd0RoD58TZn0Ao5lgY99Y2ceRZU=;
 b=Y9RMYAPK3hZhnIDOipguhseZO3BfZDPth+al+AdgvanrI1bmo4ssyr4xRsofs+w6TYINGtuGu
 gLKQDay1CPgB+cfTJIfY5mTFAw2em3KwcnNfzo8k1L3YVG4DXUf6bLr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224775

Tear down method is executed even when the tests are disabled. This lead
to SSH being used to run commands on the target, and as it might fail
when no SSH server is present, we had to use ignore_ssh_fails=True here.

Instead, remove log file just before it is created: it will remain on
the target after the test is run, but this should be acceptable.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index e2cecffe8353..443b85efe8cd 100644
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
@@ -36,6 +32,7 @@ class WestonTest(OERuntimeTestCase):
         return 'export XDG_RUNTIME_DIR=/run/user/`id -u weston`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
 
     def run_weston_init(self):
+        self.target.run('rm -f %s' % self.weston_log_file)
         if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
             self.target.run('systemd-run --collect --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6 -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-0 /usr/bin/weston --socket=wayland-1 --log=%s' % self.weston_log_file)
         else:

-- 
2.47.3


