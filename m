Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559FBC5CFCF
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 16:14:00 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11856.1786551234386331774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 09:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uNvV+fch;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout04.t-online.de (Postfix) with SMTP id D9239866;
	Wed, 12 Aug 2026 18:13:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.72]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wuBaN-2QECag0; Wed, 12 Aug 2026 18:13:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Claude <noreply@anthropic.com>
Subject: [oe-core][PATCH 2/2] clang: auto-derive CLANG_EXTRA_OE_DISTRO from DISTRO
Date: Wed, 12 Aug 2026 18:13:41 +0200
Message-ID: <20260812161341.822689-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812161341.822689-1-f_l_k@t-online.de>
References: <20260812161341.822689-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1786551227-B97F991C-8E4EBA46/0/0 CLEAN NORMAL
X-TOI-MSGID: 4167a420-a311-41aa-8432-88e3752d5e5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1786551228; i=f_l_k@t-online.de;
	bh=3waHMg1h67pY6bEFETJ9liENxL0egRlXEdFvJRpZPxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uNvV+fchzbLQwGS8zJtoMai5zt4MpHNyNlIvsKkz5FNT/asyXAPCm7u/6IX2Chwo4
	 gESGFOf5wS/EYtG9fwwowFDL35CS2EjguVfUhFMdNRuf2peInQS8MFYX9KCMUTGyev
	 qRnk+zkEGlkcLWAMrx0u8u8GOYTC35NTk+LnmzQ3axml1Q7gOilSApoJh2ePiQJelI
	 7RYry5prE+rVfyDgxJ44tO9zKPP8ekcT2c6MMqSxXDYN61KH28ewkZxCATLLZ/YdiK
	 GoHD7WQ+tZd9Dz9zNcUhxf7Vh0uMvuQBGxKDYLelkj/CI6pOPzFUO42tZzJjOjgqR4
	 v7ra975ajZo9w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243297

CLANG_EXTRA_OE_VENDORS already auto-derives from TARGET_VENDOR and
SDK_VENDOR, recognizing a self-hosted OE build host without manual
configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships
only 'poky:poky', so a self-hosted host running a custom DISTRO must
be manually registered before Distro::IsOpenEmbedded() recognizes it
via /etc/os-release.

This is easy to get wrong by hand, since the registered id must
exactly match the raw ID=3D value in /etc/os-release, including any
hyphens, which must NOT be converted to underscores (unlike the
generated C++ enumerator name, which requires the conversion). A
single typo silently disables the OE-specific GCC-install candidate
with no error, causing native clang-toolchain builds to fail to find
crtbeginS.o/libgcc despite running on a genuinely OE-built host.

Auto-derive an entry for the current DISTRO the same way
CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts
are recognized out of the box with no configuration and no
hyphen/underscore typo risk. 'poky' is skipped since it is already
the shipped default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Co-authored-by: Claude <noreply@anthropic.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 5cd08d4085..5a07080d55 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D "${TARGET_VENDOR} ${SDK_VEN=
DOR}"
 # ":" separated the ID in "/etc/os-release" and the triple for finding g=
cc on this OE DISTRO.
 # eg: "poky:poky wrlinux:wrs"
 CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
+CLANG_EXTRA_OE_DISTRO:append =3D "${@ ' ' + d.getVar('DISTRO') + ':oe' i=
f d.getVar('DISTRO') not in ['poky', ''] else ''}"
 # Match with MULTILIB_GLOBAL_VARIANTS
 ML_VARIANTS =3D "lib32 lib64 libx32"
=20
--=20
2.55.0


