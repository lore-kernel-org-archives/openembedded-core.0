Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C482CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 13:06:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16532.1779455185882321022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 06:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XI0j6NR9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D30626BC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 06:06:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C70E13F7B4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779455185; bh=8q+HINr31IdEen6MX7HalrTjWgYrA4NBMGGRyWN3YYY=;
	h=From:To:Subject:Date:From;
	b=XI0j6NR9XsOK7jFJHesT7QcnJvYKrTUj0/XTcqUK/glnvw78tkcY4sWZVH/Fv8vFI
	 cpvmbLVyeNjOowzL8GnuWbIeRqDyMzaeQANJdbZky9BAlQhhV4XfDNTjuY0wxFfdgh
	 9mMJwo0PFdZeJGaKDfKGuJLrbF97/RKB4dDeibYM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: fix mbedtls detection
Date: Fri, 22 May 2026 14:06:20 +0100
Message-ID: <20260522130620.3973656-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 13:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237547

The mbedtls detection logic in curl is broken and resulted in build
paths leaking into curl-config and libcurl.pc.  Fix the detection by
looking for a symbol that wasn't removed in mbedtls 3.0 five years ago,
and remove the explicit sysroot reference as it is no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/mbedtls.patch | 11 +++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb     |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/mbedtls.patch

diff --git a/meta/recipes-support/curl/curl/mbedtls.patch b/meta/recipes-=
support/curl/curl/mbedtls.patch
new file mode 100644
index 0000000000..fb69d304d0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/mbedtls.patch
@@ -0,0 +1,11 @@
+Fix the mbedtls detection, mbedtls_havege_init was removed
+from mbedtls in the 3.0.0 release.
+
+Upstream-Status: Submitted [https://github.com/curl/curl/issues/21727]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+--- a/m4/curl-mbedtls.m4	2026-05-22 13:09:00.344591549 +0100
++++ b/m4/curl-mbedtls.m4	2026-05-22 13:40:17.869454414 +0100
+@@ -45 +45 @@
+-      AC_CHECK_LIB(mbedtls, mbedtls_havege_init,
++      AC_CHECK_LIB(mbedtls, mbedtls_ssl_init,
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


