Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2144.1601017595601250267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 00:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08P75mP7001413
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 00:06:13 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 00:06:03 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [oe-core][PATCH 3/4] archive: fix racing between do_ar_patched and do_kernel_configme
Date: Fri, 25 Sep 2020 00:05:34 -0700
Message-ID: <20200925070535.59518-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925070535.59518-1-hongxu.jia@windriver.com>
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index aff1f9dbb0..efab438ebd 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -596,7 +596,11 @@ python () {
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
index 21ae0a7657..30afbcd617 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -32,7 +32,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
     if recipename == depname and depmc == mc:
-        if task == "do_kernel_configme" and deptaskname == "do_unpack_and_patch":
+        if task == "do_kernel_configme" and (dep.endswith(".do_unpack_and_patch") or \
+                                             dep.endswith(".do_ar_patched")):
             return False
         return True
 
-- 
2.21.0

