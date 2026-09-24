Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24613C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:57:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1757.1790265453974712009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hrlu2XHF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C3B1E5E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12AD23F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265453; bh=1ENF1BSai5ceLiQFgsY1I0TgLJO22KCrEbkcnWepRXU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hrlu2XHFboWkFtnH9H5x5b1se62VUTP8Cq7gc955+zSmIp/E2itVm9fEROkNqPrOq
	 Wz/ICE2e021Op9xeJGlFFcYYkcAxrDvHRW0FEMWYGG3q84uHuSnFAcAYkdcOCd98x0
	 VG5peVEA7YOKrPNwDYUItGrDOBTPgNVnueSoPxCo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] elfutils: fix handling of DWARF5 compilation units
Date: Thu, 24 Sep 2026 16:57:26 +0100
Message-ID: <20260924155728.295458-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924155728.295458-1-ross.burton@arm.com>
References: <20260924155728.295458-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 15:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246591

If a source file doesn't contain any functions or variable  then it
won't appear in the source file list for the generated object if the
debug information is DWARF5.  Details of why this is are in the patch
header.

Backport a patch from upstream to fix this oversight, adding files to
the -src packages that were previously missing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../elfutils/elfutils_0.196.bb                |  1 +
 .../elfutils/files/srcfiles.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.196.bb
index c2466134cdc..4541000840b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/=
${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standar=
d-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for=
-s.patch \
+           file://srcfiles.patch \
            "
 SRC_URI:append:libc-musl =3D " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/srcfiles.patch b/meta/r=
ecipes-devtools/elfutils/files/srcfiles.patch
new file mode 100644
index 00000000000..abd0226b0fd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/srcfiles.patch
@@ -0,0 +1,65 @@
+From: Mark Wielaard <mark@klomp.org>
+To: elfutils-devel@sourceware.org
+Cc: ross@burtonini.com, Mark Wielaard <mark@klomp.org>
+Subject: [PATCH] srcfiles: Always process the "zero" file table entry (C=
U comp_dir/name)
+Date: Tue, 22 Sep 2026 13:46:06 +0200
+Message-ID: <20260922114606.2865660-1-mark@klomp.org>
+X-Mailer: git-send-email 2.55.0
+MIME-Version: 1.0
+Content-Transfer-Encoding: 8bit
+X-Spam-Flag: NO
+X-Spam-Status: No, score=3D-2.9 required=3D5.0 tests=3DALL_TRUSTED,BAYES=
_00 autolearn=3Dham autolearn_force=3Dno version=3D3.4.0
+X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebees=
t.org
+
+If the main CU file doesn't contain any references to the file table
+it wouldn't show up in the src files list (except if --cu-only was
+given). This is because file entry "zero" is special. It cannot be
+referred to by DW_AT file attributes (because zero means, no
+file). But technically it should be equal to (implicitly before
+DWARF5) the DW_AT_name of the main CU DIE (using a zero directory
+entry, equal to DW_AT_comp_dir). collect_sourcefiles skipped this
+implicit zero entry unless --cu-only was given.
+
+Fix this by always handling the zero file table entry. And for
+--cu-only to just exit the loop early, so no other entries are handled
+This is also an optimization, before --cu-only would go through all
+indexes, but always added the CU name. Which worked, because
+duplicates were removed, but was somewhat inefficient.
+
+	   * src/srcfiles.cxx (collect_sourcefiles): Go from index
+	   zero, exit after zero index for CU_only, always handle
+	   index zero specially.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=3D34666
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [7b675cbdb0d1f216938b4b33aea30fd35fb1ae0a]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/srcfiles.cxx | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
+index 9bbb6ef10473..e2fc0f128d71 100644
+--- a/src/srcfiles.cxx
++++ b/src/srcfiles.cxx
+@@ -273,10 +273,14 @@ collect_sourcefiles (Dwfl_Module *dwflmod,
+             clog << "skipping cu=3D" << cuname << " due to empty comp_d=
ir" << endl;
+           continue;
+         }
+-      for (size_t f =3D 1; f < nfiles; ++f)
++      for (size_t f =3D 0; f < nfiles; ++f)
+         {
++	  /* For --cu-only we are only interested in the "zero" entry.  */
++	  if (CU_only && f !=3D 0)
++	    break;
++
+           const char *hat;
+-          if (CU_only)
++          if (f =3D=3D 0)
+           {
+             if (strcmp(cuname, "<unknown>") =3D=3D 0 || strcmp(cuname, =
"<artificial>") =3D=3D 0 )
+               continue;
+--=20
+2.55.0
--=20
2.43.0


