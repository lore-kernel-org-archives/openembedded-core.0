Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA1ACEFC42
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4654.1728415873164008535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67090DA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F5113F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] insane: only parse ELFs if they're files, not symlinks
Date: Tue,  8 Oct 2024 20:30:58 +0100
Message-Id: <20241008193103.2429829-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205305

This reduces the number of files that need to be swept by not scanning
eg the library symlinks, and means we can remove the explicit islink()
checks in many of the tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 1691d96b64a..7f01908e18e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -122,9 +122,6 @@ def package_qa_check_rpath(file,name, d, elf):
     if not elf:
         return
=20
-    if os.path.islink(file):
-        return
-
     bad_dirs =3D [d.getVar('BASE_WORKDIR'), d.getVar('STAGING_DIR_TARGET=
')]
=20
     phdrs =3D elf.run_objdump("-p", d)
@@ -150,9 +147,6 @@ def package_qa_check_useless_rpaths(file, name, d, el=
f):
     if not elf:
         return
=20
-    if os.path.islink(file):
-        return
-
     libdir =3D d.getVar("libdir")
     base_libdir =3D d.getVar("base_libdir")
=20
@@ -337,11 +331,6 @@ def package_qa_check_arch(path,name,d, elf):
         oe.qa.handle_error("arch", pn + ": Recipe inherits the allarch c=
lass, but has packaged architecture-specific binaries", d)
         return
=20
-    # avoid following links to /usr/bin (e.g. on udev builds)
-    # we will check the files pointed to anyway...
-    if os.path.islink(path):
-        return
-
     #if this will throw an exception, then fix the dict above
     (machine, osabi, abiversion, littleendian, bits) \
         =3D oe.elf.machine_dict(d)[host_os][host_arch]
@@ -383,9 +372,6 @@ def package_qa_textrel(path, name, d, elf):
     if not elf:
         return
=20
-    if os.path.islink(path):
-        return
-
     phdrs =3D elf.run_objdump("-p", d)
=20
     import re
@@ -405,9 +391,6 @@ def package_qa_hash_style(path, name, d, elf):
     if not elf:
         return
=20
-    if os.path.islink(path):
-        return
-
     gnu_hash =3D "--hash-style=3Dgnu" in d.getVar('LDFLAGS')
     if not gnu_hash:
         gnu_hash =3D "--hash-style=3Dboth" in d.getVar('LDFLAGS')
@@ -601,7 +584,7 @@ def check_32bit_symbols(path, packagename, d, elf):
     )
=20
     # elf is a oe.qa.ELFFile object
-    if elf is not None:
+    if elf:
         phdrs =3D elf.run_objdump("-tw", d)
         syms =3D re.finditer(ptrn, phdrs)
         usedapis =3D {sym.group('notag') for sym in syms}
@@ -789,7 +772,7 @@ def package_qa_walk(checkfuncs, package, d):
     elves =3D {}
     for path in pkgfiles[package]:
             elf =3D None
-            if os.path.isfile(path):
+            if os.path.isfile(path) and not os.path.islink(path):
                 elf =3D oe.qa.ELFFile(path)
                 try:
                     elf.open()
--=20
2.34.1


