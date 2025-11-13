Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EBECD6E47
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:47 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22638.1763036919282367385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XRmdnmch;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20251113122836790a1d49bf00020746-kcc_ob@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251113122836790a1d49bf00020746
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zM+NXcBLf9X4QSFiS+C7bqtKrr3j4bUgFT3UHmlWyhk=;
 b=XRmdnmchgEmfSWA9NmXW4QiljmOUkMj8w517+x/W23SfROlC9aTee5JQqq/bMWefUp6dZV
 uWJEOB0JCzSZVelv9BiaIJ/UVQtVfQ4zW4BSrULIWkLr/SAXqTYTJGj5Vb2Dqlof1wCay80c
 e5M6AqP3oK7uCnM3ERPTZyaconh4j6OjKQYCIHKBtsVtxFlMMUNme55dHJ3K7KbCfvOqIt/R
 9C3shboKJJv6e3tbptjU9VV4faeW1X4tOnZdLMzz1HheBAn1N30V09rgEH6pHOUPH7rwbXv5
 3EoDZVgawwuOTuaRuHS64SAx0PROgiDzvXRZomko4knDM28fxWs8G0UQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 4/9] goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures
Date: Thu, 13 Nov 2025 13:28:01 +0100
Message-Id: <20251113122806.16769-5-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226242

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
 meta/classes-recipe/goarch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 1ebe03864fe..0e9ef3a6ec6 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -24,6 +24,9 @@ TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES
 TARGET_GOARM:class-native = "7"
 TARGET_GO386:class-native = "sse2"
 TARGET_GOMIPS:class-native = "hardfloat"
+TARGET_GOARM:class-crosssdk = "7"
+TARGET_GO386:class-crosssdk = "sse2"
+TARGET_GOMIPS:class-crosssdk = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 

