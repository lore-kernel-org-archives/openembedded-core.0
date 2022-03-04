Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A715C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 07:55:19 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web09.4775.1646380517013091206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 23:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=GDwTa/by;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4K90Wj6qbgz9sQm
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 08:55:13 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1646380513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OnbJGdfWc4boF5E9q5qR0UHAZYPqlOvpa6SODw8trto=;
	b=GDwTa/byoGuRqrPF+ybcuR4/sc9aWsIFWhLeUDzKofPVCoYCmYswI/ZzfQLPVyyxODXBQB
	Oqz29FdUBeVov+3tL1iHACIsod/moFdRFRH15DsiNDK18/r0PCna22cxQIlEw3zAnMZFMw
	jmx+eu9mrgJwoxauAfUYyFlcHSZQ0CfT5fuiB7q55QkaFfHbyKaECcweuBrPx2XrMI3xdz
	mbiXAajk0w753LeD0ReG5arOqgnGIP8Gbrs9JzPLL54SJOs009otaLP1IMY0RVGp8uGmN2
	mXkonkWtl3Qi1mm+zAIo2a67RcnKWJQ9LPXj92yHFC0Kp5yYQDb8FNyQ/iTvZQ==
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Add libunwind-native to the libsdl2-native DEPENDS
Date: Fri,  4 Mar 2022 08:55:07 +0100
Message-Id: <20220304075507.369779-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 07:55:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162710

This fixes this CMake configuration error:

| -- Checking for one of the modules 'libunwind'
| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-=
r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake=
:890 (message):
|   None of the required 'libunwind' found
| Call Stack (most recent call first):
|   CMakeLists.txt:1367 (pkg_search_module)

This error happens even if libunwind is installed complete with its C
headers and development .so files (in Ubuntu, this means libunwind-dev
is installed).

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
index 90724ab8b7..802efba980 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] =3D "c56aba1d7b5b0e7e999e4a7698c70b6=
3a3394ff9704b5f6e1c57e0c16f
=20
 inherit cmake lib_package binconfig-disabled pkgconfig
=20
+DEPENDS:class-native +=3D "libunwind-native"
+
 BINCONFIG =3D "${bindir}/sdl2-config"
=20
 CVE_PRODUCT =3D "simple_directmedia_layer sdl"
--=20
2.32.0


