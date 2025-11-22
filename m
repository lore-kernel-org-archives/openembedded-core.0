Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EBDCFD30D
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2713.1763849696486635896
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z6glJBsQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297d4ac44fbso22058625ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849696; x=1764454496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nRXQHFaeYOURFecxtFFrJY2AtQmjLL41cHBS3ZA6dU=;
        b=z6glJBsQsfWiRbhMbG1Z8r9cgaNQ/5fCffW5BO1BT6JXxgttSAQFxyXj7bbeiKJdce
         l/WM3s8zeEWdPOVIFFk5n/oQ83WOgUGYyNHyrXASHP9hlU9vbISpjAVY/dSW5XQ6jT7U
         vRyLXs0E4uRxkTWVfUAq90CLOrA4j6b9v3ApXOiSijtBIcCYZ2yXfCozW+Bb59O8YYha
         nBuVc0HsCT+uWCMJVW32IMA+qu0QvnIk/7ttrf6eLe7143RzIlcMND1r+K2+pcvBBueL
         MmrS6bOhvrK3/OxoNiYqLK9ihX0r+gWcEPeFgP8vqLy7v4zIjdgZl5Nn/6ch1bew/axs
         rMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849696; x=1764454496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nRXQHFaeYOURFecxtFFrJY2AtQmjLL41cHBS3ZA6dU=;
        b=g5FtE48q8dWRETqlHb6qtkrGDbdJLjYNQ9noqV3zOZdnKMGBQ8xL7itR/6vg7stse9
         YkBppWXXmasb77KEesuVfqibKt1b8GpHXldzD6PbKD+teBfwjshVz1X+05xagptpflPm
         AyxFu9ZztlwnSXSmApB81/+aE95RSLL13L14PDOv99ZtlfHKfKYENFgGi989oSUT3K2e
         XhCFfUApqm0XLCn4JaRcywWN77ULe0oy1m3qz77MyCtvhdgpX1qWMhWsaAlBUfy2jB8s
         +pmW1PuvC2w9pc8EzoGLUg42/JSeoxy1NLGq/65FRPSHgAqx8X9Cg6OA0e6ZVvJ35JSg
         SUng==
X-Gm-Message-State: AOJu0YzPhaASfiHZ6cUFg54u/Q+6XiJiU4pCH3MhSYNnhr5vfYcWEcLk
	ZhVFz5sS19kka4lbFAUREIZu1iO4JamNfCU4L5Tnyu15I8J91KCwBlcIVr/uQSEAn5Id5ejVO/b
	jTGAn
X-Gm-Gg: ASbGncvzLqpnAblZhH4Rmlb6MDLbvUTgJXjp3VwlEIt/MRBwunGdFMzL8vYmPurgYLv
	BL5kEe+e2+mFFW/0FxT0yUCHz6yg7GuTTSi0Irkp14AwjDMWBxM8z4Pk1YDNRmho11279BSTqPP
	EDAQD8OsjG6Gyuz7jAYyoF4Tae3qEKtcTkjPuShXrgazegiPxkFbpuspAZApwHcJDgik9kRvu30
	yLvgKhk7rOo1Vt0O1EGtKoiueNUb+ck4vYEfko28jjhcEoXMPbGz7aEXQJcXVB7gnCsGrEriZgN
	R6PSdLkjSmIpGGFIwMGTKLRsp/uhzN/MO2zduXPZ/cpG8kQU6T/C+VPP+87vlpAZ1OmLMw4PD3B
	fNSRty6l5kU2GAC8iluio3/E9NZYk4e/Fr+GYyNZzQZSVJ1ggtJl43gnjnwSkIylVO7P51S6rhg
	1zKQ==
X-Google-Smtp-Source: AGHT+IFg/jeU41trBpvDGDApbp7DLlJMpxRk/6fXvAi8Yt2f+eVD19ohl/9hIxDh0ynB+vsvUnOxYg==
X-Received: by 2002:a17:903:2450:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29b5e2cdfa5mr127573605ad.2.1763849695720;
        Sat, 22 Nov 2025 14:14:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/21] testsdk: allow user to specify which tests to run
Date: Sat, 22 Nov 2025 14:14:18 -0800
Message-ID: <a93e21419476658f24220193fb0183efeb7a184f.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226710

From: Ross Burton <ross.burton@arm.com>

Following the usage of TEST_SUITES in testimage, add TESTSDK_SUITES to
specify the list of tests to execute. By default the variable is empty,
which means to run all discovered tests.

This makes it easier to work on a single test without having to run all
of the tests.

(From OE-Core rev: 28d437c52c77889b2ede0fc2f2d6777c5b0a553d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testsdk.bbclass | 3 +++
 meta/lib/oeqa/sdk/testsdk.py        | 3 ++-
 meta/lib/oeqa/sdkext/testsdk.py     | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testsdk.bbclass b/meta/classes-recipe/testsdk.bbclass
index fd82e6ef41..59d2834c99 100644
--- a/meta/classes-recipe/testsdk.bbclass
+++ b/meta/classes-recipe/testsdk.bbclass
@@ -14,6 +14,9 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
+# List of test modules to run, or run all that can be found if unset
+TESTSDK_SUITES ?= ""
+
 TESTSDK_CLASS_NAME ?= "oeqa.sdk.testsdk.TestSDK"
 TESTSDKEXT_CLASS_NAME ?= "oeqa.sdkext.testsdk.TestSDKExt"
 
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 518b09febb..52b702b6a2 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -114,7 +114,8 @@ class TestSDK(TestSDKBase):
                 host_pkg_manifest=host_pkg_manifest, **context_args)
 
             try:
-                tc.loadTests(self.context_executor_class.default_cases)
+                modules = (d.getVar("TESTSDK_SUITES") or "").split()
+                tc.loadTests(self.context_executor_class.default_cases, modules)
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 9d5a99d900..6dc23065a4 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -82,7 +82,8 @@ class TestSDKExt(TestSDKBase):
                 host_pkg_manifest=host_pkg_manifest)
 
             try:
-                tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+                modules = (d.getVar("TESTSDK_SUITES") or "").split()
+                tc.loadTests(OESDKExtTestContextExecutor.default_cases, modules)
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-- 
2.43.0


