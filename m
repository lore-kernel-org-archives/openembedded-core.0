Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5372DECAAD5
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:39:51 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.62751.1661715586214004594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=dCV8cttN;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7FB765C004F;
	Sun, 28 Aug 2022 15:39:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 28 Aug 2022 15:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1661715585; x=1661801985; bh=fz4nIjLvnKGYWxUygHRIgOWNU
	mT2f3Ery2bYE1537kg=; b=dCV8cttNJ9znWDZj2qMa4zx/TOJv71Ygot1j3Fb8j
	BJo/XsrQ/l6aIivZzgNyEk/Pd+pelbc/tIuGZOy01sZRdRg42NPIK9j5U/k0GDyH
	3SvKC1EveRJuHi4DbF1kSYT9p4ZlKcJVhFUVuRuKvbiSHeEDbXeyOMnMBv40MqNc
	0qXgBRPqpDdX2hg/bcGk1pSLEd9iUDIspsP01ohOFyBt9Og8kptvTOZnGByu86fk
	W3Qjiyn0p0DhdClpC63GEVw+IUTnzPMUuJKJbyuYK0aPptztARQui/jcOs29WAsN
	Rzm8sDaiNgoUPYBxKELjnTOdvFy20MR97hZn7C/Wl1QPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661715585; x=1661801985; bh=fz4nIjLvnKGYWxUygHRIgOWNUmT2f3Ery2b
	YE1537kg=; b=hfg+DBxwtSV/nJiXdTBV9IcWVrc1ow8vEXCLK5Nb7935Me3+J1W
	WOvqHn0IUHuxQgxOmManZ3YW/tqh7fTSY98fynXP0hFZ+nmqE5o2sRcTwl8LKF7h
	2e6S+RS0SCiSSagOWNVzJuPmTDkL01pM0HDpAMEkz1WF6PtXrvSRp7DnF8EVU/Ck
	BCFz58pqkuP4FpXYUzMmY4Mh2zoDGK/efwhnqyMAA6QJ/fFCt6H9H3/y2xcQAGiX
	jiNS1bGwZ7TsGXu3B0Cw7JkYliE7v6dVtgcytdz+kgzVeZm8KiZHUJLeA8tmY1pw
	7HXEA8P7iwzDyhfOXOYBAJfTsjdHYwGvJqQ==
X-ME-Sender: <xms:gcQLY9Fs44CTLxLA9gJVAEvxPHuuhzTYfg55iTPiYKj9fXnuB_GC8Q>
    <xme:gcQLYyU3Owt5PAxyTplhcNpZRLD6u9Yi5H8Ib7yQlKaoeJqLBMMqJVV7QKLwF4P0W
    ElNZJGzm52QH4QyGc4>
X-ME-Received: 
 <xmr:gcQLY_IQPt8Zd4Q0KyyI0JjCEGiXtjin4OR4sU4EcVyktguB1jmuGV1vCjKxRYX4EZqJhUmLl27JdtFGy67aqTk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejledgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:gcQLYzEPopD9dVHxZ32ymP76W5JW-R8lI1GgZPUuh8FywdkWrenajg>
    <xmx:gcQLYzVCFup3n4E2Mo6XsLH7RirNnYajnUOqnoxeYr4En4HYfHmu5g>
    <xmx:gcQLY-NquCo0PdzGCIH1lPic-tyiQIN5zdsN016411l4P5envrwKpw>
    <xmx:gcQLY6dvvwhfkHEFb6pBTWPSKYO2XjjMTFvnPCVWtntwvGFLmOJvvw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Aug 2022 15:39:44 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] image.bbclass: Exclude openssh complementary packages
Date: Sun, 28 Aug 2022 21:38:46 +0200
Message-Id: <20220828193845.7141-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169998

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
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645503a..f48d0afb9d6 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -63,6 +63,7 @@ SPLASH ?= "${@bb.utils.contains("MACHINE_FEATURES", "screen", "psplash", "", d)}
 FEATURE_PACKAGES_splash = "${SPLASH}"
 
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "{@ openssh if 'ssh-server-dropbear' in d.getVar('IMAGE_FEATURES')}"
 
 def check_image_features(d):
     valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems') or "").split()
-- 
2.35.1


