Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF35AC32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:54:48 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.5292.1661298886125334768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=t1RtJY9O;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 22FF932001FC;
	Tue, 23 Aug 2022 19:54:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 23 Aug 2022 19:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661298884; x=1661385284; bh=bUhjuiqojLpkWg7nmxZj0xVjY
	FV5zM/BWAmgFS2CPJc=; b=t1RtJY9OaUoFJLDN72XTIVA2FE+jLYJx8L/UwgYO/
	vJe9bsGMU8/OsZk8q0fjTSfOmSGHkY99RHH75A0WUAV31MvGvTfGtLUiQuBRBicU
	WCCPkpwxYdhY+sop44KMCWOZdpIEXRW0CI/mBqvNhfwSubfr+fzOKCbuSzsLi7wR
	Hm3bmhvWHwzD/O35Aw8KRrFyaA41bPk2MpheQsc0/ksXl1cweQHu8t44KX9Ik+sE
	/ChCEZ+D4bilIi9Tg4IsA0Of8OVe1+cCrIxiuweA4B8Ye+7JXnSNtHb/zCDZiP8f
	EmmmX1yK0stO9gqlpt585n3J2bqKKFFk8Lgga6Em/sGhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661298884; x=1661385284; bh=bUhjuiqojLpkWg7nmxZj0xVjYFV5zM/BWAm
	gFS2CPJc=; b=Ov+Y1ysOOAY0cl+7SaY//9girKBKnLbgjk3889aed6FK+7NQGS9
	4gvS1hyBxCp8PM9yS2g0HTOPvXdI0fEkXvTO2tFLec+YNU65XDhGjRx3ijXMm3Kg
	jfvi1d4NvaMzvjNiFRFY6HYfOxRprdFJYfNTHBXP8l9JZy/jZsQ/VsgfsBT2Z3sG
	mids220956flziQLD0uyuD3FlbY+8XsXsksrckd6KBaaXvBU+bvR8ZX5juFACSEh
	XH2wCMJmCquf1uEm/eEZ/b5crelOHWiN4BXiWAVU4GYpJhTjIC5woppp3gIgSUqH
	X0aEAc8jeZtFz+1/azLVRv7cp1t+5z2QVaQ==
X-ME-Sender: <xms:xGgFY6n0L7r3oZuO2Xm72zUkp8hMQxY7y7p42FprxJ3GMdUrsRE5Eg>
    <xme:xGgFYx0e_b0yRMAaKfcjfczNk1Y0dkSzuhZ6N80lSeDCZPvCuSwb8GJs2VQ2jEtin
    popNv7GZE5OHR8oA7A>
X-ME-Received: 
 <xmr:xGgFY4o48C2kGUmoHv009jfGJXOrAEbf8QxPNGwXe1ao_CkQ04gfj4BB9blOIVdBVR00DUqCJQVt8mEj7Dz1fQ4gH2JaMgyMgtNmsMVmdtTb8Xt_vXdeWp-z>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:xGgFY-l6L3LappdFt3NQcXU65GEJyG1JYppSN0v7HO4IDFr7sy0wlg>
    <xmx:xGgFY41vtN9CrKguv11atWR-bn-hXEzgwZ_5-oGqESNhuM9Bs47ehA>
    <xmx:xGgFY1vJ7vjVkXWJJEbaSDJiJJ8tmDJYglEzKesFXE73QVR3oj5mHA>
    <xmx:xGgFY1-aecuqSAqq3q-y_LFoFLbv5vlUhpFvcC5NusYCwUWDtpnuXw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 19:54:43 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/6] shadow: Enable subid support
Date: Wed, 24 Aug 2022 01:54:32 +0200
Message-Id: <20220823235437.2486678-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169762

From: Andrei Gherzan <andrei.gherzan@huawei.com>

shadow utils are used when creating users at image creation time. The
useradd/usermod tools will only try to add a default configuration for
subid files if they exist.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-extended/shadow/shadow.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index fbb1d395ff..b2f82e9ac7 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -147,6 +147,13 @@ do_install:append() {
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
 	ln -sf newgrp.${BPN} ${D}${bindir}/sg
+
+	# usermod requires the subuid/subgid files to be in place before being
+	# able to use the -v/-V flags otherwise it fails:
+	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -V
+	install -d ${D}${sysconfdir}
+	touch ${D}${sysconfdir}/subuid
+	touch ${D}${sysconfdir}/subgid
 }
 
 PACKAGES =+ "${PN}-base"
-- 
2.25.1


