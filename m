Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585DBC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:13:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.9062.1646918014544661286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=iz4EOgal;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3083D83A9F;
	Thu, 10 Mar 2022 14:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646918012;
	bh=EPtbk6P4pc3bXmNhgMwdIn7JqUL3fBEncVUgZupMa10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iz4EOgalfmHOqkRgUI4Aw8UOa78Xk6XfNad5ZYWbLdkxlp7JwFGxsuI6sRc3g/y4o
	 xn3uy2GRGmHd6Mwqgld9z2fh94Nf17svGUrdwjNdLq/F58Wh54vDXSvVKdMxMpTYSg
	 zlYW8Mj90dkMtj8VWnR2F5qU/zEDlpxzXU5c4Z5sFZ5V2Xx6LCpDNxF0UIvCkYDlJk
	 6xIparljua083pVJ5Bo3JBpML6nx9HK6edyi2/1yN+krGK+gPlo7THkxmwwr5Kfl7Q
	 hR4763XzUczUVZ82CAvd5VmKhrMA2WVORiz7fM7P13tKBk2pFHOFuKtwpciMpJAdYN
	 S50rR0xksgzkw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2 1/4] overlayfs-etc: add condition to package-management
 feature conflict
Date: Thu, 10 Mar 2022 14:13:26 +0100
Message-Id: <20220310131329.1906537-2-ch@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310131329.1906537-1-ch@denx.de>
References: <20220310131329.1906537-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 13:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163019

The conflict with the `package-managment` only happens if the
`overlayfs-etc` class overwrites `/sbin/init`, which is not the case
when `OVERLAYFS_ETC_USE_ORIG_INIT_NAME` is set to `0`.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/classes/overlayfs-etc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-=
etc.bbclass
index 4ced07ba11..b593a4d9eb 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -26,7 +26,8 @@
 # overlay is out of scope of this class
=20
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
-IMAGE_FEATURES_CONFLICTS_overlayfs-etc =3D "package-management"
+IMAGE_FEATURES_CONFLICTS_overlayfs-etc =3D " \
+    ${@ 'package-management' if bb.utils.to_boolean(d.getVar('OVERLAYFS_=
ETC_USE_ORIG_INIT_NAME'), True) else ''}"
=20
 OVERLAYFS_ETC_MOUNT_POINT ??=3D ""
 OVERLAYFS_ETC_FSTYPE ??=3D ""
--=20
2.35.1


