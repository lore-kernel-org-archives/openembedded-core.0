Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67393C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:23:08 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.5507.1712035384262728160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Tnt6R0eQ;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 199A1240101
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 07:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1712035382; bh=rV5n55LisRghsNCBLso6LQBIcV++itZehspAZRjFlDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Tnt6R0eQMAKGGqyJW5vqDk5cUoSiMSjWP9U/34wSkXDPr//m8v/C9RTqfyUqVqVbA
	 TFBQixWTloDG2oehf8qA3AKJOSZ9NCOfmJW2jdH7dAtbNjJoHgW32ukWUiZkt0p5nG
	 Edwwd18FtNEOAh4/uMeHPvLgixU0YGUS9/IL8Uc2VIHF1Bi+fzMJ+hvMoOCzUnVGoF
	 HvkJWIDdFUef93wkf3kyApwO9xSzFPNU6wrTvKORuOKGTALA49We70gvb7S0h+vF5Z
	 TIc6s6iogFokhuICR8s4vXvyKUAF89JrIV3x9L1FzEE45cBeJZYi0+wTYctj6DY/VX
	 fqqMzVobrPzOA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4V7x9K1MlXz6tyK;
	Tue,  2 Apr 2024 07:23:00 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] gnutls: upgrade 3.8.3 -> 3.8.4
Date: Tue,  2 Apr 2024 05:22:49 +0000
Message-Id: <20240402052249.13447-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 05:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197865

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

- Upgrade gnutls SRCREV for new version
- Refresh patches for 3.8.4

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

** libgnutls: RSA-OAEP encryption scheme is now supported
   To use it with an unrestricted RSA private key, one would need to
   initialize a gnutls_x509_spki_t object with necessary parameters
   for RSA-OAEP and attach it to the private key. It is also possible
   to import restricted private keys if they are stored in PKCS#8
   format.

** libgnutls: Fix side-channel in the deterministic ECDSA.
   Reported by George Pantelakis (#1516).
   [GNUTLS-SA-2023-12-04, CVSS: medium] [CVE-2024-28834]

** libgnutls: Fixed a bug where certtool crashed when verifying a certifi=
cate
   chain with more than 16 certificates. Reported by William Woodruff (#1=
525)
   and yixiangzhike (#1527).
   [GNUTLS-SA-2024-01-23, CVSS: medium] [CVE-2024-28835]

** libgnutls: Compression libraries are now loaded dynamically as needed
   instead of all being loaded during gnutls library initialization.
   As a result, the library initialization should be faster.

** build: The gnutls library can now be linked with the static library
   of GMP.  Note that in order for this to work libgmp.a needs to be
   compiled with -fPIC and libhogweed in Nettle also has to be linked
   to the static library of GMP.  This can be used to prevent custom
   memory allocators from being overriden by other applications.

** API and ABI modifications:
gnutls_x509_spki_get_rsa_oaep_params: New function.
gnutls_x509_spki_set_rsa_oaep_params: New function.
GNUTLS_PK_RSA_OAEP: New enum member of gnutls_pk_algorithm_t.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 ...-.hmac-file-should-be-excuted-in-target-envi.patch |  7 +++----
 .../gnutls/gnutls/Add-ptest-support.patch             | 11 +++++------
 meta/recipes-support/gnutls/gnutls/arm_eabi.patch     |  7 ++-----
 .../gnutls/{gnutls_3.8.3.bb =3D> gnutls_3.8.4.bb}       |  2 +-
 4 files changed, 11 insertions(+), 16 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.3.bb =3D> gnutls_3.8.4.bb=
} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-=
should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnut=
ls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 4bdc40d932..d13bfee8ef 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-=
be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-=
be-excuted-in-target-envi.patch
@@ -1,4 +1,4 @@
-From 21a8295bac3805e4490ba2b5f136e7f4c121061b Mon Sep 17 00:00:00 2001
+From 7be8ec59a53e93c2bd453b3ba2d63d1b300ef11f Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Mon, 23 May 2022 10:44:43 +0900
 Subject: [PATCH] Creating .hmac file should be excuted in target environ=
ment,
@@ -6,16 +6,15 @@ Subject: [PATCH] Creating .hmac file should be excuted =
in target environment,
=20
 Upstream-Status: Inappropriate [https://gitlab.com/gnutls/gnutls/-/issue=
s/1373]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
 ---
  lib/Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 6d4e8d2..24ef108 100644
+index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -206,8 +206,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
+@@ -198,8 +198,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
 =20
  all-local: $(hmac_file)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b=
/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index f87cf536fa..1152d3797f 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,11 +1,10 @@
-From 81861f7ba690956c064ebe8dce6c313951fa2a9f Mon Sep 17 00:00:00 2001
+From ff6a345235b2585c261752e47a749228672b07dc Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
=20
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
-
 ---
  Makefile.am       | 3 +++
  configure.ac      | 2 ++
@@ -27,10 +26,10 @@ index 843193f..816b09f 100644
 =20
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index b25ba14..860ddef 100644
+index d6e03cf..e3f15fb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
 =20
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
 =20
@@ -40,10 +39,10 @@ index b25ba14..860ddef 100644
 =20
  hw_features=3D
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d530ad0..71c592f 100644
+index fb9e55a..c2d226a 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -648,6 +648,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+@@ -658,6 +658,12 @@ SH_LOG_COMPILER =3D $(SHELL)
  AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
  LOG_COMPILER =3D $(LOG_VALGRIND)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/rec=
ipes-support/gnutls/gnutls/arm_eabi.patch
index fe3f031fdc..883d0123db 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 5810d97281bb30edb786de9946e5c13186eff6a2 Mon Sep 17 00:00:00 2001
+From d17ae0ef31c3c186766a338e8c40c87d1b98820e Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Wed, 25 Jan 2017 13:52:59 -0800
 Subject: [PATCH] gnutls: account for ARM_EABI
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/tests/seccomp.c b/tests/seccomp.c
-index 86442a5..03a5aa8 100644
+index 881f0bb..5f9204a 100644
 --- a/tests/seccomp.c
 +++ b/tests/seccomp.c
 @@ -55,7 +55,9 @@ int disable_system_calls(void)
@@ -27,6 +27,3 @@ index 86442a5..03a5aa8 100644
  	ADD_SYSCALL(getpid, 0);
  	ADD_SYSCALL(gettimeofday, 0);
  #if defined(HAVE_CLOCK_GETTIME)
---=20
-2.30.2
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.3.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.4.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 27d6753be0..20139b4dd4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703af=
cada0ee520f4173e"
+SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd4=
4cdfa7f36ebc3a9b"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.39.2


