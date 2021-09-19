Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.532.1632070460685862728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 09:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aIORkN25;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id y198-20020a1c7dcf000000b0030b69a49fe9so1772898wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etFE8is1zFQ5xKOst+SY43xQHT9LSiv8pufOlNhX4dI=;
        b=aIORkN25G5bIdkY2WyAzrr/Bl4Byvts0u5g4xJA4/P84LJG1CDvToap3loYAUPMzRk
         5AKmHW/M9T925yz27BiGykAnHkbOlTfRz8UWQDjQWIQn1bx8ToXAUMtvn/3znZbVRciZ
         prb4KgTbT/ge1/FHkBV82Scq00i5AsTMpC6slPrbELDG2z7/kb0zK3mrQIwOzfVOqB4Y
         WY9nz3YUZX8WFwV7QMUx5mPMcAn7cHcD3NzGgaEeM5yrcMQS1BCZNXmyweNQvDOrDU6+
         Kx2XPGXp24UBaqGr+C3PUAO5f3ioay5LIPhEYu1TCJeA/C7HpSD+PSJjrvG71/UHSgma
         oecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etFE8is1zFQ5xKOst+SY43xQHT9LSiv8pufOlNhX4dI=;
        b=0QuJjvE+VdH4uZywGjhSvwEf7294Unfr3bhNTzlTkctmyRHTUXWeNAX7ngeNg5jait
         3yi55S0O1cwTLu0gwGGIOmyRXctBqqfUKDdqkyXrX9Qys0L2zSJTfu3qLNRU/zn/+C5w
         zku4X2sK/gL3HPyUhXOMHPOpkfg73bFagY1kQqR6M0cDnoa+q6fFoq0MmtYvKjoVuW5y
         1ZHvLfjdQvijJpBYYLRKxMaVxhSDawb33rF2MCpfd5NmsOuxtLFmvNjlW+UtIYHbGsvw
         QS/OxjNwLNQzeP4ruYFN2KDdDwTnzVeQXRIUxGaExVVbOfvhKoglDbPqmyrjn5JQIlKA
         uYCw==
X-Gm-Message-State: AOAM53080p8X5FdAXIDJx2HtEnIb7JzHapeHe5zh9wntG39OUfawMOlJ
	vf8BMACyXP9x0pS+LyG+SzqYLQ6Hneg=
X-Google-Smtp-Source: ABdhPJyTxDYnf0Knj/GaaXz/3HxRSX2+r0WQN5oqaXDwPGVlAFhCFLejxBC9ZawvgkURr5wGx3fJcQ==
X-Received: by 2002:a05:600c:19cc:: with SMTP id u12mr1414747wmq.0.1632070459146;
        Sun, 19 Sep 2021 09:54:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 135sm8688211wma.32.2021.09.19.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 09:54:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] testimage: symlink the task log and qemu console log to tmp/log/oeqa
Date: Sun, 19 Sep 2021 18:54:16 +0200
Message-Id: <20210919165416.1199448-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it easier for the AB scripts (particularly, collect-results)
to access and archive these items, as they can contain useful information
when ptests or other qemu tests fail (and also if they don't fail).

[YOCTO #14518]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/testimage.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 3c689aec913..8fd04c99e72 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -201,6 +201,7 @@ def testimage_main(d):
     import json
     import signal
     import logging
+    import shutil
 
     from bb.utils import export_proxies
     from oeqa.core.utils.misc import updateTestData
@@ -408,10 +409,17 @@ def testimage_main(d):
                         get_testimage_result_id(configuration),
                         dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
         results.logSummary(pn)
+
+    # Copy additional logs to tmp/log/oeqa so it's easier to find them
+    targetdir = os.path.join(get_testimage_json_result_dir(d), d.getVar("PN"))
+    os.makedirs(targetdir, exist_ok=True)
+    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
+
     if not results or not complete:
-        bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
+        bb.fatal('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if not results.wasSuccessful():
-        bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
+        bb.fatal('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
     """
-- 
2.20.1

