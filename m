Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC9ECEFC50
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4655.1728415875434379673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58A77DA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2045C3F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] insane: tidy up objdump preloading in package_qa_walk()
Date: Tue,  8 Oct 2024 20:31:00 +0100
Message-Id: <20241008193103.2429829-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205307

Move the prepopulate function out of global scope, and access the
dictionary once instead of repeatedly.

This still results in each ELF being opened twice, but this avoids
opening all of the files at once and the ELFFile.open() call is fairly
fast.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 401807b2be3..b165f111cec 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -763,10 +763,6 @@ def qa_check_staged(path,d):
             if not skip_shebang_size:
                 package_qa_check_shebang_size(path, "", d, None)
=20
-def prepopulate_objdump_p(elf, d):
-    output =3D elf.run_objdump("-p", d)
-    return (elf.name, output)
-
 # Walk over all files in a directory and call func
 def package_qa_walk(checkfuncs, package, d):
     elves =3D {}
@@ -782,17 +778,22 @@ def package_qa_walk(checkfuncs, package, d):
             if elf:
                 elves[path] =3D elf
=20
+    def prepopulate_objdump_p(elf, d):
+        output =3D elf.run_objdump("-p", d)
+        return (elf.name, output)
+
     results =3D oe.utils.multiprocess_launch(prepopulate_objdump_p, elve=
s.values(), d, extraargs=3D(d,))
     for item in results:
         elves[item[0]].set_objdump("-p", item[1])
=20
     for path in pkgfiles[package]:
-            if path in elves:
-                elves[path].open()
-            for func in checkfuncs:
-                func(path, package, d, elves.get(path))
-            if path in elves:
-                elves[path].close()
+        elf =3D elves.get(path)
+        if elf:
+            elf.open()
+        for func in checkfuncs:
+            func(path, package, d, elf)
+        if elf:
+            elf.close()
=20
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d)=
:
     # Don't do this check for kernel/module recipes, there aren't too ma=
ny debug/development
--=20
2.34.1


