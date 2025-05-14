Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A47C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.110589.1747248811553974163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=W7axeXV+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202505141853326e8927888b58a32486-bgt5ow@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202505141853326e8927888b58a32486
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nhMgxIzZ3iXlaOg+kmuGvadbhHiHFjNEdNIsjBj7FIc=;
 b=W7axeXV+TqJZZnMD4AnuOhN14L4BgEe6oYZXF13PgQWmmERYsytKXwxp3mOUB/wuTqwVzh
 G+9c3xXHJqLU9xtu8G7MnAwEbEUflsmOp8fE9LVbJ770Yrvo6jn2g/0Ggsjxx1jnKzgYaTyz
 DlJREbszSLzvjVp3UxAJdem2ynygzq5bt4vnp70P09CxgJKOmR/GrPKQbFH/lx3kDkFoEeH0
 Wf1fon0QsU/yaxTXqDRPRdxEaktZqaGOI7xXTqgnbQZaLilL1dfxtuxC14AiWTge/MjyGU3m
 KTFHNvvbPNUS7QfFC8i80Em3LIsYFMWXl3dhIwPjpY+eeEievBan2imw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 06/22] kernel-uboot.bbclass: stage the kernel binary
Date: Wed, 14 May 2025 20:50:50 +0200
Message-ID: <20250514185225.162998-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216529

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


