Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.29.1610114808181430496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1DFA113E
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CF953F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:47 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 6/7] makewrappers: support architecture-overrides in wrapper modifiers
Date: Fri,  8 Jan 2021 14:06:39 +0000
Message-Id: <20210108140640.1069133-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Pseudo allows wrappers to define special comments in the wrapper lists to
pass extra arguments such as version=3DGLIBC_2.3 to control which symbol
version to search for.  However, these arguments can be architecture-spec=
ific.

When parsing the arguments, check for flags that end in the architecture =
name
(as returned by platform.machine()) and use those values instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 makewrappers | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/makewrappers b/makewrappers
index e68f6a9..6681e11 100755
--- a/makewrappers
+++ b/makewrappers
@@ -11,6 +11,7 @@ import glob
 import sys
 import re
 import os.path
+import platform
 import string
 import subprocess
 from templatefile import TemplateFile
@@ -290,10 +291,18 @@ class Function:
=20
         # handle special comments, such as flags=3DAT_SYMLINK_NOFOLLOW
         if self.comments:
-            modifiers =3D self.comments.split(', ')
-            for mod in modifiers:
-                key, value =3D mod.split('=3D')
-                value =3D value.rstrip()
+            # Build a dictionary of key=3Dvalue, key=3Dvalue pairs
+            modifiers =3D dict(mod.split("=3D") for mod in self.comments=
.split(','))
+            # Strip all leading/trailing whitespace
+            modifiers =3D {k.strip():v.strip() for k, v in modifiers.ite=
ms()}
+
+            arch =3D "-" + platform.machine()
+            # Sorted so that versions-foo appear after versions, so over=
rides are easy
+            for key in sorted(modifiers):
+                value =3D modifiers[key]
+                # If the key is version-arm64 and we're on arm64 then re=
name this to version
+                if key.endswith(arch):
+                    key =3D key.replace(arch, "")
                 setattr(self, key, value)
    =20
     def maybe_inode64(self):
--=20
2.25.1

