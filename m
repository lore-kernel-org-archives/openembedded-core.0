Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D11C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 18:23:25 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.59219.1690654997350210936
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 11:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cMF97Yhc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20230729182314a89c01449875cae130-n7zd4y@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20230729182314a89c01449875cae130
        for <openembedded-core@lists.openembedded.org>;
        Sat, 29 Jul 2023 20:23:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SD3JYYSeXIKXKbo2NQ2iyEQ46rfH25SsEiIx3GMSYoY=;
 b=cMF97YhctZPZEyrRJwzSaO4M9GSu8SoDHS3cc60L5XRxBdK5EjHBbDK6PeEGhAS5zMPlFK
 aRGVHsCeij4wFp+6C5CjYomQ6FTHrfhjJj1JiAQ8uLu8X/Mn1AF9oIBTAesxRGcEW4ukhlyN
 PjCddHY8JEDEL75WYeQSIfv9KZzts=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][mickledore][PATCH] libarchive: ignore CVE-2023-30571
Date: Sat, 29 Jul 2023 20:22:35 +0200
Message-Id: <20230729182235.1522941-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185056

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
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index ffcc103112..0219ffa720 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -33,6 +33,9 @@ UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
+# upstream-wontfix: upstream has documented that reported function is not thread-safe
+CVE_CHECK_IGNORE += "CVE-2023-30571"
+
 inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
-- 
2.30.2


