Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53F1C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:16:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.26759.1647267411967990641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ZJBlCpEr;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267415;
  x=1678803415;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+YnJcblMQjhSfjGe9tDVGsSjkXTJ9Upp4V4K0Romrj0=;
  b=ZJBlCpEr0D2I67ULmKWuoQKRQMr23PiY2bmUiEIEagDyyngmacSifOfg
   iAare0dBIFDR0TXLZfcHJywlU7AbmAhE8ZYvDidmNBfbMxd9HszV8Bf9m
   csB6GVdPocsrw8a90mtxsoOr725L2nwdclBnRYfc86dzEXR7jpp0D0Vn0
   j2i9Tl0hrlpSAixjbIa3SZFE2a0rBP35uBU64lFS9m/TPfl745fAvE3Kb
   glJze3wmgVefc2KGf6Vf+4IfOl8NUrzmcbQxS0x4eivDKJVwal0RLMGpJ
   c439JeCjgV1opSycmcW7+7NLoi/wHnXS0nW0ZEta7CFSv5fjMYusWbwzn
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] image.bbclass: Remove two unnecessary paths from
 do_rootfs[dirs]
Date: Mon, 14 Mar 2022 15:16:45 +0100
Message-ID: <20220314141647.14807-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220314141647.14807-1-pkj@axis.com>
References: <20220314141647.14807-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:16:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163146

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to include a path in foo[dirs] if it is also in
foo[cleandirs] (except if it is the last path in foo[dirs]).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index eb192057c2..7f1f6f80a4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -252,7 +252,7 @@ fakeroot python do_rootfs () {
 
     progress_reporter.finish()
 }
-do_rootfs[dirs] = "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
+do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${S}"
 do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask rootfs after do_prepare_recipe_sysroot

