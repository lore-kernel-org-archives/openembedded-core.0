Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90121C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 10:12:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.124607.1683022352560197880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 03:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Zep/3uHd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so35363245e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683022351; x=1685614351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IyaFdNJm2WvzA7wB3kJD182SGPE1wrKKnEaHPuiP6h4=;
        b=Zep/3uHdc3om2rUSrGrpZgI6QOgOlTJAQGYf+ILJ+MaWRf0JIdeYKXCocdaMoqTQut
         9LK3rqrEzERkD1rtqbj2IHL7/nLyvOeGF6xxzPecTKhLqtmoB7bAHAjzVa3aMAv5W9g6
         auuNuimNIPIkq0hW/UG8bnei7ON3+5+MR5MuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683022351; x=1685614351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyaFdNJm2WvzA7wB3kJD182SGPE1wrKKnEaHPuiP6h4=;
        b=c653vid0KWiqceKIxEhet4NtURWEGTnCr+I0RDY+UIRrS1IhufpZsBEtHYS5D18VJn
         YCU0JCLfrjlr2sgFNW5LY3J8x/BYkXMkKC5yRe8iABaYwqH0LK0R8VezMeAcARf0HB5Y
         LPWRqsod/m2Z9EFydl8yuUkTX++Jgruf4MvESqSqnN21YrxHJjXQFFsW3MvNjtol/ZGF
         l6zMD8JzJ4Eim6WUdFz6KBsaoupxqBM8fikI4px7n132pPsOzVAuyOovB0qBGWFOzQ5n
         Ce24dr2wZogKz/oWf+4RZsV0z8uhfysSpTh+t1ftgHGbNXP15SWGFI+MBzF6SeF0VZnx
         eI1g==
X-Gm-Message-State: AC+VfDyHouGKWHy24A0WokTAXtHzQWCSCDMlvlC5klEJksazuK0yH+ez
	9TOK67eJh+hbVm4RyTV+Wdg6/SpRCYqk+P29JpU=
X-Google-Smtp-Source: ACHHUZ5qVL4rfw35xUOIg3BBWZ9yEihi3EsCVBktN4DkjJPg+v3xwAhxF4eM/PP17Z7N3XJDluwWhA==
X-Received: by 2002:a05:600c:d7:b0:3f2:51e7:f110 with SMTP id u23-20020a05600c00d700b003f251e7f110mr11599461wmm.32.1683022350398;
        Tue, 02 May 2023 03:12:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cffc:b608:40fd:850d])
        by smtp.gmail.com with ESMTPSA id s9-20020a1cf209000000b003f321e61c1asm13639135wmc.21.2023.05.02.03.12.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 03:12:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ptest: Make returning no test results a failure
Date: Tue,  2 May 2023 11:12:29 +0100
Message-Id: <20230502101229.2851652-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180722

Ensure that even if a ptests results section is empty, the log parser adds that
empty section. Then ensure that empty sections trigger warnings.

This means if a ptest suddently stops returning any results, we notice and see
warnings about it. This has gone unnoticed on the autobuilder far too many times
so is very much worth highlighting as a regression. We shouldn't have empty ptests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 8 +++++++-
 meta/lib/oeqa/utils/logparser.py     | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 3ef90221887..23a71ea064c 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -83,12 +83,15 @@ class PtestRunnerTest(OERuntimeTestCase):
 
         extras['ptestresult.sections'] = sections
 
+        zerolength = []
         trans = str.maketrans("()", "__")
         for section in results:
             for test in results[section]:
                 result = results[section][test]
                 testname = "ptestresult." + (section or "No-section") + "." + "_".join(test.translate(trans).split())
                 extras[testname] = {'status': result}
+            if not results[section]:
+                zerolength.append(section)
 
         failed_tests = {}
 
@@ -107,7 +110,10 @@ class PtestRunnerTest(OERuntimeTestCase):
             failmsg = "ERROR: Processes were killed by the OOM Killer:\n%s\n" % output
 
         if failed_tests:
-            failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+            failmsg = failmsg + "\nFailed ptests:\n%s\n" % pprint.pformat(failed_tests)
+
+        if zerolength:
+            failmsg = failmsg + "\nptests which had no test results:\n%s" % pprint.pformat(zerolength)
 
         if failmsg:
             self.logger.warning("There were failing ptests.")
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 7cb79a8402a..60df754b36f 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -44,6 +44,8 @@ class PtestParser(object):
                 result = section_regex['begin'].search(line)
                 if result:
                     current_section['name'] = result.group(1)
+                    if current_section['name'] not in self.results:
+                        self.results[current_section['name']] = {}
                     continue
 
                 result = section_regex['end'].search(line)
@@ -75,8 +77,6 @@ class PtestParser(object):
                 for t in test_regex:
                     result = test_regex[t].search(line)
                     if result:
-                        if current_section['name'] not in self.results:
-                            self.results[current_section['name']] = {}
                         self.results[current_section['name']][result.group(1).strip()] = t
 
         # Python performance for repeatedly joining long strings is poor, do it all at once at the end.
-- 
2.39.2


