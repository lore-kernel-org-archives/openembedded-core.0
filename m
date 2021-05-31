Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.47191.1622482227653194246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 10:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iOAZd0yK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id q5so11624567wrs.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bQPFUzhpho7qSLK4mvq1LP+rCJNZoQwSRQobHczI/sM=;
        b=iOAZd0yKXpp0gTH+lx7Y8bB+XUT57MbXRTktiK0iQGCo2icQjwsnTybM5u1qSoO7rH
         5OlD9qaXQ6AwrLOAC1/jOtGDFSYtmc1MId6P5tudm1kTLuxGbCS1QgDZLmafEvcrNGB5
         02zdsoJLA5UtbHh37AdYxU0CvwnYljMjg6dTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bQPFUzhpho7qSLK4mvq1LP+rCJNZoQwSRQobHczI/sM=;
        b=MBv+8RrwmnnYMkFfBM2lIVm4juMPqjTGbP5V9aGc5FgaNevt/cTmre55wZXr4FJKJa
         SaQ6DbpPJlZoC1hCufAD1gftvFAsJ8jH3cYaIQJSrF8rxhxbf+uu6IXnB2d6it+egLY5
         jta54yg4zhYrMN6JHWqKORbJmJFCrPmoGbiENVDx0asC41oxAH6ipLLDgjkcf6gOPiYU
         6P1s+KCeYg7x+NJpQhUVy96XGAjmMxPr3yj6aKEpWAWyWYfNqeaFFJR/LqdsRs4T0QI5
         1Lp8un3CwWfY4Pv6wmu4UPAs1n4LFo+jsKJjM89WleOpFXDoeehxp3xUsfhXJ9qffCXk
         uNyw==
X-Gm-Message-State: AOAM530zM5r7ZYYL2aPUxRReZWeoQvQH3CPbfIHTpTxpcFNEn/cFGN9T
	/ts5Et70ImIGNvbzN9GiAfj22xudIB0TUg==
X-Google-Smtp-Source: ABdhPJwjPgeZPCcZ/sKmSI2RO2eH3OfT2asBI7l5cqWqxRJ85MaQd2jqeLN3x5naSgsit8i2Dis+7g==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr22380249wri.27.1622482225862;
        Mon, 31 May 2021 10:30:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id 32sm439154wrs.5.2021.05.31.10.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:30:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Improve timeout handling
Date: Mon, 31 May 2021 18:30:24 +0100
Message-Id: <20210531173024.2853629-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We had debugging for qemu faiing to start which was no longer reachable
after the QMP changes. Reorder the code to enable this debugging to work
again which may allow insight into autobuilder failures in this area.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 50 ++++++++++++++-----------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d31c98d5890..24af2fb20bb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -277,14 +277,33 @@ class QemuRunner:
 
         if self.runqemu_exited:
             self.logger.warning("runqemu after timeout")
-            return False
 
         if self.runqemu.returncode:
             self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
-            return False
 
         if not self.is_alive():
-            self.logger.warning('is_alive() failed later')
+            self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
+                              (self.runqemutime, time.strftime("%D %H:%M:%S")))
+
+            qemu_pid = None
+            if os.path.isfile(self.qemu_pidfile):
+                with open(self.qemu_pidfile, 'r') as f:
+                    qemu_pid = f.read().strip()
+
+            self.logger.error("Status information, poll status: %s, pidfile exists: %s, pidfile contents %s, proc pid exists %s"
+                % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
+
+            # Dump all processes to help us to figure out what is going on...
+            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
+            processes = ps.decode("utf-8")
+            self.logger.debug("Running processes:\n%s" % processes)
+            self._dump_host()
+            op = self.getOutput(output)
+            self.stop()
+            if op:
+                self.logger.error("Output from runqemu:\n%s" % op)
+            else:
+                self.logger.error("No output from runqemu.\n")
             return False
 
         # Create the client socket for the QEMU Monitor Control Socket
@@ -343,31 +362,6 @@ class QemuRunner:
         # Release the qemu process to continue running
         self.run_monitor('cont')
 
-        if not self.is_alive():
-            self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
-                              (self.runqemutime, time.strftime("%D %H:%M:%S")))
-
-            qemu_pid = None
-            if os.path.isfile(self.qemu_pidfile):
-                with open(self.qemu_pidfile, 'r') as f:
-                    qemu_pid = f.read().strip()
-
-            self.logger.error("Status information, poll status: %s, pidfile exists: %s, pidfile contents %s, proc pid exists %s"
-                % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
-
-            # Dump all processes to help us to figure out what is going on...
-            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
-            processes = ps.decode("utf-8")
-            self.logger.debug("Running processes:\n%s" % processes)
-            self._dump_host()
-            op = self.getOutput(output)
-            self.stop()
-            if op:
-                self.logger.error("Output from runqemu:\n%s" % op)
-            else:
-                self.logger.error("No output from runqemu.\n")
-            return False
-
         # We are alive: qemu is running
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
-- 
2.30.2

