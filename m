Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE5ECCD18E
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:07:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.40886.1760353631490754412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sEt/vaeM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80167C093AB
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69911606D7
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A16FE102F225C;
	Mon, 13 Oct 2025 13:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760353628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vIgp/uc7qNSs3YbJWCN4Kx/GitTLsSBZ2FnBNaV29jY=;
	b=sEt/vaeMvYRCfncf1nO2HMaKlx+7cGbcwj9XLrFzar9OzQgTdPZmBPf67pEK/63z2i+a1I
	ikTvfmauVorjQ4WcOxUsPIviB2BLTrwmCxG0NRTIaaWqUKm0Ko7SHU6vwusRQVq1dytJPo
	Hbja1ugT+8RvRFK6YToSD6S75PgXIm3np2oaUB1xSWide88bWQiy3aC8uNydKjiQk7mQ/C
	r6+XS3u7w2v5Nk71ZMDUoFZ7i68SozwJ92ykhGl/BH+ast6aVd59ZUHYIp3VJQO4l2Jwuv
	oOlwKOYeHcNxvnMtOovmCGy+kMMdRl3kmgtUhm1jpSItk/uqwG472i2yHGWktw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 13 Oct 2025 13:06:43 +0200
Subject: [PATCH 1/3] oeqa: runtime: logrotate: Fix typos and add comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-mathieu-test-clean-setup-v1-1-6cea9936d79b@bootlin.com>
References: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
In-Reply-To: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760353627; l=5235;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=aC6Qy20PkWWEtWZ8xw4ObjxOp6AhLQwTbFBcZyd0QLs=;
 b=dpOHxfHKvgc06/NoYZF9XXUq4xWR7BqmA+fZT8XilLZre9xoWQ+Hmg6JKJ2LysIh6mDjRbUUj
 0PkqJjMkuNvDTZOzGWyMDFqSEnzscUQTktq9J6zmePS1Bm5rh9x9ogB
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224774

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 7cb43d98c56d..0d4b9ac60baa 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -20,55 +20,56 @@ class LogrotateTest(OERuntimeTestCase):
 
     @classmethod
     def tearDownClass(cls):
-        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log//logrotate_dir', ignore_ssh_fails=True)
+        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log/logrotate_dir', ignore_ssh_fails=True)
         cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile', ignore_ssh_fails=True)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['logrotate'])
     def test_logrotate_wtmp(self):
-
         # /var/log/wtmp may not always exist initially, so use touch to ensure it is present
         status, output = self.target.run('touch /var/log/wtmp')
         msg = ('Could not create/update /var/log/wtmp with touch')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('mkdir /var/log//logrotate_dir')
+        # Create a folder to store rotated file and add the corresponding
+        # configuration option
+        status, output = self.target.run('mkdir /var/log/logrotate_dir')
         msg = ('Could not create logrotate_dir. Output: %s' % output)
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
+        status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
         msg = ('Could not write to /tmp/logrotate-test.conf')
         self.assertEqual(status, 0, msg = msg)
-        
+
+        # Call logrotate -f to force the rotation immediately
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
-        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep wtmp.1')
+        status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep wtmp.1')
         msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
         self.assertEqual(status, 0, msg = msg)
-       
+
     @OETestDepends(['logrotate.LogrotateTest.test_logrotate_wtmp'])
     def test_logrotate_newlog(self):
-        
         status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
         msg = ('Could not create logrotate test file in /var/log')
         self.assertEqual(status, 0, msg = msg)
-        
-        status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1" > /etc/logrotate.d/logrotate_testfile')
+
+        # Create a new configuration file dedicated to a /var/log/logrotate_testfile
+        status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1}" > /etc/logrotate.d/logrotate_testfile')
         msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
+        status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
         msg = ('Could not write to /tmp/logrotate_test2.conf')
         self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
+        status, output = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
         self.assertEqual(status, 1, msg = msg)
 
+        # Call logrotate -f to force the rotation immediately
         # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
-        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
+        status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
         self.assertEqual(status, 0, msg = msg)
-
-

-- 
2.47.3


