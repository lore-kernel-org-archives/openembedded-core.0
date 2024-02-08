Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE03C48BC1
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13543.1707380937714382466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7iudeIv;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-410219f18f9so8257135e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380936; x=1707985736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2mYxW0kZcfYPQT96gsUycGldYhtDPiRemUUrl+zBhE=;
        b=b7iudeIvKSIisZCkpc2RhQ2t3/ZzjddxVw6KzaIl7POOCY/5s2N2o66/EvuZEY93Mw
         +UJD4mJGk9fJYp7JJWooTX3/mc0ugesMdaIEhjE1qrASNlGBNBBbw5ZfDauqPrL9Wkra
         IdY9qXLmQZHuk2Dq/tSTG34vpzu5vRG03Y/uuGsodmwxtwOtbNmwyK+LhrNecWAyemXf
         hPJZX8lGVF9FJ6m1gNKLGwy8eSD9ZsXty7SNkLqCJAKElKbZ5KX2FqM8ltPkEWD0EP2N
         0ocDw0XFJPOd9fjh2z7wJB4MEth8B4LO7N8t3pzYBlfqTksGnrHmmYdBcp3GuyZDwYJM
         L7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380936; x=1707985736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2mYxW0kZcfYPQT96gsUycGldYhtDPiRemUUrl+zBhE=;
        b=kq/9S/3YwvpaYvywOG2/fiwS1OWqg3rzZHeyobRlcuBJ6uUggKMtYaxtgg7X0qw9dw
         /NIACVdWoDfyOHNb1StY0icXGFGbBYXE5tqGeLyUo3mgjn4DRFcYHTjXg73+SsgEAEKD
         G8W074Vu3vqC41WXDJbLvfNxDP9VFXhCV9HQJZOwZU7BJnqePUNKEx5tfKFTdcZBX13z
         GH0RX8OqDG0nar/Bc5u48Q2xby4iWBN8tHGKrhRCGnS9UjiTpLi2IHfqgh9LVjcIhgrM
         nYcKRDaoR3SkVfxrAP77qEdZk7YaFbtjafk8jiM0kZGUvSDbbvo3cVAFRrUE+HIPRV1o
         geMA==
X-Gm-Message-State: AOJu0Yz2vdyJH5bNlPzTme8S5+qjD4kdRMA4kjAH/WJxkK49K4oXLTB5
	ppG+6h75nsOxfKdL9RasXUQllL9mw0vftggmpfg6dXt9p+eUEJR8sYB/nuNP
X-Google-Smtp-Source: AGHT+IGtzxpWUueihKahysu/IiosFDAWGCZ54sJ0vymiRH9SYb+5UeC4gcsgTf0qPIBIlhc/uv1B/w==
X-Received: by 2002:a05:600c:3b03:b0:410:2b60:930d with SMTP id m3-20020a05600c3b0300b004102b60930dmr1578395wms.30.1707380935922;
        Thu, 08 Feb 2024 00:28:55 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:55 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/7] selftest: replace assertRaisesRegexp
Date: Thu,  8 Feb 2024 09:27:29 +0100
Message-ID: <20240208082821.430510-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195108

assertRaisesRegexp has been renamed to assertRaisesRegex().
assertRaisesRegexp is deprecated since version 3.2:
https://docs.python.org/3.2/library/unittest.html#deprecated-aliases

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 6fd96b84850..65f7ffa4968 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -58,12 +58,12 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, 0)
 
     def test_result_assertion(self):
-        self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
-                                runCmd, "echo foobar >&2; false", shell=True)
+        self.assertRaisesRegex(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
+                               runCmd, "echo foobar >&2; false", shell=True)
 
     def test_result_exception(self):
-        self.assertRaisesRegexp(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
-                                runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
+        self.assertRaisesRegex(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
+                               runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
 
     def test_output(self):
         result = runCmd("echo stdout; echo stderr >&2", shell=True, sync=False)
-- 
2.43.0


