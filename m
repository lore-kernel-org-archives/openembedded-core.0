Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web10.6433.1628397870290663442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 21:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ozlabs.org header.s=201707 header.b=r+zthBdw;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: anton@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1010)
	id 4Gj67S0RbZz9sWX; Sun,  8 Aug 2021 14:44:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1628397860;
	bh=YoEPkD1IjQYDVOG9SqNDXGdhwXOnwg+vGlVzNSZ/CXk=;
	h=From:To:Subject:Date:From;
	b=r+zthBdwdkM1FSA1hbRuqTrwEGpbrEo90dMfqOUHLabnJ/InDuzb2wbE+wqprl4q/
	 zYHx3Wik3EW/QF/z2ZG7h5Q2N1fp/UGdnxnMQHj3dRjaeAWHr+/rSWvjE4/o6zETDM
	 PO1Y8Lu+gsR3MXraof03nVJiDqiWX1LhCo9My4IeMn1mhDZkbrJ5wWMg/bFyATojEx
	 kERTKIXtU/69sug2SphEf29aboZjQzWNGqkjqqP2LC+K+8k6PAtipWN70ZTAtgqKDI
	 HrS5k9TdbDIB7Dhnp1SbJdWkJwnO4YWbc31ptnKdC/L/ufLC7S1vpknnyWMfNhImuZ
	 B4Yph8rfHozFg==
From: anton@ozlabs.org
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Subject: [PATCH] libjpeg-turbo: Handle powerpc64le without Altivec
Date: Sun,  8 Aug 2021 14:43:33 +1000
Message-Id: <20210808044333.2495956-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Similar to 32/64 bit big endian PowerPC, build with -DWITH_SIMD=3DFalse
if the Altivec feature is not available.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
index 3b8130af6d..9d0a338532 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
@@ -46,6 +46,7 @@ EXTRA_OECMAKE:append:class-target:armeb =3D " ${@bb.uti=
ls.contains("TUNE_FEATURES"
 # Provide a workaround if Altivec unit is not present in PPC
 EXTRA_OECMAKE:append:class-target:powerpc =3D " ${@bb.utils.contains("TU=
NE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
 EXTRA_OECMAKE:append:class-target:powerpc64 =3D " ${@bb.utils.contains("=
TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
+EXTRA_OECMAKE:append:class-target:powerpc64le =3D " ${@bb.utils.contains=
("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
=20
 DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
--=20
2.31.1

