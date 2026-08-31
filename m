Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0563C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25547.1788167054820844033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YvI+lHa8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EC3934E41465
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A1960231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D20D611C788E9;
	Mon, 31 Aug 2026 11:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=icjMw9g9NzjxIjdL4G7zWrIHMp13PRJiDyveWqUocjw=;
	b=YvI+lHa8ajQzYUnPenymzbDLbpLZN7t6UqT04aTzswJBX9VlXqEOy1ra9cUVwwqU7j5bVg
	Q/uaLLASWPJ6XnI3nQdzCSxNtJvoouuNyJ9kUxzm+obiPaHHgQm1HLgXa87d6gpge/bdcu
	c9OZ8lqSpUCWcvN0atZwKwNaPbl3wqJos27lOMt8RqCKrXbn68aMK91J3ZWDenDn57WpSt
	PmJNmAjTeg/udZE3QjMuFJ25PEf5U//CrdF9Lt3IQC/2xANcPgpdWlTf+4gBv5zGyGSJn7
	1sUoTbFG2/CLiQwepdhVlFQtKvX+kKWLjSaboZPbANRu9St0YT7g1Mpjy09g0A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:33 +0200
Subject: [PATCH 1/9] orc: upgrade 0.4.42 -> 0.4.43
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-1-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=1827;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=R9YudGdOc9r7BeGvjj5LmQpb5KoDElnJqT2amCINC3U=;
 b=GJl7sRMW6SNW1Gk4UdtR1Qf4bMUqm5Np+8xN8MpDFZgTwBtlGF4chfWrpf1JloY1EIlR4MjST
 dbjplhw1FPqBalIAkM13EtBM24nCdvgIfXFa+rSWBfybq3pFuQNW3y0
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244743

Changelog:
- Add AVX512 support (Jorge Zapata)
- neon: add divluw rule (used in GStreamer's compositor, videomixer, gaud=
ieffects and alpha-blending code paths) (Jeongkeun Kim)
- neon: add mulslq, mululq rules, shlq, shrsq, shruq (used in GStreamer's=
 audio processing element) (Jeongkeun Kim)
- orccodemem: Invalidate code chunks when recycling for QEMU (Jorge Zapat=
a)
- orcprogram-c: Allow negative constants (Carlos Falgueras Garc=C3=ADa)
- arm, neon: Split ARM and NEON logic into 32b and 64b (Carlos Falgueras =
Garc=C3=ADa)
- RISC-V: many fixes and enhancements, including some new rules (Felix Go=
ng, Yao Zi, Brad Smith)
- LoongArch: various fixes and enhancements (Jin Bo)
- OpenBSD/FreeBSD improvements (Brad Smith)
- Miscellaneous fixes (Brad Smith, Jorge Zapata)
- ci fixes (Jorge Zapata, L. E. Segovia, Tim-Philipp M=C3=BCller)

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/orc/{orc_0.4.42.bb =3D> orc_0.4.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devto=
ols/orc/orc_0.4.43.bb
similarity index 95%
rename from meta/recipes-devtools/orc/orc_0.4.42.bb
rename to meta/recipes-devtools/orc/orc_0.4.43.bb
index 89e879e1cc19..db7f5023b3b3 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.43.bb
@@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d857=
97e"
=20
 SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e=
8a102b2bd122c90c"
+SRC_URI[sha256sum] =3D "82394e20e5c4dffe8b45ea8525c62dd4e3e8be7f253ac11c=
19297ba7ea5473e0"
=20
 inherit meson pkgconfig
=20

--=20
2.47.3


