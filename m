Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE711C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:01:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.24509.1664982107531525697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WL5qiteT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6B699C0002;
	Wed,  5 Oct 2022 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664982105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jaOgdM78hu1Qlpelmawd0hEluIrNqjbo7U43LK5hvjE=;
	b=WL5qiteTLKe0tQVLiDgvntwykwyLRUvYVM4LTl1SesabmChtptWB/BsrBEN4fFjY2MDSi/
	AuxVIlZB3LPMuBRuGBTvaIwkpQzQ6johc8ozUbifG6O45Mrrg1tm6WBRrALlzuczU+ddBx
	aiTLJtQ28u0nWuDTYgtvgNEUFS/aRkxHJoYkud8zGwEIGJttojPoupLXdBIf6Fc7Yupc3z
	ORnr2EhY1GsTE0q/fgIPKOKIvoVu90oDNqHqnYYF66qkf8KfxWfcWv03SGmcCDtuifnj2b
	tp36YVeOQ9I4FsclypFYzRh2luXKKKaLnVVifzK7QuZ8Us/TFZRCvZksVRUZ1g==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
Date: Wed,  5 Oct 2022 17:01:38 +0200
Message-Id: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 15:01:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171461

Otherwise, it isn't possible to interact with the UI.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e63a229d1257..0e37c15097b3 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -12,6 +12,8 @@ inherit core-image
 TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
+IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
+
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
 QB_MEM:qemuarmv5 = "-m 256"
 QB_MEM:qemumips = "-m 256"
-- 
2.37.3


