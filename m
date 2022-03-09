Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71779C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 12:06:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.4740.1646827612115224001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 04:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=HxbgxC5Q;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B0F86808BA;
	Wed,  9 Mar 2022 13:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646827609;
	bh=NGEINXg76sZtt/gHPfK90MQRJ/5qnvhCv8vLkD2OsBs=;
	h=From:To:Cc:Subject:Date:From;
	b=HxbgxC5QSr3NCNc8qUBUalWK1+28JHWwnzy35hkh6giT+fRjm1UC50H1ibdpA/XDQ
	 gbaaYtUvAw3fzoV6fXkU3k5tJGmt6c+4OpQizWoLep55IWLJ9/7VRtcB5jVKmM06Oy
	 nPHlbzXCfq8LVGw8/Jeg5IUxmLSEtXMl/BO68vhkA9ucIA9OjKLRh2XNtxvc4N/OmD
	 jfCnl1gb8AwsX3sH8XzcHCe9aFgPmtJZGxBrKMAazCaV73J03G9vAIDzhD1J9c+C8l
	 jnTSoyhR2/WgEbaD8ZDqt0iz3XDl+ADWonMpUK2Mq0ok9UasHsp1DHbdM3dteuqBwG
	 t+3m0aKhP2SRg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH] overlayfs-etc: add condition to package-management feature
 conflict
Date: Wed,  9 Mar 2022 13:05:26 +0100
Message-Id: <20220309120526.661705-1-ch@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 12:06:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162959

The conflict with the `package-managment` only happens if the
`overlayfs-etc` class overwrites `/sbin/init`, which is not the case
when `OVERLAYFS_ETC_USE_ORIG_INIT_NAME` is set to `0`.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/classes/overlayfs-etc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-=
etc.bbclass
index 4ced07ba11..bf107b67e7 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -26,7 +26,8 @@
 # overlay is out of scope of this class
=20
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
-IMAGE_FEATURES_CONFLICTS_overlayfs-etc =3D "package-management"
+IMAGE_FEATURES_CONFLICTS_overlayfs-etc =3D " \
+	${@ 'package-management' if bb.utils.to_boolean(d.getVar('OVERLAYFS_ETC=
_USE_ORIG_INIT_NAME'), True) else ''}"
=20
 OVERLAYFS_ETC_MOUNT_POINT ??=3D ""
 OVERLAYFS_ETC_FSTYPE ??=3D ""
--=20
2.33.1


