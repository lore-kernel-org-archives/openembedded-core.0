Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C089CC636D7
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 14:50:58 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.16832.1676472657023405321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 06:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSJ7W-005TCO-Tz; Wed, 15 Feb 2023 16:50:55 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSJ7W-003jfJ-Kx; Wed, 15 Feb 2023 16:50:54 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/2] runqemu: kill qemu if it hangs
Date: Wed, 15 Feb 2023 16:50:41 +0200
Message-Id: <20230215145041.889942-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215145041.889942-1-mikko.rapeli@linaro.org>
References: <20230215145041.889942-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230215145041.889942-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177199

qemu doesn't always behave well and can hang too.
kill it with force if it was still alive. Move clean up
commands into cleanup() function.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/runqemu | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

v3: moved from qemurunner.py to runqemu SIGTERM and cleanup handling

v2: https://lists.openembedded.org/g/openembedded-core/message/176926

diff --git a/scripts/runqemu b/scripts/runqemu
index def11ea911..cedf4f62ad 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -211,7 +211,7 @@ class BaseConfig(object):
         self.mac_slirp = "52:54:00:12:35:"
         # pid of the actual qemu process
         self.qemu_environ = os.environ.copy()
-        self.qemupid = None
+        self.qemuprocess = None
         # avoid cleanup twice
         self.cleaned = False
         # Files to cleanup after run
@@ -1531,7 +1531,7 @@ class BaseConfig(object):
             for descriptor in self.portlocks.values():
                 pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
-        self.qemupid = process.pid
+        self.qemuprocess = process
         retcode = process.wait()
         if retcode:
             if retcode == -signal.SIGTERM:
@@ -1554,6 +1554,15 @@ class BaseConfig(object):
         signal.signal(signal.SIGTERM, signal.SIG_IGN)
 
         logger.info("Cleaning up")
+
+        if self.qemuprocess:
+            try:
+                # give it some time to shut down, ignore return values and output
+                self.qemuprocess.send_signal(signal.SIGTERM)
+                self.qemuprocess.communicate(timeout=5)
+            except subprocess.TimeoutExpired:
+                self.qemuprocess.kill()
+
         with open('/proc/uptime', 'r') as f:
             uptime_seconds = f.readline().split()[0]
         logger.info('Host uptime: %s\n' % uptime_seconds)
@@ -1581,6 +1590,9 @@ class BaseConfig(object):
                 else:
                     shutil.rmtree(ent)
 
+        # Deliberately ignore the return code of 'tput smam'.
+        subprocess.call(["tput", "smam"])
+
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None):
@@ -1657,12 +1669,8 @@ def main():
             subprocess.check_call([renice, str(os.getpid())])
 
         def sigterm_handler(signum, frame):
-            logger.info("SIGTERM received")
-            if config.qemupid:
-                os.kill(config.qemupid, signal.SIGTERM)
+            logger.info("Received signal: %s" % (signum))
             config.cleanup()
-            # Deliberately ignore the return code of 'tput smam'.
-            subprocess.call(["tput", "smam"])
         signal.signal(signal.SIGTERM, sigterm_handler)
 
         config.check_args()
@@ -1686,8 +1694,6 @@ def main():
     finally:
         config.cleanup_cmd()
         config.cleanup()
-        # Deliberately ignore the return code of 'tput smam'.
-        subprocess.call(["tput", "smam"])
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.34.1


