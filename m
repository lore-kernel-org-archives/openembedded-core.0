Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B39C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:24:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13329.1685982257530794110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2B90C14;
	Mon,  5 Jun 2023 09:25:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B29AD3F663;
	Mon,  5 Jun 2023 09:24:16 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] binutils: fix CVE-2023-1972
Date: Mon,  5 Jun 2023 17:24:13 +0100
Message-Id: <20230605162413.3012323-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182393

From: Ross Burton <ross.burton@arm.com>

Backport a patch from upstream to fix CVE-2023-1972.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 ...emory-access-when-an-accessing-a-zer.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an-i=
llegal-memory-access-when-an-accessing-a-zer.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/reci=
pes-devtools/binutils/binutils-2.40.inc
index 84dbf5f7301..dea68ee6fc2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -35,5 +35,6 @@ SRC_URI =3D "\
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
      file://0016-CVE-2023-25586.patch \
      file://fix-time64.patch \
+     file://0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.pa=
tch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-=
memory-access-when-an-accessing-a-zer.patch b/meta/recipes-devtools/binut=
ils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.pa=
tch
new file mode 100644
index 00000000000..31157cacd2f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-=
access-when-an-accessing-a-zer.patch
@@ -0,0 +1,43 @@
+From c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 30 Mar 2023 10:10:09 +0100
+Subject: [PATCH] Fix an illegal memory access when an accessing a
+ zer0-lengthverdef table.
+
+  PR 30285
+  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definition=
s are allocated.
+
+CVE: CVE-2023-1972
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/elf.c     | 5 +++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 027d0143735..185028cbd97 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool def=
ault_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return_verdef;
+ 	}
++
++      if (amt =3D=3D 0)
++	goto error_return_verdef;
+       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc (=
abfd, amt);
+       if (elf_tdata (abfd)->verdef =3D=3D NULL)
+ 	goto error_return_verdef;
+@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool def=
ault_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return;
+ 	}
++      if (amt =3D=3D 0)
++	goto error_return;
+       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc (=
abfd, amt);
+       if (elf_tdata (abfd)->verdef =3D=3D NULL)
+ 	goto error_return;
+--=20
+2.34.1
+
--=20
2.34.1


