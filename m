Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE06C04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:47 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.21414.1691683545506523464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pavOLM25;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-687ca37628eso956266b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683544; x=1692288344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRcB0GEi6r0a+KqC63dJR4DPMQ/RES6tLjy0hT4Uzys=;
        b=pavOLM25vSjE63eKUZpBntNNjO90nRWXKmw2V1WUupPPSnEXKW6yhx6IqvX41Pd4M1
         Q6X9TuJYoi2Hu3OlN2z69VxcmaQjpGia/+I3BjsDpgdq8S2I/OlGnCLZxd3ZUtVdSOw2
         EQZHn6FSHJsIGIqV1ZahsYTP+8/T9x5St5Rmq4DF6aoNTWlhOv+QEBYqlBLWRejK5+DR
         B4AdNuNdfSvNjyTfHyD/yv6AmlM18obTOPG6yDwVXzg6seSMsRhBvCGjo50Ydr/B8Wlh
         5JYXJVwGyzn7mETHNTxAeMPH2P1kaAzPBKa2Hnvu35SQeJGabKEs7CGCti5m4dTU/h1f
         Olkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683544; x=1692288344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRcB0GEi6r0a+KqC63dJR4DPMQ/RES6tLjy0hT4Uzys=;
        b=YAIJtqDsNsjEvnskUqs/PDEc6OlszsYT/q0Rq2aobP8JiX4gujveg9J+0YBp7mkJS8
         VROfKL2o+judGpne3Xgf50BEAF+D9l+rxCz3gS5AJsWq8JroPAXNFCEDXXaUCoQz8DHH
         LYMnaN6KlxrJp6kQh8Wna8IzKYVPal/RZpfJNdSQM5Duvd9T6PoYoGg7N7hqvjKTl3YT
         PwJzG3vstHzUEjMKcopCuZ82lT15G1OV69u806yNXWQ3va+JS7tSH59aOkxCMIQWX7IC
         7U0ZvuUSyZdCn0BIUh8gxdkzQ5V6Wb2eH42N9DqY58Iej84zy/ruyzyHSgfZaTu3hJgc
         FxBQ==
X-Gm-Message-State: AOJu0YyWBpKmzQptRFXm5yrc/ANzCyyO7k1i4cbp9zp0n2ttPObBWLfh
	KjVvvtn6SuqQgQrDBcy5yJDWTK5poWDVzVAYFGY=
X-Google-Smtp-Source: AGHT+IFxBEs93TZAnimQHd+PCznA8f6hB/aP4+Gfc48yCzeDhO1NP7uaV9D2ol41G/k2IZ23hUlY8Q==
X-Received: by 2002:aa7:88c5:0:b0:686:babd:f5c1 with SMTP id k5-20020aa788c5000000b00686babdf5c1mr3739049pff.25.1691683543836;
        Thu, 10 Aug 2023 09:05:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/37] scripts/resulttool: add mention about new detected tests
Date: Thu, 10 Aug 2023 06:04:26 -1000
Message-Id: <7e393ea6e46060daf3242f2f7721f7f968945122.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185789

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Some regression reports show a lot of "PASSED->None" transitions. When such
big lot of identical transitions are observed, it could be that tests are
now failing, but it could also be that some tests has been renamed.

To detect such case, add a log in regression report to report the number of
new tests (i.e: tests that are present in target results but not in base
result). This new log also allows to know about newly added tests bases

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01b5cefd07e01c7407bc663842b8a8d502358a6d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/regression.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 1facbcd85e..f80a9182a9 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -178,6 +178,8 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
     result = {}
+    new_tests = 0
+
     if base_result and target_result:
         for k in base_result:
             base_testcase = base_result[k]
@@ -189,6 +191,13 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
                     result[k] = {'base': base_status, 'target': target_status}
             else:
                 logger.error('Failed to retrieved base test case status: %s' % k)
+
+        # Also count new tests that were not present in base results: it
+        # could be newly added tests, but it could also highlights some tests
+        # renames or fixed faulty ptests
+        for k in target_result:
+            if k not in base_result:
+                new_tests += 1
     if result:
         new_pass_count = sum(test['target'] is not None and test['target'].startswith("PASS") for test in result.values())
         # Print a regression report only if at least one test has a regression status (FAIL, SKIPPED, absent...)
@@ -200,10 +209,13 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
             if new_pass_count > 0:
                 resultstring += f'    Additionally, {new_pass_count} previously failing test(s) is/are now passing\n'
         else:
-            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)" % (base_name, target_name, new_pass_count)
+            resultstring = "Improvement: %s\n             %s\n             (+%d test(s) passing)\n" % (base_name, target_name, new_pass_count)
             result = None
     else:
-        resultstring = "Match:       %s\n             %s" % (base_name, target_name)
+        resultstring = "Match:       %s\n             %s\n" % (base_name, target_name)
+
+    if new_tests > 0:
+        resultstring += f'    Additionally, {new_tests} new test(s) is/are present\n'
     return result, resultstring
 
 def get_results(logger, source):
-- 
2.34.1


