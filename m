Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C86C5475C
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.88515.1747172436304604777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Y+QQVMLB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250513214034a5f859154fa1beed2c-cffvil@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250513214034a5f859154fa1beed2c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nhMgxIzZ3iXlaOg+kmuGvadbhHiHFjNEdNIsjBj7FIc=;
 b=Y+QQVMLB9TDe1sQ3GSIORllTMHAVzsXGPT90tfy7c09TlROfTjOD/MWtaHbaAzy4oOvSOU
 HEGq30gxgfYxSpG0WfAljDh6keQUL+6vn1Swp7vG/Iz9YRZ3ahRoGgJKanHHbCO03IwgK8dS
 +CplC/Qi+AgQolDsYI2gxkfTLdvWf3m8Jxblur7iOTjYs/A5sIZI9ql1dtCamdBVoQ9OIzdY
 A9U44Jmzazr6D7qH3gciL6ySsGTtbdUpXv8jmPznzVuFuAw1HEJgOmEQ6AV3aHIt+aWtyA+O
 jxZq2LLAEz9Ay0nqToG+n5xib4uq7D+yDdTAsxwMUIe0lpf29jYSIJpg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 08/22] kernel-uboot.bbclass: stage the kernel binary
Date: Tue, 13 May 2025 23:36:50 +0200
Message-ID: <20250513213834.87830-9-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216464

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the kernel-uboot.bbclass to expport the kernel binary which is
needed for creating a FIT image to the sysroot-only directory.
This will allow to use
  KERNEL_CLASSES += "kernel-uboot"
and a recipe which creates the FIT image using artifacts from
sysroot-only instead of the kernel-fitimage.bbclass
  KERNEL_CLASSES = " kernel-fitimage "
which does not work with sstate-cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index d2a63524ece..7aafd4757c2 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -56,4 +56,14 @@ uboot_prep_kimage() {
 	fi
 
 	printf "$linux_comp" > "$output_dir/linux_comp"
-}
\ No newline at end of file
+}
+
+do_install:append() {
+	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
+	install -d ${D}/sysroot-only
+	uboot_prep_kimage ${D}/sysroot-only
+	# For x86 a setup.bin needs to be included in a fitImage as well
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+		install -D ${B}/${KERNEL_OUTPUT_DIR}/setup.bin ${D}/sysroot-only/setup.bin
+	fi
+}
-- 
2.49.0


