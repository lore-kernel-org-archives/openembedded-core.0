Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FE3CD8C85
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:19:17 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14957.1780748354259187141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=O+I9Nv7C;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260606121912ef3b3d65d80002070f-rjzv9b@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260606121912ef3b3d65d80002070f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Jun 2026 14:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ziq+NyBKHNyWNFqn3F8amsJ1n5gTkiulJTJTiMqhbfQ=;
 b=O+I9Nv7CsrbMnhuk5TDDg3vOAo1nJgd02nOgC4qT1r2rNCFpZDvEZZr4jR8s5Cy79Omuww
 KRUDuNfS4ylO0LqaHX2U8mJG+X+/aPYixZfbeL2TaesPZ3raz1FOtcqMdOeXLqHse62mZr5v
 AfmCmmh3YfeiAglG7mIoh2Dash5IfrOq6kLv9JEms3rdqTcM9lSoAbLqLYgeh16Mjze4rsV2
 ykT2jgIl/Lo41pbLc1vE/Egq0+pxOflzG0OuIM+BCuuCUwJa514JFfT3i0x7FIIrIVypuyWf
 Leh0U49B5l9rhV+5jR6W92ygh4mlqmiiU5xD2BxkeZ9tH+MuRZ1bsKIQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] uboot-sign: sign SPL FIT into a copy of the SPL DTB
Date: Sat,  6 Jun 2026 14:17:56 +0200
Message-ID: <20260606121836.2782754-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
References: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238219

From: Adrian Freihofer <adrian.freihofer@siemens.com>

mkimage's -K flag injects the public key into the DTB in-place. When
the signing target is the compile-output file (spl/u-boot-spl.dtb),
each test run accumulates key nodes from all previous runs in the same
work directory. With SPL_SIGN_CONF=1 every injected key carries
required = "conf", so mkimage requires ALL of them to have signed the
configuration. When a subsequent test uses a different key only its own
key signed the FIT, causing the verification to fail with:

  Failed to verify required signature 'key-<previous-keyname>'

Fix this by copying the compile-output DTB to SPL_DTB_SIGNED first and
passing the copy as the -K target. The original spl/u-boot-spl.dtb is
never modified, so each build starts from a clean state regardless of
how many times the task has been run.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 9cb5c6ccf3..2b10e71730 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -472,21 +472,25 @@ EOF
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
 		if [ -n "${SPL_DTB_BINARY}" ] ; then
 			#
-			# Sign the U-boot FIT image and add public key to SPL dtb
+			# Sign the U-boot FIT image and add public key to SPL dtb.
+			# Work on a copy of the DTB so that the compile output is
+			# never modified in-place.  Without this, sequential test
+			# runs that reuse the same work directory accumulate public
+			# key nodes from previous runs, causing mkimage to require
+			# all of them when verifying the conf signature.
 			#
+			cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
 			${UBOOT_MKIMAGE_SIGN} \
 				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 				-F -k "${SPL_SIGN_KEYDIR}" \
-				-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
+				-K "${SPL_DIR}/${SPL_DTB_SIGNED}" \
 				-r ${UBOOT_FITIMAGE_BINARY} \
 				${SPL_MKIMAGE_SIGN_ARGS}
 
 			# Verify the U-boot FIT image and SPL dtb
 			${UBOOT_FIT_CHECK_SIGN} \
-				-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
+				-k "${SPL_DIR}/${SPL_DTB_SIGNED}" \
 				-f ${UBOOT_FITIMAGE_BINARY}
-
-			cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
 		else
 			# Sign the U-boot FIT image
 			${UBOOT_MKIMAGE_SIGN} \
-- 
2.54.0


