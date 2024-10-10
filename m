Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E637CFC5E9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:06:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47523.1728576394204847748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4710E497
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 536853F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:06:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/11] insane: check for RUNPATH as well as RPATH
Date: Thu, 10 Oct 2024 17:06:18 +0100
Message-Id: <20241010160623.2880937-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010160623.2880937-1-ross.burton@arm.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205415

Since oe-core 66f8a7 merged in 2023[1], ld sets DT_RUNPATH instead of
DT_RPATH when -rpath is specified, which we don't check for.

Update the insane tests to look at both RPATH and RUNPATH.

[1] oe-core 66f8a745668a067d8d763fa2af3e65f26c9c1ebe

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 7f01908e18e..401807b2be3 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -115,7 +115,7 @@ def package_qa_check_libexec(path,name, d, elf):
         oe.qa.handle_error("libexec", "%s: %s is using libexec please re=
locate to %s" % (name, package_qa_clean_path(path, d, name), libexec), d)
=20
 QAPATHTEST[rpaths] =3D "package_qa_check_rpath"
-def package_qa_check_rpath(file,name, d, elf):
+def package_qa_check_rpath(file, name, d, elf):
     """
     Check for dangerous RPATHs
     """
@@ -127,14 +127,14 @@ def package_qa_check_rpath(file,name, d, elf):
     phdrs =3D elf.run_objdump("-p", d)
=20
     import re
-    rpath_re =3D re.compile(r"\s+RPATH\s+(.*)")
+    rpath_re =3D re.compile(r"\s+(?:RPATH|RUNPATH)\s+(.*)")
     for line in phdrs.split("\n"):
         m =3D rpath_re.match(line)
         if m:
             rpath =3D m.group(1)
             for dir in bad_dirs:
                 if dir in rpath:
-                    oe.qa.handle_error("rpaths", "package %s contains ba=
d RPATH %s in file %s" % (name, rpath, file), d)
+                    oe.qa.handle_error("rpaths", "%s: %s contains bad RP=
ATH %s" % (name, package_qa_clean_path(file, d, name), rpath), d)
=20
 QAPATHTEST[useless-rpaths] =3D "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf):
@@ -153,7 +153,7 @@ def package_qa_check_useless_rpaths(file, name, d, el=
f):
     phdrs =3D elf.run_objdump("-p", d)
=20
     import re
-    rpath_re =3D re.compile(r"\s+RPATH\s+(.*)")
+    rpath_re =3D re.compile(r"\s+(?:RPATH|RUNPATH)\s+(.*)")
     for line in phdrs.split("\n"):
         m =3D rpath_re.match(line)
         if m:
--=20
2.34.1


