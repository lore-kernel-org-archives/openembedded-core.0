Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2496FC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 06:57:16 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168949.1783407432277220406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 23:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=tWbtbP0n;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=tWbtbP0n;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1783407429;
	bh=lWeO/MHc4cQMO37Et1+zLHPfr4DQRGVqlvZXYd/p9QU=;
	h=From:To:Cc:Subject:Date:From;
	b=tWbtbP0nmEAQJJEmgaP9DhFruta8iMUKFk7Jthf1qHhwle2gGqFP/OLU8rHu1i1Ml
	 Eg/sIzUBAUyLpZI9B8yNZE4zBDp5WeM44RjwrKG0+Ippu1nyRwkFEKWR/Qn7y+qoLe
	 UFnCE4ECHW9eaAJykG6brSBXS322kpWEneyNA81FgHyPd4qp3KXBStOYlaKsp/3g33
	 n4wViqubYPotQpoUaD9MPn4rEuzTn8q93kINLwf+H7NO+xOfVLLqUZpE8JmBFYIaGR
	 FJBia+8zKucrQqMlFH3OFevjV8/+H3X05R1m9Z5NZNbHy+brdM4dtMqr2Lc7EtRV5a
	 TR4i8A1Uzhcxg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id ACD615F7EA
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 08:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1783407429;
	bh=lWeO/MHc4cQMO37Et1+zLHPfr4DQRGVqlvZXYd/p9QU=;
	h=From:To:Cc:Subject:Date:From;
	b=tWbtbP0nmEAQJJEmgaP9DhFruta8iMUKFk7Jthf1qHhwle2gGqFP/OLU8rHu1i1Ml
	 Eg/sIzUBAUyLpZI9B8yNZE4zBDp5WeM44RjwrKG0+Ippu1nyRwkFEKWR/Qn7y+qoLe
	 UFnCE4ECHW9eaAJykG6brSBXS322kpWEneyNA81FgHyPd4qp3KXBStOYlaKsp/3g33
	 n4wViqubYPotQpoUaD9MPn4rEuzTn8q93kINLwf+H7NO+xOfVLLqUZpE8JmBFYIaGR
	 FJBia+8zKucrQqMlFH3OFevjV8/+H3X05R1m9Z5NZNbHy+brdM4dtMqr2Lc7EtRV5a
	 TR4i8A1Uzhcxg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 93F4D5F7AD
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 08:57:09 +0200 (CEST)
From: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Subject: [PATCH] cml1: use KCONFIG_CONFIG_ROOTDIR in savedefconfig
Date: Tue,  7 Jul 2026 08:56:31 +0200
Message-ID: <20260707065631.388846-1-andreas.muetzel@emlix.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 06:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240359

When running do_savedefconfig with a KCONFIG_CONFIG_ROOTDIR other than
B, this task runs oe_runmake in a directory different from the other
config-related tasks.

For example, in U-Boot with the new configuration flow from wrynose and
configs defined using the UBOOT_CONFIG_* variables, the project sources
and configs will be located in a subdirectory of ${B}. This will result
in the following error when running do_savedefconfig:
make: *** No rule to make target 'savedefconfig'.  Stop.

Fix the do_savedefconfig task so it runs in KCONFIG_CONFIG_ROOTDIR.

Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
---
 meta/classes-recipe/cml1.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.=
bbclass
index ac65eec4bf..d8bac57b77 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -113,8 +113,8 @@ do_showconfig[nostamp] =3D "1"
 addtask showconfig after do_configure
=20
 do_savedefconfig() {
-	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
+    bbplain "Saving defconfig to:\n${KCONFIG_CONFIG_ROOTDIR}/defconfig"
+    oe_runmake -C ${KCONFIG_CONFIG_ROOTDIR} savedefconfig
 }
 do_savedefconfig[nostamp] =3D "1"
 addtask savedefconfig after do_configure
--=20
2.54.0


