Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA15C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:36:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56831.1786462585777839666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 08:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=eowZPChj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9371682;
	Tue, 11 Aug 2026 08:36:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BC1A3F632;
	Tue, 11 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786462585; bh=xSA59hfMNrMsQd97KI8YpVju4il3WM+gvW1yPTtM8QY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eowZPChjUMFDqTBzC0HW8FeXyofbgttBu57dVoFqofAG7TwgpM/rrRZuQkYIbrLZS
	 adw2rVZC+BHByiIiN2UnTdYRnflQ+csB5+4lJ5wpQzXUKX15n7zBjI3elaucPpm8uj
	 MFX7yvNXaAVRd2eBlLOa4/NZAm8LQXE89hn8G+00=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: twoerner@gmail.com
Subject: [PATCH 2/2] gptfdisk: remove recipe
Date: Tue, 11 Aug 2026 16:36:18 +0100
Message-ID: <20260811153619.2048639-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811153619.2048639-1-ross.burton@arm.com>
References: <20260811153619.2048639-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243214

There are no dependencies on this recipe in oe-core or meta-oe now, as
the standard fdisk command in util-linux has both a scriptable frontend
and supports GPT partition tables.

Also the last release was in 2024 and there's very little activity
upstream.

As such, remove the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...gptcurses-correctly-include-curses.h.patch | 27 --------------
 .../recipes-devtools/fdisk/gptfdisk_1.0.10.bb | 35 -------------------
 3 files changed, 63 deletions(-)
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-c=
orrectly-include-curses.h.patch
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index c5b701c2447..f30aa06e15d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -242,7 +242,6 @@ RECIPE_MAINTAINER:pn-go-runtime =3D "Khem Raj <raj.kh=
em@gmail.com>"
 RECIPE_MAINTAINER:pn-gobject-introspection =3D "Unassigned <unassigned@y=
octoproject.org>"
 RECIPE_MAINTAINER:pn-gperf =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-gpgme =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-gptfdisk =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-graphene =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-grep =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-groff =3D "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctl=
y-include-curses.h.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptc=
urses-correctly-include-curses.h.patch
deleted file mode 100644
index 011eec36f98..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-inclu=
de-curses.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 510d0d27f90dfb1c4afd0722580bb8a828b52b7f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 30 Mar 2020 17:11:19 +0200
-Subject: [PATCH] gptcurses: correctly include curses.h
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gptcurses.cc | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/gptcurses.cc b/gptcurses.cc
-index b476700..476fc43 100644
---- a/gptcurses.cc
-+++ b/gptcurses.cc
-@@ -23,11 +23,7 @@
- #include <iostream>
- #include <string>
- #include <sstream>
--#if defined (__APPLE__) || (__FreeBSD__)
- #include <ncurses.h>
--#else
--#include <ncursesw/ncurses.h>
--#endif
- #include "gptcurses.h"
- #include "support.h"
-=20
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb b/meta/recipe=
s-devtools/fdisk/gptfdisk_1.0.10.bb
deleted file mode 100644
index ba891931aca..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "Utility for modifying GPT disk partitioning"
-DESCRIPTION =3D "GPT fdisk is a disk partitioning tool loosely modeled o=
n Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. T=
he related FixParts utility fixes some common problems on Master Boot Rec=
ord (MBR) disks."
-HOMEPAGE =3D "https://sourceforge.net/projects/gptfdisk/"
-
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
-
-DEPENDS =3D "util-linux"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
-           file://0001-gptcurses-correctly-include-curses.h.patch \
-           "
-SRC_URI[sha256sum] =3D "2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5=
a9209b2ad693a282"
-
-UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/gptfdisk/files/g=
ptfdisk/"
-UPSTREAM_CHECK_REGEX =3D "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-
-EXTRA_OEMAKE =3D "'CC=3D${CC}' 'CXX=3D${CXX}' gdisk fixparts ${PACKAGECO=
NFIG_CONFARGS}"
-
-PACKAGECONFIG ??=3D "ncurses popt"
-PACKAGECONFIG[ncurses] =3D "cgdisk,,ncurses"
-PACKAGECONFIG[popt] =3D "sgdisk,,popt"
-
-do_install() {
-    install -d ${D}${sbindir}
-    for f in cgdisk sgdisk; do
-        if [ -x $f ]; then
-            install -m 0755 $f ${D}${sbindir}
-        fi
-    done
-    install -m 0755 gdisk ${D}${sbindir}
-    install -m 0755 fixparts ${D}${sbindir}
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


