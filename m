Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10759C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 07:51:59 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web12.4046.1648540317188165028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 00:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=Qt60eFcd;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151,
 mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4KSMGK2YJ7z9sWL
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 09:51:53 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1648540311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZVv/tsVPQCdmDWCgrI6oPzYSAx2aufrjQYf+AxRaLXM=;
	b=Qt60eFcdwP1De9UF8foXj5FYmUieADsWutresX6IjLfTSegkM9CP+OZZ+fgabKuUR68pA1
	ERpkf8Rhgvpf0uzJ2lexvIeCXZw8YyMfjevaWw3aKM+EKLmMxVSaHKiBWn0PlNlIBTamwQ
	dxPXDg2up+r6aHtEi2WTdO26Dx5fUm66UIomljtNTK1floiPJfo66qPchveLEVjHUxRZKG
	U8/GLqbXD9Q7T8uuOfOPIOMWdmcRprWQnB+L1R8AfdP2EeEa8HEpxn+B3PeL4GeJamktDC
	fCRcXtwAsnByQSYO6iD+ks88WGVv+eEkRe9LCpI3yT4u69LOzOYLGZ/sluIeMA==
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Disable libunwind dependency in native builds
Date: Tue, 29 Mar 2022 09:51:01 +0200
Message-Id: <20220329075101.3085897-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 07:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163739

libunwind-native currently cannot be added to the class-native DEPENDS
due to the following problem:

https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/st=
eps/12/logs/stdio

And without libunwind-native, libsdl2-native config fails errors like:

| -- Checking for one of the modules 'libunwind'
| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-=
r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake=
:890 (message):
|   None of the required 'libunwind' found
| Call Stack (most recent call first):
|   CMakeLists.txt:1367 (pkg_search_module)

Ideally, the libunwind issue would be fixed, and then this could be added
to the libsdl2 recipe:

DEPENDS:append:class-native =3D " libunwind-native"

However, the libunwind problem is not trivial to fix, and requires a
specific setup to reproduce. As an alternative workaround, turn off
libunwind support in the native SDL2 build by disabling the unwind.h
check in the CMake script (this subsequently turns off all the other
libunwind checks). The main user of libsdl2-native is qemu-native, which
does not need libunwind support in SDL2.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...d-in-native-OE-builds-by-not-looking.patch | 38 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-li=
bunwind-in-native-OE-builds-by-not-looking.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind=
-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2=
/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
new file mode 100644
index 0000000000..214664f621
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-nat=
ive-OE-builds-by-not-looking.patch
@@ -0,0 +1,38 @@
+From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Fri, 18 Mar 2022 12:06:23 +0100
+Subject: [PATCH] Disable libunwind in native OE builds by not looking fo=
r
+ libunwind
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
+By not looking for the libunwind header, the rest of the libunwind
+specific bits in the CMake build script are disabled.
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 64f9fbf..12a4d8f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -862,7 +862,7 @@ if(SDL_LIBC)
+     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
+     foreach(_HEADER
+             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string=
.h limits.h float.h
+-            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.=
h signal.h libunwind.h)
++            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.=
h signal.h)
+       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
+       string(REPLACE "." "_" _HAVE_H ${_UPPER})
+       check_include_file("${_HEADER}" ${_HAVE_H})
+--=20
+2.32.0
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
index 58bc94cc86..4ba22c1fe6 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.t=
ar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cm=
ake.patch \
            "
+SRC_URI:append:class-native =3D " file://0001-Disable-libunwind-in-nativ=
e-OE-builds-by-not-looking.patch"
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
--=20
2.32.0


