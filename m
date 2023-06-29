Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF4CEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 12:29:15 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.6901.1688041753633848722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 05:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VHE1S6Ei;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2023062912290993ad0bcf100df1238e-uhpgyu@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2023062912290993ad0bcf100df1238e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Jun 2023 14:29:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TYsSyarxUcOgVUeP1amj2HfH64S3aPcT2+Ahq6qRBTA=;
 b=VHE1S6EiwTcf+/tBmtgZXawcQlJGp0GM+doR24caiB2IqF4EV8BfxfZSAb2ivW1iDC9TT1
 N8kH+kOD/aRLYopRHt6tzbCPcREhjKbK+YiOp+Ny4PCWG4tYgxWioUi965Gxud0skK+njkYx
 3oWDV50djoAEh8hdWEszPjsGcCPzE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] gcsections: apply section removal also in C++, not only in C
Date: Thu, 29 Jun 2023 14:28:08 +0200
Message-Id: <20230629122808.730507-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 12:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183621

From: Peter Marko <peter.marko@siemens.com>

Currently only CFLAGS contains sections optimizations.
This is used during C compilation.
C++ compilation uses CXXFLAGS instead.

I did not introduce CXXFLAGS_SECTION_REMOVAL because the options
are identical in C and C++, while adding it would add whole lot
of additional useless lines of code to maintain.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-poky/conf/distro/include/gcsections.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/distro/include/gcsections.inc b/meta-poky/conf/distro/include/gcsections.inc
index a1f8651ae9..0e7bd2efff 100644
--- a/meta-poky/conf/distro/include/gcsections.inc
+++ b/meta-poky/conf/distro/include/gcsections.inc
@@ -27,8 +27,10 @@ LDFLAGS_SECTION_REMOVAL:pn-nativesdk-mingw-w64-winpthreads = ""
 
 # set default for target
 CFLAGS:append:class-target = " ${CFLAGS_SECTION_REMOVAL}"
+CXXFLAGS:append:class-target = " ${CFLAGS_SECTION_REMOVAL}"
 LDFLAGS:append:class-target = " ${LDFLAGS_SECTION_REMOVAL}"
 
 # set default for nativesdk
 CFLAGS:append:class-nativesdk = " ${CFLAGS_SECTION_REMOVAL}"
+CXXFLAGS:append:class-nativesdk = " ${CFLAGS_SECTION_REMOVAL}"
 LDFLAGS:append:class-nativesdk = " ${LDFLAGS_SECTION_REMOVAL}"
-- 
2.30.2


