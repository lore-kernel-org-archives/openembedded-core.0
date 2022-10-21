Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4DBC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:04:10 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1158.1666393449007406780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PLp64KEA;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1666393449;
  x=1697929449;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1eoE9U17QyPAh9VkUXXSFKbh/Bmtja84xVqNLHnLTYI=;
  b=PLp64KEAybIPlvTJjNKZBvEWveWj1JTM5dn7fN71VONtXZV9BVLlFx1p
   EvQ5WHk6N1xIkejJqrregkY6xVM+K2iN81JhwRl9uIOg8iNXTvSVInBgb
   YbSWM+wQkprSPMCNxmNnbyYn8+tpnLRVtAhCzmHCP+SubMKiaqHzV9IKQ
   lGbsPuOJbD5j4YinCQhN9iuErhHULeWLv9jiRD5DfPj386uT64oNmxknh
   uB2EC8SB1XaOV78lGpvNxycFD6cSYPUJJo/7iSlybxcAy58T0EwWb/MDf
   YjgZKTvFsd910jMwONq0NCquwvTRxzZrn8f0Q+4hg9dpkk4mJlW/4Cy2S
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Sat, 22 Oct 2022 01:04:03 +0200
Message-ID: <20221021230404.296850-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172048

The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
match as intended, resulting in ${TMPDIR} ending up in files in
${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
QA warnings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
index 06a9548a20..ef2e25d4d4 100644
--- a/meta/classes-recipe/externalsrc.bbclass
+++ b/meta/classes-recipe/externalsrc.bbclass
@@ -61,7 +61,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)

