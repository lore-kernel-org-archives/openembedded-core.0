Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.19577.1621260892554425252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JkNSB3KI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso3772990pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KT3gak1tpG7U4rF53LO1+6iqw/FS9BmZpSWyhDekJCM=;
        b=JkNSB3KIPWKS977g67+BxwJd/UbEaPcsaCt+Lzkw1yNwmpYuljsXBToiEspdqUcth9
         obQGKtqJApxJH96MY04LcBUW1la3oVdTtP0WxBhBJizFFE49TjzxBdyiWbMpi48WSTlW
         /wNqNyfLGjK4nsLhPHkMsV6eQe8In0PfwueX0KKoHKIx2nwHLcpLVHl8+zAgP1dd83w4
         lWCRxB9v1lzmh+D5M9jbiZakjzsm+6coQ9fwr1bkz+cU+TQBL5Qt0V8vXbygZMEP3va/
         Vgo3hfG6KdTiVi1PBuqH6F+z1cj5T8YmM424pPqHLF4An87UKmbNnrXXsHPZVWii1wgr
         3skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KT3gak1tpG7U4rF53LO1+6iqw/FS9BmZpSWyhDekJCM=;
        b=CNi+R4HQXwXtufutqC6/qF8YuF6I43eCFkBh4SsFEACW7ShGrKv+y3zYsXtUI47K3W
         1GpdIkJM8mKiLe/wtUuIqSl+tHyAqa1KS4fKr9vdoOwulDwY6ixu4KhQOsclCkz09ALo
         WfGeczzkyjHVL5m2sGZeoHH+ZnhvoMfaJj3/DoG419L2w7D4PriLpQt/GaOmq+Gc6eSd
         Ay71969qLrQxE8gXbCakKWvuZ1EthrXknl5diklXMnU8XZNBKmthjxzFazGs9oYnokmT
         NWsEckoNYdVpPEXB3ZGeX+VLxE4G8QG9/F/bU4xr1VVnq0g04FWSsnceV6vQmRSGxECf
         LMCg==
X-Gm-Message-State: AOAM531OUTGkKVTnpISa/NJdGaHw6tn6HEDy0zHiUqCbbetSySHf0bVi
	rZfrdrHEON4pG1o5/qnof2bnVk6ZFbTcmcl6vNw=
X-Google-Smtp-Source: ABdhPJzWijbxEFot3jU3Re/4DusFy1K2BfIGhnnsDTXnVx8gbCpMDhPagJvLMqxl0g18Ujk05CeQqw==
X-Received: by 2002:a17:90a:284a:: with SMTP id p10mr37390060pjf.198.1621260891722;
        Mon, 17 May 2021 07:14:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/35] oeqa/qemurunner: Improve logging thread exit handling for qemu shutdown test
Date: Mon, 17 May 2021 04:13:30 -1000
Message-Id: <57249316b6c66c5e17804e1b04f2d5cf0db92683.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than totally disabling the logging, inform it we're about to exit
so we can log messages over the exit cleanly too. This aids debugging. It
also avoids a race where the logging handler could still error whilst
shutting down.

Also remove a race window by notificing the handler of the shutdown
first, before triggering it. This removes a race window I watched in
local testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e19f31a1005f94105e1cef252abfffcef2aafad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py |  9 ++++-----
 meta/lib/oeqa/utils/qemurunner.py       | 12 +++++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 7e676bcb41..da22f77b27 100644
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
index 77ec939ad7..410789b815 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -467,6 +467,10 @@ class QemuRunner:
             self.thread.stop()
             self.thread.join()
 
+    def allowexit(self):
+        if self.thread:
+            self.thread.allowexit()
+
     def restart(self, qemuparams = None):
         self.logger.warning("Restarting qemu process")
         if self.runqemu.poll() is None:
@@ -560,6 +564,7 @@ class LoggingThread(threading.Thread):
         self.logger = logger
         self.readsock = None
         self.running = False
+        self.canexit = False
 
         self.errorevents = select.POLLERR | select.POLLHUP | select.POLLNVAL
         self.readevents = select.POLLIN | select.POLLPRI
@@ -593,6 +598,9 @@ class LoggingThread(threading.Thread):
         self.close_ignore_error(self.writepipe)
         self.running = False
 
+    def allowexit(self):
+        self.canexit = True
+
     def eventloop(self):
         poll = select.poll()
         event_read_mask = self.errorevents | self.readevents
@@ -649,7 +657,9 @@ class LoggingThread(threading.Thread):
             # happened. But for this code it counts as an
             # error since the connection shouldn't go away
             # until qemu exits.
-            raise Exception("Console connection closed unexpectedly")
+            if not self.canexit:
+                raise Exception("Console connection closed unexpectedly")
+            return ''
 
         return data
 
-- 
2.25.1

