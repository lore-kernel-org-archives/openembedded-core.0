Return-Path: <sst@poczta.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47D1C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 13:34:43 +0000 (UTC)
Received: from smtpo69.interia.pl (smtpo69.interia.pl [217.74.67.69])
 by mx.groups.io with SMTP id smtpd.web11.29725.1737898473668094652
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 05:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@poczta.fm header.s=dk header.b=SjKpem9B;
 spf=pass (domain: poczta.fm, ip: 217.74.67.69, mailfrom: sst@poczta.fm)
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with UTF8SMTPSA;
	Sun, 26 Jan 2025 14:34:30 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: openembedded-core@lists.openembedded.org
Cc: Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH] kernel-yocto: move the cp of ${KBUILD_DEFCONFIG} file outside if body
Date: Sun, 26 Jan 2025 14:34:19 +0100
Message-ID: <20250126133419.1545381-1-sst@poczta.fm>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1737898471; bh=lr3+UVzcagoApT7agCSV3NDartknGQ0uSgttwEkP07M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SjKpem9B5mwWxEK5ODxV5yk3xtvN5U12qPtfe6BeamWdDE4ilAbTKP2Y1S1McoNHL
	 bKZivGJIyiEHZ+Cujx2h1qqXI7yrWtEOsSs8ZJj7HAEbf/JQD9Q0jr53iMy4PZgNj1
	 Ke71zjDVfsRpbqHW2qUiNnAkRAtjz/vvWEWE/Kg8=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 13:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210290

In both true/false cases, we will cp the file, so move the invocation
after the if body.

In addition, misleading comment has been removed.

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 meta/classes-recipe/kernel-yocto.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c45abf6ddc..cef6b9ec3f 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -150,10 +150,6 @@ do_kernel_metadata() {
 	# from the source tree, into a common location and normalized "defconfig" name,
 	# where the rest of the process will include and incoroporate it into the build
 	#
-	# If the fetcher has already placed a defconfig in UNPACKDIR (from the SRC_URI),
-	# we don't overwrite it, but instead warn the user that SRC_URI defconfigs take
-	# precendence.
-	#
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
 		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
 			if [ -f "${UNPACKDIR}/defconfig" ]; then
@@ -163,10 +159,8 @@ do_kernel_metadata() {
 				if [ $? -ne 0 ]; then
 					bbdebug 1 "detected SRC_URI or patched defconfig in UNPACKDIR. ${KBUILD_DEFCONFIG} copied over it"
 				fi
-				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
-			else
-				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
 			fi
+			cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
 			in_tree_defconfig="${UNPACKDIR}/defconfig"
 		else
 			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree (${S}/arch/${ARCH}/configs/)"
-- 
2.48.1


