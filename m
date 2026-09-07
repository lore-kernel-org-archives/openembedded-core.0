Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670A8C79FAC
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:39 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28581.1788763051699422547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ZABRC37e;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202609070637285e4972813a000207fc-bsjciu@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609070637285e4972813a000207fc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=L+DU88ooyFegsMFg3AqRJfeJ7zuMLrTe0TE2Xma5dEw=;
 b=ZABRC37eXWLX3B6P0z4YvcgJsaf3iCQnsJUKDqHphNSYIBj0b2VBfzAeTc9dYwe6CNB6R/
 KPtJMESrzBTvnMb+sVyMffp9NXDcWn2wQWqQo0zoo+R5+C5Z3hUNcRVeazWgiUCsHvhvfFRP
 D8fMdBv9Szjl1+kF72S9MA9TRReKvC3iuw4HcuCVRNONQbRjEwsSKqsQtdv31GvJt6IGjPqT
 dNt2Xjnwx2qoNHvOMZl7W0rEpohB8ghEv6K+KX//4GnFmtSTN/qEmJVO5SRz9Se5CrnaKLTe
 yTKvtmwvUU/SXpvE2HmCvYjvflgoFCH9Bo0FM7+U/XrTEpEA/cYiXPFw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/9] oe-selftest: devtool ide-sdk: do not guess the slirp SSH port
Date: Mon,  7 Sep 2026 08:36:08 +0200
Message-ID: <20260907063720.56742-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245230

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Falling back to a hardcoded 2222 hides the case where runqemu did not
report an ip:port pair: the test would then keep running against a port
that nothing listens on and fail somewhere further down. Assert the port
instead, so the failure points at its actual cause.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index de59feadb8..3a407a5162 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3991,7 +3991,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
         with runqemu(testimage, runqemuparams="nographic slirp") as qemu:
             slirp_host = qemu.ip
-            slirp_port = qemu.port or '2222'
+            self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
+            slirp_port = qemu.port
 
             # Re-run ide-sdk with the actual slirp address; image is already built.
             bitbake_sdk_cmd = (
-- 
2.55.0


