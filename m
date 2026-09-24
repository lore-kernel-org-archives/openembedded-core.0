Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C537EC98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:57:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1731.1790265454512144601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SDKsF5uv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0211B1E5E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31D853F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265454; bh=ljYwY0tCdMoVANkUU4dWzaIxQzmGEKASnyB+Ncg0+Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SDKsF5uvFZDrQtu7W8CoG/V643sfWqSoLSeXFgcFMGLsAIDDBmgPs+V68aXRwIfCI
	 agjVOL8wIYtLXcUy3rIjsR62qrz+yoEOJlJeVy/cLXquOqv9csj8p/CZor6gtToej7
	 8g6eA9zikQik+bUYFe9IbMKgmvBwh65AqZ3zD8UQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] dwarfsrcfiles: remove
Date: Thu, 24 Sep 2026 16:57:28 +0100
Message-ID: <20260924155728.295458-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924155728.295458-1-ross.burton@arm.com>
References: <20260924155728.295458-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 15:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246593

We now use srcfiles from elfutils, so we can delete this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../dwarfsrcfiles/dwarfsrcfiles.bb            |  25 ----
 .../dwarfsrcfiles/files/dwarfsrcfiles.c       | 118 ------------------
 3 files changed, 144 deletions(-)
 delete mode 100644 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
 delete mode 100644 meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfil=
es.c

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 53f5e6bf92a..3b2342527c3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,7 +165,6 @@ RECIPE_MAINTAINER:pn-dosfstools =3D "Yi Zhao <yi.zhao=
@windriver.com>"
 RECIPE_MAINTAINER:pn-dpkg =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dropbear =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc =3D "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-dwarfsrcfiles =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-e2fsprogs =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-ed =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/=
recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
deleted file mode 100644
index c1eca13107b..00000000000
--- a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "A small utility for printing debug source file locations em=
bedded in binaries"
-DESCRIPTION =3D "${SUMMARY}"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://dwarfsrcfiles.c;md5=3D31483894e453a77acbb67=
847565f1b5c;beginline=3D1;endline=3D8"
-
-SRC_URI =3D "file://dwarfsrcfiles.c"
-BBCLASSEXTEND =3D "native"
-DEPENDS =3D "elfutils"
-DEPENDS:append:libc-musl =3D " argp-standalone"
-
-S =3D "${UNPACKDIR}"
-
-do_compile () {
-	${CC} ${CFLAGS} ${LDFLAGS} -o dwarfsrcfiles ${S}/dwarfsrcfiles.c -lelf =
-ldw
-}
-
-do_compile:libc-musl () {
-	${CC} ${CFLAGS} ${LDFLAGS} -o dwarfsrcfiles ${S}/dwarfsrcfiles.c -lelf =
-ldw -largp
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -t ${D}${bindir} dwarfsrcfiles
-}
-
diff --git a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c b/=
meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
deleted file mode 100644
index 9eb5ca807ad..00000000000
--- a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
+++ /dev/null
@@ -1,118 +0,0 @@
-// dwarfsrcfiles.c - Get source files associated with the dwarf in a elf=
 file.
-// gcc -Wall -g -O2 -lelf -ldw -o dwarfsrcfiles dwarfsrcfiles.c=20
-//
-// Copyright (C) 2011, Mark Wielaard <mjw@redhat.com>
-//
-// This file is free software.  You can redistribute it and/or modify
-// it under the terms of the GNU General Public License (GPL); either
-// version 2, or (at your option) any later version.
-
-#include <argp.h>
-#include <stdio.h>
-#include <stdlib.h>
-
-#include <dwarf.h>
-#include <elfutils/libdw.h>
-#include <elfutils/libdwfl.h>
-
-static int
-process_cu (Dwarf_Die *cu_die)
-{
-  Dwarf_Attribute attr;
-  const char *name;
-  const char *dir =3D NULL;
- =20
-  Dwarf_Files *files;
-  size_t n;
-  int i;
- =20
-  if (dwarf_tag (cu_die) !=3D DW_TAG_compile_unit)
-    {
-      fprintf (stderr, "DIE isn't a compile unit");
-      return -1;
-    }
- =20
-  if (dwarf_attr (cu_die, DW_AT_name, &attr) =3D=3D NULL)
-    {
-      fprintf(stderr, "CU doesn't have a DW_AT_name");
-      return -1;
-    }
- =20
-  name =3D dwarf_formstring (&attr);
-  if (name =3D=3D NULL)
-    {
-      fprintf(stderr, "Couldn't get DW_AT_name as string, %s",
-	     dwarf_errmsg (-1));
-      return -1;
-    }
- =20
-  if (dwarf_attr (cu_die, DW_AT_comp_dir, &attr) !=3D NULL)
-    {
-      dir =3D dwarf_formstring (&attr);
-      if (dir =3D=3D NULL)
-	{
-	  fprintf(stderr, "Couldn't get DW_AT_comp_die as string, %s",
-		 dwarf_errmsg (-1));
-	  return -1;
-	}
-    }
- =20
-  if (dir =3D=3D NULL)
-    printf ("%s\n", name);
-  else
-    printf ("%s/%s\n", dir, name);
- =20
-  if (dwarf_getsrcfiles (cu_die, &files, &n) !=3D 0)
-    {
-      fprintf(stderr, "Couldn't get CU file table, %s",
-	     dwarf_errmsg (-1));
-      return -1;
-    }
- =20
-  for (i =3D 1; i < n; i++)
-    {
-      const char *file =3D dwarf_filesrc (files, i, NULL, NULL);
-      if (dir !=3D NULL && file[0] !=3D '/')
-	printf ("\t%s/%s\n", dir, file);
-      else
-	printf ("\t%s\n", file);
-    }
- =20
-  return 0;
-}
-
-int
-main (int argc, char **argv)
-{
-  char* args[5];
-  int res =3D 0;
-  Dwfl *dwfl;
-  Dwarf_Addr bias;
- =20
-  if (argc !=3D 2) {
-    fprintf(stderr, "Usage %s <file>", argv[0]);
-    exit(EXIT_FAILURE);
-  }
- =20
-  // Pretend "dwarfsrcfiles -e <file>" was given, so we can use standard
-  // dwfl argp parser to open the file for us and get our Dwfl. Useful
-  // in case argument is an ET_REL file (like kernel modules). libdwfl
-  // will fix up relocations for us.
-  args[0] =3D argv[0];
-  args[1] =3D "-e";
-  args[2] =3D argv[1];
-  // We don't want to follow debug linked files due to the way OE proces=
ses
-  // files, could race against changes in the linked binary (e.g. objcop=
y on it)
-  args[3] =3D "--debuginfo-path";
-  args[4] =3D "/not/exist";
- =20
-  argp_parse (dwfl_standard_argp (), 5, args, 0, NULL, &dwfl);
- =20
-  Dwarf_Die *cu =3D NULL;
-  while ((cu =3D dwfl_nextcu (dwfl, cu, &bias)) !=3D NULL)
-    res |=3D process_cu (cu);
- =20
-  dwfl_end (dwfl);
-
-  return res;
-}
--=20
2.43.0


