Return-Path: <marcus.flyckt@kvaser.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FE3CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:20:00 +0000 (UTC)
Received: from qmail.kvaser.se (qmail.kvaser.se [195.22.86.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18998.1779189596002457818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kvaser.com header.s=qmail header.b=L83OnbLs;
 spf=pass (domain: kvaser.com, ip: 195.22.86.94, mailfrom: marcus.flyckt@kvaser.com)
Received: from larsgullin.kvaser.se (larsgullin.kvaser.se [10.0.3.101])
	by qmail.kvaser.se (Postfix) with ESMTP id F259BE044F;
	Tue, 19 May 2026 13:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kvaser.com; s=qmail;
	t=1779189594; bh=tiloLzDJDmzLePReqdI+vSbYtQ9+2+sMnasHjWgBFYs=;
	h=From:To:Cc:Subject:Date:From;
	b=L83OnbLs5YUg4GTr2VgGK4p0LLiDwloBztPVr815KrxHuE7afOsMXTFDvVnoS+mZg
	 OBmFTDopBzLORnKNeE7QmTS8jCOX33dCHMM/kJkHGxky9m2Ns+tp0PBIlS7G0PmZDn
	 wUNuVJnhwArIHqFfZPaPAndAR6y489xI0DLxIXsgSVcMgrU2ylZDQHDDkCyzdSX+x1
	 U+xOET+ldShgeG1fCa52ygEY/l0iJrcqIXr/tYKOz03wjuzJCNgGkcO/g2uzI6aUY/
	 F7LpB3FL+6O5qUbPJx0W4MDgMLa1wU8s2GZAag+jGsEFqiw6PPOu2FS4QZAzAN9YEB
	 c+s93cgahfW5g==
From: Marcus Flyckt <marcus.flyckt@kvaser.com>
To: openembedded-core@lists.openembedded.org
Cc: Marcus Flyckt <marcus.flyckt@kvaser.com>
Subject: [PATCH] initramfs-framework: overlayroot: switch_root instead of chroot
Date: Tue, 19 May 2026 13:19:47 +0200
Message-ID: <20260519111947.39044-1-marcus.flyckt@kvaser.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237311

Use a proper switch_root instead of a plain chroot when transitioning to
the overlay root filesystem.

Some Linux features, like unshare(2), check for chrooted
environments and may return EPERM when running inside one.

This is particularly an issue when running unprivileged containers.

Signed-off-by: Marcus Flyckt <marcus.flyckt@kvaser.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayr=
oot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
index dacbcbe213..3f0a1c5493 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -114,4 +114,4 @@ mount -n --move /proc ${NEWROOT}/proc
 mount -n --move /sys ${NEWROOT}/sys
 mount -n --move /dev ${NEWROOT}/dev
=20
-exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully=
 "Couldn't chroot into overlay"
+exec switch_root ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_grace=
fully "Couldn't switch_root into overlay"
--=20
2.43.0


