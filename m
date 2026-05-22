Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68263CD5BAC
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:47:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14191.1779446823150170767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KO4IrSyS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 10C061A366C
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:47:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D95476003C;
	Fri, 22 May 2026 10:47:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 961011081099D;
	Fri, 22 May 2026 12:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779446820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rBLHVD9+FB71i+I231bNgm03FV3nXbW4zQ7rbSkJUuU=;
	b=KO4IrSySac0x3X+ossMIVeMR/sJeRKGoUY8GYJHO4i5S59M8xqWFxPLmR5f44TY2sR5R8v
	7iLbay/A6NnugJZkD59etkoV5SGoo9AXGT1J6ld4oqcYzXZrmn1Dx9xDcuJcmsMzogdPm1
	nj7CYWtFVsf98RTjbeWeDSzN5khaRYoBhAj/xSL2YQoZOMhEqbR6fc8dRq392uBqfnPh8q
	se/MzoDgx2mXPp5+QeXw272Vi+IpVtshtMfU2K68lwBz4/bdWoWvzxxiT+5UcmS80Zhv90
	sPtzi/Eri66NUVrj/QZVT2/n41TzLG3DmT+SQWZpb65IH3NN5RQzETKMGkqTMg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 0/1] Fix SPDX_INCLUDE_COMPILED_SOURCES in SPDX3
Date: Fri, 22 May 2026 12:46:43 +0200
Message-ID: <20260522104644.788606-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237539

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

Hello,

Currently, a SPDX3 SBoM including the compiled sources [1] is incomplete =
due to
a path mismatch between what is provided by package.py and what is expect=
ed by
SPDX3 (spdx30_tasks.py, spdx_common.py). Example:

- package.py provides: "linux-yocto-6.6.123+git-r0/drivers/base/soc.c"

- SPDX3 expects: "linux-yocto-6.6.127+git/drivers/base/soc.c"

This patch fixes this mismatch, and ensures the SPDX v2.2 code is changed
accordingly.

Best regards,

[1] SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"

Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
  meta/lib/oe/package.py: fix path to kernel sources in
    save_debugsources_info

 meta/classes/create-spdx-2.2.bbclass | 2 +-
 meta/lib/oe/package.py               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--=20
2.47.0


