Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD39C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 18:24:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76901.1701714262593802481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 10:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C77D1684;
	Mon,  4 Dec 2023 10:25:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD04C3F5A1;
	Mon,  4 Dec 2023 10:24:21 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] oeqa/runtime/parselogs: load ignores from disk
Date: Mon,  4 Dec 2023 18:24:17 +0000
Message-Id: <20231204182419.2455488-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204182419.2455488-1-ross.burton@arm.com>
References: <20231204182419.2455488-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 18:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191765

From: Ross Burton <ross.burton@arm.com>

Instead of hardcoding the list of ignored errors/warnings in the test
itself, read them plain text files on disk.

This uses importlib to try to open a file called
oeqa.runtime.cases.parselogs-ignores-[candidate].txt, where the
candidate will be:

- "common"
- The TARGET_ARCH
- Each of the MACHINEOVERRDES

This allows the common and tune-specific ignores to be retained in
oe-core, and machine-specific ignores added to the layer where the
machine is defined.

[ YOCTO #14604 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 40 +++++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index cddb846bdfc..5527ebd271c 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -6,6 +6,7 @@
=20
 import collections
 import os
+import sys
=20
 from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
@@ -190,6 +191,23 @@ ignore_errors =3D {
         ] + common_errors,
 }
=20
+
+# importlib.resources.open_text in Python <3.10 doesn't search all direc=
tories
+# when a package is split across multiple directories. Until we can rely=
 on
+# 3.10+, reimplement the searching logic.
+if sys.version_info < (3, 10):
+    def _open_text(package, resource):
+        import importlib, pathlib
+        module =3D importlib.import_module(package)
+        for path in module.__path__:
+            candidate =3D pathlib.Path(path) / resource
+            if candidate.exists():
+                return candidate.open(encoding=3D'utf-8')
+        raise FileNotFoundError
+else:
+    from importlib.resources import open_text as _open_text
+
+
 class ParseLogsTest(OERuntimeTestCase):
=20
     # Which log files should be collected
@@ -198,6 +216,9 @@ class ParseLogsTest(OERuntimeTestCase):
     # The keywords that identify error messages in the log files
     errors =3D ["error", "cannot", "can't", "failed"]
=20
+    # A list of error messages that should be ignored
+    ignore_errors =3D []
+
     @classmethod
     def setUpClass(cls):
         # When systemd is enabled we need to notice errors on
@@ -212,11 +233,20 @@ class ParseLogsTest(OERuntimeTestCase):
=20
         cls.errors =3D [s.casefold() for s in cls.errors]
=20
-        try:
-            cls.ignore_errors =3D [s.casefold() for s in ignore_errors[c=
ls.td.get('MACHINE')]]
-        except KeyError:
-            cls.logger.info('No ignore list found for this machine, usin=
g default')
-            cls.ignore_errors =3D [s.casefold() for s in ignore_errors['=
default']]
+        cls.load_machine_ignores()
+
+    @classmethod
+    def load_machine_ignores(cls):
+        # Add TARGET_ARCH explicitly as not every machine has that in MA=
CHINEOVERRDES (eg qemux86-64)
+        for candidate in ["common", cls.td.get("TARGET_ARCH")] + cls.td.=
get("MACHINEOVERRIDES").split(":"):
+            try:
+                name =3D f"parselogs-ignores-{candidate}.txt"
+                for line in _open_text("oeqa.runtime.cases", name):
+                    line =3D line.strip()
+                    if line and not line.startswith("#"):
+                        cls.ignore_errors.append(line.casefold())
+            except FileNotFoundError:
+                pass
=20
     # Go through the log locations provided and if it's a folder
     # create a list with all the .log files in it, if it's a file
--=20
2.34.1


