Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995BFC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 08:08:20 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web09.24193.1646640499172815843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 00:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=G7QoNhlk;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171,
 mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4KBrgM4nFnz9sSL
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:08:15 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1646640493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HN8Qj2/REFHoEu/3tbTs2cqCPQtvhATbUh6zXFhu3fA=;
	b=G7QoNhlkBBdivPUXrclSGdufGWIuumAyJ/57urw/kjiB06TM8svyiz58kpxcgkPnsrrtdp
	818+pmT9npUO/qLFQ0qNlt24pEZHuIu88tTAwQ8Lu1kiUEyyDab9MNFOMBaOEhTiniNqit
	CjloCvIczXX+xPqPvnqYwh/Z5a56OPTUl3WWsiq7bLx88wjt786K+s25Bs8/6WjBxRaBSR
	lnTx+bWVntJuEwR0zhJeOPFY/fvCn+bickj5e9DK6hdMM2gHdtmcy2PjLKM74B3QMtxyPA
	/2ituAwegQeW2C3dzpzD0V/70j9kQCoGulW/91DxBcrLS3vQ5hXbTGe1S3OMnA==
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Make libunwind dependency optional for native builds
Date: Mon,  7 Mar 2022 09:07:50 +0100
Message-Id: <20220307080750.489418-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 08:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162798

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ependency-optional-for-native-libsdl.patch | 37 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libun=
wind-dependency-optional-for-native-libsdl.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-de=
pendency-optional-for-native-libsdl.patch b/meta/recipes-graphics/libsdl2=
/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
new file mode 100644
index 0000000000..00f3486194
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependenc=
y-optional-for-native-libsdl.patch
@@ -0,0 +1,37 @@
+From 78078bcf00f0ad13d93b1dc525ee0a666c30f246 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Mon, 7 Mar 2022 05:09:08 +0100
+Subject: [PATCH] Make libunwind dependency optional for native libsdl2 O=
E
+ build
+
+This is a workaround for this build error:
+
+| -- Checking for one of the modules 'libunwind'
+| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20=
-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmak=
e:890 (message):
+|   None of the required 'libunwind' found
+| Call Stack (most recent call first):
+|   CMakeLists.txt:1367 (pkg_search_module)
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 64f9fbf..eda3112 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1364,7 +1364,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROID AND NOT =
RISCOS AND NOT HAIKU)
+=20
+       if(HAVE_LIBUNWIND_H)
+         # We've already found the header, so REQUIRE the lib to be pres=
ent
+-        pkg_search_module(UNWIND REQUIRED libunwind)
++        pkg_search_module(UNWIND libunwind)
+         pkg_search_module(UNWIND_GENERIC libunwind-generic)
+         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIB=
RARIES})
+       endif()
+--=20
+2.32.0
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
index 90724ab8b7..d8211165d4 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.t=
ar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cm=
ake.patch \
            "
+SRC_URI:append:class-native =3D " file://0001-Make-libunwind-dependency-=
optional-for-native-libsdl.patch "
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
--=20
2.32.0


