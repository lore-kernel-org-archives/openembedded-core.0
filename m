Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAC86C23A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x037l9ZO017424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 23:47:19 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 23:46:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 16:04:59 +0800
Message-ID: <326e95f58fdba6db0602999725580a837eed549a.1546502650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1546502650.git.liezhi.yang@windriver.com>
References: <cover.1546502650.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Thu, 03 Jan 2019 07:47:28 -0000
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

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass |  8 +-------
 meta/lib/oe/types.py           | 18 ++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py |  8 +-------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e8fa4a3..82aef9f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -230,13 +230,7 @@ def testimage_main(d):
     boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
 
     # Get use_kvm
-    qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-    if qemu_use_kvm and \
-       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
-        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
-        kvm = True
-    else:
-        kvm = False
+    kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('MACHINE'))
 
     slirp = False
     if d.getVar("QEMU_USE_SLIRP"):
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index f401713..a153f2c 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -156,3 +156,21 @@ def path(value, relativeto='', normalize='true', mustexist='false'):
                 raise ValueError("{0}: {1}".format(value, os.strerror(errno.ENOENT)))
 
     return value
+
+def qemu_use_kvm(kvm, machine):
+    """
+    kvm can be:
+    - bool: 0, yes, ...
+    - MACHINEs: qemux86 qemux86-64 ...
+    """
+    use_kvm = False
+    if kvm:
+        kvm_boolean = False
+        try:
+            kvm_boolean = boolean(kvm)
+        except ValueError:
+            pass
+        if (kvm_boolean and "x86" in machine) or (machine in kvm.split()):
+            use_kvm = True
+    return use_kvm
+
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..980d6a2 100644
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
+        use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('MACHINE'))
 
         # Log QemuRunner log output to a file
         import oe.path
-- 
2.7.4


