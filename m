Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCF2CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:51:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.2878.1760601054673011217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SH8Z6fBS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08AB71A1414
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:50:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D419A6062C;
	Thu, 16 Oct 2025 07:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25F70102F22B9;
	Thu, 16 Oct 2025 09:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760601052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ko3p2XKd3T30SCsO/QZGENjbx144rWESeRbJMO5XXIU=;
	b=SH8Z6fBSEHKYPqIwCkGrDNzJuDzzNoNjdlHo4x2umhXVC4fExqDLOuoABkLiMr8P073mtd
	wvwMGoXndv6cK2p+mnVlGfdOwkvVsfa07QVb+8xRC+T/ZDfaWRr3mQ7KYX+PhgFnqM1/BZ
	QpgZsC5OJQlPhVi7M2fzxLuPlZFin6hYDb9C9JkOHqoYOE7kRPt3/soSEXD7LEI2aGhQyK
	gfH6iDfhDFgORWH4u7e4NrK4hjEHu9TVF6HkkRPIBkMywCDbz5ccDCxtbCWjcY8w/bIv1j
	58hr1Jkr4QGRaIx4Gc9OKko3tsLnq7I4WT72DTMuHKtMqu23VnsTiCNYt8ifqg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 16 Oct 2025 09:50:25 +0200
Subject: [PATCH v2 1/2] oeqa: runtime: logrotate: Remove setup and tear
 down methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-mathieu-test-clean-setup-v2-1-c4295b9334b8@bootlin.com>
References: <20251016-mathieu-test-clean-setup-v2-0-c4295b9334b8@bootlin.com>
In-Reply-To: <20251016-mathieu-test-clean-setup-v2-0-c4295b9334b8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Joshua Watt <jpewhacker@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760601050; l=3357;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=FtHPcg+p/ULMT0IFIHztNNh2+/qBu10Xra/r2ANkHsY=;
 b=qpFl1WyFbGFGvs41aCmrZhzBg3HEq9mGbHOdi4Fr69AXs0HjTeUOWcdfCDR4UNlbGsMxQWPmD
 qDvqWatJ/R6CXfioy8dBw/4g8CqVHH38DaojyB/nAx2EhsHN4Mn4VdH
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224954

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
 meta/lib/oeqa/runtime/cases/logrotate.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 0d4b9ac60baa..9fe1170226c8 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -12,17 +12,6 @@ from oeqa.core.decorator.depends import OETestDepends
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
@@ -33,6 +22,7 @@ class LogrotateTest(OERuntimeTestCase):
 
         # Create a folder to store rotated file and add the corresponding
         # configuration option
+        self.addCleanup(self.target.run, 'rm -rf /var/log/logrotate_dir')
         status, output = self.target.run('mkdir /var/log/logrotate_dir')
         msg = ('Could not create logrotate_dir. Output: %s' % output)
         self.assertEqual(status, 0, msg = msg)
@@ -55,10 +45,17 @@ class LogrotateTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg = msg)
 
         # Create a new configuration file dedicated to a /var/log/logrotate_testfile
+        self.addCleanup(self.target.run, 'rm -f /var/log/logrotate_testfile')
         status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1}" > /etc/logrotate.d/logrotate_testfile')
         msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
         self.assertEqual(status, 0, msg = msg)
 
+        self.addCleanup(self.target.run, 'rm -rf /var/log/logrotate_dir')
+        status, output = self.target.run('mkdir /var/log/logrotate_dir')
+        msg = ('Could not create logrotate_dir. Output: %s' % output)
+        self.assertEqual(status, 0, msg = msg)
+
+        self.addCleanup(self.target.run, 'rm -f /etc/logrotate.d/logrotate_testfile')
         status, output = self.target.run('echo "create \n olddir /var/log/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
         msg = ('Could not write to /tmp/logrotate_test2.conf')
         self.assertEqual(status, 0, msg = msg)

-- 
2.47.3


