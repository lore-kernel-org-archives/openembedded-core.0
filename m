Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6477.1620287462672550490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 00:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g4cTbR/j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t18so4524852wry.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 00:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv7SF5GXnDNhriwwHuGLN2h36apAU78DpOSzwjAXpUQ=;
        b=g4cTbR/jV0dgJIJcFgMkcl6B+ZPwQL5OXzECBS5XnFGV7yulCsws/3apLSYNPXUvJA
         04oguXvDUDMkBP4IPJPK2CtvZOb7KdDH7HFegZ1feaxt3Cj3yrN57xEC/UHMf5Fmkqmt
         u2S3WkWn0Lofj4QqXCrfp+dk35eh2xaM03Uno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv7SF5GXnDNhriwwHuGLN2h36apAU78DpOSzwjAXpUQ=;
        b=qXsoW5nuUTswuegr9c9GFF4IcNjzRYWaLgJiFrhtJoNfzdjHLRKUiX9SzYkzKqpUg4
         tsWCE7NOAaLRfwVOLDk51dua0h8LSER96jOZVnV6SSBaNEt2+DhxbPP1Vr7JsBJxI67a
         FYK9+Je84NOnoNX7b1uBVevM3BAFhaT+3GbJ8UW9VCnNo5nS89mbTjPh7HRGbpGyiHor
         cjJObQQl95bMKZwS26n9QEHnFD+MECSgcyMpcmOHp2uPigIy9F2k8xiajpudWNLNt6Ss
         bK2ayFzQcdMBNwnntr9BybLwJEwwM5D1frEFLpcZ6NpA5Bk8rJddAoz72wbz3T0qILXh
         W3iA==
X-Gm-Message-State: AOAM530XDImtV7AF0AsqQf8nTWgzXoRtqOvkRt6OF4gBJP7wcLu6Rq7T
	tmxT2NL6pzGjlIJcEGzhscoOs3fg0XhdPQ==
X-Google-Smtp-Source: ABdhPJyguhXbqsqGIG05Bpt8w65hF4D5BdOWVK9JXNtk4a0slk84OXETHBJo/S8B422BO2REvynFHg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3434873wrr.19.1620287460900;
        Thu, 06 May 2021 00:51:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id q16sm2251437wmj.24.2021.05.06.00.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 00:51:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/qemurunner: Improve logging thread exit handling for qemu shutdown test
Date: Thu,  6 May 2021 08:50:58 +0100
Message-Id: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than totally disabling the logging, inform it we're about to exit
so we can log messages over the exit cleanly too. This aids debugging. It
also avoids a race where the logging handler could still error whilst
shutting down.

Also remove a race window by notificing the handler of the shutdown
first, before triggering it. This removes a race window I watched in
local testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py |  9 ++++-----
 meta/lib/oeqa/utils/qemurunner.py       | 12 +++++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 7e676bcb416..da22f77b276 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -163,12 +163,11 @@ class QemuTest(OESelftestTestCase):
         bitbake(cls.recipe)
 
     def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):
+        # Allow the runner's LoggingThread instance to exit without errors
+        # (such as the exception "Console connection closed unexpectedly")
+        # as qemu will disappear when we shut it down
+        qemu.runner.allowexit()
         qemu.run_serial("shutdown -h now")
-        # Stop thread will stop the LoggingThread instance used for logging
-        # qemu through serial console, stop thread will prevent this code
-        # from facing exception (Console connection closed unexpectedly)
-        # when qemu was shutdown by the above shutdown command
-        qemu.runner.stop_thread()
         time_track = 0
         try:
             while True:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f6e10072887..cb0be5603c0 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -534,6 +534,10 @@ class QemuRunner:
             self.thread.stop()
             self.thread.join()
 
+    def allowexit(self):
+        if self.thread:
+            self.thread.allowexit()
+
     def restart(self, qemuparams = None):
         self.logger.warning("Restarting qemu process")
         if self.runqemu.poll() is None:
@@ -630,6 +634,7 @@ class LoggingThread(threading.Thread):
         self.logger = logger
         self.readsock = None
         self.running = False
+        self.canexit = False
 
         self.errorevents = select.POLLERR | select.POLLHUP | select.POLLNVAL
         self.readevents = select.POLLIN | select.POLLPRI
@@ -663,6 +668,9 @@ class LoggingThread(threading.Thread):
         self.close_ignore_error(self.writepipe)
         self.running = False
 
+    def allowexit(self):
+        self.canexit = True
+
     def eventloop(self):
         poll = select.poll()
         event_read_mask = self.errorevents | self.readevents
@@ -719,7 +727,9 @@ class LoggingThread(threading.Thread):
             # happened. But for this code it counts as an
             # error since the connection shouldn't go away
             # until qemu exits.
-            raise Exception("Console connection closed unexpectedly")
+            if not self.canexit:
+                raise Exception("Console connection closed unexpectedly")
+            return ''
 
         return data
 
-- 
2.30.2

