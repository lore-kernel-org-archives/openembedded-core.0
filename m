Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A85CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:41 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28653.1781814998406190764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=e+JOpCQN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-915d64fead9so260050385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781814997; x=1782419797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnK3cQAkJvSsE9KEoQeN0fuZPQkmRjocwgPx2HsG/ng=;
        b=e+JOpCQN452CBC9et8kIfweF4AeZ4779quBwoRB1ZYWjeRpkWBqIq7n2lRRdaK4TaX
         dqJfPvzVhipQwAUrXjRk3v0xJnkTRd44Qf0WDAoD6/hmogQTsvc0hGkN7Y092Nz4FBpC
         kgzscs2ukA3RlPD41+fu+/Fm0pX5vH3Vk+IydIlzjdoB/5cPwYKFG66tKSChXIf8DAG6
         tJjx2WCXJDiJeNT9vTLXNzuTxDa6wB0jf1TS48aeyHSfBFOJFJjCkfrFNWAnnCi07a9d
         Ddhzt01z0xJXVgmzIIjIQsBBByy4tc9854NamWFzQJaFDC3QUo4cVlcsC297V/KSRhJo
         +CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814997; x=1782419797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SnK3cQAkJvSsE9KEoQeN0fuZPQkmRjocwgPx2HsG/ng=;
        b=bLwvxJslRy22FwxDC1sYbtRIH/s2aKDs8KdpvZCJldw0YAOcy5/sp7SzUwHlTZyhT7
         WoSde2tXCmlXmXMekcop/FIy210W0hbskLuolNjTmqTdwBYxN5XsjVrimw0vaFbI3+s+
         /gJCA+0LD+vJOEhaJ3Tfv+qa4lUqKD18uBwKxwbZzfJ334QLLpGsTcRWcf+6RkJgW3qB
         rPC87J0tOK7j1xAbx9hJeM7rGI+8gqffYt7Nj7fy+LNYOLRxTz+0MTjRDK46+dhFKynk
         4teuKPAetXmubYZZvAeaeKIYDzrwOSduD1LnCHN0vtfg/3eyt0nsoN7gEOVz7WEjt6N0
         uwNA==
X-Gm-Message-State: AOJu0YyNYoJ+a2RUWl64uhkxXOe8NGET1uhQ5QBkCNT/UtRIdRMeGlIf
	97ZPWx10enFJfm4YYRjAg3hmn/dK16zej2O5N4uL0+Ibl7fkZjhnmaxV8NyLprvKJ5969ibOpNk
	dMMVFiUrBfwTr
X-Gm-Gg: AfdE7cmRiY9U+Ka0NEaxAUSTMFut8yrNLr6jICGs9yosFf3dGu62m1+5uMTAfmurOsr
	oqfAooKo3lRFwPHDCY/yB9HHFDhmxQplASSBDQr0mm9ejFGaQWifPW7BHq9w2qNXctPYVUk+ooy
	qDJXuLKvzSVcPdnVOfFl3Mc25v1pwniYVYA3qRKrlsBSEzlrnwl958yJTXxJTAtKO4JgZfcAE+c
	Rm66UnHxYlBtA9yGLCTb0k7Quagmgy5aOu5jvMvRNnsRFWdrWMW9jNcCmyHmjnkNhw9ejmKKEDp
	Swp/fsGdkUe8LVQGNWN5/2J4uLLj2JTyQI51o+QBG+w08RAaJkicutMqVF4CWrWO/UAwlxpbkUv
	Yiw6kofNUt3I2t3Wz1SLk4F6uV/UIXWy8UsY4DCN5vOIl+VlNlaad6rW1T/M+Qjd+/ejqP3vc8h
	QDga1TaT8j4jmCOkvZ
X-Received: by 2002:a05:620a:2611:b0:915:8e2b:e5de with SMTP id af79cd13be357-9208a3d5ebdmr93721285a.7.1781814997149;
        Thu, 18 Jun 2026 13:36:37 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a152b7f2sm20696085a.13.2026.06.18.13.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 1/7] scripts/patchtest: refactor results methods
Date: Thu, 18 Jun 2026 16:36:26 -0400
Message-ID: <20260618203632.131125-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239102

The add{Error,Failure,Success,Skip} methods used by the inner
PatchTestResult class re-use a lot of nearly-identical code. Encapsulate
the logic used into two new functions:

1. _format_test_description(), which includes all of the original
   syntax/tag cleanup logic
2. _write_patchtest_result(), which formats the actual result lines that
   patchtest ultimately emits (to console and/or file)

selftest:

|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 38
|# XPASS: 18
|# XFAIL: 18
|# XSKIP: 2
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 56 ++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 143cf08572..07c3ada6f7 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -33,6 +33,22 @@ logger.setLevel(logging.INFO)
 info = logger.info
 error = logger.error
 
+def _format_test_description(test):
+    return (test.id().split('.')[-1]
+            .replace('_', ' ')
+            .replace("cve", "CVE")
+            .replace("signed off by", "Signed-off-by")
+            .replace("upstream status", "Upstream-Status")
+            .replace("non auh", "non-AUH")
+            .replace("presence format", "presence"))
+
+
+def _write_patchtest_result(line, logfile=None):
+    print(line)
+    if logfile:
+        with open(logfile, "a") as f:
+            f.write(line + "\n")
+
 def getResult(patch, mergepatch, logfile=None):
 
     class PatchTestResult(unittest.TextTestResult):
@@ -74,43 +90,19 @@ def getResult(patch, mergepatch, logfile=None):
             logger.error(traceback.print_exc())
 
         def addFailure(self, test, err):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
             self.test_failure = True
-            fail_str = '{}: {}: {} ({})'.format(self.fail,
-            test_description, json.loads(str(err[1]))["issue"],
-            test.id())
-            print(fail_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(fail_str + "\n")
+            desc = _format_test_description(test)
+            issue = json.loads(str(err[1]))["issue"]
+            _write_patchtest_result('{}: {}: {} ({})'.format(self.fail, desc, issue, test.id()), logfile)
 
         def addSuccess(self, test):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            success_str = '{}: {} ({})'.format(self.success,
-            test_description, test.id())
-            print(success_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(success_str + "\n")
+            desc = _format_test_description(test)
+            _write_patchtest_result('{}: {} ({})'.format(self.success, desc, test.id()), logfile)
 
         def addSkip(self, test, reason):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            skip_str = '{}: {}: {} ({})'.format(self.skip,
-            test_description, json.loads(str(reason))["issue"],
-            test.id())
-            print(skip_str)
-            if logfile:
-                with open(logfile, "a") as f:
-                    f.write(skip_str + "\n")
+            desc = _format_test_description(test)
+            issue = json.loads(str(reason))["issue"]
+            _write_patchtest_result('{}: {}: {} ({})'.format(self.skip, desc, issue, test.id()), logfile)
 
         def stopTestRun(self):
 
-- 
2.54.0


