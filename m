Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCE6C3ABB8
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:06:58 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.28204.1746364017644731354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=UFgvCJzp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025050413065584b60616f37155f910-f_vxvv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025050413065584b60616f37155f910
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nhMgxIzZ3iXlaOg+kmuGvadbhHiHFjNEdNIsjBj7FIc=;
 b=UFgvCJzp2uaoT1dgx+ga5MkqDB68vygGpDmdRblLXwqhTox4YD4z25UaT1PfYLugOG7nMJ
 ODrmAYnbFb021YMIAvjmtDbbiQGn58upmo6lCGV+p4l6Qci24NtHnsgEBEqj6a7PkSiFPs/i
 pv41k332ZComLLVL9dELvfuLysdpi9uh0iK3amvfcqi+STHRJg68cLw6SoeuX7Uz3HSMdJrK
 hhbDEQ5Or6ov8Ie1oMccCHJJ1zz3b516EBX3blh3x9RmbR75g6Virnnuy5GdnVnF4bogAfrH
 8H4Uey2/xKU5Mbweyl7ANUM3ZTj9EzPmZlq1thGzQsXcBiyv0bNdcraQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/20] kernel-uboot.bbclass: stage the kernel binary
Date: Sun,  4 May 2025 15:04:53 +0200
Message-ID: <20250504130507.717954-6-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215948

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


