Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3570510F92FF
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 20:34:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.757.1774989245804305813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 13:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=afELa4+c;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77646C59959
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 20:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3E206029D
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 20:34:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98DB8104502A1;
	Tue, 31 Mar 2026 22:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774989242; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sZcG6CdPiQaXVNmhLQSIQo/DrCxaSbg/9uiibhd0BPk=;
	b=afELa4+cTL/2ev4LRNN3so2ujffvtlltb9e9RGT0XP6BB0KSaRwOaaBKGY60eVVusMKKXx
	TTTiHC1em0pYvKehQFHMIzdNk10VlmhNJgiewzrNaaa6oSMd/b7fZqBwnDl6VHju3Tx5JD
	ty0RUTO1J+R6u0aZSAKyNvOl5FgzXlpdQCeV9GuNd9Ln7TYnODO425WbWpX2P/8Z9IuyoK
	6TezY6yKBP9StJVNWbmNrAcUApNViLWvzBwPE9HHWrloZ6rKx4uCeFWemuu/82HnduQ1Mg
	mPo/2Loj1xii8inCaVFb2uvcsokhF73cs99bc7G7W9h06Oa02UAtvx0Ov/BEEw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v2] lto: disable expect to workaround GCC LTO debug_line_str bug
Date: Tue, 31 Mar 2026 22:31:54 +0200
Message-ID: <20260331203154.674733-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 20:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234315

From: Thomas Perrot <thomas.perrot@bootlin.com>

When expect is built with LTO, GCC correctly passes -ffile-prefix-map
to lto1 during link-time recompilation. However, when lto1 incorporates
debug info from a linked dependency (tcl8), the directory entries in
.debug_line_str from that dependency are not subject to prefix
remapping, leaving a raw TMPDIR path in the split debug symbols of
libexpect5.45.4.so:

  .debug_line_str: /src/build/tmp/work/.../tcl8/8.6.17/build

This is specific to packages linking against tcl8 with LTO and is not
an incompatibility between LTO and expect itself.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

---
Changes in v2:
- Fix commit message
- Link to v1: https://lore.kernel.org/all/20260331081246.73406-1-thomas.p=
errot@bootlin.com/
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
index 54983412bc14..8c13601a4df6 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -4,6 +4,7 @@
 #
=20
 # Disable LTO for following packages
+LTO:pn-expect =3D ""
 LTO:pn-glibc =3D ""
 LTO:pn-gcc-runtime =3D ""
 LTO:pn-libgcc-initial =3D ""
--=20
2.53.0


