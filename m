Return-Path: <benjamin.missey@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E744C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:20:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.web10.8634.1751620842838755553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QZM2UiE9;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+benjamin.missey.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C556561457;
	Fri,  4 Jul 2025 09:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CEF4C4CEE3;
	Fri,  4 Jul 2025 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751620841;
	bh=jhwp48RNq+iyp+zMiaNdQ9Hkrv8kfRgVctGprHheYFw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QZM2UiE9Um/RKfyWHXcG+C+S6PIjvVS5Uc/bieMCnPPTX6G7yw5U77zCkg6Y+bsJU
	 nogezX+SEj8df5oCBCppjqb+1jFsPmz/1wRpUer5JNl9JDikbozUNo/7HHlVXABl1X
	 W1hi3Aul8kgBV2R3WxQXtpaZpSRwByGBMWOVoMt5358HEnlPf9x2+ODjOaSRmUT5aO
	 Ae5Kv46pbKGI7kTHmlJncRyWV5mQK4QnZE1THpVG+yekrS6SgIVh90vyTvFdLJTeSw
	 tR93zoGfwScEK0+XIrHQKynwS7QgXFaCysJdw1zn8GK50Owr+2lEssjlE3SJ3wpRsF
	 8+vmNc6FvWCZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73824C8303D;
	Fri,  4 Jul 2025 09:20:41 +0000 (UTC)
From: Benjamin Missey via B4 Relay <devnull+benjamin.missey.non.se.com@kernel.org>
Date: Fri, 04 Jul 2025 11:20:31 +0200
Subject: [PATCH] kernel-fit-image: fix symbolic link fit-image.its
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-fix_typo_kernel_fit_image_bbclass-v1-1-b30b07126469@non.se.com>
X-B4-Tracking: v=1; b=H4sIAN6cZ2gC/x2NQQqDMBAAvyJ7biCmitqvlLLEuNFFGyUrooh/N
 3icw8ycIBSZBD7ZCZE2Fp5DgvyVgRts6ElxlxiMNqWudKE877gey4wjxUATel6R/7YnbFs3WRF
 lC+N0U9dl5d+QOkukJD2P7++6bnpL7fRzAAAA
To: openembedded-core@lists.openembedded.org
Cc: pascal.eberhard@se.com, Benjamin Missey <benjamin.missey@non.se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751620841; l=1205;
 i=benjamin.missey@non.se.com; s=20250620; h=from:subject:message-id;
 bh=TON0k6AXlo565FrIe2ZnTiaFCI8bZoW2lQ6EtL8r3fQ=;
 b=02ypVho0/c1npgZrwzklevxn1hewt8+QbPJEr2vW0uEQWZykNY9wmQttVnMsrc1ZBZ/N8DSHb
 JQOmkSydYXcAkLDO+QCDD380bLzOnC2wC17cOwT8XTCFK1epoygobvP
X-Developer-Key: i=benjamin.missey@non.se.com; a=ed25519;
 pk=HehU6MOmKShwMy0xbM2FC7HuoJnsSlKtZKWSTRRy1Do=
X-Endpoint-Received: by B4 Relay for benjamin.missey@non.se.com/20250620
 with auth_id=437
X-Original-From: Benjamin Missey <benjamin.missey@non.se.com>
Reply-To: benjamin.missey@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219912

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
base-commit: 77a93e8cf1da4231341c56f64f9d4d474f9f2bb7
change-id: 20250704-fix_typo_kernel_fit_image_bbclass-a42c098857f3

Best regards,
-- 
Benjamin Missey <benjamin.missey@non.se.com>



