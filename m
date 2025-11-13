Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E7FCD5BDE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:28 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22629.1763036898307765005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mmgBp2fC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251113122819a059273aea000207f2-offs72@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251113122819a059273aea000207f2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XGF+4fgwl1p9YDhxnqy18yrDYXLHYBkMYSuNmB1Q9gY=;
 b=mmgBp2fCIlA8Kf9jVscFCYcbPnYglo+/ZXunh2YWH5hdCrmKTspv4VEZ3C6kAy5eGd07px
 PW1VFt04r03GPgv+VbCJvdFLqIkxcMVR09zxVveiE2cvgaXrPonSq+1L4bxMcz4Gqlpjbrvv
 7T+zH/ex9WZxQrzfJZ0UUo81lKL9fGDXXIOhHIqeEEamDq+kGIk082Xzangyn4Mm6pI6pVzQ
 fhac48WSeke4Wp2rAGtR2VvR6yNglUJdQom9Oh8awBZLq5UxBB8ka+cYm5yuLD6ynkO0GRS6
 FGjnaOcRRwwVkUjK2dkOSO8l6G9LRecNBP6lP7gqPmlfrmHAPS0zVCQw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/9] testsdk: allow user to specify which tests to run
Date: Thu, 13 Nov 2025 13:27:58 +0100
Message-Id: <20251113122806.16769-2-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226239

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
---
 meta/classes-recipe/testsdk.bbclass | 3 +++
 meta/lib/oeqa/sdk/testsdk.py        | 3 ++-
 meta/lib/oeqa/sdkext/testsdk.py     | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testsdk.bbclass b/meta/classes-recipe/testsdk.bbclass
index fd82e6ef41d..59d2834c992 100644
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
index 518b09febb6..52b702b6a28 100644
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
index 9d5a99d900f..6dc23065a4a 100644
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

