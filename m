Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DB0C4332F
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 01:36:44 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.4819.1636594602490440931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 17:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=RRDlwwxE;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636594603;
  x=1668130603;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FRJceP90BGEqXzAOuss7NOlWsJqIprLxxR/L3Zp5f+U=;
  b=RRDlwwxEvfKt2IfYiIEGdkTisnx2mPBYgvRVUlxu1iUjDf+2qeECt2x7
   ppb4Ycpu3u3bjHNyGoe1rDqvtreG/+rWZM74WEaFxLib8RzNmtRx2pR5r
   MvrbDtObY/JY795QKRaq8TGp7ftMHdwM1sJ7KFjQXPq5sw5RdODIYSqMT
   2/P/MPtAXQJlaFSexbNiQkMc5ZBxZK99ATdhIR2IAIS/HE02EwA8OnfML
   y6PDStiBD0ws5Czm5kSGFWENEFO5n9sjdmyiPDtENHxECGmrwATCilolA
   C0sfYMZekpXU95C1oTSr/SlO4frpYvwp1pgGR9EL+12K9Agx1/z5oRdtJ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] systemd-bootchart: Revert inappropriate use of
 ${systemd_system_unitdir}
Date: Thu, 11 Nov 2021 02:36:32 +0100
Message-ID: <20211111013632.16009-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211111013632.16009-1-pkj@axis.com>
References: <20211111013632.16009-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 01:36:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158125

This is a partial revert of commit 5ace3ada (systemd:
'${systemd_unitdir}/system' => '${systemd_system_unitdir}') where
the string '${systemd_unitdir}/system' matched something other than the
intended directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index 71c2ba6d7c..fe6f0452d4 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -38,7 +38,7 @@ do_configure:prepend() {
     rm -f ${S}/m4/intltool.m4
 }
 
-FILES:${PN} += "${systemd_system_unitdir}d-bootchart"
+FILES:${PN} += "${systemd_unitdir}/systemd-bootchart"
 
 EXTRA_OECONF = " --with-rootprefix=${root_prefix} \
                  --with-rootlibdir=${base_libdir}"

