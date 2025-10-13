Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF86CCD190
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:07:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.41128.1760353631231379467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sewQmD56;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F12CEC093AC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2D90606C6
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38D15102F2261;
	Mon, 13 Oct 2025 13:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760353629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4R81aTo6mj2dZGQKv5Wlx+5sIE7BJ7Ab+5SNQQPC2+k=;
	b=sewQmD56CAIClCnxjSHjOdiuSGlqh8sq/dvRfCvt+4LL3xUOg6T/vZIO+cWeanTB7wUd1L
	Y7yHjo1bZjKuvu/6/shp6wt4d6K5TW7NNR34cxKVBH54GMbn1i2tmrCuHBwT8vR8C0Kv7V
	/vkboJbNeJfUHgGl46JCqw8wi3ZJ89CXqksGcV/gUOSWtn9tJQnaxLKPhDFxCxDz9EZUQG
	I2unGkjrJNQeoEPBJOX7XTMqstmRVdD8i6T5uttxN1jS711ZHfaj15BIE65NTEK8S3ITBH
	6aeBKbQvnOMzrhCSthUyGL1tgKpQ3ZffmR1nzLQHXs/BKXbKu/qFfItKFiOBiA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 13 Oct 2025 13:06:44 +0200
Subject: [PATCH 2/3] oeqa: runtime: logrotate: Remove setup and tear down
 methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-mathieu-test-clean-setup-v1-2-6cea9936d79b@bootlin.com>
References: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
In-Reply-To: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760353627; l=8790;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=KKqfegGDY8Qo0y2eyQtotqKK5Ed41DpKZLKUFN1N0G4=;
 b=mfuGroSNMNY8FlMchVQ92nsjFExgbTXH0VOqNoDI5N4HYESOPcxxc5Mm4YQ+f2SOUQWMd+mCS
 v6rF4TsHGtsCQIwTaP5Eog3BIRV21v2g1+su0DVD470R36NKS/XaObc
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224773

Setup and tear down methods are executed even when the tests are disabled.
This lead to SSH being used to run commands on the target, and as it
might fail when no SSH server is present, we had to use
ignore_ssh_fails=True here.

Instead, run cleanup tasks in tests themselves and remove the tear down
method.

Also, the wtmp configuration file is not modified since the test was
modified a few years ago: there is no need to backup and restore it.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 100 ++++++++++++++++---------------
 1 file changed, 52 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 0d4b9ac60baa..4b9915b99ba5 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -12,64 +12,68 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class LogrotateTest(OERuntimeTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        cls.tc.target.run('cp /etc/logrotate.d/wtmp $HOME/wtmp.oeqabak',
-                          ignore_ssh_fails=True)
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log/logrotate_dir', ignore_ssh_fails=True)
-        cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile', ignore_ssh_fails=True)
-
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['logrotate'])
     def test_logrotate_wtmp(self):
-        # /var/log/wtmp may not always exist initially, so use touch to ensure it is present
-        status, output = self.target.run('touch /var/log/wtmp')
-        msg = ('Could not create/update /var/log/wtmp with touch')
-        self.assertEqual(status, 0, msg = msg)
+        try:
+            # /var/log/wtmp may not always exist initially, so use touch to ensure it is present
+            status, output = self.target.run('touch /var/log/wtmp')
+            msg = ('Could not create/update /var/log/wtmp with touch')
+            self.assertEqual(status, 0, msg = msg)
 
-        # Create a folder to store rotated file and add the corresponding
-        # configuration option
-        status, output = self.target.run('mkdir /var/log/logrotate_dir')
-        msg = ('Could not create logrotate_dir. Output: %s' % output)
-        self.assertEqual(status, 0, msg = msg)
+            # Create a folder to store rotated file and add the corresponding
+            # configuration option
+            status, output = self.target.run('mkdir /var/log/logrotate_dir')
+            msg = ('Could not create logrotate_dir. Output: %s' % output)
+            self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
-        msg = ('Could not write to /tmp/logrotate-test.conf')
-        self.assertEqual(status, 0, msg = msg)
+            status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
+            msg = ('Could not write to /tmp/logrotate-test.conf')
+            self.assertEqual(status, 0, msg = msg)
 
-        # Call logrotate -f to force the rotation immediately
-        # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
-        _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
-        status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep wtmp.1')
-        msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
-        self.assertEqual(status, 0, msg = msg)
+            # Call logrotate -f to force the rotation immediately
+            # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
+            _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
+            status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep wtmp.1')
+            msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
+            self.assertEqual(status, 0, msg = msg)
+
+        finally:
+            # Clean files created in the test
+            self.target.run('rm -rf /var/log/logrotate_dir')
 
     @OETestDepends(['logrotate.LogrotateTest.test_logrotate_wtmp'])
     def test_logrotate_newlog(self):
-        status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
-        msg = ('Could not create logrotate test file in /var/log')
-        self.assertEqual(status, 0, msg = msg)
+        try:
+            status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
+            msg = ('Could not create logrotate test file in /var/log')
+            self.assertEqual(status, 0, msg = msg)
+
+            # Create a new configuration file dedicated to a /var/log/logrotate_testfile
+            status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1}" > /etc/logrotate.d/logrotate_testfile')
+            msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
+            self.assertEqual(status, 0, msg = msg)
+
+            status, output = self.target.run('mkdir /var/log/logrotate_dir')
+            msg = ('Could not create logrotate_dir. Output: %s' % output)
+            self.assertEqual(status, 0, msg = msg)
 
-        # Create a new configuration file dedicated to a /var/log/logrotate_testfile
-        status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1}" > /etc/logrotate.d/logrotate_testfile')
-        msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
-        self.assertEqual(status, 0, msg = msg)
+            status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
+            msg = ('Could not write to /tmp/logrotate_test2.conf')
+            self.assertEqual(status, 0, msg = msg)
 
-        status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
-        msg = ('Could not write to /tmp/logrotate_test2.conf')
-        self.assertEqual(status, 0, msg = msg)
+            status, output = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
+            msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
+            self.assertEqual(status, 1, msg = msg)
 
-        status, output = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
-        msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
-        self.assertEqual(status, 1, msg = msg)
+            # Call logrotate -f to force the rotation immediately
+            # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
+            _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
+            status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
+            msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
+            self.assertEqual(status, 0, msg = msg)
 
-        # Call logrotate -f to force the rotation immediately
-        # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
-        _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
-        status, _ = self.target.run('find /var/log/logrotate_dir -type f | grep logrotate_testfile.1')
-        msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
-        self.assertEqual(status, 0, msg = msg)
+        finally:
+            # Clean files created in the test
+            self.target.run('rm -rf /var/log/logrotate_dir')
+            self.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile')

-- 
2.47.3


