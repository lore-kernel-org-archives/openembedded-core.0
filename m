Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0007EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 06:20:17 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.6809.1690870811574343939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 23:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ogeqvzHn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20230801062008012964af9a7b2f5367-nrkjhy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230801062008012964af9a7b2f5367
        for <openembedded-core@lists.openembedded.org>;
        Tue, 01 Aug 2023 08:20:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Q8trG3/s2JgcYcSTQS51AdXlBYdyTj1GDUqrX62PB1I=;
 b=ogeqvzHnw+peTUm1ccKi2wxJPWXgHCQdEMOorr4mgKNsg4lurG8p3XWzKzCpXfYYrgqQfL
 soLrfj2XNfgv9PM4NpFQuMRIBcdLgrrrdohtWPQxGHAG+B3B7ZUcLDCtv3JIDCCUbUR7jqgE
 idhi255aRlUiN1oXgTnJaaTpbmmdg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] gcc-runtime: remove bashism
Date: Tue,  1 Aug 2023 08:18:49 +0200
Message-Id: <20230801061850.5188-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185193

From: Peter Marko <peter.marko@siemens.com>

Debian 12 no longer supports replacing dash with bash as default shell.
Therefore to achieve compatibility with Debian 12, all bashisms need
to be removed.

Shell comparison via == gives an error with dash and thus the condition
is always false.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index bccc8a5b89..64b6168ba7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -132,7 +132,7 @@ do_install:append:class-target () {
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
-	if [ "${TARGET_ARCH}" == "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
-- 
2.30.2


