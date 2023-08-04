Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B5DC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:06:17 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.2594.1691168775939920701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=UGWMVkSh;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=1m7X0rTV;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 3DAA83200945;
	Fri,  4 Aug 2023 13:06:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 04 Aug 2023 13:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1691168774; x=1691255174; bh=iVFVMW5gQY
	Gn1wcm8vMQ8rqqOoGl+oQf95n9vBfdjHI=; b=UGWMVkShlWSyCz6W9f2iVMaDdh
	EnLBUPTOUER71QJIqjpMECpTyIBjG6Mo5L2ayMP0S7AffuirG1F84JqA+9vzoqeG
	+l7Ozquwg0kOPzHOJ6qal5TOOS4cX9J5DptdnvHbIVwZmNPgCpnzuMxoaF56JN9m
	w2F5RVJMPbuLpZoIzgwLugCiNd7WTExBoK12dHpUFUbYYeXTnpdOOHTlaopd68Qf
	H89HqzKQmgoC1EOI5NtWjF1ZYEoVMnO6hjZZVcQ7fCS8AC4cPFQN8PehWd9ewodW
	2fdZ9F1W5+hMUfN84fhHa1/HESSJMCQ/yripiFBblFHUEgva/ZCjMECVHNPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691168774; x=1691255174; bh=iVFVMW5gQYGn1
	wcm8vMQ8rqqOoGl+oQf95n9vBfdjHI=; b=1m7X0rTVVcbvTrhGBxDlkLPSC+xMd
	CEeosvH8qkCoktI2Cvz4EfAEOKhTwxXt7X7IGf6ReMyLEcYClYo/GEGletzbtdRn
	YO2/c18c1p6r61PopVdF2VK+vRs9Fniy+ZYg0887MpY9/Y+2ZtFncetVh7B+PXSO
	vVkBiyKc+ywG7hw6k2NqO1ITLftwt06pFzOC6V6nj2+fX/K0cRiX8CLfzEfPtpxf
	eGLTuW2/MFYjz/ahEyzXHcc7XjeThMbeD6DH0173DN5lZ9WWpF2p2bhhuYHHhjhr
	Gmkc3RgvEbZ/pSIbKnvTcjmMZZWkUmn6c2Ow5vhMYOfRHTOIRnrzUtyfw==
X-ME-Sender: <xms:BjDNZDVjojshRRC3Sd1H9J_eK7LJp28CurBurW76eDPg_8tIosa0mg>
    <xme:BjDNZLn3F_xMFUNtiBREj1Ch3Oz9B2pVp70H5p5Y1TQLL7RXuyAnoEZhypWoGpiY8
    wr3fNQ2HMdFEFcFnrA>
X-ME-Received: <xmr:BjDNZPYHsaJw3EdOY64KsgriT7NlqseRNFBk7zSsRCMK3M5rmjBiSmcbEf0jT8bHxH9zHM7OT23WSipuFE-PA4XwhPO3dDq0thc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeeggddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddt
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevtdevgfdthfefveejudelheeghefh
    hfdtteetheehudeiueefhfetkeejleefteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:BjDNZOXTMkLWGyAADTMKKugP22qzst355iEK8wlt5RsuAkGaQFVkHw>
    <xmx:BjDNZNm6YwNtv_7yy7j2v9e1lQUsUX1zH2u7SRby049YjRinVIh51g>
    <xmx:BjDNZLcgSPprVsmvolbTPWu7clUiTer5ilscr4iq-dfhTWlvQNvuRA>
    <xmx:BjDNZNuWmBDwk7oM--v05Jasz10gx73dWMfyYezvXvcxjIjm8R1PUw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Aug 2023 13:06:14 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Joel Stanley <joel@jms.id.au>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2] kernel: don't fail if Modules.symvers doesn't exist
Date: Fri,  4 Aug 2023 12:06:10 -0500
Message-ID: <20230804170610.38795-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185538

From: Joel Stanley <joel@jms.id.au>

Kernels that do not use modules do not have the Modules.symvers file,
which causes the previous one-liner to fail.  Invert the logic so that
the absence of the Modules.symvers is a passing situation but we still
get failure checking on the install operation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 247ef4a48a..bb5995b495 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -486,7 +486,7 @@ kernel_do_install() {
 	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
+	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
@@ -555,7 +555,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.41.0


