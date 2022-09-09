Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C37C6FA8A
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:56 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.1827.1662761090791194241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=oeN1ZIFl;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2437E5C00C0;
	Fri,  9 Sep 2022 18:04:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 09 Sep 2022 18:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1662761090; x=1662847490; bh=q/
	eD6OzjBf3eaZAzMtimNRXMR6jlVnVd/6r+lG2htMM=; b=oeN1ZIFlhmsnXWwIEQ
	pgbBqzPDzpUZQbWdkZGO7DSWjWVlVfe5EorC4ibldBI1uZOW5BG94hBW4yjhPtLc
	7qRIcC6qjJgAW8lSnuBuMhcx8GvUeWBJ/LABlAb1LgkptMaHTGLLQ+sc+1yJob5H
	B4xDwud5wWSi4+Lyz+Uw6PTQBniP+MR/JmRA6I3b3ixLWVImKKuiCEblGe66V505
	smqd7mVNUp5ncmtnZ1CYLAVvGjeimKUUT+JHMmDm2wzPG0UsQX0lr1RNmNB5ytv5
	VXjIsMky7y398J0VCHX4m1xwCXSlO0UirzMBLLR4DsP1LgEcqIAh8Y2JuTeEVkE+
	u5bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1662761090; x=1662847490; bh=q/eD6OzjBf3ea
	ZAzMtimNRXMR6jlVnVd/6r+lG2htMM=; b=fIhxINRjwQd/P/3mVdlUSXjqRZvR/
	YVFGaA/YwM9J97cqz8l3IPllloxUWJ/kYQ8zorHd79MXN68WXrgOjdIgMKvfd1EW
	AkjQsWDCbocMxV6Y8ujR+4kE2l54C8cg8M1vOu7a2Sv6hfwlfybXdexS4dUDVHT/
	xCKx0w6wHn5Bv0Ct6mOGa9xj1LfFweNyCwxS1O09N+EVE7qITyFhHn9xR748bLoG
	DHynAdDqkr6YFQuWFbKTZzSaGWF9z7VyL5t9Pvu/SJIaFBWnSItchiGJpEXIQvp0
	lkWzfnppsAFi6YfJki4ZpxDiOpaYnIWqe9XYsbasQm1AblOixvBrRC2Dw==
X-ME-Sender: <xms:grgbY9pGQ9GqEyva4RV3BAGBDH4-O_ZY39Xcmb2nnO6Pl4Zp0AELyA>
    <xme:grgbY_oiOzDLEIY1ES24zgHWBoFk0wTqYfqMIfvlhssNsClaSGrVN4ja-gV1xKvSQ
    noA4_61tnaIlm0jxPo>
X-ME-Received: 
 <xmr:grgbY6PYcqzA8I89OveYxC4spDj0uVJu9PcxyYl9CDOvaDT_0ROS46BHQDZ-ssVHGqFSIg-RvAWRFx0prLw-9KfPS3D-bonw6xUYX62BBrk6VeDQTXLHSJzb>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedtiedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:grgbY44bsPBcnXK7ar8zBRzrD4fjv3_PqRuyKzsY7DldZLLy0pe5Tg>
    <xmx:grgbY84T6XoltK9ELwlV5azGNRkjc6qX65Qj3C3nS_fJQOe25r-Tpw>
    <xmx:grgbYwgf1yO2gqAuv3lOukZio-wKmRg2BIEBt0u0RrnvnFcFChV32Q>
    <xmx:grgbY6TKrbDXjrK0mwSQhvtHAY_1ueG8Rdm_uQ4VnzKqVlDWUFG4hg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 18:04:49 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 3/4] kernel-module-split.bbclass: Pass the kernel package name
 to depmodwrapper
Date: Sat, 10 Sep 2022 00:04:24 +0200
Message-Id: <20220909220425.2737985-3-andrei@gherzan.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170507

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This makes sure that the postrm script it using the right kernel paths.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 1b4c864a63..08c2e54e86 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -18,7 +18,7 @@ pkg_postrm:modules () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
+	depmodwrapper -a -b $D ${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}
 fi
 }
 
-- 
2.25.1


