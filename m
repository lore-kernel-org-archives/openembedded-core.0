Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id E017A7E27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 16:06:59 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id 189so7701597ybh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UHbIIo11EFcrfonytIoE4ObFbi92JobgHlAhOQOvXJI=;
	b=V1woRWLeTKgyYXNwyWo38fLat4Ui4ftwawX+PSwiuTy+Sfg0jIisW4hIm/+2/FnVjg
	gK8XqoSpjkwO2/dBk/FeOSVffoQ9xC0y5kszQM0dOzGNn175C3WqKqGp/e0qV/bKRk76
	LR83BvAasOztwzDihOYgFButOKE4w6YalDKgN0uDMIg3iyAUAwxfERKiftruAyoJV81Y
	b2wOo+waJ594SFowps5nhg99JL/eBfzQtrroDln+gRYzTFNd4HVi/lF6EyO4KW3D+T67
	7G8Kh7WdpdtkXX1mNjjVN0U1TJ6ml8uRD7B6sf4TNwczt0A3R1vg3gX98n9P57aQbIr9
	2Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UHbIIo11EFcrfonytIoE4ObFbi92JobgHlAhOQOvXJI=;
	b=tahT8ziKkZ/Ps+3Qd216UqVcN/32lR0wLYiqdUPTBOXacbYPQ6CDJw7OF7CPoVzthL
	qUF0DYg3v7C1XqgFCfORAdedEbSaSl9pX++Tfh5/HQU2FGvxf+WOcJc7qAQwjRvI0Du1
	MZooKYwVsAXofTY/o3cz5oJHdmcHX4YasbTLa5WubYN10dhYbUw5JltLhWGMR3R2gJ0y
	a0PZcWdTTaGnCiG2iR07McBqoevH0rPEp27edvaxk51yLOcXElUSR/qTeNI3KPHG3n0u
	PhRmQkBbme034ScA1B8carnFKY8kh7uPHp6R9VfQn9VwIeFzXvilAECMfnpwr83Vcamd
	c56g==
X-Gm-Message-State: APjAAAW6w2qZvDx1cVLCI3HHcte2wYi7xz/8F0iXxXwmUKq9KBO0PHPw
	oj2LJNg4Q3Vfi6wH/0GUpCBxycsj7pyPfg==
X-Google-Smtp-Source: APXvYqx5dfI6adgb1HAXndOn1ZXtjrGqFzhyT9Fj7tW6cnD7rypkmusm1TOwXXDGJy8KUlprK9/FYQ==
X-Received: by 2002:a25:844c:: with SMTP id r12mr83747704ybm.229.1561478820370;
	Tue, 25 Jun 2019 09:07:00 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	f199sm1612775ywb.105.2019.06.25.09.06.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 09:06:59 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Tue, 25 Jun 2019 12:06:58 -0400
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 12:06:58 -0400
Message-Id: <20190625160658.3596-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v4] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Tue, 25 Jun 2019 16:07:00 -0000
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
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 68 ++++++++++++++++++++----
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 0f5f9f43ca..0f79e5a0f3 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
+import time
 
 class SyslogTest(OERuntimeTestCase):
 
@@ -21,6 +22,53 @@ class SyslogTest(OERuntimeTestCase):
 
 class SyslogTestConfig(OERuntimeTestCase):
 
+    def verif_not_running(self, pids):
+        for pid in pids:
+            status, err_output = self.target.run('kill -0 %s' %pid)
+            if not status:
+                self.logger.debug("previous %s is still running" %pid)
+                return 1
+
+    def verify_running(self, names):
+        pids = []
+        for name in names:
+            status, pid = self.target.run('pidof %s' %name)
+            if status:
+                self.logger.debug("%s is not running" %name)
+                return 1, pids
+            pids.append(pid)
+        return 0, pids
+
+
+    def restart_sanity(self, names, restart_cmd):
+        status, original_pids = self.verify_running(names)
+        if status:
+            return 1
+
+        status, output = self.target.run(restart_cmd)
+
+        # Always check for an error, most likely a race between shutting down and starting up
+        timeout = time.time() + 30
+
+        while time.time() < timeout:
+            # Verify the previous ones are no longer running
+            status = self.verif_not_running(original_pids)
+            if status:
+                continue
+
+            status, pids = self.verify_running(names)
+            if status:
+                continue
+
+            # Everything is fine now, so exit to continue the test
+            status = 0
+            break
+
+        msg = ('Could not restart %s service. Status and output: %s and %s'
+               %(names, status, output))
+        self.assertEqual(status, 0, msg)
+
+
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_logger(self):
         status, output = self.target.run('logger foobar')
@@ -37,12 +85,16 @@ class SyslogTestConfig(OERuntimeTestCase):
                ' Output: %s ' % output)
         self.assertEqual(status, 0, msg=msg)
 
+
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
-        if "systemd" != self.tc.td.get("VIRTUAL-RUNTIME_init_manager", ""):
-            (_, _) = self.target.run('/etc/init.d/syslog restart')
-        else:
-            (_, _) = self.target.run('systemctl restart syslog.service')
+        status = self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service')
+        if status:
+            status = self.restart_sanity(['rsyslogd'], '/etc/init.d/rsyslog restart')
+            if status:
+                status = self.restart_sanity(['syslogd', 'klogd'], '/etc/init.d/syslog restart')
+            else:
+                self.logger.info("No syslog found to restart, ignoring")
 
 
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
@@ -52,10 +104,8 @@ class SyslogTestConfig(OERuntimeTestCase):
     def test_syslog_startup_config(self):
         cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
         self.target.run(cmd)
-        status, output = self.target.run('/etc/init.d/syslog restart')
-        msg = ('Could not restart syslog service. Status and output:'
-               ' %s and %s' % (status,output))
-        self.assertEqual(status, 0, msg)
+
+        self.test_syslog_restart()
 
         cmd = 'logger foobar && grep foobar /var/log/test'
         status,output = self.target.run(cmd)
@@ -64,4 +114,4 @@ class SyslogTestConfig(OERuntimeTestCase):
 
         cmd = "sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf"
         self.target.run(cmd)
-        self.target.run('/etc/init.d/syslog restart')
+        self.test_syslog_restart()
-- 
2.21.0


