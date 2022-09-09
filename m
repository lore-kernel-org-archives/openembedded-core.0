Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73527C6FA86
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:56 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.1917.1662761089218652578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=pKOpJn8M;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 83FE55C00C8;
	Fri,  9 Sep 2022 18:04:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 09 Sep 2022 18:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1662761088; x=1662847488; bh=Jd
	tBRA3D1VkV0s2yVyatoW1Bw3ecwfMpkhy+8e4AhHY=; b=pKOpJn8MVCSKjUI3un
	JvrG83rs2xQY/3EbO0ZHFUEWOVz3Wcf93KkFa1TPtIb92S+s0WB4ZZiYq9Sh/5x7
	hw303wSEQ2YoMdzD8JnQrfuYKpCx/eAmeyP7/DGuEQap8+7Zzf9q0zIdJAIjiXG5
	8LTTQ4BGKqP0vtsXUd3uPNwi6QbGEAGO4Kl+aRuH4abdJD73vCL7ru1OLPkVhGqZ
	UGX5KgUDlV4bsKDfeuTGSmuJjaVYw8S67WZ55f24DVpOMrCPznn15s8MI7Y6nf2E
	WzlgdPK6qjBc1pbyQ7ntpuryxw66VgFKPGfgdyLJRsRgn2A5bUDOCkfYcfT7fVc1
	K4nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1662761088; x=1662847488; bh=JdtBRA3D1VkV0
	s2yVyatoW1Bw3ecwfMpkhy+8e4AhHY=; b=n3a6tWsB9PZA4Y32eiuZLgJDv72GN
	nnQem39tRFspHP5VFR/xDCiNol10aZsgFCfqmMRoI5/PjS1aVZW15mF+NtI2HjWX
	+UoUgBZ+XiKVRqeDwLSAMyZesc6t+cQMb+ey0obGpbsywVmK/UtzFsuCESQZMDpe
	6Q3iBiA7m2aE8wwGszCmmXMfXx3vyYqW14c1Pe8NgEKfr6E5MnS09mhv7F04EhwV
	TlZ8YYyLX3YlsWoXMNy9HvmYb+K31/FAyAgZltPO7DmrL5SGhekBnk7FO1WDyQP6
	8dQ+8oOEHwIOPnD1/RGeTlGC+RnPVIB/dv/aLc3hh1Pqhq/JbiYMzxC+g==
X-ME-Sender: <xms:gLgbYypEa3Vgjx14ZUKzYMf5MscBGnaq9oddyN22mwob5uH_Oq9gbQ>
    <xme:gLgbYwrel-jV61TOyTmX93AUCa2q0hPDPoNxVtyFKtSO6kKv32ztxF1MVaTwfIEA2
    Jo0VAuoEasPj_4WWQ4>
X-ME-Received: 
 <xmr:gLgbY3Pevs42lfJDEEck-UrPSdZ45RcCXnJFu9zYzF_-6YG3LX_1kuUD46fMGTbyRZk0VPiNb7ncGO3HE-XlZ8gAYZgm3GAraKFbJoFvdKbhlL0r3pTjEGOX>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedtiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:gLgbYx51B5Stwyh0zswzZb7JbWWvCwmXzVuSlF95BJ0nSUuDbVuUZg>
    <xmx:gLgbYx6WUfJXPk9cth-QNwsZWcxMcADdBb8hJA-OO8-FFBnwje24dg>
    <xmx:gLgbYxh7KmJo-94MkZ40UJSnzlr3obLMmrciWENnn12bWkg9cgh82A>
    <xmx:gLgbYzTGYGHZ8ivQcGpZiBOZd6Qk8WIUcqBH4v69cL8fp6gVOUkkCQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 18:04:47 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 2/4] kernel.bbclass: Pass the kernel package name to
 depmodwrapper
Date: Sat, 10 Sep 2022 00:04:23 +0200
Message-Id: <20220909220425.2737985-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909220425.2737985-1-andrei@gherzan.com>
References: <20220909220425.2737985-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 22:04:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170506

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This makes sure that the postinstall script it using the right kernel
paths.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index de1b80d0ae..e4e69e0763 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -677,7 +677,7 @@ pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
 	fi
 	if [ -n "$D" ]; then
-		depmodwrapper -a -b $D ${KERNEL_VERSION}
+		depmodwrapper -a -b $D ${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}
 	else
 		depmod -a ${KERNEL_VERSION}
 	fi
-- 
2.25.1


