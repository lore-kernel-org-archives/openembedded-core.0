Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web09.12409.1603111952662928006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WQrV0sNr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id i1so11314120wro.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uImfNHcvzf+f8RQ8fu2lKrRXjUzZWEjKidVH863OZ3M=;
        b=WQrV0sNrD0BSqAEEn2jIeDoTxnZrDEKZ8cb5rdXZ1RW7MxScjHET/r/LBFssnNOi2d
         3wY3lq0XQpBUU+TyU5y3THvSBVzYmHVxPzkiqfy/W3LjOWSmXb5/yQ/ZZP/liXPuHNSZ
         ZDzFs5S3XNzlwf/HJ29/Ydc+MISnzaFbDdlSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uImfNHcvzf+f8RQ8fu2lKrRXjUzZWEjKidVH863OZ3M=;
        b=s+Mvk3j6/14eaTLxFiVnxFDrkQGEL/zhzhP01kZ5mRyBLvUtDgXBt2VpcJvUZ7fqnq
         HDuV6x6yJWOv+9zYS3y3X3bbRTmaRc4Mgs9DyVl4g88Xxk/zympr+EdcL+blnSQNb+wu
         dV5EhskT9N4DtA42gQVZ6FFpc2jw0xG03qqFPEzfEWMDdSKC5BP1e7M1HUEH27wX6WMm
         bF3SWmPbJotddbMKE9OUhSoxoNgvEUFkCvy181JaMvEDs5ELC1X8qGWp5MEhE8POa7Ql
         RFvWz/6B1u4bLtlqU/cb4giz3Zo9LvyfGfYxLaBhhypTRnefPxfsRsE2iKCTIG4iI01I
         5h3Q==
X-Gm-Message-State: AOAM530GM+vjbHc/TRFIyNkTDg9RjqU/UzDuHCLXE1PDVVJgc29IpqsR
	Ro0Lok3/EGkRfp/x/DezpJX9EuVZVnHzUA==
X-Google-Smtp-Source: ABdhPJwpxl8FQNhM8aelCOlAFnJitJMm3+PTEM2pwLg9GJKfZ9ItZILIhlpJLphKo2e8KFt0EL0onA==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr19408194wrr.184.1603111950822;
        Mon, 19 Oct 2020 05:52:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id j7sm18730010wrn.81.2020.10.19.05.52.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 05:52:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa: Add sync call to command execution
Date: Mon, 19 Oct 2020 13:52:25 +0100
Message-Id: <20201019125225.3621348-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We previously put a sync call into devtool to try and combat the bitbake
timeout issues on the autobuilder. It isn't enough as the timeouts occur
mid test. They are also occurring on non-devtool tests.

Add in sync calls around command execution instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 7 -------
 meta/lib/oeqa/utils/commands.py         | 5 +++++
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0185e670ad0..d3d2e04c20e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -107,13 +107,6 @@ class DevtoolBase(OESelftestTestCase):
                         'under the build directory')
         self.append_config(self.sstate_conf)
 
-    def tearDown(self):
-        # devtools tests are heavy on IO and if bitbake can't write out its caches, we see timeouts.
-        # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
-        # hit here rather than in bitbake shutdown.
-        super().tearDown()
-        os.system("sync")
-
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
         self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f7f8c16bf00..7016f90c6a2 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -184,6 +184,11 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
     cmd = Command(command, timeout=timeout, output_log=output_log, **options)
     cmd.run()
 
+    # tests can be heavy on IO and if bitbake can't write out its caches, we see timeouts.
+    # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
+    # hit here rather than in bitbake shutdown.
+    os.system("sync")
+
     result.command = command
     result.status = cmd.status
     result.output = cmd.output
-- 
2.25.1

