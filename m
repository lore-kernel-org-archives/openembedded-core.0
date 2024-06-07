Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A806BC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:51:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39021.1717757474458132219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73EE92F4
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:51:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B38773F762
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:51:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: show cleaned build paths in more tests
Date: Fri,  7 Jun 2024 10:51:12 +0000
Message-Id: <20240607105112.3188264-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200436

A few tests were still manually cleaning their build paths, change them
to use package_qa_clean_path().

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index bd05da0378e..345196eeb3f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -459,8 +459,8 @@ def package_qa_check_buildpaths(path, name, d, elf, m=
essages):
     with open(path, 'rb') as f:
         file_content =3D f.read()
         if tmpdir in file_content:
-            trimmed =3D path.replace(os.path.join (d.getVar("PKGDEST"), =
name), "")
-            oe.qa.add_message(messages, "buildpaths", "File %s in packag=
e %s contains reference to TMPDIR" % (trimmed, name))
+            path =3D package_qa_clean_path(path, d, name)
+            oe.qa.add_message(messages, "buildpaths", "File %s in packag=
e %s contains reference to TMPDIR" % (path, name))
=20
=20
 QAPATHTEST[xorg-driver-abi] =3D "package_qa_check_xorg_driver_abi"
@@ -489,7 +489,7 @@ def package_qa_check_infodir(path, name, d, elf, mess=
ages):
     infodir =3D d.expand("${infodir}/dir")
=20
     if infodir in path:
-        oe.qa.add_message(messages, "infodir", "The /usr/share/info/dir =
file is not meant to be shipped in a particular package.")
+        oe.qa.add_message(messages, "infodir", "The %s file is not meant=
 to be shipped in a particular package." % infodir)
=20
 QAPATHTEST[symlink-to-sysroot] =3D "package_qa_check_symlink_to_sysroot"
 def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
@@ -501,8 +501,8 @@ def package_qa_check_symlink_to_sysroot(path, name, d=
, elf, messages):
         if os.path.isabs(target):
             tmpdir =3D d.getVar('TMPDIR')
             if target.startswith(tmpdir):
-                trimmed =3D path.replace(os.path.join (d.getVar("PKGDEST=
"), name), "")
-                oe.qa.add_message(messages, "symlink-to-sysroot", "Symli=
nk %s in %s points to TMPDIR" % (trimmed, name))
+                path =3D package_qa_clean_path(path, d, name)
+                oe.qa.add_message(messages, "symlink-to-sysroot", "Symli=
nk %s in %s points to TMPDIR" % (path, name))
=20
 QAPATHTEST[32bit-time] =3D "check_32bit_symbols"
 def check_32bit_symbols(path, packagename, d, elf, messages):
--=20
2.34.1


