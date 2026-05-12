Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9134CD4F35
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:54:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76368.1778594053994561748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PoEWRBkr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A76F1691
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E2443F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594053; bh=elIZlQxf0wSWqk4oelavUuXiI5DJjYn9kuaYG7TLY3s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PoEWRBkrcGNGc7yXZdZeYQM+OkE3ujgbbj8YNhOMOtpwyem7h4t+NkCrUvHeZeVR4
	 0kcTK9Vp27OKVqrL/vgquhmIKyc6NlpHkzjyReqafQRuXNx/gaLDQblHD+XTe4UDNK
	 /0PnFzyKAWOiJ0xZOWNCsUeK+BU4jNFgR0hV76Mo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] librsvg: consolidate DEPENDS
Date: Tue, 12 May 2026 14:54:05 +0100
Message-ID: <20260512135407.3056055-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135407.3056055-1-ross.burton@arm.com>
References: <20260512135407.3056055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236885

There's no reason to append cargo-native to BASEDEPENDS when it can just
be added to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index be72b1a1491..61ef01c3fd7 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -10,7 +10,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
 SECTION =3D "x11/utils"
-DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-na=
tive cargo-c-native"
+DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-na=
tive cargo-native cargo-c-native"
 RDEPENDS:${PN}-ptest +=3D "rsvg liberation-fonts"
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -31,11 +31,6 @@ SRC_URI[archive.sha256sum] =3D "a56d2c80d744ad2f2718f8=
5df466fe71d24ff1f9bc3e5ef588
=20
 UPSTREAM_CHECK_REGEX =3D "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
-# librsvg is still autotools-based, but is calling cargo from its automa=
ke-driven makefiles
-# so we cannot use cargo class directly, but still need bits and pieces =
from it=20
-# for cargo to be happy
-BASEDEPENDS:append =3D " cargo-native"
-
 export EXTRA_NATIVE_PKGCONFIG_PATH =3D ":${B}/meson-uninstalled"
 export RUST_BACKTRACE =3D "full"
 export RUSTFLAGS
--=20
2.43.0


