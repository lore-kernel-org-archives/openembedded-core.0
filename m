Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924D5ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 18:59:29 +0000 (UTC)
Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by mx.groups.io with SMTP id smtpd.web09.1356.1666897166103081833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 11:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: baylibre.com, ip: 5.39.83.55, mailfrom: bero@baylibre.com)
Received: from c64.fritz.box (unknown [81.221.122.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bero@lindev.ch)
	by mail.lindev.ch (Postfix) with ESMTPSA id 7D05B410036A;
	Thu, 27 Oct 2022 20:59:23 +0200 (CEST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Subject: [kirkstone][PATCH 1/1] cmake-native: Fix host tool contamination (Bug: 14951)
Date: Thu, 27 Oct 2022 20:58:54 +0200
Message-Id: <20221027185853.2005941-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 18:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172199

Trying to build cmake-native on a host system where curl was built with c=
make
(resulting in CURLConfig.cmake and friends, which do not use the same nam=
ing
schemes expected by cmake-native's build process, being installed to a sy=
stem
wide cmake directory like /usr/lib64/cmake/CURL) results in undefined
references to all libcurl symbols.

The problem is that cmake-native sees and uses the system wide
/usr/lib64/cmake/CURL/CURLConfig.cmake, which defines CURL::libcurl and
CURL::curl as opposed to setting ${CURL_LIBRARIES} as expected by
cmake-native.

find_package(CURL) (cmake-native's CMakeLists.txt, line 478) succeeds, bu=
t
incorrectly uses the system wide CURLConfig.cmake, resulting
CMAKE_CURL_LIBRARIES to be set to an empty string (cmake-native's
CMakeLists.txt, line 484), causing the cmake-native build to miss -lcurl.

The simplest fix is to let cmake know the right value for
CURL_LIBRARIES. Making it -lcurl should always work with libcurl-native
in recipe-sysroot-native.

Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.22.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/re=
cipes-devtools/cmake/cmake-native_3.22.3.bb
index ee1f7761c4..45ea78ae00 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
@@ -32,6 +32,7 @@ CMAKE_EXTRACONF =3D "\
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=3D0 \
     -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
     -DHAVE_SYS_ACL_H=3D0 \
+    -DCURL_LIBRARIES=3D-lcurl \
 "
=20
 do_configure () {
--=20
2.38.1


