Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A5D637A2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 17:23:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17082.1731518611019906675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 09:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 784B71480
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 09:24:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1EB6A3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 09:23:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] scripts/checklayer: check for SECURITY.md
Date: Wed, 13 Nov 2024 17:23:24 +0000
Message-Id: <20241113172324.3514858-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 17:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207122

Add a check for a SECURITY.md file (or similar) to yocto-check-layer, as
knowing where to report security issues is important.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/checklayer/__init__.py     | 12 +++++++++
 scripts/lib/checklayer/cases/common.py | 34 +++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/=
__init__.py
index 62ecdfe3906..86aadf39a6b 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -452,3 +452,15 @@ def compare_signatures(old_sigs, curr_sigs):
             msg.extend(['      ' + line for line in output.splitlines()]=
)
             msg.append('')
     return '\n'.join(msg)
+
+
+def get_git_toplevel(directory):
+    """
+    Try and find the top of the git repository that directory might be i=
n.
+    Returns the top-level directory, or None.
+    """
+    cmd =3D ["git", "-C", directory, "rev-parse", "--show-toplevel"]
+    try:
+        return subprocess.check_output(cmd, text=3DTrue).strip()
+    except:
+        return None
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checkla=
yer/cases/common.py
index 97b16f78c8e..51233de767e 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -7,7 +7,7 @@ import glob
 import os
 import unittest
 import re
-from checklayer import get_signatures, LayerType, check_command, get_dep=
graph, compare_signatures
+from checklayer import get_signatures, LayerType, check_command, compare=
_signatures, get_git_toplevel
 from checklayer.case import OECheckLayerTestCase
=20
 class CommonCheckLayer(OECheckLayerTestCase):
@@ -40,6 +40,38 @@ class CommonCheckLayer(OECheckLayerTestCase):
         email_regex =3D re.compile(r"[^@]+@[^@]+")
         self.assertTrue(email_regex.match(data))
=20
+    def find_file_by_name(self, globs):
+        """
+        Utility function to find a file that matches the specified list =
of
+        globs, in either the layer directory itself or the repository to=
p-level
+        directory.
+        """
+        directories =3D [self.tc.layer["path"]]
+        toplevel =3D get_git_toplevel(directories[0])
+        if toplevel:
+            directories.append(toplevel)
+
+        for path in directories:
+            for name in globs:
+                files =3D glob.glob(os.path.join(path, name))
+                if files:
+                    return sorted(files)[0]
+        return None
+
+    def test_security(self):
+        """
+        Test that the layer has a SECURITY.md (or similar) file, either =
in the
+        layer itself or at the top of the containing git repository.
+        """
+        if self.tc.layer["type"] =3D=3D LayerType.CORE:
+            raise unittest.SkipTest("Core layer's SECURITY is top level"=
)
+
+        filename =3D self.find_file_by_name(("SECURITY", "SECURITY.*"))
+        self.assertTrue(filename, msg=3D"Layer doesn't contain a SECURIT=
Y.md file.")
+
+        size =3D os.path.getsize(filename)
+        self.assertGreater(size, 0, msg=3Df"{filename} has no content.")
+
     def test_parse(self):
         check_command('Layer %s failed to parse.' % self.tc.layer['name'=
],
                       'bitbake -p')
--=20
2.34.1


