Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95817D3B7E8
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 11:27:41 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6236.1765193254727270520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 03:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Fg5LLTtn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251208112731f5ed3a7ef70002070e-u5szdx@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251208112731f5ed3a7ef70002070e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Dec 2025 12:27:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WQBPP6qvHHfPyAcu69xoKGU1Lwjfxi5IisaXc1qmv/o=;
 b=Fg5LLTtnMqWD9q7ks4zRFUq1mHWuo1/r8JAu3ypLG6dC66rzI4f72XwEWnIrqJO96+9PTq
 FGtLEgynyx4zGbgb6jRAkbMk4ovjWVpFLGPO2h6Z2PkpiVm+jZiCyXAJYUOXspSTUS8V29fK
 3YnDhpRUvIl8plJPzbwiY7OKFER04m4xIjWNCH4PqiPZz6gQgDZSWi7cFsAK20Js5lyXWPyC
 DkEjBnS5kyNLreHX+909yi56tR2kLDOyJphqIqjeAdRDCNjIjwclWsppDIKOvMROpuLMXmIf
 qj2h9gsLV/LDaoTZjiaqZOIF7TEQq2e/ylWdihNWVrhctEUTv3AVr95w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: changqing.li@windriver.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libmicrohttpd: disable experimental code by default
Date: Mon,  8 Dec 2025 12:27:20 +0100
Message-Id: <20251208112720.1154248-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 11:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227390

From: Peter Marko <peter.marko@siemens.com>

Introduce new packageconfig to explicitly avoid compilation of
experimental code. Note that the code was not compiled by default also
before this patch, this now makes it explicit and makes it possible to
check for the flags in cve-check code.

This is less intrusive change than a patch removing the code which was
rejected in patch review.

This will solve CVE-2025-59777 and CVE-2025-62689 as the vulnerable code
is not compiled by default.
Set appropriate CVE status for these CVEs based on new packageconfig.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index ad3c34ab9e7..264af6d81a5 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -22,9 +22,12 @@ PACKAGECONFIG:append:class-target = "\
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 do_compile:append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_CHECK_IGNORE += "${@bb.utils.contains('PACKAGECONFIG', 'experimental', '', 'CVE-2025-59777 CVE-2025-62689', d)}"

