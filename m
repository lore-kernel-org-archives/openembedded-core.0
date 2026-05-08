Return-Path: <marcus.flyckt@kvaser.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE12CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 08:51:22 +0000 (UTC)
Received: from qmail.kvaser.se (qmail.kvaser.se [195.22.86.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9446.1778230271384991998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 01:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kvaser.com header.s=qmail header.b=ft0mePEi;
 spf=pass (domain: kvaser.com, ip: 195.22.86.94, mailfrom: marcus.flyckt@kvaser.com)
Received: from larsgullin.kvaser.se (larsgullin.kvaser.se [10.0.3.101])
	by qmail.kvaser.se (Postfix) with ESMTP id DDB65E0450;
	Fri,  8 May 2026 10:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kvaser.com; s=qmail;
	t=1778230269; bh=Bm05NljUWriQUB+MNaMMvq9dtwLTxQNBc8vJIweQqI8=;
	h=From:To:Cc:Subject:Date:From;
	b=ft0mePEi0O5UtcPC68WlNo42DVRBW9w7oK7yRDXdlKMLgNyxKmu1CJwswt7yMiBF9
	 FHR/8LWCiA9zonI3k5GT1mHJosiE8fFe4Rtjcrzxj4LglfY17tfDmyBtKcq1fya2Hn
	 gIu5IBcaLDr/9ZO6vARSbvEajoh7P0zYSAyUPm5wZoCanIEOWpSvhxvW/Yjwq95TBM
	 yVR4cZ32U6k44WrjOclJE4jy6hKW4mnpdocKfJl4KhnFNkaaLX/JRdUybNBWKUkERr
	 39ZkQm34OzbupO9xVO6ERz2u9koas1+2O/zEgFzNp/6ifqRJ77kNwqaod0bWUqggsP
	 32YtpAuuErO9g==
From: Marcus Flyckt <marcus.flyckt@kvaser.com>
To: openembedded-core@lists.openembedded.org
Cc: Marcus Flyckt <marcus.flyckt@kvaser.com>
Subject: [PATCH] initramfs-framework: overlayroot: Don't assume rootfs location
Date: Fri,  8 May 2026 10:50:53 +0200
Message-ID: <20260508085053.29282-1-marcus.flyckt@kvaser.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 08:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236698

Instead of assuming that the old rootfs is located at /rootfs, use the
ROOTFS_DIR variable.

This makes it possible to change rootfs location between the rootfs
module and the overlayroot module.

Signed-off-by: Marcus Flyckt <marcus.flyckt@kvaser.com>
---
 .../recipes-core/initrdscripts/initramfs-framework/overlayroot | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayr=
oot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
index 0d41432878..dacbcbe213 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -37,8 +37,7 @@
=20
 PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
=20
-# We get OLDROOT from the rootfs module
-OLDROOT=3D"/rootfs"
+OLDROOT=3D"${ROOTFS_DIR}"
=20
 NEWROOT=3D"${RWMOUNT}/root"
 RWMOUNT=3D"/overlay"
--=20
2.43.0


