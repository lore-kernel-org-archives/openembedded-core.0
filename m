Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13023.1599137005282085994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DB13D6E
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 05:43:24 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E395F3F66F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 05:43:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: only load real files as ELF
Date: Thu,  3 Sep 2020 13:43:19 +0100
Message-Id: <20200903124319.489104-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The file path checks are passed an ELF object if the file is an ELF. It
doesn't make a lot of sense to load symlinks to ELFs as if they're in
the same package then the real file will be checked too.

This should speed up do_package_qa slightly as libraries won't be
scanned repeatedly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d7f8f919c3..c38720afdb 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -709,12 +709,13 @@ def package_qa_walk(warnfuncs, errorfuncs, package,=
 d):
     warnings =3D {}
     errors =3D {}
     for path in pkgfiles[package]:
-            elf =3D oe.qa.ELFFile(path)
-            try:
-                elf.open()
-            except (IOError, oe.qa.NotELFFileError):
-                # IOError can happen if the packaging control files disa=
ppear,
-                elf =3D None
+            elf =3D None
+            if os.path.isfile(path):
+                elf =3D oe.qa.ELFFile(path)
+                try:
+                    elf.open()
+                except oe.qa.NotELFFileError:
+                    elf =3D None
             for func in warnfuncs:
                 func(path, package, d, elf, warnings)
             for func in errorfuncs:
--=20
2.28.0

