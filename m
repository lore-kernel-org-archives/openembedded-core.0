Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 061427BE0F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 06:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x046vrh9018724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2019 22:58:03 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 22:57:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2019 15:15:43 +0800
Message-ID: <f20642eb8822150fa43d2c9fada6c5c36c1d08e7.1546585931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1546585931.git.liezhi.yang@windriver.com>
References: <cover.1546585931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] oeqa: Fix for QEMU_USE_KVM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2019 06:58:13 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86"
QEMU_USE_KVM = "qemux86"
IMAGE_CLASSES += "testimage"

$ oe-selftest -r runqemu.RunqemuTests.test_boot_rootfs

[snip]
  File "/buildarea1/lyang1/poky/meta/lib/oe/types.py", line 122, in boolean
    raise ValueError("Invalid boolean value '%s'" % value)
ValueError: Invalid boolean value 'qemux86'

Now QEMU_USE_KVM can only be boolean, can not contain MACHINE any more, kvm
will be enabled if target_arch == build_arch or both of them are x86 archs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass |  8 +-------
 meta/lib/oe/types.py           | 24 ++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py |  8 +-------
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 3c2209a..73cd375 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -231,13 +231,7 @@ def testimage_main(d):
     boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
 
     # Get use_kvm
-    qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-    if qemu_use_kvm and \
-       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
-        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
-        kvm = True
-    else:
-        kvm = False
+    kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
     slirp = False
     if d.getVar("QEMU_USE_SLIRP"):
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index f401713..b9462e0 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -156,3 +156,27 @@ def path(value, relativeto='', normalize='true', mustexist='false'):
                 raise ValueError("{0}: {1}".format(value, os.strerror(errno.ENOENT)))
 
     return value
+
+def is_x86(arch):
+    """
+    Check whether arch is x86 or x86_64
+    """
+    if arch.startswith('x86_') or re.match('i.*86', arch) or arch == 'ia64':
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
+
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..288e747 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -107,13 +107,7 @@ class QemuTarget(BaseTarget):
         dump_target_cmds = d.getVar("testimage_dump_target")
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
-        qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-        if qemu_use_kvm and \
-           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
-            d.getVar("MACHINE") in qemu_use_kvm.split()):
-            use_kvm = True
-        else:
-            use_kvm = False
+        use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
         # Log QemuRunner log output to a file
         import oe.path
-- 
2.7.4


