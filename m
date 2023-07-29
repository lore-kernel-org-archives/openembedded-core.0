Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676BAC0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 18:22:35 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.58678.1690654949380197936
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 11:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Qtg3kzRf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202307291822259572fb3d4d81323133-og36fp@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202307291822259572fb3d4d81323133
        for <openembedded-core@lists.openembedded.org>;
        Sat, 29 Jul 2023 20:22:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gIdrmuuWDDgSQ5cMe610ZBAOYXFq4uF2zE8DN2xaxbE=;
 b=Qtg3kzRfJvNOJUnPB+4j4YZdqFeAwnjwYo2GNphCDgSHGjui0GIj5+5Pb2gxUaScosOEbk
 WXaNUktwGTNSl1ZYLln4QuxuOnrjesLBOd9IgQlaWXmSSBQX8Qobg7axwk7xJT2JPLBiHPs7
 FKMdnpV/GgIPdh4iPeSbPWVIqwMac=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libarchive: ignore CVE-2023-30571
Date: Sat, 29 Jul 2023 20:21:48 +0200
Message-Id: <20230729182148.1522886-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 18:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185055

From: Peter Marko <peter.marko@siemens.com>

This issue was reported and discusses under [1] which is linked in NVD CVE report.
It was already documented that some parts or libarchive are thread safe and some not.
[2] was now merged to document that also reported function is not thread safe.
So this CVE *now* reports thread race condition for non-thread-safe function.
And as such the CVE report is now invalid.

The issue is still not closed for 2 reasons:
* better document what is and what is not thread safe
* request to public if someone could make these functions thread safe
This should however not invalidate above statment about ignoring this CVE.

[1] https://github.com/libarchive/libarchive/issues/1876
[2] https://github.com/libarchive/libarchive/pull/1875

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index aafede3da8..3025242b40 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -33,6 +33,8 @@ UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
+CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
+
 inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
-- 
2.30.2


