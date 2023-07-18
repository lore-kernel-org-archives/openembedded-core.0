Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F05C3DA41
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9115.1689690405416531227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OcktTLBv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-668711086f4so3573174b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690404; x=1692282404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0hFXY7Q/PRQUXNK8QHa3v5nxDHxWGmeS0QiFQ1zDzI=;
        b=OcktTLBvt/RteorDWZnL2/zqxWBfuZMS24Z/pHrWmLpaXRJH4DDTURy/8KfNGVfmFv
         KEYrSGdBSO6JVJKSULYj//MBiEqFe/qbtYkkwpaZ/E8cD8ytYUO/+5MYSy9j97qsE29T
         aVux8IX4G6EyGhFnQbPKNxUoLnUR9lhCInD4hZgXRdurqzBFyZE/evUR+AzKnRu3bywR
         wy74B7d0PnRjGbYwVBrRlcjDur6XDw6yADAW8betAlfqolfZzl2rOw0EZ1YEA4JtZzEe
         /IDjWAq2dyWqF9OYVEzN7IyuZeBWeyZfmqeu5FjERgYLXl6ZQWn9AUp6FJyqS5LggBNv
         fA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690404; x=1692282404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0hFXY7Q/PRQUXNK8QHa3v5nxDHxWGmeS0QiFQ1zDzI=;
        b=JvIQXtGe32wBFCcKOnTjvHdkjPkRuVAYh5deLRWrImKRCgu9bke+w0rt6e3Na1fo7i
         d9ku2R2dEnmNCV38X6n48w4kneH+HnH3MjJx8apO5kocpdUhDQo/pjt7JFX2xypg+JqD
         fELXzNuu97z6AuawL87NX2fxjDfPDaJcDt29zEhWIy0MoEJFY/lG6DjIv8VSBv76PuBT
         UfoymcmG/Eq9deerQKUatxqO1zh0hXqDmNtdC61rOklTmb2kC0epc+1RLp8rug3EBDYj
         FhMVEHESETOP4RFH7BM3QJkEfhZDEeaex4x1TpB8zYRsWWjExXChocgNcTq/kdHZ9Iqs
         1Ksg==
X-Gm-Message-State: ABy/qLb+JKZ8KTg2T6YhvFGCAOiflEmsvyNV9YThN/ROnqjSTdRiYA/y
	1D4vKR/Bq/zfcEd3XIaVpYQTLG4d2Qxng8xpH7U=
X-Google-Smtp-Source: APBJJlEAlCoJm1NOKIZ0YgphFKiF8QCgmp0qoIiE4UO3/YGohtGyLdCaKngNczXxcqsqsjkyp+ddOg==
X-Received: by 2002:a05:6a00:2da1:b0:682:93ce:4825 with SMTP id fb33-20020a056a002da100b0068293ce4825mr18040522pfb.3.1689690404507;
        Tue, 18 Jul 2023 07:26:44 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/27] selftest reproducible.py: support different build targets
Date: Tue, 18 Jul 2023 04:25:47 -1000
Message-Id: <3b82a7d74995c0670a6914c58b3d7c42327b8ee9.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184517

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Allow users to set different build reproducibility targets than
the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.

Fixing all issues from "world" builds is not possible in some
complex build environments with lots of layers. Limiting the focus to
a smaller subset allows using this test to detect and fix build
reproduction issues incrementally.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c66bebbce5995e386a1a4d055a914a39b6ee518d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2c9bc0bf90..98259ae515 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -132,9 +132,13 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size = 250 * 1024 * 1024
 
     # targets are the things we want to test the reproducibility of
-    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+    targets = get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
+    if targets:
+        targets = targets.split()
+    else:
+        targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
-    sstate_targets = []
+    sstate_targets = (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS") or "").split()
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
-- 
2.34.1


