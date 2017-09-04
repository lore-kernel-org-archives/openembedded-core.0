Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 01F4977E94
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:35:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Sep 2017 14:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,476,1498546800"; d="scan'208";a="1169068313"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2017 14:35:49 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 14:35:48 -0700
Message-Id: <20170904213548.15582-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170904213548.15582-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170904213548.15582-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] package_[deb|ipk]: improve multiprocess logic when creating deb/ipk packages
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
X-List-Received-Date: Mon, 04 Sep 2017 21:35:49 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Current implementation does not handle possible exceptions coming from child
processes, the latter responsible for creating packages. With the aim to have more
control, use pipes to communicate exceptions and stop package creation in case
of failure.

Helps to debug [YOCTO #12012].

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 36 +++++++++++++++++++++++++++++++++---
 meta/classes/package_ipk.bbclass | 36 +++++++++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 30605344f4..5d297939b6 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -41,7 +41,29 @@ def debian_arch_map(arch, tune):
     return arch
 
 python do_package_deb () {
-    from multiprocessing import Process
+
+    import multiprocessing
+    import traceback
+
+    class DebianWritePkgProcess(multiprocessing.Process):
+        def __init__(self, *args, **kwargs):
+            multiprocessing.Process.__init__(self, *args, **kwargs)
+            self._pconn, self._cconn = multiprocessing.Pipe()
+            self._exception = None
+
+        def run(self):
+            try:
+                multiprocessing.Process.run(self)
+                self._cconn.send(None)
+            except Exception as e:
+                tb = traceback.format_exc()
+                self._cconn.send((e, tb))
+
+        @property
+        def exception(self):
+            if self._pconn.poll():
+                self._exception = self._pconn.recv()
+            return self._exception
 
     oldcwd = os.getcwd()
 
@@ -56,20 +78,28 @@ python do_package_deb () {
 
     max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
     launched = []
+    error = None
     pkgs = packages.split()
-    while pkgs:
+    while not error and pkgs:
         if len(launched) < max_process:
-            p = Process(target=deb_write_pkg, args=(pkgs.pop(), d))
+            p = DebianWritePkgProcess(target=deb_write_pkg, args=(pkgs.pop(), d))
             p.start()
             launched.append(p)
         for q in launched:
             # The finished processes are joined when calling is_alive()
             if not q.is_alive():
                 launched.remove(q)
+            if q.exception:
+                error, traceback = q.exception
+                break
+
     for p in launched:
         p.join()
 
     os.chdir(oldcwd)
+
+    if error:
+        raise error
 }
 do_package_deb[vardeps] += "deb_write_pkg"
 do_package_deb[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index ec90996184..8439cda6dd 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -17,7 +17,29 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
 OPKGLIBDIR = "${localstatedir}/lib"
 
 python do_package_ipk () {
-    from multiprocessing import Process
+    import multiprocessing
+    import traceback
+
+    class IPKWritePkgProcess(multiprocessing.Process):
+        def __init__(self, *args, **kwargs):
+            multiprocessing.Process.__init__(self, *args, **kwargs)
+            self._pconn, self._cconn = multiprocessing.Pipe()
+            self._exception = None
+
+        def run(self):
+            try:
+                multiprocessing.Process.run(self)
+                self._cconn.send(None)
+            except Exception as e:
+                tb = traceback.format_exc()
+                self._cconn.send((e, tb))
+
+        @property
+        def exception(self):
+            if self._pconn.poll():
+                self._exception = self._pconn.recv()
+            return self._exception
+
 
     oldcwd = os.getcwd()
 
@@ -41,20 +63,28 @@ python do_package_ipk () {
 
     max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
     launched = []
+    error = None
     pkgs = packages.split()
-    while pkgs:
+    while not error and pkgs:
         if len(launched) < max_process:
-            p = Process(target=ipk_write_pkg, args=(pkgs.pop(), d))
+            p = IPKWritePkgProcess(target=ipk_write_pkg, args=(pkgs.pop(), d))
             p.start()
             launched.append(p)
         for q in launched:
             # The finished processes are joined when calling is_alive()
             if not q.is_alive():
                 launched.remove(q)
+            if q.exception:
+                error, traceback = q.exception
+                break
+
     for p in launched:
         p.join()
 
     os.chdir(oldcwd)
+
+    if error:
+        raise error
 }
 do_package_ipk[vardeps] += "ipk_write_pkg"
 do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
-- 
2.12.3


