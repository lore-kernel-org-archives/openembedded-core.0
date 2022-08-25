Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CD4ECAA27
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 16:30:50 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.26220.1661445048448322728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 09:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=E0tQVwsA;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B4A015C00A2;
	Thu, 25 Aug 2022 12:30:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 25 Aug 2022 12:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661445047; x=1661531447; bh=QOwA85riQslXuedhWJywmh70H
	okmOtyyN1xGn3Bi0fc=; b=E0tQVwsAqnwMia/lssfazWRKfWbc6hgvI3QTJpzLz
	LT22zpwkhSUwx9PiBhNMvxZNWtbro0+hyN4Wp64nAQ7QGdEA06B67j+FTuR3LyTd
	xtSigX/2EuafwRKJvyQ1K8oDe9HAHiDAS3IsLkouHOZr8aT3RAk8ewRu7anPXRwK
	+TRI1bEoP2/Uxjm7G6vBVQInrosWIZcD8WR0nxuH54R4pNOvWUImcxu59I29F0t5
	59m4NMoQA++dGcQ1UKqyGtkhc66NMm4ihv3MeoDATlzwLEtrE49oMU8V6hyqVw1w
	jgSrOxYTdE4CuKR2d1TsYxxHZllvMlXtCzyqbKeWotJSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661445047; x=1661531447; bh=QOwA85riQslXuedhWJywmh70HokmOtyyN1x
	Gn3Bi0fc=; b=2NsNgzDeQ3g4svLordDGWjbOKTuWbVk4cPdfeFyPbWUgbtHs2pt
	vL9JWkE4JQVGS7b73hJnKlf5tyiQt/IdsvXcoYGxHx1zfybYCopm6Yh6RlEqut2Y
	D2tBoD7S5btwVLTipfQGYMqRmRJST7ZLIyJm0+9c1tT9FsJLRAoMCwuaq41NPs8G
	aLGvzVfnn/4pBs7vRhOTZyM643XMmN3NWoEieH7xaabgfjzzcm2huiTO4Ipv8YOm
	g0dV7dPcs7OMxQdRw267HNUCZwg4JLINU+j00dJhTbemU4fIpBtqbcDul+0qcgBI
	pnJAaZGCWbYaF3S08SCSeYScyreyJEM2VKA==
X-ME-Sender: <xms:t6MHY_KmTVX4X0vJ_SOP3SgCaX6z6WZ9oC2PBmTK9JuK6-_Qd1wVoQ>
    <xme:t6MHYzKdGyEe-dAx2V4Bdb6X3pDAqRIuT6AslFHTe97yGvfOtuCxfB1Z7Fo-OSo6s
    2Z8kmLN7QrarJsOMAc>
X-ME-Received: 
 <xmr:t6MHY3sydSU-mNBvQxvLkUM1bBP29H32GCN6TND6Ct_3_F_XKazsJTAR0VgNyzxnaCaFdmRFV0SF_almDIASeTzFwfzKthA9xP2gBz4dRZOLAyqq1acXnWQA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefte
    eljeetvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:t6MHY4ZsiLb3OATX0eqAa0dYhP7xcwy1trVsVW3QnNVCus-YOf2Zjw>
    <xmx:t6MHY2ZdYsUC0K7DNKn6tLn0E-Mx1_HWpisVOti8YlRkk7X6yam_Fw>
    <xmx:t6MHY8AEunl0vMugghYk1LWfx5pVRkRL0h1wq7xTv_N4cAoIpGNhdw>
    <xmx:t6MHY5xCskfBCgAlA5QYT7K9ir2oSP0ws46JRHMu7CFo0-AH6xltZw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 12:30:46 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH 1/3] shadow: Enable subid support
Date: Thu, 25 Aug 2022 18:30:39 +0200
Message-Id: <20220825163041.840129-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 16:30:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169880

From: Andrei Gherzan <andrei.gherzan@huawei.com>

shadow utils are used when creating users at image creation time. The
useradd/usermod tools will only try to add a default configuration for
subid files if they exist.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-extended/shadow/shadow.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index f5fdf436f7..b3ae2b4874 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -149,6 +149,13 @@ do_install:append() {
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


