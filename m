Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AC7C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:18:41 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.59352.1739211515551773309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 10:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=g01xlbwi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250210181833cda283c46fa85c87c6-vkunec@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250210181833cda283c46fa85c87c6
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Feb 2025 19:18:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WxytA7Hh4lF7TAufZBjLDyXA4p2vFDUdBlxGVBvXEww=;
 b=g01xlbwiWL6tppcOVvcB5cG4Oeppvfp7Yt1JLrwSPra0lbtCS1x+M1TxdTGuS4XRg0p0XN
 X6KCMF3KkwhonN1Xg3DVxweX304HgemeL82pRdfMDk3uwNeDJW1A3O9P3+EiRcEUb4zIjC2o
 Rl72AN7Wg+Ovj0dEEixs9pt1WBh0iLOnbvPpUBFRdPy5NG0YiUIkgK9V/Eq5u7nXgQgE/tYA
 7xClsdjtWNDu+ima1F/0uHV9/VpMVPennaJD//04zCfwiCCOaOhkf1s02Y4SeLbD3bGctaPB
 lDIKXtu+RVN70Hdcwx/dIwHv6cfUmaups6FO+CttRS6/qC5jfqSNIzcA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][styhead][PATCH] cmake: apply parallel build settings to ptest tasks
Date: Mon, 10 Feb 2025 19:17:40 +0100
Message-Id: <20250210181740.2582553-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211114

From: Peter Marko <peter.marko@siemens.com>

ptest compile and install tasks do not have parallel build settings for
cmake. On powerful build machines this can cause overload situations
and oomkills.
Observed when building qtgrpc with ptest generally enabled in distro.

Having this in ptest class is suboptimal, but creating ptest-cmake class
just for these two variables is probably overkill.

(From OE-Core rev: 3c311fbf0c2090268e9b83123d762b05b61b4074)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 3d3781ef33..e8aca0db8b 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -67,6 +67,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"

