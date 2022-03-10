Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEC6C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:06:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.7952.1646906785828966397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=OfjwBmH/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6102E839DE;
	Thu, 10 Mar 2022 11:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646906783;
	bh=56Lt1GCcyoExz+Y928xHwnfMlm+DuQ2AI+BnbH6qNY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfjwBmH/BN3fk3J+kaHxqutN0cvQZaaphwOM7758cNSVlyA035VETQNDNzi9gvOeJ
	 ROoPTRwC/yMNR3FMP3R5X0rLiqDB+JHc38SzsXUWO8bdnmR+2oLczI3/jKjrHS0NOi
	 Vv7kICf1XaWdSU1yT9PJDu/3RztWakkjHoyCULWpTvGRC0VhrSgWXmriHNtsk/4EjC
	 Cy26xRRdIHUnxI6ejhDD6NnW9Wg+pl38aifnQpiDjUwIPNLywq/D1u9+YQCZqWk6xc
	 aSTOiP4fAfGq/SX8Zutk5777dZyIfEnXaKbWoqxIlhJgPJ6ceqs8b2PcCYkSWecBJh
	 5U3VB9efYaWTQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 2/2] files: overlayfs-etc: add index=off and xino=off mount
 option to preinit
Date: Thu, 10 Mar 2022 11:06:09 +0100
Message-Id: <20220310100609.2881374-2-ch@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310100609.2881374-1-ch@denx.de>
References: <20220310100609.2881374-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163006

Overlayfs-etc is useful if the rootfs is read-only. One reason to have
the rootfs read-only is to allow image based updating.

Image based updating will change the underlying root file system, which
is unsupported by overlayfs when with some mount options [1].

This disables those options.

[1] https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html?hig=
hlight=3Doverlayfs#changes-to-underlying-filesystems

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/files/overlayfs-etc-preinit.sh.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayf=
s-etc-preinit.sh.in
index 1daf83513e..51cbdf25a8 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -26,6 +26,7 @@ then
 	    -o upperdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper \
 	    -o lowerdir=3D/etc \
 	    -o workdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work \
+	    -o index=3Doff,xino=3Doff,redirect_dir=3Doff,metacopy=3Doff \
 	    {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || \
 		    echo "PREINIT: Mounting etc-overlay failed!"
 else
--=20
2.35.1


