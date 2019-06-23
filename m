Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id AFDD87E080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 16:23:08 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id i14so4756615ybp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B3XeR/vvhFX5T3xhEUVfhN+66+5CRtjMzWJuvF0MyAU=;
	b=CYY4yzpdzm/nZGw5mInWhJfsH5Udcj6S0ZVO4saaVmv2aWcIb+7E2F8vNWrge0mayZ
	ThaQxuJWQHfK3fZXBdK5TmPH60gsoFcH7qCJ3ICRjYTTpxAaS5a5bQm0iXnWSHfIzyvT
	b4ABAGCPyu8XqPldHORWljL1ytOAIxn4EmSKlSEIYmMBgUUZCNl2iNbFxkx4W1KMzuc3
	r9DwpqKXSGErAy0ut6aLR8zxWEHrWSclRPmn0zAmxSc3tWEYs4gLxEONO7eeOT+DCyFt
	CF04i3uMRUrRWZ5DrXNtyHJkQEucCQBsRCJkWRLs74nEFpqNM3Fk/8r4fLJdg71qUWuV
	0jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B3XeR/vvhFX5T3xhEUVfhN+66+5CRtjMzWJuvF0MyAU=;
	b=IPag4mj84AA2q6O3fsi2Fy3Pb9CeJpSLevz03oNlfEgk0Ir1tIKSGh2XBGHh/VkzCF
	xDoTdASQ31bq9VXGBQipXfEnv8PnIZUTdaAsyNZfKZ7aiejRVW6KO4X2Wxitq2C7KyBx
	LRhrl5aM1Xgg8qURWnMCbPXfTP7CXzIpJZgj/yjcziuCmKT+KoPCiTvs3RfYu53WdjkS
	qNWfVoUWqDkSEvVWT1vUlrxVfVVtO3FBRwYnZOPtbBo7sSJNiQkwZHprD3wKa8nf3XM0
	S5lK2MzS1exXouBDVZBcY9crrsCUA1CUwokUjLmdj3lZ7YLrwRcWbrVQcHIYXaKlg0W8
	jklA==
X-Gm-Message-State: APjAAAVx8xSIRQwl5fqeJRZChENdlnucuG+qLTm3HFx8RMkNVL64AuyV
	8tlvX7nLawZ3thSi1sTHfte2Mh/m9X9U0A==
X-Google-Smtp-Source: APXvYqxCKGwYuiH3hWktErN5V+7pq1OQCi3aR90K/mEOZSqDkRvNathv83ZjvKhKN6RXj3ZBpzF57A==
X-Received: by 2002:a25:bb46:: with SMTP id b6mr61004262ybk.50.1561306989169; 
	Sun, 23 Jun 2019 09:23:09 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	h84sm1848967ywh.28.2019.06.23.09.23.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 23 Jun 2019 09:23:08 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Sun, 23 Jun 2019 12:23:06 -0400
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 12:23:06 -0400
Message-Id: <20190623162306.13965-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] oe_syslog.py: Handle syslogd/klogd restart race
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jun 2019 16:23:08 -0000
Content-Transfer-Encoding: 8bit

syslogd and klogd can occasionally take too long to restart, which
causes tests to fail by starting before the log daemons are ready.  To
work around this problem, poll for up to 30 seconds on the processes to
verify the old ones are killed and the new ones are up and running.
Similarly, add checks for rsyslogd and systemd-journald to possibly
catch issues with those daemons.

