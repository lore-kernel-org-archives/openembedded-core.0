Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10101.1794999608971095790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bMoMKQ2Q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B54F4C4F77B
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 11:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9FDD5FE9B
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 11:00:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AF7011BC101E;
	Wed, 18 Nov 2026 12:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794999605; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzxmErhu2zUQEpU8aMNR7o8gv9iOGDbMVJr9hnxmHao=;
	b=bMoMKQ2QPaiVjV+H6GewM8XNJ0JZjhultZPoT3wdv5xlN7FhYiHAep8BQOsCqwA4Z/sHX5
	/OUMBx98NaBKvyO9mWO+mUoZ+kK5GJ5PCJGY/z3ociRRj19C0aGMwHxN2APcCoagtWmZ3x
	k6AlNaGOQ4TccMW5MB5fjT8bQFM2a5VzadeOrMv7tDGLkwIlL7Ze0KxnLmwerh5ezIb25l
	7Q1DuIjauVeoy3R8D3mN9PbjQQ0v8Kj+HBPyWUNHtZnOPMCb16zkHlTqTye/eaLezzOMBJ
	E8MeXHiLb6Fa4yoFewaOMynkzifnkIl5iZ0KMddyk3CX/8sQE652PAqGLFDZ0g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 05/13] lib/oe: move oe.types.{is_x86,qemu_use_kvm} to oe.qemu
Date: Wed, 18 Nov 2026 11:59:20 +0100
Message-ID: <20261118105929.78358-1-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 11:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250539
Content-Type: text/plain; charset="utf-8"

The oe.types library represents OpenEmbedded types such as booleans,
integers, etc. which is unrelated to what these two functions do:
is_x86() checks if a given arch matches the x86 architecture, and
qemu_use_kvm() is used to return True to enable KVM based on the current
target architecture.

Move these two functions to oe.qemu which is more appropriate. Adapt
usage in OE-Core as a consequence.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass         |  2 +-
 meta/lib/oe/qemu.py                           | 29 +++++++++++++++++++
 meta/lib/oe/types.py                          | 23 ---------------
 .../oeqa/selftest/cases/efibootpartition.py   |  4 +--
 meta/lib/oeqa/selftest/cases/runqemu.py       |  4 +--
 meta/lib/oeqa/selftest/cases/uki.py           |  4 +--
 meta/lib/oeqa/targetcontrol.py                |  4 +--
 7 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 9909c928cd..0c1a55a4c9 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -288,7 +288,7 @@ def testimage_main(d):
     boottime =3D int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
=20
     # Get use_kvm
-    kvm =3D oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TA=
RGET_ARCH'))
+    kvm =3D oe.qemu.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TAR=
GET_ARCH'))
=20
     # Get OVMF
     ovmf =3D d.getVar("QEMU_USE_OVMF")
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
index 769865036c..5e0ee6087d 100644
--- a/meta/lib/oe/qemu.py
+++ b/meta/lib/oe/qemu.py
@@ -4,6 +4,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
+import os
+import re
+
+import oe.types
+
 def qemu_target_binary(d):
     package_arch =3D d.getVar("PACKAGE_ARCH")
     qemu_target_binary =3D (d.getVar("QEMU_TARGET_BINARY_%s" % package_a=
rch) or "")
@@ -52,3 +57,27 @@ def qemu_run_binary(d, rootfs_path, binary):
     base_libdir =3D rootfs_path + d.getVar("base_libdir", False)
=20
     return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) +=
 rootfs_path + binary
+
+def is_x86(arch):
+    """
+    Check whether ``arch`` is ``x86`` or ``x86_64``, return ``True`` if =
it is,
+    ``False`` otherwise.
+    """
+    if arch.startswith('x86_') or re.match('i.*86', arch):
+        return True
+    else:
+        return False
+
+def qemu_use_kvm(kvm, target_arch):
+    """
+    Enable kvm if target_arch =3D=3D build_arch or both of them are x86 =
archs.
+    """
+
+    use_kvm =3D False
+    if kvm and oe.types.boolean(kvm):
+        build_arch =3D os.uname()[4]
+        if is_x86(build_arch) and is_x86(target_arch):
+            use_kvm =3D True
+        elif build_arch =3D=3D target_arch:
+            use_kvm =3D True
+    return use_kvm
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index b929afb1f3..c4b338921b 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -163,26 +163,3 @@ def path(value, relativeto=3D'', normalize=3D'true',=
 mustexist=3D'false'):
                 raise ValueError("{0}: {1}".format(value, os.strerror(er=
rno.ENOENT)))
=20
     return value
