Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA139C43217
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 15:42:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.7296.1667662931917442607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MxfSE/Kr;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667662933;
  x=1699198933;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=w6GGAarfB79IsIhh4JWO5sD05wzEq7ZBkYlWaHR/QQE=;
  b=MxfSE/Kr5skP4k2Vl2eYtrxMtONZZ/rXxPGDUfs6rV9K1e/4kFq6yY/F
   C1eEZoN9X0q6SGkbKTGvP2+t3sydxaIvBRuYYwsLgRTqo9G0t6UsHdhkv
   ALwWfKyhT/r/21Myd3evyNeXTbUM81QPWhD2sMBYnELsYnBl/nycugWx8
   yJ4RmNX23/lpbIJfgidEKmzqtEBU2b722qx2CG0ZQWNpsBXNJBkZgnNBc
   OZpqEfEttV53XENtUi2sQkD0g+D7aM+cnLW6W4qm78rSxa/E5l+ikcV/I
   OWoIDMO0qT8rjCHBzF54rwOP3xNUn7Zk8bFL2kWCJN89H291r/hXUwcP9
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [langdale][PATCH 2/2] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Sat, 5 Nov 2022 16:42:03 +0100
Message-ID: <20221105154203.273684-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105154203.273684-1-pkj@axis.com>
References: <20221105154203.273684-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 15:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172748

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
index 5905342589..75fb91bcb0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -61,7 +61,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)

