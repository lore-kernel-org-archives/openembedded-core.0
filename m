Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9890C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:42:41 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.9038.1661334153084671401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=W/BkCxRB;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 68C3D5C00C9;
	Wed, 24 Aug 2022 05:42:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 24 Aug 2022 05:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661334152; x=1661420552; bh=bUhjuiqojLpkWg7nmxZj0xVjY
	FV5zM/BWAmgFS2CPJc=; b=W/BkCxRBN+24C/sc9B7YlADQaGAu3cpGgKEkIm6s4
	QA8qwVti9W6C1rNANXDAq1643kAtKVp0T4a5oWvjF3uNBE5kCjyOoPlEi5EKH39r
	/CmZKpCgeU7sx8bQ3BUinjuC1w8xhyxw2oFHi7y5UMfDxeMzcKdzYTjWcLUUp4bo
	jH4FnUXbtGQOOoF7xh8KTCq/IEBIOIszHW8p5CKddmgK07zpTexTcRSNlK73ns7b
	J5F5EilMIBzzh/N27IXcIqg5FBvV4b0akUKNvt1T6d/yO8ZLWjBwLvv9y2873n3S
	veqXLfKGrcavU+R02mgKeNidNJEclrs/odKE3SL1tInoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661334152; x=1661420552; bh=bUhjuiqojLpkWg7nmxZj0xVjYFV5zM/BWAm
	gFS2CPJc=; b=FwxBeQVxI+XFSb1bbPyZf+klU8Jwu7M+mNzS9oo0TPCRLW2m5Ce
	HCyAgW62IrYSlBBfJdPaA7XTGgTCl2jlCqgevxa+ju3Bnvc3+OCQ6lGwjQuuKJj5
	DWLhrD3mFLctVUbCeSbgXTKpwtMJMSCxAWlqfdQLi3DJuD37oW8am1i25I29ciO3
	KVqZXKpROpWUmYd8p7ZZMoEj5TJ6hLmuJs1N9u/jUGtoQSCX3Co+2lTmfbdhrHkt
	JvyLWlGFAqPgnqr8al31+VIx+Ta0wPy0DOvx6k7U8NvYODeInkcoxclCwXEan293
	1har2kFvrcT/F6sNY7/CT5nC6tyzrALmI3g==
X-ME-Sender: <xms:iPIFYyeJleF95U0dInaI75Q9jcQbynZU8zovDSFV5Vve9SuUZRPAFA>
    <xme:iPIFY8OLzu8tIyyltJFlwjBvrOZfKy50zZhZJx-D5yv7G4ytMs0GJSHnfha_BoMzQ
    x_rS_tW-O2SBhe5Pw0>
X-ME-Received: 
 <xmr:iPIFYzgMp5UOnlCd9RoMB8Io8wo-Lx3B8BcUA6TemGGcs8KMagfUZ5hv6QqkUoW9zLiGhuU1WU-W97Tq-dNwcYaIK0gk9dbd8cke9ETG6iWJEtck8iaxIpGM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:iPIFY__vneVVMqYpOt8YRri4yjZKC3n9jHVnSUkGB5wq1sjICggAhA>
    <xmx:iPIFY-sNNkfKOLXMXf4vi0UR5Sfesw4C_9mdKCXZtqKGqmdpYJOZ3A>
    <xmx:iPIFY2GrDwLIC3LA2o9eUuGykLaStKA7RHGh_qLhZ7jD1DVTRvF_Pg>
    <xmx:iPIFYzVcnd0FkD5r6mC7CKYhUb8-_xFK7DGXz2iJOwP4e5Z1xd9AJg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 05:42:31 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v3 1/6] shadow: Enable subid support
Date: Wed, 24 Aug 2022 11:42:17 +0200
Message-Id: <20220824094222.2554642-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169803

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


