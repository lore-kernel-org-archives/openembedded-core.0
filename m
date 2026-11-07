Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9101.1794059716702739840
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 05:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t+eC80rL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A4B34E414C8
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D62CC5FFBC
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4F6103292DE;
	Sat,  7 Nov 2026 14:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794059714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kuz5tvNHwSfMteJE0H1zfqLG+6MuSJRSz/raWdQJKJw=;
	b=t+eC80rL32Pyy8OYbQZlcgkfC8DruWhIA+Vav9F1gufQAr7wHDCP1v3alapjYUhNVSEe1m
	ly5aXrNr3T/Hs8Y9oDvK0FgKEP6X/YxrV/YzeCI5QORIIX2Ndigfz6UHhcfRLPy6TyD8W9
	K9n0nwdeHlR8k4LuVvV6Bl7/8IYkAPXee7phKY4ZU13LRpUHfWbYf7k5Z0ylra3mykBVIk
	1NqGHhi05vX7wwBi65dCcqwNclMwaAm+bea4mfVAww4srajhuCKbd2M1ylCVPmwJmmJNYp
	eWPH67fzFj/HVPf2ZX2V/GI4zAqBPAvKhrylGVS0KCrItD8HwK4BcUDe6LNlfw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 07 Nov 2026 14:54:55 +0100
Subject: [PATCH 3/3] runqemu: Do not run cleanup in signal handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-mathieu-master-next-b16487-v1-3-2fe0e7b9b1fb@bootlin.com>
References: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
In-Reply-To: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794059710; l=3959;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=guCLjIbPRkHO6EeARiiTBt1LTAui6+f8GsGq/gkYwwo=;
 b=jIIXz6lVTq8QHWNghq9O2uw6gSlAnsY5D2HnE0U1jGIeKAdVPFtyLwpGZEffywwspnPWVRoFb
 kT9R9Wxo82MA7+O19nZ3FkcRTZ3r6qRmfIWjjfJIykJqFvny9P0nl+Q
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 13:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249743

If QEMU is still running while we are in the cleanup() function, this
means we are currently handling a SIGTERM on runqemu. So we are still
waiting on the process in start_qemu(). Trying to manipulate the process
here might result in a deadlock.

As an alternative, SIGTERM handler is now limited to transferring this
SIGTERM to QEMU. Clean-up will happen in the normal path of the code. An
additional SIGALRM timer makes sure to kill the QEMU process if it's
still alive 5 seconds later.

[YOCTO #16487]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/runqemu | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c9f6481cd11e..967a86b78304 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -227,8 +227,6 @@ class BaseConfig(object):
         # pid of the actual qemu process
         self.qemu_environ = os.environ.copy()
         self.qemuprocess = None
-        # avoid cleanup twice
-        self.cleaned = False
         # Files to cleanup after run
         self.cleanup_files = []
         self.qmp = None
@@ -1658,6 +1656,7 @@ to your build configuration.
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
         self.qemuprocess = process
         retcode = process.wait()
+        signal.alarm(0)
         if retcode:
             if retcode == -signal.SIGTERM:
                 logger.info("Qemu terminated by SIGTERM")
@@ -1672,22 +1671,11 @@ to your build configuration.
                 raise RunQemuError('Failed to run %s' % str(cmd))
 
     def cleanup(self):
-        if self.cleaned:
-            return
-
         # avoid dealing with SIGTERM when cleanup function is running
         signal.signal(signal.SIGTERM, signal.SIG_IGN)
 
         logger.info("Cleaning up")
 
-        if self.qemuprocess:
-            try:
-                # give it some time to shut down, ignore return values and output
-                self.qemuprocess.send_signal(signal.SIGTERM)
-                self.qemuprocess.communicate(timeout=5)
-            except subprocess.TimeoutExpired:
-                self.qemuprocess.kill()
-
         with open('/proc/uptime', 'r') as f:
             uptime_seconds = f.readline().split()[0]
         logger.info('Host uptime: %s\n' % uptime_seconds)
@@ -1718,8 +1706,6 @@ to your build configuration.
         # Deliberately ignore the return code of 'tput smam'.
         subprocess.call(["tput", "smam"])
 
-        self.cleaned = True
-
     def run_bitbake_env(self, mach=None, target=''):
 
         if not mach:
@@ -1806,9 +1792,26 @@ def main():
 
         def sigterm_handler(signum, frame):
             logger.info("Received signal: %s" % (signum))
-            config.cleanup()
+            # Stop qemu: process.wait() in start_qemu() will reap it. Add an
+            # alarm to send a SIGKILL if QEMU is still alive 5s later.
+            if config.qemuprocess is not None and config.qemuprocess.returncode is None:
+                try:
+                    config.qemuprocess.terminate()
+                except OSError:
+                    pass
+                signal.alarm(5)
         signal.signal(signal.SIGTERM, sigterm_handler)
 
+        def sigalrm_handler(signum, frame):
+            # Force-kill qemu if it is still running after the grace period.
+            # No-op once qemu has been reaped (returncode set).
+            if config.qemuprocess is not None and config.qemuprocess.returncode is None:
+                try:
+                    config.qemuprocess.kill()
+                except OSError:
+                    pass
+        signal.signal(signal.SIGALRM, sigalrm_handler)
+
         config.check_args()
         config.read_qemuboot()
         config.check_and_set()

-- 
2.47.3

