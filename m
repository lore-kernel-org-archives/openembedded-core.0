Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1EAC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:16:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.26758.1647267411934991214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=J9kI9yUR;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267412;
  x=1678803412;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fPPinZ2Fcv5zgnYrBB/0PHy94u3Na5O8pA1zuxduk/c=;
  b=J9kI9yURthpL802NA7mjvYeJ+hAiIQaKE3a7NhmpjkbCCxnS4jgCzPJ1
   VkgRNcj4HGwMMAvN4fkLFhqBAfod8gM7WsrPJEqimA+J71Lpf2LLBZ9dp
   JaDupFGEtjCMBvAfF0+64QX0v1vhrYUgjIqTAmN8/miA76v2wm2Dp0PGX
   2XC6en9B1197tfA3S9QHcdg6gC2FcnbsGqRGeuk99hmeCy1iSSZI2Cipl
   UYy3wLtAcuoUpqrdOnYVHs9U5DE83EDSY7qBDWh37XnWr20enkjZZl976
   Hs3Of8wbXqoFejpSDMBL4h5lEo+uWi5LLMF/Z9c0FkgogxcMkCqFOT8jE
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] deploy.bbclass: Remove an unnecessary path from
 do_deploy[dirs]
Date: Mon, 14 Mar 2022 15:16:44 +0100
Message-ID: <20220314141647.14807-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220314141647.14807-1-pkj@axis.com>
References: <20220314141647.14807-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:16:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163143

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to include a path in foo[dirs] if it is also in
foo[cleandirs] (except if it is the last path in foo[dirs]).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/deploy.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/deploy.bbclass b/meta/classes/deploy.bbclass
index 737c26122b..7fbffe996b 100644
--- a/meta/classes/deploy.bbclass
+++ b/meta/classes/deploy.bbclass
@@ -7,6 +7,6 @@ python do_deploy_setscene () {
     sstate_setscene(d)
 }
 addtask do_deploy_setscene
-do_deploy[dirs] = "${DEPLOYDIR} ${B}"
+do_deploy[dirs] = "${B}"
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"

