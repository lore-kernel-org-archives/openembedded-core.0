Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFEAC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:48:11 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.45821.1749419287222049300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UX/52jG6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250608214804b31c914328c1662a37-kio2wx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250608214804b31c914328c1662a37
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Jun 2025 23:48:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=10U32XdZqyTEjWut/TiCHtZ58GfZAdMU4NAH2lHevE8=;
 b=UX/52jG62Xe4oypWwUnNrNArrsH40L6HcMv7tpv5X+FkN9/akiL2/GvGtBVQ0Wasl00Yho
 S42cS8Ykt1Ptsr46aY2EQ4d3rR1f5XvMlnWIUDArjI7495smMnb9RTDfBjoU5Yz2kZgtWkce
 oVWIsyWspvZRlqdg1DsnPsuMcCsHlPpFylBAt+mJJbwlf4PSmxoNXnnn9HfCjvdnfsHZiUed
 XM0mlJlIrY5/vC3/kAsVAyaVAct329THzfoNH4IPk/KxHBGFD5uenOuXju0MOkY8LNxI/gkM
 ThyeMC88ia+0paPE7fl7FYXFLY43S2iu/XOdrl5YIcpoy7EEM4x2C4+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] testimage: get real os-release file
Date: Sun,  8 Jun 2025 23:47:17 +0200
Message-Id: <20250608214717.2427776-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218233

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file in addition to this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

(From OE-Core rev: ed43f9ccb3c08845259e24440912631afd780d12)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 954c213912..33b1c13f9d 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -25,7 +25,9 @@ TESTIMAGE_AUTO ??= "0"
 TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${sysconfdir}/os-release \
+    ${nonarch_libdir}/os-release \
+"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"

