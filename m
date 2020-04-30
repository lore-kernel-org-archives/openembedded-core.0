Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6037.1588249847163369391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 05:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ECZInaOf;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k1so6682225wrx.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1C0qRRFrCu/baAKXDYpClmkqBZ+CmCguvzyEqTSvJnk=;
        b=ECZInaOfVlT28qUPdTdZtC3bDRNHPfJG2VqYCwF8OJyupqNmp3uPBClWue+AGf05vv
         JJHl7nEuq6ArXPLto4NoDArl/WSzqgpoBDGssGtg3qFKQSeZejpRRWeUsA5nG3vXYvMB
         PEejYqo8sklACb2Mcv93NL1Zm8pjmzGt/7laAOF28ovkyV1k14Z6+dz4JgNlYZDJNw41
         PNm8PwG9mGtlgbsh1ev/5aDRMvw8IGB3L7El9+YOYlDx7ZyyHYpYUEMX7E0pFCh5QGWp
         +nM4uxD/z/BSBsfPCloULikcHC0Y5p0tqaiLSFlTWpjQYuWZTDPFCH72nPSfuntdEOsF
         I6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1C0qRRFrCu/baAKXDYpClmkqBZ+CmCguvzyEqTSvJnk=;
        b=aWpzZivvUUAdJxulWLAMgY8pXGx0PiHuOkU2feKK/VlhpkrojKChMnJ8caVcIZe9CD
         h4axUs8NcZMOyLM3aSXWfqHgqBFL7M9zUp2zd6sBfsir9yyTl1K0Qo94t28FUua4W+pH
         genPbafL/VOapPgvnBn590/FGmdiftXYV1aG9b63CyM6Xp5s9sspy2D8OLHeyXfaydI4
         tb+mYnTYsN+qcXhg5Pc5YPUePQY9Ot8raXaXa2rNVBCc/LiNaBpCfp9ezwDBZV944yTo
         MZckv0xidbCsOXbl+NJFlrBJ9OW4phQlwHMki9CXtx8ltE+q51h6p0rguq36ipLNQ//z
         gIUQ==
X-Gm-Message-State: AGi0PuYt0oC1XSJ71vZCWMDGYYUTkE4MLztiaYM0DHJRD4ZK+9pj9A1T
	lmUstulqrPtXxLfinZUOjLhS42EV
X-Google-Smtp-Source: APiQypKndKviP61Kull7866p+SuiOv8nIpescUVDV7tQkkn+t15vUsfCgj0B+dFDs0OAfahqSt1jBw==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr3493219wrc.47.1588249845448;
        Thu, 30 Apr 2020 05:30:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id k3sm4102585wru.90.2020.04.30.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 05:30:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] testresults.json: add duration of the tests as well
Date: Thu, 30 Apr 2020 14:30:33 +0200
Message-Id: <20200430123033.6931-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is printed by testimage, but isn't actually saved.
It's a useful metric for tracking execution times.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/core/runner.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 1284295c34..00b7d0bb12 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -182,8 +182,10 @@ class OETestResult(_TestResult):
             (status, log) = self._getTestResultDetails(case)
 
             t = ""
+            duration = 0
             if case.id() in self.starttime and case.id() in self.endtime:
-                t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
+                duration = self.endtime[case.id()] - self.starttime[case.id()]
+                t = " (" + "{0:.2f}".format(duration) + "s)"
 
             if status not in logs:
                 logs[status] = []
@@ -191,6 +193,8 @@ class OETestResult(_TestResult):
             report = {'status': status}
             if log:
                 report['log'] = log
+            if duration:
+                report['duration'] = duration
             if dump_streams and case.id() in self.logged_output:
                 (stdout, stderr) = self.logged_output[case.id()]
                 report['stdout'] = stdout
-- 
2.26.1

