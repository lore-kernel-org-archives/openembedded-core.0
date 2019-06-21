Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4957E7C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:42:15 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id x7so2822568ybg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S/oUy5au1q9qKnGTncYOr8QByPhYyfKq7mEe9raELHI=;
	b=w3ckjj2evVPnRVwty1ly22YIgDkwFuI7k1/m43T1ua8lf1N77kW17l9O0SoG2LYB+/
	VjHNcpTmxvK40v8SK2+am4UA1Fh6Bq1kAqhthoIaU9edGMh97farkCNCUO/8eiO2/pNO
	4PDBag4ssRzScZ8AtC0YtWrECGVO86Tb3ymgHrN37K7VmmqCqqMWeiDgHgVwKR3GjHNw
	TKokI/2k89Y3BO14O8trH5zPtXkhlcMwzpAmU6TsDikSBYDaM/q67/87Sgt+DdE2P2ji
	EtGec3qXSRcRcJQH2t8wePL1kMrufC/3xGC91DEeK9rlSSgleWVXlL8h8KCc8otUI/s7
	pndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S/oUy5au1q9qKnGTncYOr8QByPhYyfKq7mEe9raELHI=;
	b=O9vN+19lBzXlH5tL9t34I7006KfBzrNFwEGX/6dq4DdQFjSJJl/TtMF+kptbqMoSEI
	rwoK5XN0wyxdBTR6Yyw2RegDSuIjBJH/6xTIbGTYVSlvDumegudXN1Xvc3/XPrzCUsHo
	Rx0I7H9gwAFmUq40GEbL1ppwEkH++M5gs+DyTznZ5Ej0ygH8fAB2d8brlDeyZcsig0S0
	C6JCiW70+ESJTipb1+KiZUMyIRhe6JUmVzoJcmcr2ZpXcPQ5hRv3kKO2jkUpD8V0AAjQ
	nvdJpbPOET2BPbOEvlnL1W+naq2m8ns5sJMgf2H9WWv6MxvFlRToUPEM5HS1ZCBOknmn
	7L9A==
X-Gm-Message-State: APjAAAUbrHxhkro4T7xmoj7jYZyBJNmy5zdRnLvda6wX1DT0IprZnLIB
	W1lnXngm8mzgV0oO1Se8mjIx7MG+Rlg90Q==
X-Google-Smtp-Source: APXvYqxkfXaKa/y3ElLNAgiTlnSJ4te5tLg/oREAcTjxpF4pLymXo0GGKLuZWlJbt8yQ4gxwOFDkPw==
X-Received: by 2002:a25:3d01:: with SMTP id k1mr9942334yba.403.1561131735861; 
	Fri, 21 Jun 2019 08:42:15 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	i131sm1487280ywi.70.2019.06.21.08.42.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 08:42:15 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Fri, 21 Jun 2019 11:42:13 -0400
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 11:42:13 -0400
Message-Id: <20190621154213.12761-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 15:42:15 -0000
Content-Transfer-Encoding: 8bit

syslogd and klogd can occasionally take too long to restart, which
causes tests to fail by starting before the log daemons are ready.  To
work around this problem, poll for up to 30 seconds on the processes to
verify the old ones are killed and the new ones are up and running.

[YOCTO #13379]

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 0f5f9f43ca..3270a0fc88 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -50,9 +50,46 @@ class SyslogTestConfig(OERuntimeTestCase):
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
                    'Not appropiate for systemd image')
     def test_syslog_startup_config(self):
+        status, syslogd_pid = self.target.run('pidof syslogd')
+        status, klogd_pid = self.target.run('pidof klogd')
+
         cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
         self.target.run(cmd)
         status, output = self.target.run('/etc/init.d/syslog restart')
+
+        # Error, most likely a race between shutting down and starting up
+        if status:
+            import time
+            timeout = time.time() + 30
+
+            while time.time() < timeout:
+                time.sleep(1)
+                # Verify the old ones are no longer running
+                status, output = self.target.run('kill -0 %s' %syslogd_pid)
+                if not status:
+                    self.logger.debug("old syslogd is running")
+                    continue
+
+                status, output = self.target.run('kill -0 %s' %klogd_pid)
+                if not status:
+                    self.logger.debug("old klogd is running")
+                    continue
+
+                # Verify the new ones are running
+                status, new_syslogd_pid = self.target.run('pidof syslogd')
+                if status:
+                    self.logger.debug("new syslogd is not running")
+                    continue
+
+                status, new_klogd_pid = self.target.run('pidof klogd')
+                if status:
+                    self.logger.debug("new syslogd is not running")
+                    continue
+
+                # Everything is fine now, so keep running
+                status = 0
+                break
+
         msg = ('Could not restart syslog service. Status and output:'
                ' %s and %s' % (status,output))
         self.assertEqual(status, 0, msg)
-- 
2.21.0


