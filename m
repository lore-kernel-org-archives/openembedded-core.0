Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0A5C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:28:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.34.1739212114349940671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 10:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JpRcjbXh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502101828315973e4b3e15a3e8d26-wrkoht@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502101828315973e4b3e15a3e8d26
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Feb 2025 19:28:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=R2bZoUbcVqBifkikIu/JNI3w5LqX2WVsiEFWPVCkgfE=;
 b=JpRcjbXhd45IebbWTxmU70osps3xGuxF1VTsQ5Hi7oFXwErsf12jJZbeWAvQVjkkjvD4d1
 r7I6lXhvJCjEUDll2Qaq0ONd22seu1adxzK2RoRVBrPgIb5vQCkBTxL8ox3qabDMr08NFqk0
 uroXz2CpvvZHbuQlQFEo2k8452FT45IeSolWjnlULcCy0cFjB66sg2wpqGxPcYMO2/971+W3
 90RtiavxrEOtnrAtuDSSw6cTqcaB1+7mwwEbu0oERn+MDRfAscUYPlRiJuT1UJd81YfhrsqC
 Li0a9hypkJZMnQepPaJR+dEgqCbcQrTonOe55aVY0zCD/jN0zO31H9DA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] cmake: apply parallel build settings to ptest tasks
Date: Mon, 10 Feb 2025 19:27:34 +0100
Message-Id: <20250210182734.3110798-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211116

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
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7ec6ca58fc..0c0d719829 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -62,6 +62,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"

