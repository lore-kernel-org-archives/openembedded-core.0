Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.26700.1592249784471527666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vlcrZujO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id l63so5776817pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zWSKkJYDL8/slH4n2f4G7Ga3bTwjf9YwZnWFVC+c938=;
        b=vlcrZujOMEIUYSXRrqC2GGwsK81gOPFv275DDr3rg1DuGnLGoOXISaJOuctNC1kQ/R
         z8X0zP86Y+h3bqDnVuJrpN3F3q4fvBQs+O6jLROn/8VjBlKAmFIk37yGhtLPmZypS4v0
         U8kI4ljDbKYRc0gKZi5zAgyAfS7RI78QZ0ZIOejHDdjebKRs6PgLQyDL+k/0cfZUBEFy
         Liqt2zKk5BM+e42bTeCHx5YhpxI5Qt/J9OnvApAHThm/0DuGUu75l6au8mw3ZGgQ573F
         5kxUw/Z7K2SaQGuJqoLwz/o8rzrlrXCkQd5GbuDPIW7IxpyiSJPW6snQSa7bSsOlCXGK
         F0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zWSKkJYDL8/slH4n2f4G7Ga3bTwjf9YwZnWFVC+c938=;
        b=Ru9yd7FHxqLKh1YCrMkhSiaI39eBOz0WIdeFq/8aqvxTznAK9yISMC23EbkfbR1fGg
         rOw1St5GmvPozPM9WVnncR8QuQFEIc/neQtORAzxG0HnVJTJXOifwSUq4z/0cbOcaORD
         fDvqxmuhi3f2HeXCE/GnBat957f6Hrg9H8pR0YzV9yLM8vYYRFP+7M87JU3RrQmFruNE
         RPgwqcq5sapCVDB75P0mIMez5GkKd4erjVYMn4Z5s27PQ9fuS/utAq/OyHphw/VFundf
         KQwfuEO48Ciu8dOyd2Q6ejxzi0CL/fbg8jRAOKdDdsl2VBGil/5Rotm9BSAo7IqFkfie
         rq1g==
X-Gm-Message-State: AOAM530ErpdKB7OQks2oy5j5FpwCz9LPzqY/CbIVi9ZbypsJZfciPeeO
	Uu1sgYVgclfJYYWYEKk2KKCwB2rKQJY=
X-Google-Smtp-Source: ABdhPJwLilcyniox8DGKVbXug6AqZELZ1JsotM7769ZAdIN0ldhobVD9YB1HqbYUJP5Pe7HrhgDifw==
X-Received: by 2002:a65:40c5:: with SMTP id u5mr5836492pgp.80.1592249783432;
        Mon, 15 Jun 2020 12:36:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/21] oeqa/targetcontrol: Rework exception handling to avoid warnings
Date: Mon, 15 Jun 2020 09:35:28 -1000
Message-Id: <bd2d32903f208b6a70abaa29b980db1498b84a02.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing:

WARNING: bitbake/lib/bb/cookerdata.py:136: ResourceWarning: unclosed file <_io.FileIO
name='tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemurunner_log.20200601181912'
mode='ab' closefd=True

which can only be caused by the qemu.stop() method not being called.
Tweak the error handling to fix the blanket exception handler which
is likely meaning this function isn't getting called.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee707090848d793e3b2d82dd3861ae22222682c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py  | 5 ++++-
 meta/lib/oeqa/utils/commands.py | 5 +----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 2aa548e1ad..7bbba6016b 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -182,7 +182,10 @@ class QemuTarget(BaseTarget):
         return self.runner.is_alive()
 
     def stop(self):
-        self.runner.stop()
+        try:
+            self.runner.stop()
+        except:
+            pass
         self.logger.removeHandler(self.loggerhandler)
         self.connection = None
         self.ip = None
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f1679875dc..df373c4169 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -351,10 +351,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
 
     finally:
         targetlogger.removeHandler(handler)
-        try:
-            qemu.stop()
-        except:
-            pass
+        qemu.stop()
 
 def updateEnv(env_file):
     """
-- 
2.17.1

