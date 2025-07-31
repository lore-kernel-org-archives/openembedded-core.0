Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D692AC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:28:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.70912.1753990092904314576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 12:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NdQNz8Ip;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202507311928081118a5193e7d547a42-6_zwh5@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202507311928081118a5193e7d547a42
        for <openembedded-core@lists.openembedded.org>;
        Thu, 31 Jul 2025 21:28:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AY5/nrFhJMeuh5fTfV/tDkEWy0WEXMnXUaX470tqBpw=;
 b=NdQNz8IpSlxbWyszaIWV9z1y06hW5+FijlITBensnji2ksQrpk+feIfLBOGEDp6B0n9IgI
 SiQ5VWS6Zw4qkSG24gLh9gp9rKLIYh5UFiHpsWboJ4oTS4TX2qoB1wjamGmX+JRjnXc8JQyT
 Ci83GNTroHTQIKDlqVrEePFkvxpj+wK59s08RK8zQKjj8bdvCnpZb7p2l9CqcPoq2HWIhGqm
 snJKxHf6Vkcb3ig+rbVBtdo6VIMp/jO+ugz/HCbLg63zY9XLrmgcOhYzz6elAHNb4mAIiHAI
 Co6uiReIztP1fAC4ciX+7Fvb/Vu0jNIsnWdAqKoJf9H0kGzfLm8rNQ+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [OE-core][PATCH v2] oeqa: do not fail when sdk package is not available
Date: Thu, 31 Jul 2025 21:27:19 +0200
Message-Id: <20250731192719.13194-1-peter.marko@siemens.com>
In-Reply-To: <20250723062616.101590-1-peter.marko@siemens.com>
References: <20250723062616.101590-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221206

From: Peter Marko <peter.marko@siemens.com>

Prior to commits:
* 11277efd057685558a744e98082b5709e849dd2a
* d0e8b83d05957b1f22d08582e364afa4b522801e
the tests were skipped if package was not available.
Now the code calls function ensure_host_package which says
"try to sdk-install missing dependencies", however in fact for sdkext it
causes a failure if the installation is not available.

Since maturin is not installed in any image, it cannot be installed
unless it's downloaded from sstate-cache mirror populated by a world
build. These builds are however now not done for powerpc and mips.
IT also does not work in local builds without sstate-cache mirror.

Fix this by skipping the test if the package cannot be installed to
match the original behavior before those commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/sdk/case.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 1fd3b3b569..03cfde88ff 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -44,7 +44,10 @@ class OESDKTestCase(OETestCase):
             if isinstance(self.tc, OESDKExtTestContext):
                 recipe = (recipe or packages[0]) + "-native"
                 print("Trying to install %s..." % recipe)
-                self._run('devtool sdk-install %s' % recipe)
+                try:
+                    self._run('devtool sdk-install %s' % recipe)
+                except subprocess.CalledProcessError:
+                    raise unittest.SkipTest("Test %s needs one of %s" % (self.id(), ", ".join(packages)))
             else:
                 raise unittest.SkipTest("Test %s needs one of %s" % (self.id(), ", ".join(packages)))
 

