Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CEACD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29689.1780322829235473484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 07:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tgBbYY+2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DA2E19F6
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Jun 2026 07:07:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14B743F632
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Jun 2026 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780322828; bh=I/wCaZX5q36JG/OLmBZjs2ruBXBFjcoSpPUi5XPo2Hg=;
	h=From:To:Subject:Date:From;
	b=tgBbYY+2gz9/2jE9HStXrNXZ9uEne1oIO9qLioW4bysx8TxDZMRsWE7N7tQ9OdthR
	 Sg0A84xg6RnmqPs+tfo94Tsf+EFtGcPVx0pK5Mt3SKdrdAbc7CWkNQe4cEOs/cnZSz
	 8U99Iw/QTtex5GtWMMG2EDiFTFtOpC3SN4Rnn4Go=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] curl: fix mbedtls detection
Date: Mon,  1 Jun 2026 15:07:04 +0100
Message-ID: <20260601140704.1194736-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 14:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237835

The mbedtls detection logic in curl is broken and resulted in build
paths leaking into curl-config and libcurl.pc.  Backport a patch to fix
the detection by looking for a symbol that wasn't removed in mbedtls 3.0
five years ago, and remove the explicit sysroot reference as it is no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/mbedtls.patch | 41 ++++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb     |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch

diff --git a/meta/recipes-support/curl/curl/mbedtls.patch b/meta/recipes-=
support/curl/curl/mbedtls.patch
new file mode 100644
index 0000000000..f2f2c457aa
--- /dev/null
+++ b/meta/recipes-support/curl/curl/mbedtls.patch
@@ -0,0 +1,41 @@
+From 50b1408f97d9e8fc585c5351cbf86bf60a30eb59 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 23 May 2026 01:05:10 +0200
+Subject: [PATCH] autotools: mbedtls detection fixes
+
+- fix symbol used for first-round detection.
+- skip detecting mbedtls on custom path if custom path was not supplied.
+
+Reported-by: Ross Burton
+Fixes #21727
+
+Closes #21729
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/50b1408f9=
7d9e8fc585c5351cbf86bf60a30eb59]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ m4/curl-mbedtls.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/curl-mbedtls.m4 b/m4/curl-mbedtls.m4
+index 7c5bccd22983..6887302592d6 100644
+--- a/m4/curl-mbedtls.m4
++++ b/m4/curl-mbedtls.m4
+@@ -42,7 +42,7 @@ if test "x$OPT_MBEDTLS" !=3D "xno"; then
+     if test -z "$OPT_MBEDTLS"; then
+       dnl check for lib first without setting any new path
+=20
+-      AC_CHECK_LIB(mbedtls, mbedtls_havege_init,
++      AC_CHECK_LIB(mbedtls, mbedtls_ssl_init,
+       dnl libmbedtls found, set the variable
+       [
+         AC_DEFINE(USE_MBEDTLS, 1, [if mbedTLS is enabled])
+@@ -58,7 +58,7 @@ if test "x$OPT_MBEDTLS" !=3D "xno"; then
+     addcflags=3D""
+     mbedtlslib=3D""
+=20
+-    if test "$USE_MBEDTLS" !=3D "yes"; then
++    if test "$USE_MBEDTLS" !=3D "yes" && test -n "$OPT_MBEDTLS"; then
+       dnl add the path and test again
+       addld=3D-L$OPT_MBEDTLS/lib$libsuff
+       addcflags=3D-I$OPT_MBEDTLS/include
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
index b9251336b8..4287b7b7da 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://mbedtls.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
@@ -56,7 +57,7 @@ PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldap=
s,openldap"
 PACKAGECONFIG[libgsasl] =3D "--with-libgsasl,--without-libgsasl,libgsasl=
"
 PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[mbedtls] =3D "--with-mbedtls=3D${STAGING_DIR_TARGET},--wit=
hout-mbedtls,mbedtls"
+PACKAGECONFIG[mbedtls] =3D "--with-mbedtls,--without-mbedtls,mbedtls"
 PACKAGECONFIG[mqtt] =3D "--enable-mqtt,--disable-mqtt,"
 PACKAGECONFIG[negotiate-auth] =3D "--enable-negotiate-auth,--disable-neg=
otiate-auth"
 PACKAGECONFIG[nghttp2] =3D "--with-nghttp2,--without-nghttp2,nghttp2"
--=20
2.43.0


