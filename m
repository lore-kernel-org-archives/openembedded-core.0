Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1D76C0BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:27:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB59RNl7018048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 01:27:23 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 01:27:23 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 17:34:27 +0800
Message-ID: <b8fce58a2792f697f0604f85d6b999b666ac0403.1544002055.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1544002055.git.Qi.Chen@windriver.com>
References: <cover.1544002055.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa: drop support of listing machines in QEMU_USE_KVM
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
X-List-Received-Date: Wed, 05 Dec 2018 09:27:24 -0000
Content-Type: text/plain

We want QEMU_USE_KVM to only set to some boolean value, with possible
MACHINE override. Drop the support of listing machines in this variable,
and give users error message if they still do so.

Error message below is an example.

ERROR: core-image-minimal-1.0-r0 do_testimage: Invalid boolean value 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64'
QEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.
  e.g.
    QEMU_USE_KVM_qemux86-64 = '1'
    ERROR: core-image-minimal-1.0-r0 do_testimage: Function failed: do_testimage

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage.bbclass | 12 ++++++------
 meta/lib/oeqa/targetcontrol.py | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 82cbb06..7c3bc0a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -229,12 +229,12 @@ def testimage_main(d):
 
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-    if qemu_use_kvm and \
-       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
-        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
-        kvm = True
-    else:
-        kvm = False
+    try:
+        kvm = oe.types.boolean(qemu_use_kvm)
+    except ValueError as e:
+        bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
+                 "  e.g.\n"
+                 "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
 
     slirp = False
     if d.getVar("QEMU_USE_SLIRP"):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..158a8b0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -108,12 +108,12 @@ class QemuTarget(BaseTarget):
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-        if qemu_use_kvm and \
-           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
-            d.getVar("MACHINE") in qemu_use_kvm.split()):
-            use_kvm = True
-        else:
-            use_kvm = False
+        try:
+            use_kvm = oe.types.boolean(qemu_use_kvm)
+        except ValueError as e:
+            bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
+                     "  e.g.\n"
+                     "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
 
         # Log QemuRunner log output to a file
         import oe.path
-- 
1.9.1


