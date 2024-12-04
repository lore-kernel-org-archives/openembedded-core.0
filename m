Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B263DE77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.25154.1733344601894811747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qNM/UVsl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee88b57ac0so197252a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344601; x=1733949401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GSZseudCqN7r+90UD7nlzL8y4hy4uzqacA/Inzr9jk=;
        b=qNM/UVsljZEstozwP9pXCF6yNpTv+SQ9+MCg7HPCZ2k01tGzWr9sh9T5m2v/324B0F
         72yRifdUFwCUWGprjoQdsjmZRDhSeWbZ8Mcbx/vNFotT/0r/lytCjCvJaShTLX6MNKAo
         4ajzzBHY8va/EjaKAj2iQrms9B7moVISCtj4WAGEASHTwxb02JRd7T7YbO+j67kKE9h0
         hHeOhtTl6p64BbTRHAQT9OYoeC0Yx5pxwlUgpQISSawaxhv+vQgF4xQ/B4nnjOGlP3x0
         KsbhP3IsEAW0InIkeJPbOuDr6Qb7eeRkaVk2q/uueGLyzoay4L9yo3S/VNmwlKTfsS+M
         feKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344601; x=1733949401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GSZseudCqN7r+90UD7nlzL8y4hy4uzqacA/Inzr9jk=;
        b=aHM5YXKzeIQRHWllfQZg2i62k6efJk0//uq5ygkaodqfphOYEmbGnecwUIoC9ugzJF
         sVty1FZv3gzfdOQ0NIQtJgbMbP4jnH8ioYy8JBKM0BHDOFfBjY4VtYw2Y8ncJ5+S+AC8
         DD81G5NNRY8pU87jOGRQKeKKIA/S225BTtRdSiayWgN7rSrpyzr0nL3It78ZJb3FawPp
         v3pAQ2QsF+b6pq+1bxIqLEMiUvEOAzks4ihG7tlNx4niStEmI9ZAG1YxRYEpKOqG8dVm
         6mbYaAe2MekSRCmSIkRRaU/n/DSFgr4YUwjAxaSlzqGCmkl2snsT343osDqREDSxa308
         ca6Q==
X-Gm-Message-State: AOJu0Yyi/SZHIHF//wCYDyZXLVlg7zWcXAo0YCSSnuhWz4FfwTYI8s6D
	4H1W7smr4UQLRSdFNWI8dkb0/ptGdgHR4wArPgS9/8XCIR/D0jQ7DN7ulcIzcfIBdO+y7fsbwQ4
	l
X-Gm-Gg: ASbGncu9Uoi/j/0LDghIUkkF+koPMzFk8ZE/R92+OT3z5Y2Q3dwjgLO1hvxkUZQUW67
	4zWAaCD1zlEsEB+EhhbUMWDEP5iw7Q9T/8T+bfaHP/JfXlyKVETpE8LiOlC3LknilYqoax/Ee1W
	Cgg833YjyoU0RZTPZGkRz1st5DMmWH3/7YIeSVzOICHkgI4njc5MRYN5Jiz6PibCSJQ+3cd64Nl
	BxjjMo2SQ1mRZJupkfnfB+Q7ANK9y2wD0WwE7g=
X-Google-Smtp-Source: AGHT+IENTyxfRp0T3YzaRbmLPRlyGKSDb8vksRcQ1zO3AUthjaQwajzqxpYDaGWCLH6/7REQk3sq7A==
X-Received: by 2002:a17:90b:1058:b0:2ee:843c:3170 with SMTP id 98e67ed59e1d1-2ef41bbac6emr1099288a91.3.1733344601130;
        Wed, 04 Dec 2024 12:36:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/15] resulttool: Use single space indentation in json output
Date: Wed,  4 Dec 2024 12:36:15 -0800
Message-Id: <03fef3a99186863a0c460bd89bad40f2360a6930.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208336

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
index a86a706bd9..b683d9b80a 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -357,7 +357,7 @@ class OETestResultJSONHelper(object):
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


