Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85369D75E5D
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 17:43:44 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.51723.1732383819552084975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 09:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=QZ+3vGpb;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 20345240027
	for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 18:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1732383817; bh=FRAFOIcqjZqNeX1jAhQlOZo8y94e4Ikc809Q9hs8ZCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=QZ+3vGpbnC5xY8y/e8RwmINXaN9rtQAeu7kw8SK1+7y43cB/6wPgONDzFxu1NozSC
	 OYADMiWi5ArjAVOxF4bwtmJIxeC4FgJv/jBylFaryhBU2rGZaZatfjXeq/TZeiLza9
	 kXjUKx1rap8sqdL2A4sTTpkCeX5Hwxg3XWvMAScAEGQoSy2+ZhnPSPoxYnLFAyLNJ0
	 aKjNtjBHaWh67sgJdLKiY/PGU1VsgivTzoLmrOZKT08nGWGzlNft1tnwYNO2D60Fuq
	 QTQADrx/dD6tfO4ubnjibM/s6USzAk7xxvBxeHZHx9zoPqYgYWNYTDWiFi5lZG7W6e
	 SACJuargGfGoQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4XwfTN1cr3z6tw2;
	Sat, 23 Nov 2024 18:43:35 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] gnutls: Upgrade to 3.8.8
Date: Sat, 23 Nov 2024 17:43:22 +0000
Message-Id: <20241123174322.2034861-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 17:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207689

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

In 3.8.7 is that the linkage to compression libraries were changed to use=
 a new
tool called dlwrap, this caused issues during the last upgrade but is res=
olved
now with the update to 3.8.8. Remove the workarounds for the update hence=
.

Changes in 3.8.8 include:
* libgnutls:
   * Experimental support for X25519MLKEM768 and SecP256r1MLKEM768
     key exchange in TLS 1.3
   * All records included in an OCSP response are now checked in TLS
   * Handling of malformed compress_certificate extension is now more sta=
ndard
     compliant
* More flexible library linking options for compression libraries, TPM, a=
nd
  liboqs support. The configure options, --with-zstd, --with-brotli, --wi=
th-zlib,
   --with-tpm2, and --with-liboqs now take 4 states:
   yes/link/dlopen/no, to specify how the libraries are linked or
   loaded.

Do not set a specific library linking option but use the default(yes).

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../gnutls/gnutls/conditional.patch           | 42 -------------------
 .../{gnutls_3.8.7.1.bb =3D> gnutls_3.8.8.bb}    |  6 +--
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/conditional.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.7.1.bb =3D> gnutls_3.8.8.=
bb} (94%)

diff --git a/meta/recipes-support/gnutls/gnutls/conditional.patch b/meta/=
recipes-support/gnutls/gnutls/conditional.patch
deleted file mode 100644
index 2ff532fb53..0000000000
--- a/meta/recipes-support/gnutls/gnutls/conditional.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 292f96f26d7ce80e4a165c903c4fd569b85c1c1f Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Fri, 16 Aug 2024 09:42:15 +0900
-Subject: [PATCH] build: fix setting AM_CONDITIONAL for brotli and zstd
-
-As the with_{libbrotli,libzsttd} variables are unset if configured
-with --without-{brotli,zstd}, check the unequality to "no" doesn't
-work; use explicit matching with "yes" instead.
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 95ec4c1515..a476176800 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1158,7 +1158,7 @@ if test x$ac_brotli !=3D xno; then
- else
-     AC_MSG_RESULT(no)
- fi
--AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" !=3D "no" && t=
est "$with_libbrotlidec" !=3D "no")
-+AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" =3D yes && tes=
t "$with_libbrotlidec" =3D yes)
-=20
- AS_IF([test "$ac_cv_dlopen_soname_works" =3D yes], [
-     save_CFLAGS=3D$CFLAGS
-@@ -1203,7 +1203,7 @@ if test x$ac_zstd !=3D xno; then
- else
-     AC_MSG_RESULT(no)
- fi
--AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" !=3D "no")
-+AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" =3D yes)
-=20
- AS_IF([test "$ac_cv_dlopen_soname_works" =3D yes], [
-     save_CFLAGS=3D$CFLAGS
---=20
-GitLab
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb b/meta/recipes=
-support/gnutls/gnutls_3.8.8.bb
similarity index 94%
rename from meta/recipes-support/gnutls/gnutls_3.8.7.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.8.bb
index b381520e2e..213b9ff803 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.8.bb
@@ -21,15 +21,11 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.g=
etVar('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls=
-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
-           file://conditional.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "9ca0ddaccce28a74fa18d738744190afb3b0daebef74e6ad=
686bf7bef99abd60"
-
-# This is only needed for 3.8.7.1, remove when upgrading to 3.8.8 onward=
s
-S =3D "${WORKDIR}/gnutls-3.8.7"
+SRC_URI[sha256sum] =3D "ac4f020e583880b51380ed226e59033244bc536cad2623f2=
e26f5afa2939d8fb"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.39.5


