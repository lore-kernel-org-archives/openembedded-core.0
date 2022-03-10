Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59063C43217
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:13:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9022.1646918015641518960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=XqpC4JJE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E3B9883AB3;
	Thu, 10 Mar 2022 14:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646918014;
	bh=x5ZyHI3LkqYc8PJxB2X93KnD4nYA4CY95kA8/lx+bIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqpC4JJEs/HfeE9QcmyehIeUv0s7M3871AdI/QTR0TLGhcRWSCGao1YO8K4NKoozV
	 67+msVRpW6is0q828xzzo1ENxRwU+fzmWcKm3XfewfKCSd16QKM+6jKtA8YR5Ppoec
	 8d6Y3teEsu2XPREzrIuGuYJ6+8M8ZvmTxa+meNzCSAPMe3qwLcIwH39qCZ4d0gjVQ8
	 msyf45DxSZLH+92sTAWtI77wRvMYNeK3me4Ii3C0LvJ9Q+h9iAbfHaht/oymINzYxW
	 4dz65rcbga8dG02CBf8ocLb3JHKs+kLk0cJ5j2oGCMa3cPIsusxDBiF80BE7TPH2nq
	 rK8XiP4ifvU1g==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2 4/4] files: overlayfs-etc: add overlay mount options to
 preinit
Date: Thu, 10 Mar 2022 14:13:29 +0100
Message-Id: <20220310131329.1906537-5-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 13:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163021

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
index e5f5001a05..43c9b04eb9 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -26,6 +26,7 @@ then
         -o upperdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper \
         -o lowerdir=3D/etc \
         -o workdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work \
+        -o index=3Doff,xino=3Doff,redirect_dir=3Doff,metacopy=3Doff \
         {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || \
             echo "PREINIT: Mounting etc-overlay failed!"
 else
--=20
2.35.1


