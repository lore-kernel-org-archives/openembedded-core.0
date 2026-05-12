Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C8ACD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:54:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75989.1778594055279720266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Sa1tWoOG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0791691
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D69363F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594054; bh=5xWpQczZos5OHRhKJjODUHUHUmRsJIMEVJulKSi1Yiw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sa1tWoOGsklgFzAQ099DnNSDxaq1JzQbVoy0+LKIGC+w6ue2X+UFRPDSUM58RPxxc
	 kIrDkkJmZteFcLvj3ZwNynbDsYw6EY6xqINVtNr+KZ1lRcf57J122TItlgdIhFG5vZ
	 PhlNjiEk2bu9Dyfhyu2NlCfpteLfb4ue33FXSglc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] librsvg: consolidate PACKAGECONFIG
Date: Tue, 12 May 2026 14:54:06 +0100
Message-ID: <20260512135407.3056055-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135407.3056055-1-ross.burton@arm.com>
References: <20260512135407.3056055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236886

Explictly appending PACKAGECONFIG makes it harder to directly control
PACKAGECONFIG, merge the assignments to keep it simple.

This does not change the behaviour of native builds as G-I is disabled
in native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index 61ef01c3fd7..0b82ae14523 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -56,8 +56,9 @@ LDFLAGS +=3D " -L${B}/rsvg"
 # needed on ubuntu 20.04/debian 11 to avoid 'undefined reference to `dls=
ym'' errors
 BUILD_LDFLAGS +=3D " -ldl"
=20
-PACKAGECONFIG ??=3D "gdkpixbuf ${@bb.utils.contains('PTEST_ENABLED', '1'=
, 'apitest', '', d)}"
-PACKAGECONFIG:append:class-target =3D " ${@bb.utils.contains('GI_DATA_EN=
ABLED', 'True', 'vala', '', d)}"
+PACKAGECONFIG ??=3D "gdkpixbuf \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'apitest',=
 '', d)} \
+                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala=
', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] =3D "-Dpixbuf-loader=3Denabled,-Dpixbuf-loader=3D=
disabled,gdk-pixbuf-native"
 PACKAGECONFIG[vala] =3D "-Dvala=3Denabled,-Dvala=3Ddisabled"
--=20
2.43.0


