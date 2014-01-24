Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f172.google.com (mail-gg0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2976E947
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:29 +0000 (UTC)
Received: by mail-gg0-f172.google.com with SMTP id x14so761034ggx.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=q0RY9OiDiW8s3x/juij8uykdWRW1z/Nijs5wBRAlhcQ=;
	b=vd6VCEKxh7taT4vOvdsFSYmU/rkSGnIIsq1ByBmYV5HcORzmhruKnV1P51/01jyS0/
	AZU8QPOSueqC+yijf91IYhnUDQZwRXNwpibWuF8T9O+z8glzj3Zn3BGKYkoh24TIA0XK
	635c5lHXNH7IMN4oZX1sMe1d/8NOe/gW0V8IniUwqaFhY/P4SiNr3N7/PTNnxHjDZNss
	DkUL6I2VgfX1RVxFA0iHQsqTXSHLg+qPuBAg4ejG3sJLvn6OveRkSkvHqiPdkc+EVzgT
	vTy8LbN9CiYufB7rr4vAmUfkgpG0DuAFQR1ejwAlDJuD1s8svGAChO2Yeqm53ti26JZX
	/NkA==
X-Received: by 10.236.87.239 with SMTP id y75mr10430216yhe.50.1390526790073;
	Thu, 23 Jan 2014 17:26:30 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	o27sm42493872yhb.19.2014.01.23.17.26.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1BB9A17BF8CFB; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:12 -0200
Message-Id: <1390526775-26036-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v3 08/11] libfslcodec: Enable/disable the VPU support based on SoC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 01:26:29 -0000

This enables the VPU support for all SoCs but MX23, MX28 and MX6SL.

Change-Id: I82bc80b4540ed2a83aeb2ac4545b47f3e7e37d9b
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-multimedia/libfslcodec/libfslcodec.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-multimedia/libfslcodec/libfslcodec.inc b/recipes-multimedia/libfslcodec/libfslcodec.inc
index aa5282c..35fc713 100644
--- a/recipes-multimedia/libfslcodec/libfslcodec.inc
+++ b/recipes-multimedia/libfslcodec/libfslcodec.inc
@@ -1,4 +1,4 @@
-# Copyright (C) 2012-2013 Freescale Semiconductor
+# Copyright (C) 2012-2014 Freescale Semiconductor
 # Released under the MIT license (see COPYING.MIT for the terms)
 DESCRIPTION = "Freescale Multimedia codec libs"
 LICENSE = "Proprietary"
@@ -20,6 +20,12 @@ ALLOW_EMPTY_${PN}-meta = "1"
 # Choose between Soft Float-Point and Hard Float-Point
 EXTRA_OECONF = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--enable-fhw', '', d)}"
 
+# VPU Hardware acceleration
+VPU_SUPPORT = "--enable-vpu"
+VPU_SUPPORT_mx6sl = "--disable-vpu"
+VPU_SUPPORT_mxs = "--disable-vpu"
+EXTRA_OECONF += "${VPU_SUPPORT}"
+
 do_install_append() {
 	# FIXME: This link points to nowhere
 	rm ${D}${libdir}/imx-mm/audio-codec/lib_src_ppp_arm11_elinux.so
-- 
1.8.5.3


