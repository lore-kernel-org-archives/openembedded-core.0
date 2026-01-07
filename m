Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC24CFD652
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:14:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8107.1767798886941915974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IDnhZZS1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 90F21C1EC92
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90F17606F8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC974103C8747;
	Wed,  7 Jan 2026 16:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767798884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WFWgpoHotYyM0wYvkE+7YBEoMJjcOQAwCwfGCQOOZIE=;
	b=IDnhZZS1Ss/BwK/QO2Mfvhm89N/l4tQwp6RZDDYupto8vknYSB8TQRScLNLLlgQgyIaodW
	tpF+86ThUb4B0BX1fcNePxAyfkH5e1Dz952Tjkv7a9iK92oFZUioSJY+TUWW8cK+ouOt+O
	iUG/Qu2xsWqSvun8Lx6r3uxirtoOCeOdvPVT7RzZ2f9eRJB0lb1u9u3gbbhFZYPEkKo2Gn
	AoU4hrEpsVkfRt+ETmfHklUssmYpEBpl4RNhwpTUeE+udwHNbN/2gKbu1iKz3hPM2u+Vm8
	h2McjBwYJJKp/qInRzhlW2Fko/qHggGCaWIzlyDcSCbQsHP9AjHJrFCpslUDLQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/2] Move RISC-V recipe-specific configuration out of common includes
Date: Wed,  7 Jan 2026 16:14:34 +0100
Message-ID: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229004

This series moves RISC-V specific configuration out of linux-yocto.inc in=
to a
new inc file: linux-yocto-features.inc.

By relocating these RISC-V specific settings, the configuration remains
available for oe-core builds while avoiding unintended side effects for e=
xternal
or custom recipes that require such include file.

The first patch only changes u-boot, and u-boot contains only one version=
ed
recipe, so I kept it as it was in v1.

Changes in v2:
- As per the comments in v1, I created a new inc file that is now include=
d in
  the versioned recipes

Jo=C3=A3o Marcos Costa (2):
  u-boot: relocate SRC_URI_RISCV into recipe
  linux-yocto: relocate KERNEL_FEATURES_RISCV

 meta/recipes-bsp/u-boot/u-boot-common.inc        | 12 ------------
 meta/recipes-bsp/u-boot/u-boot_2025.10.bb        | 12 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb     |  1 +
 .../linux/linux-yocto-features.inc               | 15 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb |  1 +
 .../linux/linux-yocto-tiny_6.12.bb               |  1 +
 .../linux/linux-yocto-tiny_6.16.bb               |  1 +
 .../linux/linux-yocto-tiny_6.18.bb               |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc        | 16 ----------------
 meta/recipes-kernel/linux/linux-yocto_6.12.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb    |  1 +
 14 files changed, 37 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-features.inc

--=20
2.47.0


