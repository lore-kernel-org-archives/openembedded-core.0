Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A694D10F3DEA
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 15:36:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13283.1774712185728561898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 08:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=RQxAX0Qv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93460C58760
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 15:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E09A6029A
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 15:36:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42C0C104509EF;
	Sat, 28 Mar 2026 16:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774712182; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=VoYNcorIK0yFlxYKsaAM6rViuvP1KujA3o/KnmUWZIE=;
	b=RQxAX0QvkWiP2fJiBt2omFIXmJi20r9OEmgoQqSlq5ZziR/1F84p/Y4vWiXNkbpr9TlWB3
	rS1vWLIAQ8X6kuFydQnJmDSsaM7dXjJlzAetoiOzpNgfFXb7JFKgSSdwfP9LdN8B37r7IN
	IoWgEjC7Yh3x/Zx8I77RdRDB3U6GHBob1XZqOY1Vmun0DYfU9ErxOJ7OHKICBSU5wPv0bh
	LHDoEFA8WqahAXWjUobTeVUIdNFpPJowU/REDAWz2vvJn62a1awmldhynmW/5dAalzDyk4
	EelfG3fVxJ7LUTcXTc9uKIC5Wyafac/K5LzFnu37q/jXWuJ9Yf4OV8URAfrUnQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] lto: disable sqlite3 to fix buildpaths QA failure
Date: Sat, 28 Mar 2026 16:34:13 +0100
Message-ID: <20260328153413.279179-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 15:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234131

From: Thomas Perrot <thomas.perrot@bootlin.com>

With LTO enabled, GCC performs a link-time recompilation pass where
DW_AT_comp_dir is set to the build directory. The -ffile-prefix-map
flags from DEBUG_PREFIX_MAP are not applied to this attribute during
LTO recompilation, leaving a raw TMPDIR path in the split debug
symbols of libsqlite3.so.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/distro/include/lto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
index 8752249685a4..b4f823681af0 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -21,6 +21,8 @@ LTO:pn-libbsd =3D ""
 LTO:pn-perf =3D ""
 # webkit is not linking properly with LTO, disable until next time
 LTO:pn-webkitgtk =3D ""
+# LTO link-time recompilation leaves TMPDIR in DW_AT_comp_dir of debug s=
ymbols
+LTO:pn-sqlite3 =3D ""
 LTO:pn-xserver-xorg =3D ""
 LTO:pn-grub =3D ""
 LTO:pn-grub-efi =3D ""
--=20
2.53.0


