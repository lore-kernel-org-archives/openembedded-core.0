Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.12166.1631883567489159332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XtFEFnr6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i23so15079234wrb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uD7PDcBFluwt5y1JaFJXwba1QAjOpoU25/XIsMRpsCg=;
        b=XtFEFnr65MlkV59AG8sIIdF3Fx0okloUxJEEnFW2Lcps8y27pdb1m2oFFpLoZnGqJm
         rFG4Jn6nLt7mGvDfQPLYulm3uOSR5ktbDxqNuXaKfqtiq9C8jtHw/Rz+OjiKCd7LK83b
         im8JUhGBh19WuaxTsTJHUGzmcNWn8+LisI0MJ/XvLY3KIvEk14hBd9xJ2Cu2TACbB9Vp
         2/n3wN0B4uszUloOBZGw2MqudrCEudwmTxR4PbAxvXMvon62TBlRfgrgo73e+KJBDC6i
         3ApxaxjGTda2hS18h8c4LxZB2Rw8zCOjTtUcpcXouAhZZTCbq1A8Bs6OaDHsTmQqAYuy
         iM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uD7PDcBFluwt5y1JaFJXwba1QAjOpoU25/XIsMRpsCg=;
        b=OFUiHtj5h1h9pqpIYV57EydDA0G+6AajiuM+F94P2O6ZLQ2Zi5bLJfMHQMsN+O5T4a
         yQceNww+nqDOGiNQxXi/NThLjrkjAftFXNh1HaS1bJXIls9aHAW+TC+YiEAVENVf6C+1
         VhaNK++PvlPoTvEc0gwu6CW/CWdY/Bm+O78LR1gXn8DNJKOQXHpfjsvaEAGyUJ/hw3Ty
         lhPlO66jbOs49P976gf3Gf51JLBy6rTF06EVb0ZWlBzrtx87jTeAcPvmrP0SHIlQeq3m
         5MWKnXLqvAZUEMJf0dm3Mm7D2Gd09zCSMCZUPEdTs6tRxxQ4lDDNgVjSgVmrq3m8q4+3
         BsOw==
X-Gm-Message-State: AOAM533Q5YYSzl8sP22nhXBqLIXOREkfNHitlOR7/kxJRnY535X2HLXn
	d5opNRuNLX+97U//ZmiJWAqLSNnVl9Q=
X-Google-Smtp-Source: ABdhPJxz7dCieLkBZAGs5IUxG7jpck7ydjdGA8Y5NH2ZhvEG7Xp+BRalDORbOjvfTPPVTO5fjL4HDw==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr12028282wrm.415.1631883566139;
        Fri, 17 Sep 2021 05:59:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id j21sm6929041wmj.40.2021.09.17.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:59:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] testimage: copy the task log and qemu console log to tmp/log/oeqa
Date: Fri, 17 Sep 2021 14:59:21 +0200
Message-Id: <20210917125922.2435721-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917125922.2435721-1-alex@linutronix.de>
References: <20210917125922.2435721-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it easier for the AB scripts (particularly, collect-results)
to access and archive these items, as they can contain useful information
when ptests or other qemu tests fail.

[YOCTO #14518]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/testimage.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 3c689aec913..305e26d24d6 100644
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
+    shutil.copy(bootlog, targetdir)
+    shutil.copy(d.getVar("BB_LOGFILE"), targetdir)
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

