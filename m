Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEE4C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:17:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.22669.1751549327406498586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hYCZPyqM;
 spf=pass (domain: kernel.org, ip: 139.178.84.217, mailfrom: devnull+benjamin.missey.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5A215C5128;
	Thu,  3 Jul 2025 13:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64DADC4CEF0;
	Thu,  3 Jul 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751548930;
	bh=HxA5i8JUrtT9umVDtNoc3FLViDihhHwLRPPdR0nomkQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hYCZPyqMabenjhYNEOF8MwsHvhqEdrTW2Zi5sHE3pZCuT2oB8/wKKPGPd42h5a8At
	 TPUk80dCQIPpFEd7FY3lni5MYLE45m9+H3fllPeN5MMcpQVUruPyQ3NyFmOwPnsf9b
	 ew7CI/gYiL5mu1Me/eWRL5uVjHF1A45O9I7bm7jm+wFSJw4KBIwux94ckokKCSHue3
	 ktdysHt0IR8kgbmCRFJZiethWVKbcrYQjBH58C57FSCpW18iWcYrfAzBzUWf+H6wzX
	 v436lKRNaxFjjmwOlb0PM+DKP0s2aYkl5oX4zxldmjxX29uqfhpDk98nmCUiD8zdpv
	 poA7ND8FwWveA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5484FC83F03;
	Thu,  3 Jul 2025 13:22:10 +0000 (UTC)
From: Benjamin Missey via B4 Relay <devnull+benjamin.missey.non.se.com@kernel.org>
Date: Thu, 03 Jul 2025 15:21:55 +0200
Subject: [PATCH] kernel-fit-image: fix symbolic link fit-image.its
MIME-Version: 1.0
Message-Id: <20250703-fix_typo_kernel_fit_image_bbclass-v1-1-2f1857f1466b@non.se.com>
X-B4-Tracking: v=1; b=H4sIAPKDZmgC/x2NzQrCMBAGX6Xs2UBsDP68ipQlTb/UxZqWbBGl9
 N0NHucwMxspikDp1mxU8BaVOVc4HhqKj5BHGBkqU2tbb8/WmSQfXr/LzE+UjImTrCyvMIL7Pk5
 B1USHIZ2uwbuLp9pZCqr0f9y7ff8Bw5pDjXMAAAA=
To: openembedded-core@lists.openembedded.org
Cc: pascal.eberhard@se.com, Benjamin Missey <benjamin.missey@non.se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751548929; l=1205;
 i=benjamin.missey@non.se.com; s=20250620; h=from:subject:message-id;
 bh=VZXY6XMGgfZM2Ki6yfw6FoZm+iOjyCZSwwTwDNidL6c=;
 b=lR9ROplyeyuepZysfNXHF90cQD8mz5cvVcKGgh9RXEUAaYPEFiW5Ue4EUos6czDTDdGlwLEqT
 1urRAMmg9pKCMCb0Mv78Hy1hitPoyopMWLJ1mXP2ZzjPvnzJYdmjyFW
X-Developer-Key: i=benjamin.missey@non.se.com; a=ed25519;
 pk=HehU6MOmKShwMy0xbM2FC7HuoJnsSlKtZKWSTRRy1Do=
X-Endpoint-Received: by B4 Relay for benjamin.missey@non.se.com/20250620
 with auth_id=437
X-Original-From: Benjamin Missey <benjamin.missey@non.se.com>
Reply-To: benjamin.missey@non.se.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219995

From: Benjamin Missey <benjamin.missey@non.se.com>

Bad symbolic link is used for kernel-fit-image. fit-image-its used
instead of fit-image.its.
Fix bad typo.

Signed-off-by: Benjamin Missey <benjamin.missey@non.se.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 39845997ed..fd4c6a30fe 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -173,7 +173,7 @@ do_deploy() {
     fi
 
     if [ -n "${INITRAMFS_IMAGE}" ]; then
-        ln -snf fit-image-its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+        ln -snf fit-image.its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
         if [ -n "${KERNEL_FIT_LINK_NAME}" ]; then
             ln -snf fit-image.its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
         fi

---
base-commit: d1c39b29f21719b349072c51a761fa19770a49ea
change-id: 20250703-fix_typo_kernel_fit_image_bbclass-c3edf49a5385

Best regards,
-- 
Benjamin Missey <benjamin.missey@non.se.com>



