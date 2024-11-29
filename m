Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E006D729F1
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 17:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.119634.1732901893236993492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 09:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6408811FB
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 957E53F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] gnu-efi: upgrade to 4.0.0
Date: Fri, 29 Nov 2024 17:38:03 +0000
Message-Id: <20241129173803.3499627-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129173803.3499627-1-ross.burton@arm.com>
References: <20241129173803.3499627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208029

gnu-efi isn't making releases on SourceForge anymore, so switch to git
clones and track releases on GitHub.

License-Update: "Copright" typo fixed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...0002-Do-not-treat-warnings-as-errors.patch | 13 +++-------
 .../{gnu-efi_3.0.18.bb =3D> gnu-efi_4.0.0.bb}   | 26 ++++++++++---------
 2 files changed, 17 insertions(+), 22 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.18.bb =3D> gnu-efi_4.0.0.bb=
} (83%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-=
as-errors.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warn=
ings-as-errors.patch
index 37befc8b4c8..84966c484ea 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-erro=
rs.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-erro=
rs.patch
@@ -15,18 +15,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Make.defaults b/Make.defaults
-index 0068e31..b643285 100755
+index 1347aca..1834d1c 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -190,7 +190,7 @@ CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Werro=
r \
-            -funsigned-char -fshort-wchar -fno-strict-aliasing \
-            -ffreestanding -fno-stack-protector
+@@ -262,3 +262,3 @@ CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Werro=
r \
  else
 -CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign -Werror=
 \
 +CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \
-            -funsigned-char -fshort-wchar -fno-strict-aliasing \
- 	   -ffreestanding -fno-stack-protector -fno-stack-check \
-            $(if $(findstring gcc,$(CC)),-fno-merge-all-constants,)
---=20
-2.25.1
-
+            -fno-strict-aliasing \
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb b/meta/recipes-bs=
p/gnu-efi/gnu-efi_4.0.0.bb
similarity index 83%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
index db77f30aaf4..29d9e695a92 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
@@ -3,24 +3,26 @@ HOMEPAGE =3D "http://sourceforge.net/projects/gnu-efi/"
 DESCRIPTION =3D "GNU-EFI aims to Develop EFI applications for ARM-64, AR=
M-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU =
toolchain and the EFI development environment."
 SECTION =3D "devel"
 LICENSE =3D "GPL-2.0-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://gnuefi/crt0-efi-arm.S;beginline=3D4;endline=
=3D16;md5=3De582764a4776e60c95bf9ab617343d36 \
-                    file://gnuefi/crt0-efi-aarch64.S;beginline=3D4;endli=
ne=3D16;md5=3De582764a4776e60c95bf9ab617343d36 \
-                    file://inc/efishellintf.h;beginline=3D13;endline=3D2=
0;md5=3D202766b79d708eff3cc70fce15fb80c7 \
-                    file://lib/arm/math.c;beginline=3D2;endline=3D15;md5=
=3D8ed772501da77b2b3345aa6df8744c9e \
-                    file://lib/arm/initplat.c;beginline=3D2;endline=3D15=
;md5=3D8ed772501da77b2b3345aa6df8744c9e \
-                    file://lib/aarch64/math.c;beginline=3D2;endline=3D15=
;md5=3D8ed772501da77b2b3345aa6df8744c9e \
-                    file://lib/aarch64/initplat.c;beginline=3D2;endline=3D=
15;md5=3D8ed772501da77b2b3345aa6df8744c9e \
+LIC_FILES_CHKSUM =3D "file://gnuefi/crt0-efi-arm.S;beginline=3D4;endline=
=3D16;md5=3D8b0a86085b86eda7a3c7e8a1eb7ec753 \
+                    file://gnuefi/crt0-efi-aarch64.S;beginline=3D4;endli=
ne=3D16;md5=3D8b0a86085b86eda7a3c7e8a1eb7ec753 \
+                    file://inc/efishellintf.h;beginline=3D13;endline=3D2=
0;md5=3Dee14c1530c341a7050837adead6bc9a5 \
+                    file://lib/arm/math.c;beginline=3D2;endline=3D15;md5=
=3Dccb5c6b51053d1ee7277539ec38513d7 \
+                    file://lib/arm/initplat.c;beginline=3D2;endline=3D15=
;md5=3Dccb5c6b51053d1ee7277539ec38513d7 \
+                    file://lib/aarch64/math.c;beginline=3D2;endline=3D15=
;md5=3Dccb5c6b51053d1ee7277539ec38513d7 \
+                    file://lib/aarch64/initplat.c;beginline=3D2;endline=3D=
15;md5=3Dccb5c6b51053d1ee7277539ec38513d7 \
                    "
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
+COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
+COMPATIBLE_HOST:armv4 =3D 'null'
+
+SRC_URI =3D "git://github.com/ncroxon/gnu-efi;protocol=3Dhttps;branch=3D=
master \
            file://0002-Do-not-treat-warnings-as-errors.patch \
            "
-SRC_URI[sha256sum] =3D "7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8c=
cdefd33cf7413f5c"
+SRCREV =3D "5ea320f0f01c8de8f9dd4e4e38a245608f0287dd"
=20
-inherit sourceforge-releases
+S =3D "${WORKDIR}/git"
=20
-COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
-COMPATIBLE_HOST:armv4 =3D 'null'
+inherit github-releases
=20
 do_configure:linux-gnux32:prepend() {
 	cp ${STAGING_INCDIR}/gnu/stubs-x32.h ${STAGING_INCDIR}/gnu/stubs-64.h
--=20
2.34.1


