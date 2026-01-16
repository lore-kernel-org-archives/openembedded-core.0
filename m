Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910FCC982E9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:05:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3641.1768586737034250562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 10:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5B561682
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:05:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 205BC3F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:05:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] fontconfig: backport a patch to fix a build race
Date: Fri, 16 Jan 2026 18:05:01 +0000
Message-ID: <20260116180501.1548304-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116180501.1548304-1-ross.burton@arm.com>
References: <20260116180501.1548304-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 18:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229555

There's a build race where some objects don't explicitly depend on the
generated header ftalias.h being created:

  In file included from ../sources/fontconfig-2.17.1/src/fcpat.c:23:
  ../sources/fontconfig-2.17.1/src/fcint.h:129:12: fatal error: fcalias.h=
: No such file or directory
    129 | #  include "fcalias.h"

Backport a patch from upstream to add the missing dependencies.

[ YOCTO #16134 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ded-missing-target-rule-dependencies.patch | 31 +++++++++++++++++++
 .../fontconfig/fontconfig_2.17.1.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-buil=
d-Added-missing-target-rule-dependencies.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added=
-missing-target-rule-dependencies.patch b/meta/recipes-graphics/fontconfi=
g/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
new file mode 100644
index 0000000000..40b25cc926
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missin=
g-target-rule-dependencies.patch
@@ -0,0 +1,31 @@
+From 0bba79bfd3d8a216794d15af97ce4abefd4b8748 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Florian=3D20=3D22sp1rit=3D22=3DE2=3D80=3D8B?=3D <sp1ri=
t@disroot.org>
+Date: Sat, 9 Aug 2025 20:22:43 +0200
+Subject: [PATCH] build: Added missing target rule-dependencies
+
+02b835b62 did not appropriately ensure, that the patternlib_internal
+target waits until the {ft_,}alias_headers have finished generating the
+headers that it depends on.
+
+Upstream-Status: Backport [0bba79bfd3d8a216794d15af97ce4abefd4b8748]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index c4d65d6c..10866aa8 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -9,7 +9,7 @@ endif
+ # Factor our pattern manipulation code into its own library
+ # to break the depedency cycle:
+ # FontConfig pattern handling - Fontations code - FontConfig.
+-pattern_sources =3D [ 'fcpat.c', fcstdint_h, fclang_h ]
++pattern_sources =3D [ 'fcpat.c', fcstdint_h, fclang_h, alias_headers, f=
t_alias_headers ]
+ pattern_lib =3D static_library('patternlib_internal',
+                                     pattern_sources,
+                                     include_directories: incbase,
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index eca12400db..0d0fcfcceb 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -23,6 +23,7 @@ DEPENDS =3D "expat freetype zlib gperf-native util-linu=
x"
 SRC_URI =3D "https://gitlab.freedesktop.org/api/v4/projects/890/packages=
/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            file://musl-fix.patch \
+           file://0001-build-Added-missing-target-rule-dependencies.patc=
h \
            "
 SRC_URI[sha256sum] =3D "9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc051=
2827025c026fa541"
=20
--=20
2.43.0


