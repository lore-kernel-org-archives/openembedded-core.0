Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97604C001CC
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:06:31 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.3256.1713117986231480557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 11:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=qnzy6ex3;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D65E4240028
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 20:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1713117983; bh=q7i1Z7OJwDgrIlxeWvlL6t4FbvHulv+RQAUXt6TuE5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=qnzy6ex33c9jaysHTNzfAQgU0NJg9BcS+syT716X7LUucugsTxB7/Cq4tyYyun6FO
	 TCAsKGp8PHlfqq2k7xUIKc91o/ekwLq03V6xxeG6jl3FDJ3nFeBqWvhcv50E6J41rK
	 WCiS2ebuekDNNMmV6h7ReUtzXmVNB6xOM1y9kARRaoWFE5FTVWltfjETRoscApjaIF
	 n2MJEw4oS0kDdRYAEyG5dmyvFlZNHNJJ4eHH/A3rkqzfzwsM9cCba3BGXqi3egCX1o
	 blJgMPsteo9II91JQrBFr8dV0vhiGcfv8znhGCuekdTSjKmDTSDyeenkrXMDEJaug3
	 GLxPTQSKyka7Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VHdXZ6fWbz9rxG;
	Sun, 14 Apr 2024 20:06:21 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 1/2] gnutls: upgrade 3.8.4 -> 3.8.5
Date: Sun, 14 Apr 2024 18:06:10 +0000
Message-Id: <20240414180611.794096-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 18:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198212

From: Wang Mingyu <wangmy@fujitsu.com>

Add-ptest-support.patch
refreshed for 3.8.5

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* libgnutls: Due to majority of usages and implementations of
  RSA decryption with PKCS#1 v1.5 padding being incorrect,
  leaving them vulnerable to Marvin attack, the RSAES-PKCS1-v1_5
  is being deprecated (encryption and decryption) and will be
  disabled in the future.
* libgnutls: Added support for RIPEMD160 and PBES1-DES-SHA1 for
  backward compatibility with GCR.
* libgnutls: A couple of memory related issues have been fixed in RSA PKC=
S#1
  v1.5 decryption error handling and deterministic ECDSA with earlier
  versions of GMP.
* build: Fixed a bug where building gnutls statically failed due
  to a duplicate definition of nettle_rsa_compute_root_tr().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/gnutls/Add-ptest-support.patch | 8 ++++----
 .../gnutls/{gnutls_3.8.4.bb =3D> gnutls_3.8.5.bb}           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.4.bb =3D> gnutls_3.8.5.bb=
} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b=
/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 1152d3797f..8edd31d6b9 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,4 +1,4 @@
-From ff6a345235b2585c261752e47a749228672b07dc Mon Sep 17 00:00:00 2001
+From bfa70adcbda4e505cf2e597907852e78e0439ee2 Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
@@ -26,7 +26,7 @@ index 843193f..816b09f 100644
 =20
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index d6e03cf..e3f15fb 100644
+index 934377e..4406eae 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
@@ -39,10 +39,10 @@ index d6e03cf..e3f15fb 100644
 =20
  hw_features=3D
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index fb9e55a..c2d226a 100644
+index e39a3b3..861dd63 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -658,6 +658,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+@@ -663,6 +663,12 @@ SH_LOG_COMPILER =3D $(SHELL)
  AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
  LOG_COMPILER =3D $(LOG_VALGRIND)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.5.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.5.bb
index 20139b4dd4..21506a04dc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd4=
4cdfa7f36ebc3a9b"
+SRC_URI[sha256sum] =3D "66269a2cfe0e1c2dabec87bdbbd8ab656f396edd9a40dd00=
6978e003cfa52bfc"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.39.2


