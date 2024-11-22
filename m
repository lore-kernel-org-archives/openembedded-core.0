Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23610E69179
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.28634.1732292623876438770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bokEfusD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431ac30d379so20593745e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292622; x=1732897422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv6DR/1fH9TeLdoZnHDWcNSnSby2DbD8Lr+nWluwzIc=;
        b=bokEfusDUWXFTKornN4/PaeZIsQjlhPCNL2ZmBBmbjdZM38u8RGvA3C4xbhLc6prqP
         bpJbQdX/F9ezV0IePAsXA69HUXUaDBIGrVdeZgrmQZIrrKiad64rqebXNY4HGlaioG1t
         QtFyE99qwbqexyh0H0xUc6QgIAK3uhrd4xTbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292622; x=1732897422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv6DR/1fH9TeLdoZnHDWcNSnSby2DbD8Lr+nWluwzIc=;
        b=pU/8lU6/js0asaQBFwlFrh+8KpgoYQv9SJvpzKcXnymVvXsbNKFzbRIiyIqeNYQzJQ
         x4QYMZr3cAun/yiayka9bzQL9q3X18bbqUMNGPRqvJi4VyWXywRls1gHZV5A6BebtfGi
         EcRK53Pd7PAZqv5Zs9T4tiwjCIIBzvgZn2cUlnH+WvJXsMcEodIE1NVJCfnGrT4OZVb/
         0RU+eAwDD4+4VjXUk146jjxCwapMXNaPpoGH3auJUkLIomqir0LKdepYJz9ZL7lx860V
         CcdWq857ThWyXvQaAZrh8vX3mghWp6rY0VBSSulJrka/2oJWipDfZu3JGTUeU7+wHsyR
         Cqpw==
X-Gm-Message-State: AOJu0YxBlvsUsJZVcKTicJOAbf+iDDuc2/LLlgdMh9coCo/4DlkiSHxX
	HkhMi29/MCYc2eCpS0yCHsw+pWMMkume6fxcs3WS3WtQ878rqQY6vn1jbxofY0SzGmo+cj/xuiY
	7
X-Gm-Gg: ASbGncuLrj+XwyOkUGGsYq9AOHH+ULqgZbvnpTLfiZ9LNA0ozrYhmzVxavqu0bHJlwK
	p6IsPrFJnR/JFkOSiwkgrIB7FTpNQ3PaCZQctgy9K0Ilh1xcDxBZhQfm+g1ULCRk+7ZpEZCqMbQ
	si5k1c4HAmBNt/uqVap7oh4kZCS36oWMJz6gdqEJItFNLi1C9zYBxFtqLf1uBe1MgyY126XdOTy
	ej/RV4DWIz5XM/I9oTyeQ0jTo7ww/ZrzQrgIE3L5UCdeUSvdoSCZIaIvlhnWA5xtrYa73R5Cwgw
	iCk=
X-Google-Smtp-Source: AGHT+IGYQ8q+7B9OLPoAsxM9q0GZh1IYznTzQDBRUWFPyfeoKYsBmUOgjiPVI3/+85oQ2ElTUlF28w==
X-Received: by 2002:a05:600c:1914:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-433ce413b3cmr28540555e9.6.1732292621647;
        Fri, 22 Nov 2024 08:23:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] resulttool: Use single space indentation in json output
Date: Fri, 22 Nov 2024 16:23:33 +0000
Message-ID: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207629

Using 4 space indentation in resulted in hundreds of megabytes of extra file size
in general use. Reduce this to make filesizes more managable and reduce the processing
cost. Some level of indentation and spacing does make the files more readable and allows
use of git diff so we need to retain some of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py              | 2 +-
 scripts/lib/resulttool/manualexecution.py | 2 +-
 scripts/lib/resulttool/report.py          | 2 +-
 scripts/lib/resulttool/resultutils.py     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index a86a706bd96..b683d9b80a7 100644
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
index ecb27c59332..ae0861ac6b4 100755
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
index a349510ab85..1c100b00ab3 100644
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
index c5521d81bd1..8fd4e0a9cf0 100644
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

