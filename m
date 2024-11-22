Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8482AD75E27
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:07:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21887.1732273637942896070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7814212FC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:07:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A51F3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:07:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: handle llvm-objcopy behaviour when reading .note.dlopen section
Date: Fri, 22 Nov 2024 11:07:13 +0000
Message-Id: <20241122110713.637176-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207600

There are two behavioural differences between the objcopy in binutils
and llvm which resulted in build failures when building systemd with
clang:

1) If the section specified in --dump-section doesn't exist, binutils
set an exit code of 0 whereas llvm sets 1.  This means we need to handle
the exit code so that we raise exceptions on unexpected failures, but
return an empty byte string if the segment isn't found.

2) binutils writes the section to the file name directly, whereas llvm
writes to a temporary file and renames.  This means we can't read the
open fd directly, and instead need to re-open the file to read it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
index eaf6ca1f79a..e0b333398c2 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -12,9 +12,17 @@ python package_generate_dlopen_deps() {
         import tempfile, subprocess
=20
         with tempfile.NamedTemporaryFile() as f:
-            cmd =3D [d.getVar("OBJCOPY"), "--dump-section", f"{segment}=3D=
{f.name}", filename]
-            subprocess.run(cmd, check=3DTrue)
-            return f.read()
+            try:
+                cmd =3D [d.getVar("OBJCOPY"), "--dump-section", f"{segme=
nt}=3D{f.name}", filename]
+                subprocess.run(cmd, check=3DTrue)
+                with open(f.name, "rb") as f2:
+                    return f2.read()
+            except subprocess.CalledProcessError as e:
+                # binutils-objcopy has 0 exit code if the segment can't =
be found, but llvm-objcopy
+                # does not. Assume the failure isn't critical and ignore=
 errors.
+                if e.returncode =3D=3D 1:
+                    return b""
+                raise e
=20
     def parse(buffer, is_little):
         deps =3D []
--=20
2.34.1


