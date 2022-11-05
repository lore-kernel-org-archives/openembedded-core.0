Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D189CC43219
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 15:43:14 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.7243.1667662989383294807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 08:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BFTfl/NQ;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667662990;
  x=1699198990;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=U8Uwx7iDblKbv/DWiAq2KfIU/1OI9vUkBuEaFB0jWAM=;
  b=BFTfl/NQqm8o00GBP4TMPYKzbk6gvMQIK/1rw4OksTKF8sk7/v89vqTi
   /7QgLWXsoYL9cP9A7i1UTxTJZZra1lkD7K4E4GKfi/W0J5UHDPH1aBKUC
   mrg47jQSAT6Rm2mlgbk5DFfm98FSnWyqB6QuXOFW42XmZ9WOGMlM4PYvZ
   PbWC39yUO2zrqWrqoxWeftZDLNoy9h4oxWENWfXymamobzGC36pu4Go2/
   2WaDW2He2aduZgHN3LznGjoStbnT3ouV8mwB7BTeDGpjgwVdfOke8llz3
   8inWz60ZrxSv8YDq7BeNqb873pBQNW9RUssmvIu07IhTJojC3MXDPiaPJ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [langdale][PATCH 3/3] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Sat, 5 Nov 2022 16:43:03 +0100
Message-ID: <20221105154303.274085-3-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105154303.274085-1-pkj@axis.com>
References: <20221105154303.274085-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 15:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172750

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
match as intended, resulting in ${TMPDIR} ending up in files in
${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
QA warnings.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 686553f900..a6a8ca6318 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -60,7 +60,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)

