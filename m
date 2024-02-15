Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56567C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 18:54:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.627.1708023248890042670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 10:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 927CB40C83
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:54:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dV0x66VpLkG
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2024 18:54:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77EF1400CF
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:54:07 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 06471163EA5;
	Thu, 15 Feb 2024 13:54:06 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] zlib: upgrade 1.3 -> 1.3.1
Date: Thu, 15 Feb 2024 13:54:05 -0500
Message-Id: <20240215185405.2855996-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195692

Refresh local patch.

Changelog:
https://github.com/madler/zlib/releases/tag/v1.3.1

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...configure-Pass-LDFLAGS-to-link-tests.patch | 22 +++++++++----------
 .../zlib/{zlib_1.3.bb =3D> zlib_1.3.1.bb}       |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-core/zlib/{zlib_1.3.bb =3D> zlib_1.3.1.bb} (94%)

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-l=
ink-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS=
-to-link-tests.patch
index e6cc915ba5..07b2cd3879 100644
--- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tes=
ts.patch
+++ b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tes=
ts.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-From f15584918a7fbbe3cc794ad59100e5e8153ea9f6 Mon Sep 17 00:00:00 2001
+From ea77f1f003a4d18b23cca703f3c824942863a1b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Mar 2022 22:38:47 -0800
 Subject: [PATCH] configure: Pass LDFLAGS to link tests
@@ -13,24 +13,25 @@ tests perform correctly. Without this some tests may =
fail resulting in
 wrong confgure result, ending in miscompiling the package
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/configure b/configure
-index 52ff4a0..d04ee59 100755
+index c55098a..a7c6d72 100755
 --- a/configure
 +++ b/configure
-@@ -427,7 +427,7 @@ if test $shared -eq 1; then
+@@ -443,7 +443,7 @@ if test $shared -eq 1; then
    echo Checking for shared library support... | tee -a configure.log
    # we must test in two steps (cc then ld), required at least on SunOS =
4.x
-   if try $CC -w -c $SFLAGS $test.c &&
+   if try $CC -c $SFLAGS $test.c &&
 -     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
 +     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
      echo Building shared library $SHAREDLIBV with $CC. | tee -a configu=
re.log
    elif test -z "$old_cc" -a -z "$old_cflags"; then
      echo No shared library support. | tee -a configure.log
-@@ -503,7 +503,7 @@ int main(void) {
+@@ -505,7 +505,7 @@ int main(void) {
  }
  EOF
    fi
@@ -39,7 +40,7 @@ index 52ff4a0..d04ee59 100755
      sizet=3D`./$test`
      echo "Checking for a pointer-size integer type..." $sizet"." | tee =
-a configure.log
      CFLAGS=3D"${CFLAGS} -DNO_SIZE_T=3D${sizet}"
-@@ -537,7 +537,7 @@ int main(void) {
+@@ -539,7 +539,7 @@ int main(void) {
    return 0;
  }
  EOF
@@ -48,7 +49,7 @@ index 52ff4a0..d04ee59 100755
      echo "Checking for fseeko... Yes." | tee -a configure.log
    else
      CFLAGS=3D"${CFLAGS} -DNO_FSEEKO"
-@@ -554,7 +554,7 @@ cat > $test.c <<EOF
+@@ -556,7 +556,7 @@ cat > $test.c <<EOF
  #include <errno.h>
  int main() { return strlen(strerror(errno)); }
  EOF
@@ -57,7 +58,7 @@ index 52ff4a0..d04ee59 100755
    echo "Checking for strerror... Yes." | tee -a configure.log
  else
    CFLAGS=3D"${CFLAGS} -DNO_STRERROR"
-@@ -661,7 +661,7 @@ int main()
+@@ -663,7 +663,7 @@ int main()
    return (mytest("Hello%d\n", 1));
  }
  EOF
@@ -66,7 +67,7 @@ index 52ff4a0..d04ee59 100755
      echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configu=
re.log
 =20
      echo >> configure.log
-@@ -751,7 +751,7 @@ int main()
+@@ -753,7 +753,7 @@ int main()
  }
  EOF
 =20
@@ -75,6 +76,3 @@ index 52ff4a0..d04ee59 100755
      echo "Checking for snprintf() in stdio.h... Yes." | tee -a configur=
e.log
 =20
      echo >> configure.log
---=20
-2.25.1
-
diff --git a/meta/recipes-core/zlib/zlib_1.3.bb b/meta/recipes-core/zlib/=
zlib_1.3.1.bb
similarity index 94%
rename from meta/recipes-core/zlib/zlib_1.3.bb
rename to meta/recipes-core/zlib/zlib_1.3.1.bb
index ede75f90bd..e6a81ef789 100644
--- a/meta/recipes-core/zlib/zlib_1.3.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
-SRC_URI[sha256sum] =3D "ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f=
8bf355702efa593e"
+SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91=
eefb60f03b72df23"
=20
 # When a new release is made the previous release is moved to fossils/, =
so add this
 # to PREMIRRORS so it is also searched automatically.
--=20
2.25.1


