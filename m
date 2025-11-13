Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177BBCD6E4E
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:44:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22955.1763037866514158801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a+alMKmQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251113124423d8c55f771900020766-lnbod2@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251113124423d8c55f771900020766
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:44:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oDAuGIBKCXrZ/aBpwXadQattpw4GOQcw79Tzux3IWL8=;
 b=a+alMKmQK5R/Xswem1CMmcBoQvV06Y99ctYZuRJHmozRR6eKc+zzzGOtFrBRbKTOtm9bC0
 1dg8NAN1KYwktinPbfTfxr/6u7oU/conwoDf8GblxaobJ2rCIWVaug7BCobWaBoKtITFH+ZA
 57N/xVDZ+cxVt1LeHtgn9S4J7F++mzN76lm6OKx7WoyxV6d7pDA8jPyrZRr5LPJf/9/Roje2
 0uiSRA/Pu2Kq7fprxHOwdcK0IWd6DZVUIT3SHvhVG6Gtqlt6/HYF8lpHrcVaGZjnDyLzwhvR
 TghJuIICh+2joCIhD6JSOLIArhliwWvtcOrrhUn/HC0jo338QFcp1LuQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures
Date: Thu, 13 Nov 2025 13:44:10 +0100
Message-Id: <20251113124410.17858-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226248

From: Alexander Kanavin <alex@linutronix.de>

The default assignments look like this:
TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"

TUNE_FEATURES is a target-specific variable, and so should be used
only for target builds. The change is similar to what is already done
for native packages.

(From OE-Core rev: cfff8e968257c44880caa3605e158764ed5c6a2a)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/goarch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 394c0c5d84..5996bf1805 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -18,6 +18,9 @@ TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES
 TARGET_GOARM:class-native = "7"
 TARGET_GO386:class-native = "sse2"
 TARGET_GOMIPS:class-native = "hardfloat"
+TARGET_GOARM:class-crosssdk = "7"
+TARGET_GO386:class-crosssdk = "sse2"
+TARGET_GOMIPS:class-crosssdk = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 

