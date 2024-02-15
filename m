Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6960DC48BF3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.4905.1708035442919325593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FteFwFMF;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4122a8566e4so6217555e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035441; x=1708640241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2KvcjsvtTy/ULDFY9UAC3JY0LBu4c6+FFcTvMn+E7I=;
        b=FteFwFMFWNdS/jaH7/gwgfLCimgyVMVSXzRE0UA6Mk50pSyDEf/HWgEZ73REtQQgXm
         rEeUGQ56KHViSso5YMUphet0gmBI8877P8rn2cUMg74wEDYsSGFngGbFECGmlUKwCCJM
         MsuBFH/MDgMSLlmrmyCNaiiEUBF4tvL9QU4pBaYRFTo1EkouZER943qorzO7BaPMy8tH
         y3nvw70VB64H+GKnfCrx4lWaRTJ2Ki0SeKZkvty50MAlfggV9G3VWm+INjnJeXrU82Dp
         GCteq9+wOgrQA2D4rlloCFilXJr7dbeCiLsb+kds+HwNVwGgeodHPYyJVzkPot2WFlJi
         IgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035441; x=1708640241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2KvcjsvtTy/ULDFY9UAC3JY0LBu4c6+FFcTvMn+E7I=;
        b=CCHbx78ozl3ezMwqKNWUCfksNMWoFGdkPzhEhjKmYNmzuVHJqBzn1vUNxGe56kxVHn
         nmY0GQsPOPuXLm5bkKM3Aa0jMI3cvQbgTiX5x32hG5oCz4VPtctWRJCRFE0aTG1ANXkq
         YfVCOK86hXpY0xj4ZMKCh+l6/mFkeafp01QCzdWUvE1ScYzWu5rxtIZYor9+RJzKfpzf
         OD+UhgCanuR/zHttXUuId/BIzuFF7f7ALncUMLCVCbBpuMPNNFHnWGyLfsZaOr5AwOBn
         4GMHQmV9mPJwAMgZjKaD3wbgNThUv7+FjmHK1KzBIo06Y1MOL+IjrVmPc0iIH5RFO3St
         Grpw==
X-Gm-Message-State: AOJu0YwqUD9mdBrHKMgIq0f0E3j3rS5dMH6OpCxKG8ewLp+YcCvLjkCN
	Uhatl1QixPZcD7hnHMedSB3x1kae+q9/HkXTl9HxKADeZjVSRK5FPcoZuhYfVAY=
X-Google-Smtp-Source: AGHT+IF3l6y9Kk7ZUIHSQQ67yeM0Ax9eoqP2Bp5UA1jMll4WQ1swd6k4aK41jsDsGHzLZCaCvmPzlA==
X-Received: by 2002:a05:600c:4fc4:b0:412:913:5484 with SMTP id o4-20020a05600c4fc400b0041209135484mr2482325wmq.11.1708035441181;
        Thu, 15 Feb 2024 14:17:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:20 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 05/12] oeqa: replace deprecated assertEquals
Date: Thu, 15 Feb 2024 23:13:51 +0100
Message-ID: <20240215221711.332614-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195716

From: Adrian Freihofer <adrian.freihofer@gmail.com>

assertEquals is deprecated since Python 2.7:
https://docs.python.org/2/library/unittest.html#deprecated-aliases
It throws errors at least on Python 3.12. Replace it by assertEqual.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 68286d0b70cf09a0d2950b48945c9192fb8c8769

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py      | 2 +-
 meta/lib/oeqa/selftest/cases/liboe.py        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
index 64baaa8f84..68b19f4d47 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
@@ -19,4 +19,4 @@ class SanityTests(OESDKTestCase):
             # Canonicalise the location of this command
             tool_path = os.path.realpath(self._run("command -v %s" % command).strip())
             # Assert that the tool was found inside the SDK root
-            self.assertEquals(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
+            self.assertEqual(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index aea2ad6561..dc0fc35062 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -919,7 +919,7 @@ class DevtoolModifyTests(DevtoolBase):
             runCmd('git -C %s checkout %s' % (tempdir, branch))
             with open(source, "rt") as f:
                 content = f.read()
-            self.assertEquals(content, expected)
+            self.assertEqual(content, expected)
         check('devtool', 'This is a test for something\n')
         check('devtool-no-overrides', 'This is a test for something\n')
         check('devtool-override-qemuarm', 'This is a test for qemuarm\n')
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index afe8f8809f..da88ff480e 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -97,6 +97,6 @@ class LibOE(OESelftestTestCase):
 
         dstcnt = len(os.listdir(dst))
         srccnt = len(os.listdir(src))
-        self.assertEquals(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
+        self.assertEqual(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
 
         oe.path.remove(testloc)
-- 
2.43.1


