Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4318AD3EE84
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40252.1769096085874814948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BD91476
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0410A3F632
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] wget: merge .bb/.inc
Date: Thu, 22 Jan 2026 15:34:36 +0000
Message-ID: <20260122153438.1546221-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122153438.1546221-1-ross.burton@arm.com>
References: <20260122153438.1546221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229850

There's just a single recipe file that uses the .inc, so merge them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/wget/wget.inc       | 41 ----------------------
 meta/recipes-extended/wget/wget_1.25.0.bb | 42 ++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget.inc

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
deleted file mode 100644
index 13cf879067..0000000000
--- a/meta/recipes-extended/wget/wget.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "Console URL download utility supporting HTTP, FTP, etc"
-DESCRIPTION =3D "Wget is a network utility to retrieve files from the we=
b using \
-HTTP(S) and FTP, the two most widely used internet protocols. It works \
-non-interactively, so it will work in the background, after having logge=
d off. \
-The program supports recursive retrieval of web-authoring pages as well =
as \
-FTP sites"
-HOMEPAGE =3D "https://www.gnu.org/software/wget/"
-SECTION =3D "console/network"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6f65012d1daf98cb09b386cfb68df=
26b"
-
-inherit autotools gettext texinfo update-alternatives pkgconfig
-
-DEPENDS +=3D "autoconf-archive-native"
-
-EXTRA_OECONF =3D "--without-libgnutls-prefix --without-libssl-prefix \
-                --disable-rpath"
-
-EXTRA_OEMAKE +=3D 'TOOLCHAIN_OPTIONS=3D"${TOOLCHAIN_OPTIONS}" \
-                 DEBUG_PREFIX_MAP=3D"${DEBUG_PREFIX_MAP}"'
-
-ALTERNATIVE:${PN} =3D "wget"
-ALTERNATIVE:${PN}:class-nativesdk =3D ""
-ALTERNATIVE_PRIORITY =3D "100"
-
-RRECOMMENDS:${PN} +=3D "ca-certificates"
-
-BBCLASSEXTEND =3D "nativesdk"
-
-PACKAGECONFIG ??=3D "gnutls pcre2 zlib \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ares] =3D "--with-cares,--without-cares,c-ares"
-PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
-PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[iri] =3D "--enable-iri,--disable-iri,libidn2"
-PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
-PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-linux"
-PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
-PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
-PACKAGECONFIG[pcre2] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
-PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 93fefc9092..87ccdeade2 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -1,7 +1,47 @@
+SUMMARY =3D "Console URL download utility supporting HTTP, FTP, etc"
+DESCRIPTION =3D "Wget is a network utility to retrieve files from the we=
b using \
+HTTP(S) and FTP, the two most widely used internet protocols. It works \
+non-interactively, so it will work in the background, after having logge=
d off. \
+The program supports recursive retrieval of web-authoring pages as well =
as \
+FTP sites"
+HOMEPAGE =3D "https://www.gnu.org/software/wget/"
+SECTION =3D "console/network"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6f65012d1daf98cb09b386cfb68df=
26b"
+
+inherit autotools gettext texinfo update-alternatives pkgconfig
+
+DEPENDS +=3D "autoconf-archive-native"
+
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"
=20
-require wget.inc
+EXTRA_OECONF =3D "--without-libgnutls-prefix --without-libssl-prefix \
+                --disable-rpath"
+
+EXTRA_OEMAKE +=3D 'TOOLCHAIN_OPTIONS=3D"${TOOLCHAIN_OPTIONS}" \
+                 DEBUG_PREFIX_MAP=3D"${DEBUG_PREFIX_MAP}"'
+
+PACKAGECONFIG ??=3D "gnutls pcre2 zlib \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ares] =3D "--with-cares,--without-cares,c-ares"
+PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[iri] =3D "--enable-iri,--disable-iri,libidn2"
+PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
+PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
+PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[pcre2] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
+PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
+
+ALTERNATIVE:${PN} =3D "wget"
+ALTERNATIVE:${PN}:class-nativesdk =3D ""
+ALTERNATIVE_PRIORITY =3D "100"
+
+RRECOMMENDS:${PN} +=3D "ca-certificates"
+
+BBCLASSEXTEND =3D "nativesdk"
--=20
2.43.0


