Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC81CCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:38:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.25227.1759858701247149930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1VBNbwGa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E4A444E40F63
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCB74606C8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3B33102F2179;
	Tue,  7 Oct 2025 19:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759858699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zN36EiSZRvbN7+AT+HvXaFMfrqITKJTXCktJjj3AdR4=;
	b=1VBNbwGaW1YuVuKGg/T9Fds+WvLpZRuamb8xeM/ERk89sQ7jnVnF+sO6dSCGeBU4LhO87d
	TbAzGVSZI4fgNir/bdKL1+aloKuNOi6MHOkSxeTCAjiQajhrBx99ggwFs6rtG18ny5tMMe
	eFotOQiLvCmVSXnK669CI6P9VBsBD6O28eBjpXt1oToRKhx5/GRO6+iLWRE3jhIL3XZdWU
	tOcQtaRmbcVhndK48nsIac2/iFn8C8PmV+F3umrYOY6tPjEriGv2cKD2v9Vy5eLw5ACben
	PgMC6HkwFrPs2S/OFdIexNcKVnjlPFWwCQ1nnR0S3mVeHcgdGiXOiaOOo8k37Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 07 Oct 2025 19:38:07 +0200
Subject: [PATCH 2/4] oeqa: runtime: Ignore SSH errors during setup and tear
 down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-mathieu-ssh-fails-v1-2-a6affee3571b@bootlin.com>
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
In-Reply-To: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759858696; l=2596;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=k3qizJtLhjqMJJMz+nCQJyMISFN2eS0RDyyn8ti73mU=;
 b=mKmOarjSgJ69IKaO/NB8pe7wMLRpA69nJBhdFGv7P27NThF7Pcyq7LgNzFW9oTT52+PnmI67X
 s77PRlOUmYGDxq0WY4RUFyfmYkWS7PvMoFi9pUGC07c+F29IxfSAs1q
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224546

Tests using SSH will fail when no SSH server is present on the target.
These tests are disabled in these cases, by being marked with a
dependency on ssh.SSHTest.test_ssh, which in turns has a dependency on
having either dropbear or openssh-sshd in the image.

But setUpClass() and tearDownClass() functions are always executed, even
on tests failing the dependency checks, leading to unexpected failed
tests.

Ignoring SSH errors in setup and tear down allows to avoid these test
errors.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 7 ++++---
 meta/lib/oeqa/runtime/cases/weston.py    | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 6ad980cb6adc0cc1660989228442633db3a9827d..7cb43d98c56d73865838ed8418a6a88732840a28 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -15,12 +15,13 @@ class LogrotateTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        cls.tc.target.run('cp /etc/logrotate.d/wtmp $HOME/wtmp.oeqabak')
+        cls.tc.target.run('cp /etc/logrotate.d/wtmp $HOME/wtmp.oeqabak',
+                          ignore_ssh_fails=True)
 
     @classmethod
     def tearDownClass(cls):
-        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log//logrotate_dir')
-        cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile')
+        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log//logrotate_dir', ignore_ssh_fails=True)
+        cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile', ignore_ssh_fails=True)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['logrotate'])
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index ee4d336482e5e7b4e61625599d38ab2fbf09ace0..e2cecffe83536c9bfeaae62892bad832f75cb541 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -16,7 +16,7 @@ class WestonTest(OERuntimeTestCase):
 
     @classmethod
     def tearDownClass(cls):
-        cls.tc.target.run('rm %s' % cls.weston_log_file)
+        cls.tc.target.run('rm %s' % cls.weston_log_file, ignore_ssh_fails=True)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['weston'])

-- 
2.47.3


