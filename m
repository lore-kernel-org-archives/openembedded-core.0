Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D80C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:13:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.9293.1646918015448119844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=IGT09ZKN;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 56D3283AAF;
	Thu, 10 Mar 2022 14:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646918013;
	bh=8zsenyUVpefTsznO5ed4twTsPmx7V7O9l+L/0//92/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGT09ZKNfM0Yf5d1edY6Sat8khJkRReh1Rv4kUs1zn/cIVh6HS42ZxcqZCM1TIA2P
	 L0lECAvfe7iHX4gAmR3VTABRSSTCY0c1XbqlmiF52RQmCqGeWMibAbaG7IwQzsGUuB
	 m/VrHH2TL+oOpRqDMpgKNGEYoyVU+Sb4G84nv5E6MQ0xwRGRpJwyYQRMCpwm1D/tnf
	 h1b4GhSv9xoZRcym33cqubOpPTII7nc97ce3g+Cbc5cK0WjBoeo9joenlQ2werm4ID
	 iEl2/Lxp8ljBMY2bJOibxSjwK4f/PMQCbkKCB7vHQwlLxecyDFEjNBvEhO8jl0r9v4
	 LkNf6yDXPkGrQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2 3/4] files: overlayfs-etc: wrap long lines of preinit file
Date: Thu, 10 Mar 2022 14:13:28 +0100
Message-Id: <20220310131329.1906537-4-ch@denx.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/163020

Make it easier to see what is happening by wrapping the overly long
lines in the preinit file for the overlayfs-etc.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/files/overlayfs-etc-preinit.sh.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayf=
s-etc-preinit.sh.in
index 2ebb6c9224..e5f5001a05 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -16,11 +16,18 @@ mount -t sysfs sysfs /sys
 [ -z "$CONSOLE" ] && CONSOLE=3D"/dev/console"
=20
 mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
-if mount -n -t {OVERLAYFS_ETC_FSTYPE} -o {OVERLAYFS_ETC_MOUNT_OPTIONS} {=
OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
+if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
+    -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
+    {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
 then
     mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper
     mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work
-    mount -n -t overlay -o upperdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overla=
y-etc/upper,lowerdir=3D/etc,workdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay=
-etc/work {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || echo "PRE=
INIT: Mounting etc-overlay failed!"
+    mount -n -t overlay \
+        -o upperdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper \
+        -o lowerdir=3D/etc \
+        -o workdir=3D{OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work \
+        {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || \
+            echo "PREINIT: Mounting etc-overlay failed!"
 else
     echo "PREINIT: Mounting </data> failed!"
 fi
--=20
2.35.1