[YOCTO #13379]

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 125 +++++++++++++++++++++--
 1 file changed, 117 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 0f5f9f43ca..40a52eb078 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
+import time
 
 class SyslogTest(OERuntimeTestCase):
 
@@ -21,6 +22,110 @@ class SyslogTest(OERuntimeTestCase):
 
 class SyslogTestConfig(OERuntimeTestCase):
 
+    @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
+    def rsyslog_restart_sanity(self, rsyslog_pid):
+        status, output = self.target.run('/etc/init.d/rsyslog restart')
+
+        # Always check for an error, most likely a race between shutting down and starting up
+        timeout = time.time() + 30
+
+        while time.time() < timeout:
+            # Verify the previous ones are no longer running
+            status, err_output = self.target.run('kill -0 %s' %rsyslog_pid)
+            if not status:
+                self.logger.debug("previous rsyslogd is still running")
+                status = 1
+                continue
+
+            # Verify the new ones are running
+            status, new_rsyslog_pid = self.target.run('pidof rsyslogd')
+            if status:
+                self.logger.debug("new rsyslogd is not running")
+                continue
+
+            # Everything is fine now, so keep running
+            status = 0
+            break
+
+        msg = ('Could not restart rsyslog service. Status and output:'
+               ' %s and %s' % (status,output))
+        self.assertEqual(status, 0, msg)
+
+
+    @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
+    def systemd_journal_restart_sanity(self, journald_pid):
+        status, output = self.target.run('systemctl restart syslog.service')
+
+        # Always check for an error, most likely a race between shutting down and starting up
+        timeout = time.time() + 30
+
+        while time.time() < timeout:
+            # Verify the previous ones are no longer running
+            status, err_output = self.target.run('kill -0 %s' %journald_pid)
+            if not status:
+                self.logger.debug("previous systemd-journald is still running")
+                status = 1
+                continue
+
+            # Verify the new ones are running
+            status, new_journald_pid = self.target.run('pidof systemd-journald')
+            if status:
+                self.logger.debug("new systemd-journald is not running")
+                continue
+
+            # Everything is fine now, so keep running
+            status = 0
+            break
+
+        msg = ('Could not restart systemd-journald service. Status and output:'
+               ' %s and %s' % (status,output))
+        self.assertEqual(status, 0, msg)
+
+
+    @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
+    def syslog_restart_sanity(self):
+        status, syslogd_pid = self.target.run('pidof syslogd')
+        status, klogd_pid = self.target.run('pidof klogd')
+
+        status, output = self.target.run('/etc/init.d/syslog restart')
+
+        # Always check for an error, most likely a race between shutting down and starting up
+        timeout = time.time() + 30
+
+        while time.time() < timeout:
+            # Verify the previous ones are no longer running
+            status, err_output = self.target.run('kill -0 %s' %syslogd_pid)
+            if not status:
+                self.logger.debug("previous syslogd is still running")
+                status = 1
+                continue
+
+            status, err_output = self.target.run('kill -0 %s' %klogd_pid)
+            if not status:
+                self.logger.debug("previous klogd is still running")
+                status = 1
+                continue
+
+            # Verify the new ones are running
+            status, new_syslogd_pid = self.target.run('pidof syslogd')
+            if status:
+                self.logger.debug("new syslogd is not running")
+                continue
+
+            status, new_klogd_pid = self.target.run('pidof klogd')
+            if status:
+                self.logger.debug("new syslogd is not running")
+                continue
+
+            # Everything is fine now, so keep running
+            status = 0
+            break
+
+        msg = ('Could not restart syslog service. Status and output:'
+               ' %s and %s' % (status,output))
+        self.assertEqual(status, 0, msg)
+
+
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_logger(self):
         status, output = self.target.run('logger foobar')
@@ -37,12 +142,18 @@ class SyslogTestConfig(OERuntimeTestCase):
                ' Output: %s ' % output)
         self.assertEqual(status, 0, msg=msg)
 
+
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
-        if "systemd" != self.tc.td.get("VIRTUAL-RUNTIME_init_manager", ""):
-            (_, _) = self.target.run('/etc/init.d/syslog restart')
+        status, journal_pid = self.target.run('pidof systemd-journald')
+        if not status:
+            self.systemd_journal_restart_sanity(journal_pid)
         else:
-            (_, _) = self.target.run('systemctl restart syslog.service')
+            status, rsyslog_pid = self.target.run('pidof rsyslogd')
+            if not status:
+                self.rsyslog_restart_sanity(rsyslog_pid)
+            else:
+                self.syslog_restart_sanity()
 
 
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
@@ -52,10 +163,8 @@ class SyslogTestConfig(OERuntimeTestCase):
     def test_syslog_startup_config(self):
         cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
         self.target.run(cmd)
-        status, output = self.target.run('/etc/init.d/syslog restart')
-        msg = ('Could not restart syslog service. Status and output:'
-               ' %s and %s' % (status,output))
-        self.assertEqual(status, 0, msg)
+
+        self.syslog_restart_sanity()
 
         cmd = 'logger foobar && grep foobar /var/log/test'
         status,output = self.target.run(cmd)
@@ -64,4 +173,4 @@ class SyslogTestConfig(OERuntimeTestCase):
 
         cmd = "sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf"
         self.target.run(cmd)
-        self.target.run('/etc/init.d/syslog restart')
+        self.syslog_restart_sanity()
-- 
2.21.0


