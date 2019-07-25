Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46F647CE21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 08:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6P8M14n003327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 01:22:01 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 25 Jul 2019 01:22:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Jul 2019 04:21:07 -0400
Message-ID: <1564042867-156900-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] archive: fix racing between do_ar_patched and do_kernel_configme
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
X-List-Received-Date: Thu, 25 Jul 2019 08:22:01 -0000
Content-Type: text/plain

While archive mode is 'patched', there is a probably racing between
do_ar_patched and do_kernel_configme
[snip]
|File: 'oe-core/meta/classes/archiver.bbclass', lineno: 313, function: create_tarball
...
|Exception: FileNotFoundError: [Errno 2] No such file or directory: 'build/
tmp-glibc/work-shared/qemux86-64/kernel-source/.tmp.config.DCUH7mUNe3'
[snip]

Task do_kernel_configme will modify ${S}, and it broke create_tarball in
do_ar_patched.

Order do_kernel_configme and do_ar_patched to avoid racing.

Also improve sstatesig.py to respect commit [fed0ed8 archiver.bbclass: do
not cause kernel rebuilds]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/archiver.bbclass | 8 ++++++--
 meta/lib/oe/sstatesig.py      | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index af9f010..72ce34a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -487,7 +487,11 @@ python () {
     # Add tasks in the correct order, specifically for linux-yocto to avoid race condition.
     # sstatesig.py:sstate_rundepfilter has special support that excludes this dependency
     # so that do_kernel_configme does not need to run again when do_unpack_and_patch
-    # gets added or removed (by adding or removing archiver.bbclass).
+    # or do_ar_patched gets added or removed (by adding or removing archiver.bbclass).
     if bb.data.inherits_class('kernel-yocto', d):
-        bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
+        ar_src = d.getVarFlag('ARCHIVER_MODE', 'src')
+        if ar_src == "patched":
+            bb.build.addtask('do_kernel_configme', 'do_configure', 'do_ar_patched', d)
+        else:
+            bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
 }
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 13af16e..b1b9c39 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -28,7 +28,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # The exception is the special do_kernel_configme->do_unpack_and_patch
     # dependency from archiver.bbclass.
     if recipename == depname:
-        if task == "do_kernel_configme" and dep.endswith(".do_unpack_and_patch"):
+        if task == "do_kernel_configme" and (dep.endswith(".do_unpack_and_patch") or \
+                                             dep.endswith(".do_ar_patched")):
             return False
         return True
 
-- 
2.8.1


