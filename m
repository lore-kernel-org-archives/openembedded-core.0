Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.32434.1620657087885541540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qJdqvhSv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so4432061otq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KT3gak1tpG7U4rF53LO1+6iqw/FS9BmZpSWyhDekJCM=;
        b=qJdqvhSvQclNdM+6DdAXthFyc99qF38gcHEmxe74L1vrua/uYg/sttD7WJgBCELkrs
         9YaPHB12FJUT5maauwtzuX9CtV+Pjb6jxAjXDKJbudrsdIJiRmaP5ny4uLOqpL+j4Dof
         Wmy1LGdhEzuHwXs2GOMVUjsDIChNDSOC3+RSXj4izGZmqOG3ePBv2StV2qqrVWBV5DKb
         CXarmgk4WE5+d7OWQfDfyK9Q6kvesIxeQ63e4dzdxzuEazcUTjYTRj4bjPaImndf8K7o
         Frc1HFwpM6bJ7mdWgvL0PA2OARFjrurRkWcTXikOkSwNHY79LLWxBb/poLlVP0g7Yt9C
         Y1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KT3gak1tpG7U4rF53LO1+6iqw/FS9BmZpSWyhDekJCM=;
        b=Zv1kuyhgCTlFpZkWBxVxCHAv4l2GtI5WevQS/YaYHbwckfxRzqgfxQAVSlnuSR9jeX
         BuRzReCoDm7CZDh3XDbAT26ycM5dpRAYWZAERUjScTDa5/6Wmjz4ukD5OWa8aWhC5RMs
         L6r/vWn9M+W9ctjeCoAwP31kImjpL5mTf/MU5A6Xipvvz4ooq43TmucbY/Z+MsH6ZfUs
         ntkp0MMiGdKZxAeyf5Y/Ei7twFicSS3fxlt8N8dfUSal7aluCACbfcU0JhI2nAZk72eh
         azP9OreS5qL0y7VqChA++wubyVEVFUmeoPnIcPwaQ4sVuxD9n40+DFro/vlWQijMKk+P
         uwdQ==
X-Gm-Message-State: AOAM533ewZLlWLZ+6Q9W+nasnAmjQj2uebx5d2gj+JOD0mvOeKt0GSoK
	NfQjnrepW02eYuopeMWMxzEtJGptsaEiVucMt9Y=
X-Google-Smtp-Source: ABdhPJyFBcJwhBe7ZMcgwma6JiGuIGAvPJP9yOujdGnlN04NOe4j+yte8b8L3X82X3MTYR2Cfp8InA==
X-Received: by 2002:a05:6830:1ac3:: with SMTP id r3mr14674784otc.322.1620657086742;
        Mon, 10 May 2021 07:31:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/25] oeqa/qemurunner: Improve logging thread exit handling for qemu shutdown test
Date: Mon, 10 May 2021 04:29:02 -1000
Message-Id: <07aeb15203c9c89ae82a814961b27593156e723a.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
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

