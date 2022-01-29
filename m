Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD843C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 00:57:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.648.1643417877484549399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 16:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=PAhr0eF4;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E327183282;
	Sat, 29 Jan 2022 01:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643417874;
	bh=dSxltm2GpxgB2+q5RP7GWElbOQcDlvfxZqETt16+8YM=;
	h=From:To:Cc:Subject:Date:From;
	b=PAhr0eF4ZQkmKQ5OhE0gwMMjI8Gfv//nxyT1GE/L4gaH4X3G5KFgU2CzFgXq8ZiF3
	 k1//ydeJRUO1vVU6hLwPUnB26aYqow4CyDUt5cPhQxO8ILoIj2xanrHs9SnqREM5Cx
	 j4zr32uS1R/95z5SpLM1eoCM7BOLFdoTlfepDwhNLrrj0nq/oHJvl27S+aR3EqUFC0
	 Te+TZmfbasox0Grvra2eCDee0ieeAw0r6HcfMSjCXsrRVH2L1giNLGL3ip7+SJj+xl
	 BncVfxlbd8+dj/om8HYiqCioxSMSF7L8GFCBXojtK9nbyKmJld4Ehivr2iest8Ubqn
	 b2H9RRs+xtYog==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] kernel-fitimage: Add missing dependency for UBOOT_ENV
Date: Sat, 29 Jan 2022 01:57:37 +0100
Message-Id: <20220129005737.86270-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 00:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161088

For $UBOOT_ENV file to appear in sysroot, virtual/bootloader
must populate sysroot first. Add the missing dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 1e3bc21f1f..507e0a2213 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -36,6 +36,10 @@ python __anonymous () {
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',=
 ' ${INITRAMFS_IMAGE}:do_image_complete')
=20
+        ubootenv =3D d.getVar('UBOOT_ENV')
+        if ubootenv:
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual=
/bootloader:do_populate_sysroot')
+
         #check if there are any dtb providers
         providerdtb =3D d.getVar("PREFERRED_PROVIDER_virtual/dtb")
         if providerdtb:
--=20
2.34.1