-
-def is_x86(arch):
-    """
-    Check whether arch is x86 or x86_64
-    """
-    if arch.startswith('x86_') or re.match('i.*86', arch):
-        return True
-    else:
-        return False
-
-def qemu_use_kvm(kvm, target_arch):
-    """
-    Enable kvm if target_arch =3D=3D build_arch or both of them are x86 =
archs.
-    """
-
-    use_kvm =3D False
-    if kvm and boolean(kvm):
-        build_arch =3D os.uname()[4]
-        if is_x86(build_arch) and is_x86(target_arch):
-            use_kvm =3D True
-        elif build_arch =3D=3D target_arch:
-            use_kvm =3D True
-    return use_kvm
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/=
oeqa/selftest/cases/efibootpartition.py
index fcfcdaf7e4..b896558e62 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -8,7 +8,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 from oeqa.core.decorator.data import skipIfNotMachine
-import oe.types
+import oe.qemu
=20
 class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
@@ -17,7 +17,7 @@ class GenericEFITest(OESelftestTestCase):
         image =3D "core-image-minimal"
         runqemu_params =3D get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
         cmd =3D "runqemu %s nographic serial wic ovmf" % (runqemu_params=
)
-        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td=
["TARGET_ARCH"]):
+        if oe.qemu.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td[=
"TARGET_ARCH"]):
             cmd +=3D " kvm"
=20
         self.write_config("""
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/self=
test/cases/runqemu.py
index bfa76812ae..11bce6ab6a 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -7,7 +7,7 @@
 import os
 import re
 import time
-import oe.types
+import oe.qemu
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.selftest.case import OESelftestTestCase
@@ -34,7 +34,7 @@ class RunqemuTests(OESelftestTestCase):
             self.fstypes +=3D " wic.vmdk wic.qcow2 wic.vdi wic.zst"
=20
         self.cmd_common =3D "runqemu nographic snapshot"
-        kvm =3D oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.t=
d["TARGET_ARCH"])
+        kvm =3D oe.qemu.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td=
["TARGET_ARCH"])
         if kvm:
             self.cmd_common +=3D " kvm"
=20
diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest=
/cases/uki.py
index fc31fb767a..47ca26a948 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -9,7 +9,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 from oeqa.core.decorator.data import skipIfNotArch
 from oeqa.core.decorator import OETestTag
-import oe.types
+import oe.qemu
=20
 class UkiTest(OESelftestTestCase):
     """Boot Unified Kernel Image (UKI) generated with uki.bbclass on UEF=
I firmware (omvf/edk2)"""
@@ -21,7 +21,7 @@ class UkiTest(OESelftestTestCase):
         image =3D "core-image-minimal"
         runqemu_params =3D get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
         cmd =3D "runqemu %s nographic serial wic ovmf" % (runqemu_params=
)
-        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td=
["TARGET_ARCH"]):
+        if oe.qemu.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td[=
"TARGET_ARCH"]):
             cmd +=3D " kvm"
=20
         self.write_config("""
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol=
.py
index 1deea2e5ce..7ed3ebd785 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -91,7 +91,7 @@ class QemuTarget(BaseTarget):
=20
     def __init__(self, d, logger, image_fstype=3DNone, boot_patterns=3DN=
one):
=20
-        import oe.types
+        import oe.qemu
=20
         super(QemuTarget, self).__init__(d, logger)
=20
@@ -108,7 +108,7 @@ class QemuTarget(BaseTarget):
         dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir =3D os.path.join(d.getVar('LOG_DIR'), 'runtime-host=
dump')
-        use_kvm =3D oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.ge=
tVar('TARGET_ARCH'))
+        use_kvm =3D oe.qemu.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.get=
Var('TARGET_ARCH'))
=20
         # Log QemuRunner log output to a file
         import oe.path
