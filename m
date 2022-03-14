Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB24C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:16:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.26759.1647267411967990641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ejhf4jUq;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267412;
  x=1678803412;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jAHzOvUayE7Vt6evNtdDMrd2IKqWDuHtcVJuRIXytm8=;
  b=ejhf4jUqSsITEOzr0MIWWZaaBwq2E//6BhNxG3pMlVQFPfA99SM4e5J9
   wtOzFw2CsHMfTywYfaG0ZJG0Neg88y9BGm8F6DOqLE2EFnGX2CcFTOMtT
   9dGd72byLfZtM7HI9FiwTafWoGNcEGUCghoTiJVy+eK+ZmoX45F3yBwfq
   PDhBdtti5ruyTUw44llPLCxNyTGFa/3sdbu3gpVTpPv4B8sOlpCqSSh1/
   zssB4NZaao1HUG6Osni9i7zs//JRkswrhBhoHDLe/FruNOxEHDYgYj8D2
   nuNPchNg7HtG87hxj5zOeffJcaTKNaUAF7r+Ydol8ImKiD4pJKzM3fPOo
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] create-spdx.bbclass: Remove an unnecessary path from
 do_create_spdx[dirs]
Date: Mon, 14 Mar 2022 15:16:43 +0100
Message-ID: <20220314141647.14807-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:16:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163144

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to include a path in foo[dirs] if it is also in
foo[cleandirs] (except if it is the last path in foo[dirs]).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 5375ef3e34..daf99ca676 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -600,7 +600,7 @@ python do_create_spdx_setscene () {
 }
 addtask do_create_spdx_setscene
 
-do_create_spdx[dirs] = "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
 do_create_spdx[deptask] = "do_create_spdx"

