Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.5785.1591152853675399398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gdqtg6nk;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id q8so590710iow.7
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LFS74GDyyiD79kOgj3nrAjYCB6J2JSP241c4fS/U/+c=;
        b=Gdqtg6nkSfz7EW1AmY+5rx8LiEEP3LSLiWrmBAyfvFsB3ewaJne3OlKf4GNUGd9QL+
         PThOKxJQBW2qQzCX5mILfRyUIoUv5xs4/L7fTBPgyQW84x7VaNPcBwVx/HBeN+jm5/ob
         Y9baqkzO1ri6UpysS7ByrQrr9KjsXI9pphsWtYPg/D7BQy41YRw2GCFkNN2itFmbPHKU
         LDHL2LewyGZslLK8LeZNUoysABM4cc1q1WfQdg9VcW45Mx8HDQKsfCuAuieSwNjVe6P4
         Zy1OLIXngKw31JSccYHZA6rH4+o0FO+h11tkY4fOro0duZSgYJ8vfTurgWSnJM7V3ATL
         Brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LFS74GDyyiD79kOgj3nrAjYCB6J2JSP241c4fS/U/+c=;
        b=A/5qgHhvpN/yKvIOJmcGWEX6K+1wki+d2rBrAVRkCPypYsyy4632yqV6EyIVVKesfZ
         SF3fjZ7ry1l6TQicsBohEjhNRCLtRWxwzCwkKtemAN8T7kEbS9MmwCSDVVW5vP5x45kB
         w9BuuHGfwFoKmTWf7RSQNFTp4NjSZwipmInFjIRsmsimUYP++h67AG2lid0P851jpO7T
         G4MXyIZa2sAZlpliuU+hQsJPcjcNpbg02QwHW4N49Toxh1/euMzX5gwYXUreQPnmAvZY
         DV9VKQL9tuN9Ua++w+RDulxVUF16KiXfPjNTj3iSenj5i6iC85LSeCIZuWU9L50l13+Y
         V3yQ==
X-Gm-Message-State: AOAM530rItkSImM3yTMk0mNn8iygIVM5Qez5yvDSO916jOIKBD97PZpB
	2phmdbA+wED40B7GHL4387MS/rz5Fo0=
X-Google-Smtp-Source: ABdhPJxZPnK9zQNoGp++ZhDeBqa/lBCCcHGDWzRWJd9TWqARgbvzM4146q1WuTw84n6AZmRYC6auZA==
X-Received: by 2002:a02:1607:: with SMTP id a7mr27035919jaa.14.1591152852696;
        Tue, 02 Jun 2020 19:54:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:12 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 3/8] bitbake: lib: Add support for Logging Adapters
Date: Tue,  2 Jun 2020 21:54:00 -0500
Message-Id: <20200603025405.26885-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603025405.26885-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
 <20200603025405.26885-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creates a BBLoggingAdapter class that is monkey patched in place of the
logginer.LoggingAdapter. The new adapter is compatible with the BBLogger
class API, allowing adapters to be created for bitbake loggers. A new
BBLoggerMixin class is used to reduce code duplication between the BBLogger
and BBLoggerAdapter classes.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/__init__.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/__init__.py b/bitbake/lib/bb/__init__.py
index b96466e654..2e2966c3b9 100644
--- a/bitbake/lib/bb/__init__.py
+++ b/bitbake/lib/bb/__init__.py
@@ -35,12 +35,14 @@ class NullHandler(logging.Handler):
     def emit(self, record):
         pass
 
-Logger = logging.getLoggerClass()
-class BBLogger(Logger):
-    def __init__(self, name):
+class BBLoggerMixin(object):
+    def __init__(self, *args, **kwargs):
+        # Does nothing to allow calling super() from derived classes
+        pass
+
+    def setup_bblogger(self, name):
         if name.split(".")[0] == "BitBake":
             self.debug = self.bbdebug
-        Logger.__init__(self, name)
 
     def bbdebug(self, level, msg, *args, **kwargs):
         loglevel = logging.DEBUG - level + 1
@@ -60,10 +62,22 @@ class BBLogger(Logger):
     def verbnote(self, msg, *args, **kwargs):
         return self.log(logging.INFO + 2, msg, *args, **kwargs)
 
+Logger = logging.getLoggerClass()
+class BBLogger(Logger, BBLoggerMixin):
+    def __init__(self, name, *args, **kwargs):
+        self.setup_bblogger(name)
+        super().__init__(name, *args, **kwargs)
 
 logging.raiseExceptions = False
 logging.setLoggerClass(BBLogger)
 
+class BBLoggerAdapter(logging.LoggerAdapter, BBLoggerMixin):
+    def __init__(self, logger, *args, **kwargs):
+        self.setup_bblogger(logger.name)
+        super().__init__(logger, *args, **kwargs)
+
+logging.LoggerAdapter = BBLoggerAdapter
+
 logger = logging.getLogger("BitBake")
 logger.addHandler(NullHandler())
 logger.setLevel(logging.DEBUG - 2)
-- 
2.26.2

