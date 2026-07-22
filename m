Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE66DC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 15:43:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3158.1784734979314019327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WHP2/bE1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A20701691
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80A8F3F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734978; bh=zwwDqhkGtKtUi5avzfaEijT3tw7gn9VUsNk/QGPzwQg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WHP2/bE1zRSRi6bqXqqyzTc5V37YJVVWbFo1/33WHwRsDBOCQojR20O8wL6Rg85+7
	 g4GIsuxB6Y7kdxUPHf/BAE2mwtW+v9RIuaxbu+2WE7HfpwH6qTYfnKB+KrmD9oVjQX
	 IRSG7IM1QdB2/S8GRPPFU6tVLx/BcSI3uez3LyVs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] xorg-libs: use meson where possible
Date: Wed, 22 Jul 2026 16:42:47 +0100
Message-ID: <20260722154247.2987545-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722154247.2987545-1-ross.burton@arm.com>
References: <20260722154247.2987545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 15:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241703

These recipes can use meson to build, so use it.  The output is
functionally identical but do_configure is faster:

  PKG              TASK          ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
  libfontenc       do_configure   -11.0s   -89.0%      12.4s -> 1.4s
  libxau           do_configure   -11.0s   -89.8%      12.2s -> 1.2s
  libxvmc          do_configure   -10.8s   -87.1%      12.4s -> 1.6s
  libxscrnsaver    do_configure   -10.6s   -88.4%      12.0s -> 1.4s
  libxcomposite    do_configure   -10.6s   -88.3%      12.0s -> 1.4s
  libxinerama      do_configure   -10.5s   -88.3%      11.9s -> 1.4s
  libxres          do_configure   -10.5s   -87.8%      11.9s -> 1.4s
  libxdamage       do_configure   -10.4s   -88.3%      11.8s -> 1.4s
  libxxf86vm       do_configure   -10.4s   -87.9%      11.8s -> 1.4s
  libxrandr        do_configure   -10.4s   -87.7%      11.9s -> 1.5s
  libxfixes        do_configure   -10.3s   -88.2%      11.7s -> 1.4s
  libxft           do_configure   -10.3s   -86.3%      11.9s -> 1.6s

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb    | 3 +++
 meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb       | 2 ++
 meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb | 2 ++
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb    | 2 ++
 meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb     | 2 ++
 meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb        | 2 ++
 meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb   | 2 ++
 meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb     | 2 ++
 meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb       | 2 ++
 meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb | 2 ++
 meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb      | 2 ++
 meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb    | 2 ++
 12 files changed, 25 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb b/meta/re=
cipes-graphics/xorg-lib/libfontenc_1.1.9.bb
index 07278251129..d5c1ed54eb9 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
@@ -9,6 +9,9 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96254c20ab81c63e65b26f0dbcd4a=
1c1"
=20
 DEPENDS +=3D "zlib xorgproto font-util"
+
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 SRC_URI[sha256sum] =3D "9d8392705cb10803d5fe1d27d236cbab3f664e26841ce019=
16bbbe430cf273e2"
diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb b/meta/recip=
es-graphics/xorg-lib/libxau_1.0.12.bb
index b52b28914be..483df32dbb8 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7908e3424911=
98401321cec1956807ec"
 DEPENDS +=3D " xorgproto"
 PROVIDES =3D "xau"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXau"
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb b/meta=
/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
index 79c2fa69f7a..37dc59a4847 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
@@ -18,6 +18,8 @@ DEPENDS +=3D " xorgproto virtual/libx11 libxfixes libxe=
xt"
 PROVIDES =3D "xcomposite"
 BBCLASSEXTEND =3D "native nativesdk"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXcomposite"
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb b/meta/re=
cipes-graphics/xorg-lib/libxdamage_1.1.7.bb
index 2602ee46808..f57050de0ca 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
@@ -19,6 +19,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9fe101f30dd2=
4134cf43146863241868"
 DEPENDS +=3D "virtual/libx11 xorgproto libxfixes"
 PROVIDES =3D "xdamage"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXdamage"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb b/meta/rec=
ipes-graphics/xorg-lib/libxfixes_6.0.2.bb
index 513e85ab9de..71af323e0d7 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da5a9755c8921=
cc7dc08a5cfe4267d0ff"
=20
 DEPENDS +=3D "virtual/libx11 xorgproto"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXfixes"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb b/meta/recipe=
s-graphics/xorg-lib/libxft_2.3.9.bb
index 0b7c736451e..ebc53bcf56b 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
@@ -18,6 +18,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D90b90b60eb30=
f65fc9c2673d7cf59e24"
 DEPENDS +=3D "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES =3D "xft"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 SRC_URI[sha256sum] =3D "60a25b78945ed6932635b3bb1899a517d31df7456e69867f=
fba27f89ff3976f5"
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb b/meta/r=
ecipes-graphics/xorg-lib/libxinerama_1.1.6.bb
index 10f683a6f37..8df9465fb18 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
@@ -15,6 +15,8 @@ DEPENDS +=3D "libxext xorgproto"
 PROVIDES =3D "xinerama"
 PE =3D "1"
=20
+XORGBUILDCLASS =3D "meson"
+
 XORG_PN =3D "libXinerama"
 SRC_URI[sha256sum] =3D "d00fc1599c303dc5cbc122b8068bdc7405d6fcb19060f459=
7fc51bd3a8be51d7"
=20
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb b/meta/rec=
ipes-graphics/xorg-lib/libxrandr_1.5.5.bb
index 8696d110257..89e2490b30e 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc9d1a2118a6c=
d5727521db8e7a2fee69"
=20
 DEPENDS +=3D "virtual/libx11 xorgproto libxrender libxext"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXrandr"
diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb b/meta/recip=
es-graphics/xorg-lib/libxres_1.2.3.bb
index b9c71d40738..1297fd363f9 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.3.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c89441a8df2=
61bdc56587465e13c7fa"
=20
 DEPENDS +=3D "libxext xorgproto"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXres"
diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb b/meta=
/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
index f6cdb2e4175..c13a63c48bf 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
@@ -17,6 +17,8 @@ PROVIDES =3D "libxss"
 RREPLACES:${PN} =3D "libxss"
 PE =3D "1"
=20
+XORGBUILDCLASS =3D "meson"
+
 XORG_PN =3D "libXScrnSaver"
=20
 SRC_URI[sha256sum] =3D "5057365f847253e0e275871441e10ff7846c8322a5d88e1e=
187d326de1cd8d00"
diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb b/meta/reci=
pes-graphics/xorg-lib/libxvmc_1.0.15.bb
index 8fe205b3873..5fca1f11d9e 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0a207f08d496=
1489c55046c9a5e500da \
=20
 DEPENDS +=3D "libxext libxv xorgproto"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXvMC"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb b/meta/re=
cipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
index 9afc3ef8099..c0f40cd4805 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfa0b9c462d8f=
2f13eba26492d42ea63d"
=20
 DEPENDS +=3D "libxext xorgproto"
=20
+XORGBUILDCLASS =3D "meson"
+
 PE =3D "1"
=20
 XORG_PN =3D "libXxf86vm"
--=20
2.43.0


