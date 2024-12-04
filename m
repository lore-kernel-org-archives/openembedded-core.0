Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFFFE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.25631.1733345137915371491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RmllBbwY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215ac560292so1550605ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345137; x=1733949937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GSZseudCqN7r+90UD7nlzL8y4hy4uzqacA/Inzr9jk=;
        b=RmllBbwYom+c3l0G6bmvTyvbmNPxOC7Z2UIbO0LK4hBzF5efMBETl3EI9D6QtGN8lz
         Bh+KzGxxAyzGDzhCIPCbe5vFan6G9WMyR8WIXnrYsPL1ikVGUHi1fBkY7YHmEyfVxqOD
         yru0DfgvloVk1WFshbZ+DmjQDvrq7Ne//zratOVEV/qKey4m0cj+hfMF1wPes0lJL/aQ
         LqXcF/X47BPtMoGmM9LlwaFGNY51u5G2/5OTLLsQ4ZyCO4uJUcxyNV6vMZFaFxuQ3NMD
         ru4YRgHhU3GM2BLllBQR8Y8S+/UrXLH8pEMa5dnzLG72G7sjuK4u15jFR+7a2T0RoHyC
         WrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345137; x=1733949937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GSZseudCqN7r+90UD7nlzL8y4hy4uzqacA/Inzr9jk=;
        b=kpn5C8LplC4+BKHqVDTG7tnA+ff6Gu2eVKoMmV3AtsKtfiPAWViQGV1mRao+3kWoOi
         p641qJCLimOlVf1NX/dIj/ffXQomdxo5feuQqADhkTTx7oDv2pKDJpJWPOgBXv+g8reQ
         rsOt6/C0q6tgsjnQc2J//6uFJcEdhQjaWMVdvlMplMUraEV7vXaQ8znnZBvPMFEAVDJ2
         nB/es5eAlh8MKfkG7YKeWo3TEwBMGEWKlO1ryIifsKneVkMaCh86lv8lui+SHtlkhSYS
         v1hmqm0TzICbikbi6r+w8pgJoJtcc1e1Xlim3mQc+vaK4PVldV55akInKQS8A/vdWTWC
         ASZQ==
X-Gm-Message-State: AOJu0Yz4mdfMQ4pP27zMYgFhLMZV0CKgWeU7PkysNWtyQpkcQGmHyvBR
	v9yXu848jkOvcvEh2aHaym1XEdCqZXiHQqgIkUyQyFPPdMdGG8plwSrGSGQ5kRU7el1DIPJ23wi
	9
X-Gm-Gg: ASbGncv0y2Qa6ZAYYtnWYD5+f2halc9XFdhcvNkau1+zk2ae2Z3sTy/BkNvOKs4iENl
	BaHii4tXFlkwoT7+x3RrxmW1Vimm8KG5f6WjaPt+Wii7ZIx61VHn9ivLftfRVg467fopCk8sizL
	3IbJKW/YJcBZ4fv+nBp9Dq+TRMb5fQG3YE1PZHRdFGv6lAKo/1i5jwmMPbyBjhdATykQK405KUr
	TJAiOowPfV67kDJjmceP1ZELAvtFkTsKMnL0Fw=
X-Google-Smtp-Source: AGHT+IErOJAGFZ1zgtlY9e/SBY/VpkOLvGDYcdbHz13yMcRp54a40++5hek3B/eiPxSK6k2aJULNMQ==
X-Received: by 2002:a17:902:cf0c:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-215bd0d84cbmr137734965ad.32.1733345137226;
        Wed, 04 Dec 2024 12:45:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/14] resulttool: Use single space indentation in json output
Date: Wed,  4 Dec 2024 12:45:16 -0800
Message-Id: <b8be3ac506bb39665390c770f72de2ca359670b1.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208351

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


