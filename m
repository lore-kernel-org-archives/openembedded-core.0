Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8801A6C484
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 06:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB66NJsf003398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 22:23:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 22:23:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2018 14:30:36 +0800
Message-ID: <4e980624cf550689a95a3847a3dc1103975b1d8c.1544066027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1544066027.git.Qi.Chen@windriver.com>
References: <cover.1544066027.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 06 Dec 2018 06:23:18 -0000
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

QB_CPU_KVM is also checked to determine whether to enable kvm.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage.bbclass | 12 +++++++-----
 meta/lib/oeqa/targetcontrol.py | 12 +++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 82cbb06..3353d133 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -229,11 +229,13 @@ def testimage_main(d):
 
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-    if qemu_use_kvm and \
-       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
-        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
-        kvm = True
-    else:
+    try:
+        kvm = oe.types.boolean(qemu_use_kvm)
+    except ValueError as e:
+        bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
+                 "  e.g.\n"
+                 "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
+    if kvm and not d.getVar('QB_CPU_KVM'):
         kvm = False
 
     slirp = False
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..d21823b 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -108,11 +108,13 @@ class QemuTarget(BaseTarget):
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-        if qemu_use_kvm and \
-           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
-            d.getVar("MACHINE") in qemu_use_kvm.split()):
-            use_kvm = True
-        else:
+        try:
+            use_kvm = oe.types.boolean(qemu_use_kvm)
+        except ValueError as e:
+            bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
+                     "  e.g.\n"
+                     "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
+        if use_kvm and not d.getVar('QB_CPU_KVM'):
             use_kvm = False
 
         # Log QemuRunner log output to a file
-- 
1.9.1


