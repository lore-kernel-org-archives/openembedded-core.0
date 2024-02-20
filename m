Return-Path: <christoph.vogtlaender@loewensteinmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC8C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 11:31:55 +0000 (UTC)
Received: from mailout01.de1.retarus.com (mailout01.de1.retarus.com [94.199.92.161])
 by mx.groups.io with SMTP id smtpd.web10.11113.1708428704969380737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 03:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@loewensteinmedical.com header.s=lmdkim header.b=h0+s32U8;
 spf=pass (domain: loewensteinmedical.com, ip: 94.199.92.161, mailfrom: christoph.vogtlaender@loewensteinmedical.com)
Received: from mailout01.rmx.fraix1.retloc (localhost [127.0.0.1])
	by mailout01.de1.retarus.com (Postfix) with ESMTP id 4TfHL604K3z1T5Cv
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 12:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout01.de1.retarus.com 4TfHL604K3z1T5Cv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=loewensteinmedical.com; s=lmdkim; t=1708428702;
	bh=DJuwp/ZnD2WVwDT8kw1YQu5uGi+ev8bm0CDmw2Dekck=;
	h=From:To:CC:Subject:Date:From;
	b=h0+s32U8k4CHb1rT3B8Nor1wE1x0zxfgppHKzGTPDedE7y+MyHOwf8XUFK5XoxkDU
	 Wun2GlKyZZbbUmh/lApKftBxvBa1RmKt73diFc7b/5fJqk9dpXortyDNDNn/AC8uhd
	 B2vEGt8zDwtS8R6bfF64WT24AcfDbu7K5vQj7ZjC9N3PGDep+shkfz9+3NY24LUEXe
	 htm0vvTwKogp0a+7uvpfDmFNuZWB3elq2cAyi1gaowDBDVUtXs8SroiGVGebYK0fIy
	 KxUEtiwBSQ/kT+ARf6Y4YAKoBavKmRIT21T9kOXJ2cHDxFRoV9tEj8ApJGt5iUKbWf
	 Fv4C8yIdyXYcw==
Received: from outlook.salvia-medical.de (unknown [212.211.225.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by kdin03.de1.retarus.com (Postfix) with ESMTPS id 4TfHL56RHtzyhC
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 12:31:41 +0100 (CET)
Received: from mgmt01.inh.lmi-dev.de (192.168.202.8) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 20 Feb 2024 12:31:41 +0100
Received: from lmi-nb49.salvia-lifetec.inh (unknown [10.2.1.93])
	by mgmt01.inh.lmi-dev.de (Postfix) with ESMTPA id 951A82337C9;
	Tue, 20 Feb 2024 12:31:41 +0100 (CET)
From: =?UTF-8?q?Christoph=20Vogtl=C3=A4nder?=
	<christoph.vogtlaender@loewensteinmedical.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Christoph=20Vogtl=C3=A4nder?=
	<christoph.vogtlaender@loewensteinmedical.com>
Subject: [PATCH] overlayfs: add missing vardeps
Date: Tue, 20 Feb 2024 12:28:26 +0100
Message-ID: <20240220112826.36625-1-christoph.vogtlaender@loewensteinmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) To
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2)
X-RMX-ID: 20240220-123141-lcctzxJrbJSM-0@out03.fraix1
X-RMX-SOURCE: 212.211.225.55
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 11:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195912

Fixes [YOCTO #15120]

Consider OVERLAYFS_WRITABLE_PATHS as dependecy of do_create_overlayfs_uni=
ts() in
order to rebuild the recipe when changing the used mount point.

Tested in a local recipe by changing the used mount point and verified th=
at the
recipe was re-build: passed

Signed-off-by: Christoph Vogtl=C3=A4nder <christoph.vogtlaender@loewenste=
inmedical.com>
---
 meta/classes-recipe/overlayfs.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/overlayfs.bbclass b/meta/classes-recipe/=
overlayfs.bbclass
index 53d65d7531..a82763ec10 100644
--- a/meta/classes-recipe/overlayfs.bbclass
+++ b/meta/classes-recipe/overlayfs.bbclass
@@ -138,4 +138,5 @@ do_install:append() {
     done
 }
=20
+do_create_overlayfs_units[vardeps] +=3D "OVERLAYFS_WRITABLE_PATHS"
 addtask create_overlayfs_units before do_install
--=20
2.34.1


