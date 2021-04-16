Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8237.1618576611326296013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 05:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g26rELxP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id x7so26520891wrw.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6vXk/CL533Y1+M7hd2f9Kq+imTvCpet5fCzDvml+nQ=;
        b=g26rELxPma7y57KBx4GNuwAJmvbkVdhZdtPmSI8Ii/JgMOEocVpkb3uBlA8bFor2JE
         DOPM1B1SxGNNb42zs3F+9VnXFzSmkrN03AH930DzCepCtU5leCJaJ7cRPI/eCnCHlZP/
         l2clbuEgi5fn3qSqjImutPPpicPTR+kNN2+2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6vXk/CL533Y1+M7hd2f9Kq+imTvCpet5fCzDvml+nQ=;
        b=anBdaVe4mdrUgwKyJ9s9zgHf86zLr+TYgneNBCuUCAzEmsg68n2kR+y+jaFarFtpNQ
         /1Y21mKCna4KRDXGrPTysKkrhvrMcHhIkJ8yLDWHsBk037oym8m7xfWfX0IWfo5xTFvN
         rhoZ4NAMd5n+JF5FtNVlZTsT46qBqm9NDJGe/nZ3AMkegesOJt47p1F3isAzwmuuZI2q
         32HVbbl0bz1qNNZ6N75Or8uqQ6h+0b4FaMDEUSlwQr7gTYg5guHbffBxnJMxfz+E7lyO
         O0yv3eBECOQq99ttjSXJbsnC3MbqIHT3HrSeqODhC4v1h77AdAPd02ExrCVao3gf6Uhg
         gCiQ==
X-Gm-Message-State: AOAM533Dz5AwSDUoojWE+Z+ppX7dVqywD3Bb3ib2849vJkWdh3aUckFG
	UGCoHYe/GHg3qItEKHFutBpUAtFvGBm1Ag==
X-Google-Smtp-Source: ABdhPJwyNgz8RyACxUh454o91VsYIXl3FDu1yp3EqbbF0t+XnQQO7zU1OiJ2dKLoz3VVfbbL8gSF4w==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr9085856wrs.288.1618576609629;
        Fri, 16 Apr 2021 05:36:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2f18:3933:16db:89cf])
        by smtp.gmail.com with ESMTPSA id d2sm10143953wrs.10.2021.04.16.05.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 05:36:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Hardcode test assumptions about heartbeat event timings
Date: Fri, 16 Apr 2021 13:36:48 +0100
Message-Id: <20210416123648.1366311-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting a value of 10 for heartbeat events causes the test to fail. Hardcode
a value to ensure it works correctly even if the default is changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 20fe8ed8f63..1859d3222a5 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -58,15 +58,15 @@ class ImageOptionsTests(OESelftestTestCase):
 class DiskMonTest(OESelftestTestCase):
 
     def test_stoptask_behavior(self):
-        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
-- 
2.30.2

