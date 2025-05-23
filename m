Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DBCC5B543
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.44671.1747993341093926584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=d3B+3pIw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202505230942182e416ed0e29987eab9-rmf5m8@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202505230942182e416ed0e29987eab9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wnypcO3iXUgNAB4z0FwOjJB5Kuq/bwCfyl5AwCRtNgE=;
 b=d3B+3pIwvUkyIOdV7DL/B77XDY53eb8mjuGcdXSMVcNA48kr54zo5LPCZLTJ0pEHjNjQF+
 luV7iZbG6qi9GcFF3AgN7iLtppSdtMD6Cn6VQguHp9bnc7+zJmysFthicUpGo4X+Nb3uiOBw
 PGNES2BqjKhLNjCdLwdSrEtFLivv4wDliLG193E0mXqeutoFdfq/FR4xUyG7h45Ikncym2dt
 i3qWhUKDhlF29irl0YaEJNMPkjtxAfB8i5Ze1Xi24+4q6cX8Tg8F3VTC4l4DA59upiacYEDw
 HF1krpypb9M8fWCP3Kro2ad1MPKWlsi8ifAWI38IFtso9hT7OdGoHoBA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 06/17] kernel-uboot.bbclass: deploy the vmlinux kernel binary
Date: Fri, 23 May 2025 11:41:07 +0200
Message-ID: <20250523094152.727177-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217195

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the kernel-uboot.bbclass to build and deploy the kernel binary
intended for inclusion in a FIT image.
Note that the kernel used in a FIT image is a stripped (and optionally
compressed) vmlinux ELF binary - not a self-extracting format like
zImage, which is already available in the deploy directory if needed
separately.

The kernel.bbclass inherits all classes listed in the KERNEL_CLASSES
variable. By default, KERNEL_CLASSES is defined as:
  KERNEL_CLASSES ?= " kernel-uimage "
Since kernel-uimage.bbclass inherits from kernel-uboot.bbclass, the
creation and deployment of the kernel binary for inclusion in a FIT
image happens automatically by default.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index d2a63524ece..e26ba6f0aa9 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -56,4 +56,13 @@ uboot_prep_kimage() {
 	fi
 
 	printf "$linux_comp" > "$output_dir/linux_comp"
-}
\ No newline at end of file
+}
+
+kernel_do_deploy:append() {
+	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
+	uboot_prep_kimage "$deployDir"
+	# For x86 a setup.bin needs to be include"d in a fitImage as well
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+		install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/"
+	fi
+}
-- 
2.49.0


