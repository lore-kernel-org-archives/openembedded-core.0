Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FB0CD37B4
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 01:57:59 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.43173.1695002270375429169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 18:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup 20230812-3u04._domainkey.redrectangle.org on 127.0.0.1:53: no such host" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=E/pTjiVp;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 86DCB76F;
	Mon, 18 Sep 2023 03:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695002268;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=5405; bh=V4fjo3NW5rNL4TdlTyHVwYujIsY4KnDow2F230r5kZA=;
	b=E/pTjiVpLYem2I7jQW9L6zcStn1ZliWtdSzJC23+BO/m863y+C8roEMtabSNshzt
	xZ0Wf6HRIv5DhAy9Qr4L9UXWnlmXSfyCXG+cOtx+bKInBJjLMDKE8mVn95pjvZJHjKf
	oj3W+9e2tVKDEramE6sgf48+STjJXJAhY6GdVNFckT0154cMdAzt2IyP/XIizPVEKYm
	Y//Ssg76u18jvlUdn+0vTdXahCFy+CerhJ67KZCh5Wy0ATf0TaNXcTDP1iV4tTWRid2
	15UVF0+xGhEQYBwrWDphPy1Wh0ZfIctoj7jZSPpEC1A5MUqP+aDfL1iChr0g5mqog/w
	/sGLzv7HSA==
Received: by smtp.mailfence.com with ESMTPSA ; Mon, 18 Sep 2023 03:57:45 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update from 8.2.1 to 8.3.0
Date: Sun, 17 Sep 2023 18:57:35 -0700
Message-ID: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 01:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187818

NSS support was removed, so adjust PACKAGECONFIG options.

The --enable-crypto-auth option was removed and split into separate
options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate by
default as these are probably the most common.

Disable test 1279 since this requires libcurl and hangs the tests.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl/disable-tests       |  1 +
 .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb} (88%=
)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
index b687b2bb76..fdac795662 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -21,6 +21,7 @@
 # This test is scanning the source tree
 1222
 # These CRL tests need --libcurl option to be enabled
+1279
 1400
 1401
 1402
diff --git a/meta/recipes-support/curl/curl_8.2.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.3.0.bb
similarity index 88%
rename from meta/recipes-support/curl/curl_8.2.1.bb
rename to meta/recipes-support/curl/curl_8.3.0.bb
index 068486a352..327c261b1a 100644
--- a/meta/recipes-support/curl/curl_8.2.1.bb
+++ b/meta/recipes-support/curl/curl_8.3.0.bb
@@ -14,7 +14,7 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] =3D "dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713=
c8a7ef498cba4894"
+SRC_URI[sha256sum] =3D "376d627767d6c4f05105ab6d497b0d9aba7111770dd9d995=
225478209c37ea63"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
@@ -24,21 +24,26 @@ inherit autotools pkgconfig binconfig multilib_header=
 ptest
 # Entropy source for random PACKAGECONFIG option
 RANDOM ?=3D "/dev/urandom"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} l=
ibidn openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} b=
asic-auth bearer-auth digest-auth negotiate-auth libidn openssl proxy ran=
dom threaded-resolver verbose zlib"
 PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-resol=
ver verbose zlib"
 PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib"
=20
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,threaded-=
resolver"
+PACKAGECONFIG[aws] =3D "--enable-aws,--disable-aws"
+PACKAGECONFIG[basic-auth] =3D "--enable-basic-auth,--disable-basic-auth"
+PACKAGECONFIG[bearer-auth] =3D "--enable-bearer-auth,--disable-bearer-au=
th"
 PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] =3D "--enable-manual,--disable-manual"
 # Don't use this in production
 PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
 PACKAGECONFIG[dict] =3D "--enable-dict,--disable-dict,"
+PACKAGECONFIG[digest-auth] =3D "--enable-digest-auth,--disable-digest-au=
th"
 PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] =3D "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] =3D "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[kerberos-auth] =3D "--enable-kerberos-auth,--disable-kerbe=
ros-auth"
 PACKAGECONFIG[krb5] =3D "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,openldap"
 PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,openldap"
@@ -47,6 +52,7 @@ PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-lib=
idn2,libidn2"
 PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] =3D "--with-mbedtls=3D${STAGING_DIR_TARGET},--wit=
hout-mbedtls,mbedtls"
 PACKAGECONFIG[mqtt] =3D "--enable-mqtt,--disable-mqtt,"
+PACKAGECONFIG[negotiate-auth] =3D "--enable-negotiate-auth,--disable-neg=
otiate-auth"
 PACKAGECONFIG[nghttp2] =3D "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pop3] =3D "--enable-pop3,--disable-pop3,"
@@ -56,7 +62,6 @@ PACKAGECONFIG[rtmpdump] =3D "--with-librtmp,--without-l=
ibrtmp,rtmpdump"
 PACKAGECONFIG[rtsp] =3D "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] =3D "--enable-smb,--disable-smb,"
 PACKAGECONFIG[smtp] =3D "--enable-smtp,--disable-smtp,"
-PACKAGECONFIG[nss] =3D "--with-nss,--without-nss,nss"
 PACKAGECONFIG[telnet] =3D "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] =3D "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded-resolver,--disab=
le-threaded-resolver,,,,ares"
@@ -67,11 +72,10 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,z=
std"
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
-    --enable-crypto-auth \
     --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
-    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls nss openssl', d) =3D=3D '') else ''} \
+    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls openssl', d) =3D=3D '') else ''} \
 "
=20
 do_install:append:class-target() {
--=20
2.41.0


