Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21641.1793114983849056962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 08:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=I4KvsBBY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3E815A1;
	Tue, 27 Oct 2026 08:29:39 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A5793F59E;
	Tue, 27 Oct 2026 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793114983; bh=//z7+4CHU9ykrf9I62Z3qvk2qvSJu2Gn77uv7bOUh9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=I4KvsBBY3/MfblVfUTTZLZQ5pNJEkUkVvPSK78T9utTM2CesNbNmIpN344qqfNw2n
	 y8OHlj82/yW677CjkVr7agk1SBCGKyRsMjnELZnuxxpOAk0Jr9m6K3rUdBJXS5WbxZ
	 49/3SfkXRZzd6JYZE4MyjM6uloxscZ+DobUOmJZw=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH] systemd: Improve detection of executables and libraries
Date: Tue, 27 Oct 2026 15:29:30 +0000
Message-ID: <20261027152930.1387813-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248753
Content-Type: text/plain; charset="utf-8"

Use cached mode bits to detect executables independently of
host access permissions. Match shared-library basenames with
a regex to avoid matching directory names.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
index 37074a9682..4ce9845ad8 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -3,7 +3,7 @@ PACKAGEFUNCS =3D+ "package_generate_dlopen_deps"
 python package_generate_dlopen_deps() {
     # https://systemd.io/ELF_DLOPEN_METADATA/
=20
-    import os, struct, json
+    import os, struct, json, re
=20
     def extract_segment(filename, segment):
         """
@@ -49,6 +49,7 @@ python package_generate_dlopen_deps() {
     }
=20
     shlibs =3D oe.package.read_shlib_providers(d)
+    shlib_pattern =3D re.compile(r"\.so(\.|$)")
=20
     for pkg, files in pkgfiles.items():
         # Skip -dbg packages as we won't need to generate dependencies f=
or those
@@ -61,7 +62,8 @@ python package_generate_dlopen_deps() {
             if cpath.islink(f):
                 continue
=20
-            if os.access(f, os.X_OK) or ".so." in f or f.endswith(".so")=
:
+            # Scan shared libraries and executable files for dlopen note=
s.
+            if shlib_pattern.search(os.path.basename(f)) or cpath.is_exe=
cutable(f):
                 try:
                     elf =3D oe.qa.ELFFile(f)
                     elf.open()
