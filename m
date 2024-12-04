Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F340E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.21220.1733334910487995645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LvhkWOXv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fcdb53cca6so64906a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334910; x=1733939710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+Ej6xPFqCU399vWOIIr1CMedQCmL0CSW9xkukxEKGE=;
        b=LvhkWOXvyirg6Xvicj2kXeklHNtjmjhbipA+HIgDY3ybbxfUtUhMugP5UJu5925bCN
         PBwoekxTebREAcO35/+nUtAFcv02ylXbztgpTMfk+Q6Tg/8t62lwWPoVug2eMpq3q86Y
         yaY9FtLxLlW+rwU2jCe/bjRqM0FNBfEyj9EPAiaNDtOzD7w1GzMErEh+rYxmi9PFmvyy
         ECd2sfEfv2I0W12INXAxtNtAOjDsiuOPMs3xFYav3/Mndi+7vrvQZ4z2N9P6xo0fEJPT
         N1neeKKsDRrqvzDPZidWEZiuG+C8Pm6aNA1+UjEcuXlkfiUn/dG+0Zu/htm1GieOeh7N
         2zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334910; x=1733939710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+Ej6xPFqCU399vWOIIr1CMedQCmL0CSW9xkukxEKGE=;
        b=qbRcNFGPjISLMrBNfLQV1V7lx9UlTWoBRykoFUhhnVsGaZwUWA/rNzccKjtKbMggic
         GK9gnHEtwxmEs94GZfTXHn5pK/JlvbIiPBa446ZoAyEh2zpme5rfzSUrxzH1J42EIWnB
         imz3kJzB7nyh0LQbXECnfyikLSxQ6/Tscd8ZpR4C7KnD1ZuTxF9lK9Tr27VMTAZRnfKu
         oYV6xx6goEboK/BD0KRpjQcPzvS5r73KBbzMAmFYVNejs0TM2r4dt616/jehJzUZRvlw
         7eAuhOkSr3BUtdE3Vll5Kh/I0OC8YP6rRyAWgmc3RPtuQ62KVuQKn0CvqZnQaQyBEGaC
         mKVQ==
X-Gm-Message-State: AOJu0Yy3bGlGKW0m6FWFfBvkooElnYvmU58a/q2qKeyrR941P2qZK62S
	238+iLs58YvWuJ/tQss4PmcxT0BepIsYneMjabNJUUH9X1TtQFPXPbdtNJd/+twkO7ZqSPBqlqi
	M
X-Gm-Gg: ASbGncs3giuZvoZMyiw1wdDNbQAmLcAODmkWkuXYVAwhtmLck6/y258tNCowiqOCIPa
	q9n7N5zovqnFaAxmhT7O1JJ2vULvNgUQfKHH91wWta5j2KMpEwf5lVUQzPyTsSy5s6x6OSDrEl4
	ICdfi2mdM5mBOi01rEAAL01VtAZ2MN3Yb8jO/R5EMp2RWZVJaOruXf9aKQeJB+o85Yb2mXZATcM
	ICE6TPsCk3S2/JEexLM8HpZ5CXtmvuRNtHhmdQ=
X-Google-Smtp-Source: AGHT+IEdLMfoLUQDvrf39uq7MBOcK/LosRSHJyp0Qtydkk20S4iFStQiBY+KcDqKZEEQOFHdmkkgOA==
X-Received: by 2002:a05:6a21:3289:b0:1e0:eb49:b81b with SMTP id adf61e73a8af0-1e1653f6b69mr12369773637.31.1733334909642;
        Wed, 04 Dec 2024 09:55:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/38] resulttool: Use single space indentation in json output
Date: Wed,  4 Dec 2024 09:53:58 -0800
Message-Id: <cae6106f152c8c44e2d85179ad7e6831b974ffd5.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208314

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Using 4 space indentation in resulted in hundreds of megabytes of extra file size
in general use. Reduce this to make filesizes more managable and reduce the processing
cost. Some level of indentation and spacing does make the files more readable and allows
use of git diff so we need to retain some of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a274cdcaf852cca9497f0358f44dda99c06aacbe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/runner.py              | 2 +-
 scripts/lib/resulttool/manualexecution.py | 2 +-
 scripts/lib/resulttool/report.py          | 2 +-
 scripts/lib/resulttool/resultutils.py     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index d50690ab37..a246c7d26b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -347,7 +347,7 @@ class OETestResultJSONHelper(object):
             os.makedirs(write_dir, exist_ok=True)
         test_results = self._get_existing_testresults_if_available(write_dir)
         test_results[result_id] = {'configuration': configuration, 'result': test_result}
-        json_testresults = json.dumps(test_results, sort_keys=True, indent=4)
+        json_testresults = json.dumps(test_results, sort_keys=True, indent=1)
         self._write_file(write_dir, self.testresult_filename, json_testresults)
         if has_bb:
             bb.utils.unlockfile(lf)
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index ecb27c5933..ae0861ac6b 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -22,7 +22,7 @@ def load_json_file(f):
 def write_json_file(f, json_data):
     os.makedirs(os.path.dirname(f), exist_ok=True)
     with open(f, 'w') as filedata:
-        filedata.write(json.dumps(json_data, sort_keys=True, indent=4))
+        filedata.write(json.dumps(json_data, sort_keys=True, indent=1))
 
 class ManualTestRunner(object):
 
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index a349510ab8..1c100b00ab 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -256,7 +256,7 @@ class ResultsTextReport(object):
                 if selected_test_case_only:
                     print_selected_testcase_result(raw_results, selected_test_case_only)
                 else:
-                    print(json.dumps(raw_results, sort_keys=True, indent=4))
+                    print(json.dumps(raw_results, sort_keys=True, indent=1))
             else:
                 print('Could not find raw test result for %s' % raw_test)
             return 0
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index c5521d81bd..8fd4e0a9cf 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -169,7 +169,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         if not ptestjson:
             resultsout = strip_ptestresults(results[res])
         with open(dst, 'w') as f:
-            f.write(json.dumps(resultsout, sort_keys=True, indent=4))
+            f.write(json.dumps(resultsout, sort_keys=True, indent=1))
         for res2 in results[res]:
             if ptestlogs and 'result' in results[res][res2]:
                 seriesresults = results[res][res2]['result']
-- 
2.34.1


