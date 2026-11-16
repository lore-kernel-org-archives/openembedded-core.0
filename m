Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30994.1794845356512341234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qgg41OCg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 538BE1A16A2
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19CB66023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44BCE11BC183B;
	Mon, 16 Nov 2026 17:09:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=odUslp78jxejskfKYFTLdAj8mz5TXhN3w8EuRAOQtA4=;
	b=Qgg41OCg2bTJ5CQmht9KkmB01BZwhuJn+poRefvdyeGPrCCkDHx5hdm3r4dXqzY2i8EPVS
	Zm8hWR/27RDrHmEfjgNlrnuGFYNrd1OQUswdHU75GMK9xR4Ttl5L1L7Jd9+gMM1BLSdZTl
	hviarulk/OW7dcBun4CAtOgugq/Tkm/Mw51Llcgmv0+MX+3BdLsoRbXRMTH8F7Fv+/7RfV
	jO2iZ1wSmfeZo8LX5pMljikFoGm3feBGXKeHNL4XdjmngpcRrnWPnm1lfyXlwR9Q9LMvSz
	azX0BQ/zb2iKSlaksyucXiP7fpvViZI+T1UgqLJeUrB7Yx3wgnL3nYoJPukg2g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:03 +0100
Subject: [PATCH 05/13] lib/oe: move oe.types.{is_x86,qemu_use_kvm} to
 oe.qemu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6357;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5g75g5G32gbghO0JyjWQauFPgsQQZcnvbSy6uApnX7U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqeBUuc/CNRuHYOnyqypvUpdzf4f14gzqShe
 Qlrrl21UISJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqngAKCRDRgEFAKaOo
 NlNBD/97QxFHXma8amPZagp54ggsLBV2EvwAaaKO5VtFTzjuyPfR5yn/rTcnCpovLQGpAj0NOvN
 kIYq4Q84hrTtU6tn+fFcIGlANb7hpgo4pkrK8VVKR8jawvjEsZJ6ZUMSznjpDZNjpLv8wAUQUsv
 nVmteDL1Uo30u+uNyvr6qQZVIQuozJaYIZQK7JOCXpqz47Zc+yoO1qZYR7/fs71tphGMZ3aYKf4
 L7IIHhRqxZhvsUYcsleTjhCvmfhG60Et3wRa++Fgqe632OjTRHjTo/PUByihWNcfzRQUonguZ1w
 79u2zIOTHE6GggdLVwz/KmmVPOONrAqK0kp/mJlsTCjfgulRedvwNgxfIFv7B0aRjkNgrn3pZ05
 sw6tr2UNGL0M6U8deOUNqBRS9P5NHEEoC7QrA01mi7/+LgMNCvUQZaoTykXurYWGRdFdv3ICMVi
 KyThkz+EwW8JfbN+qso7zDM1FDDFA5OFXkmCwTNaMKgLU/94/Bj41ZC5RxOn2bXuAL5+XAGLu5s
 KyGwVKqGCvwVj1L3h/Uo6B3xGL2wRag4Q3VEs7HKZl5s9TZv10mnP8qxCqbrzczKYqekrE8DmxI
 aOmwsoPfslYSZpqqkiBJDK08xO15xXaHqvkBG24ev2Zypop5n4GQgckG4np1aCTuTP1+MNOJbGl
 vS7fRTXZRxL2Rog==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250356

The oe.types library represents OpenEmbedded types such as booleans,
integers, etc. which is unrelated to what these two functions do:
is_x86() checks if a given arch matches the x86 architecture, and
qemu_use_kvm() is used to return True to enable KVM based on the current
target architecture.

Move these two functions to oe.qemu which is more appropriate. Adapt
usage in OE-Core as a consequence.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass            |  2 +-
 meta/lib/oe/qemu.py                              | 24 ++++++++++++++++++++++++
 meta/lib/oe/types.py                             | 23 -----------------------
 meta/lib/oeqa/selftest/cases/efibootpartition.py |  2 +-
 meta/lib/oeqa/selftest/cases/runqemu.py          |  2 +-
 meta/lib/oeqa/selftest/cases/uki.py              |  2 +-
 meta/lib/oeqa/targetcontrol.py                   |  2 +-
 7 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 9909c928cd..0c1a55a4c9 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -288,7 +288,7 @@ def testimage_main(d):
     boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
 
     # Get use_kvm
-    kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
+    kvm = oe.qemu.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
     # Get OVMF
     ovmf = d.getVar("QEMU_USE_OVMF")
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
index 769865036c..abe2745b10 100644
--- a/meta/lib/oe/qemu.py
+++ b/meta/lib/oe/qemu.py
@@ -52,3 +52,27 @@ def qemu_run_binary(d, rootfs_path, binary):
     base_libdir = rootfs_path + d.getVar("base_libdir", False)
 
     return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
+
+def is_x86(arch):
+    """
+    Check whether ``arch`` is ``x86`` or ``x86_64``, return ``True`` if it is,
+    ``False`` otherwise.
+    """
+    if arch.startswith('x86_') or re.match('i.*86', arch):
+        return True
+    else:
+        return False
+
+def qemu_use_kvm(kvm, target_arch):
+    """
+    Enable kvm if target_arch == build_arch or both of them are x86 archs.
+    """
+
+    use_kvm = False
+    if kvm and boolean(kvm):
+        build_arch = os.uname()[4]
+        if is_x86(build_arch) and is_x86(target_arch):
+            use_kvm = True
+        elif build_arch == target_arch:
+            use_kvm = True
+    return use_kvm
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index b929afb1f3..c4b338921b 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -163,26 +163,3 @@ def path(value, relativeto='', normalize='true', mustexist='false'):
                 raise ValueError("{0}: {1}".format(value, os.strerror(errno.ENOENT)))
 
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
-    Enable kvm if target_arch == build_arch or both of them are x86 archs.
-    """
-
-    use_kvm = False
-    if kvm and boolean(kvm):
-        build_arch = os.uname()[4]
-        if is_x86(build_arch) and is_x86(target_arch):
-            use_kvm = True
-        elif build_arch == target_arch:
-            use_kvm = True
-    return use_kvm
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index fcfcdaf7e4..0899d57c0b 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -17,7 +17,7 @@ class GenericEFITest(OESelftestTestCase):
         image = "core-image-minimal"
         runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
         cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
-        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
+        if oe.qemu.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
             cmd += " kvm"
 
         self.write_config("""
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index bfa76812ae..bdd5ae1bc3 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -34,7 +34,7 @@ class RunqemuTests(OESelftestTestCase):
             self.fstypes += " wic.vmdk wic.qcow2 wic.vdi wic.zst"
 
         self.cmd_common = "runqemu nographic snapshot"
-        kvm = oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"])
+        kvm = oe.qemu.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"])
         if kvm:
             self.cmd_common += " kvm"
 
diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
index fc31fb767a..6283df540a 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -21,7 +21,7 @@ class UkiTest(OESelftestTestCase):
         image = "core-image-minimal"
         runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
         cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
-        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
+        if oe.qemu.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
             cmd += " kvm"
 
         self.write_config("""
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1deea2e5ce..23b26bc2b5 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -108,7 +108,7 @@ class QemuTarget(BaseTarget):
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir = os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdump')
-        use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
+        use_kvm = oe.qemu.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
         # Log QemuRunner log output to a file
         import oe.path

-- 
2.56.0

