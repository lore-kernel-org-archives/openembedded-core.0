Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2289DECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 16:26:04 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.26841.1662395158968645419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 09:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=FQR1CQFG;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 382155C00A2;
	Mon,  5 Sep 2022 12:25:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 05 Sep 2022 12:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1662395158; x=1662481558; bh=Yw+b59SGgmD5t6HYnpwh8EfBC
	N6miDExj9ebZ3J7slc=; b=FQR1CQFGDHSIHC9gIs/uACdyNWBkszgCFFn0F6EhX
	FpvMtnWFSmnZTi/d0dgmhhDJh8g6H1mhclENrLLx0G8wUVC7gjKIxtJoMtFxhz6g
	PBozHFBMZcnuCpOggf2TpreFUpt5Vgf4nMCfIi8wjtQi7ESiG4MAm6LqQluLlEIl
	zhRY8r8qXfDr6FUr/fHc8QyWqjS0wDkdCtF/ORhR888PycAvLBqT5RfMRMpXsJQs
	JCWlEqc3n6QiMlUYtqojVplV+QWGkFiHcO2B9KEu90T3OOpxN/udOIifY08PDXs3
	JWc6dTQKamTEqWAyI3UlJATslia2Y4OMH42fqOKQ4yJ0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1662395158; x=1662481558; bh=Yw+b59SGgmD5t6HYnpwh8EfBCN6miDExj9e
	bZ3J7slc=; b=isYAg7GWeVaTvxc13lohj0vOLvJMISB/MO8yKLXJYPFtz1cosls
	2pEO+/4MhyaW2ZRZV+i9xTFOAJO0ZP1qQTvq8wQ0UYKozcXm8Gw2xjYEyhQE06Kq
	pAD8pKYWRbh8s3mcBblpb8ZEQSk0Blxn4x6VJAX0Sahghu8ut9NRuaMC13y5cMud
	GhaOKdxvQ5P0kb4Y76MW9Nt0TZAKnV7ErbEp/KBDxatOxPlFdr0EThN0WETLrzCg
	U8t1V+JZaZCuT2C0WKb20SOxlc3IkEYMsSZuuwa+tiheXgDEQwGN2gEzMqPUfWdb
	3lY24IRWIG0ov0gd7L1e0XAFup/bkz/OgxA==
X-ME-Sender: <xms:FSMWYzN8qNkrbi_5lDHiGG6fTMTO0fg1apFpA3B4gqbbaarAMQrcnw>
    <xme:FSMWY9_PTA1jULqS8I5D9cMGk_cFYfpvZLE6a_caKgMZs-qyQCBjOlCYTHffEO1I4
    e5LD5WElAnVHLc3ghU>
X-ME-Received: 
 <xmr:FSMWYyQ0a6d6skGtwkNIVcOuf9PuYIel-KqkYH-EO_wypg5Carfn1rssgkaa2iSlU6O0iMSk49CN7hW-0itHdLo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:FSMWY3v3kCe4aUHxRdKO9kzKY1gouaCTGiLuh3NQrJmc__kMJvS7eA>
    <xmx:FSMWY7eluSJ2QWhTxvvOf4dzn6Xf570JMxGhYZpIKHfc2ron0q5sxw>
    <xmx:FSMWYz2ViIuD4jjXP8mClT7as6wv3g4JZQsOYtfeK5uIqkhSIuPQyw>
    <xmx:FiMWYzFXg2hyzKoCjKKLmQZxX9Aq6Pmx8GeMSzQEPcPXSk4kq0uC1g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 12:25:57 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v3] core-image.bbclass: Exclude openssh complementary packages
Date: Mon,  5 Sep 2022 18:24:48 +0200
Message-Id: <20220905162447.22061-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 16:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170320

Openssh (main) package may be marked for installation via complementary
packages mechanism if sftp-server is installed
and this causes conflict with dropbear [Yocto #14858] [1].
Excluding openssh complementary packages if packagegroup-core-ssh-dropbear
is in PACKAGE_INSTALL fixes this issue.
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
Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/classes-recipe/core-image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 4b5f2c99c4..90d9eb9d3f 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -62,6 +62,10 @@ FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
 # Including image feature foo would replace the image features bar1 and bar2
 IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
+# Do not install openssh complementary packages if either packagegroup-core-ssh-dropbear or dropbear
+# is installed # to avoid openssh-dropbear conflict
+# see [Yocto #14858] for more information
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
 
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
-- 
2.37.3


