Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A983ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:55:31 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.62610.1661716528870870593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=e7VuMJL2;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 151CA5C00FE;
	Sun, 28 Aug 2022 15:55:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 28 Aug 2022 15:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1661716528; x=1661802928; bh=UlWYGLsLAD8ST2P/cPh8OZ/cG
	chcQvR+/CfvvLjudGM=; b=e7VuMJL2e/UNTabnZqnVgxCj+y08FVVi6mP1dUuAH
	Vzy+0fbB8IjBm4vqh9iSLtPnv8eG81nrFrYa08QCvBgTeeSZXHHTB1WcqQMupPgd
	QQFTzxPrt3pVCkjcXr4KkjSfEhCqOAEeogEeaaiugKFg+Z1+UOrLuX+wTQbb/W7+
	HjMnvTTdLvXcj7hOnTbXf4+22Q/xpq/sovLXU9aku74iYeL6LMH8bNJDKzXN04FC
	kLQIctycVcs3w4lvgQMHKTVihKEb7e+DcvGH3T5ltPYA8mKnm3VHVgm7+cU7bVKK
	UuNKcR7FpEHIi9+vMiqgTeSf1hh+bWynQzqV2PYTDzAOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661716528; x=1661802928; bh=UlWYGLsLAD8ST2P/cPh8OZ/cGchcQvR+/Cf
	vvLjudGM=; b=uK1h+GQERkcVOc80BY02/P4p37PVMqM1KA/d1KIApYZUXE0tw+A
	bAlGeWbpWQPMJjzrI6gwlG6G+GUdfqZDrrogjc3h1k7YD5u3UWZrX39Q5gMARSzX
	bidpHcjzN8tGXl/e/I89eT32r8le4NnLSVRoZrgzS5E6avS/zIl8F6NESPD17PFK
	QCYgyhLjCyLo52ZJTYrhYnBvc9B4rJiSAOabWUNDhb303nHzc4BUSQE4I5irKQOS
	ryYlYmdHy0SVpt9+q4Ln14gc4QdJf3tGy3LdPUtHp+1n6iR/Ej0z8jPnmKZhQRgo
	+PDIZC6Jc8RWM8383yAcDAAaQ7O7pnYsm3g==
X-ME-Sender: <xms:L8gLY0LBYPWk40Zy6PdQo4rKG8lA9hbfKsxBvNepClU0Y8xwhUza5w>
    <xme:L8gLY0KxoRQCxA-hQXk78b3pTABED-IZBKYwWkx2GotarJVAUpQKv0Id9wT5F_R0P
    8JcWgM4cuwS6wvww3g>
X-ME-Received: 
 <xmr:L8gLY0sdUqrvXw-_BIhOBn7fQumw9YnbuviisuCfUijHQmab1R58o0dxx4MV9hAOrilO4fGHYn4z6GUCUWQ6QDA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejledgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:L8gLYxZHT5vmJu_tQqiC8FE9PiaS0Zbp2aTGsi_IzAAAi4tcaZrGDA>
    <xmx:L8gLY7bMKjNA4g3JfnHNX0CuH9CIY6M_SRMHCVvAQU1r00aYF1S4hw>
    <xmx:L8gLY9BJ00nltEIDUcOAzuBp9Y3p8s0rXNYT5zjQJATCAHMcRqrIEA>
    <xmx:MMgLYyzf403Jr25rhYX05o_4BsRMfzBkSu--KvCp2y8Pj2yqGSY3Tg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Aug 2022 15:55:26 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2] core-image: Exclude openssh complementary packages
Date: Sun, 28 Aug 2022 21:54:06 +0200
Message-Id: <20220828195405.8213-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170000

Openssh (main) package may be marked for installation via complementary
packages mechanism as a dependency of openssh-ptest
and this causes conflict with dropbear [Yocto #14858] [1].
Excluding openssh complementary packages if ssh-server-dropbear is in
DISTRO_FEATURES fixes this issue.
To install openssh complementary packages in the images with
ssh-server-dropbear they may be added manually into the list because
they will be excluded from the installation even if corresonding class
(dev-pkg or dbg-pkgs) inherited.

[1]
Error:
 Problem: problem with installed package dropbear-2020.81-r0.core2_64
  - package dropbear-2020.81-r0.core2_64 conflicts with openssh provided by openssh-8.9p1-r0.core2_64
  - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided by dropbear-2020.81-r0.core2_64
  - package openssh-ptest-8.9p1-r0.core2_64 requires openssh, but none of the providers can be installed
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-recipe/core-image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 4b5f2c99c4b..fa38ae876d0 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -78,5 +78,6 @@ CORE_IMAGE_BASE_INSTALL = '\
 CORE_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "{@ openssh if 'ssh-server-dropbear' in d.getVar('IMAGE_FEATURES')}"
 
 inherit image
-- 
2.35.1


