Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB554C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 14:04:32 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web11.23109.1716905072002549450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 07:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VpZ5B0ckvzLfC;
	Tue, 28 May 2024 16:04:30 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VpZ594NynzWSQ;
	Tue, 28 May 2024 16:04:29 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 28 May 2024 16:04:14 +0200
Subject: [PATCH] kernel-yocto: fix incorrect debug message for defconfig in
 WORKDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-kernel-yocto-unpatched-bbdebug-v1-1-a4ddad98cb55@cherry.de>
X-B4-Tracking: v=1; b=H4sIAF3kVWYC/x3NywqDMBBG4VeRWXfAThuUvkrpIpdfHSyJJFpax
 HdvcPltztmpICsKPZqdMj5aNMWK66UhP9k4gjVUk7Ryb430PCNHvPmX/Jp4i4td/YTAzgW4beT
 gb13vjIEVoRpZMgb9noPn6zj+XwL21XAAAAA=
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 14:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199973

From: Quentin Schulz <quentin.schulz@cherry.de>

Right before this message is printed, the in-tree defconfig is checked
against the one in WORKDIR. If it is different, and therefore either
provided through SRC_URI or patched, then the message is printed.
Therefore, the debug message is incorrect and should say that a patched
defconfig was detected and overwritten.

Fixes: 004da4c6c602 ("kernel-yocto: split meta data gathering into patch and config phases")
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index f741a342d4..6d5c3b6327 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -158,7 +158,7 @@ do_kernel_metadata() {
 				# one already placed in UNPACKDIR
 				cmp "${UNPACKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
-					bbdebug 1 "detected SRC_URI or unpatched defconfig in UNPACKDIR. ${KBUILD_DEFCONFIG} copied over it"
+					bbdebug 1 "detected SRC_URI or patched defconfig in UNPACKDIR. ${KBUILD_DEFCONFIG} copied over it"
 				fi
 				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
 			else

---
base-commit: 51aa0217e595939f15bd3ffd7625907aef142c05
change-id: 20240528-kernel-yocto-unpatched-bbdebug-dc378b55ea22

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


