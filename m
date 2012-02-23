Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuY-0001fg-Lc
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm8f4003018 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:09 GMT
X-Quarantine-ID: <34w58XiheKR0>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 34w58XiheKR0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:08 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm5kV003003
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:07 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Yt4-0005Pq-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:39:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:25 +0000
Message-Id: <a7a11da5e692eba27bb228c6e34c4fbe56e7ad6c.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/16] sstatesig.py: Add handling for machine specific module depenedencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 14:44:58 -0000

Adding dependencies on machine specific recipes from generic packages
causes a rebuild of the generic package per machine if using signatures
for the stamp files which is unacceptable.

We need to declare that RRECOMMENDS on kernel-module-* are safe
and that we shouldn't care about these machine specific dependencies
from a stamp perspective. This change adds code which does this.

It depends on a change in bitbake to expose the dataCache object
which can be used to make the calculations we need to allow this to
work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py |   26 ++++++++++++++++++++------
 1 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index ee7cbad..5a64882 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -1,6 +1,6 @@
 import bb.siggen
 
-def sstate_rundepfilter(fn, recipename, task, dep, depname):
+def sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache):
     # Return True if we should keep the dependency, False to drop it
     def isNative(x):
         return x.endswith("-native")
@@ -8,13 +8,16 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname):
         return x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-cross-intermediate")
     def isNativeSDK(x):
         return x.endswith("-nativesdk")
+    def isKernel(fn):
+        inherits = " ".join(dataCache.inherits[fn])
+        return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
 
     # Always include our own inter-task dependencies
     if recipename == depname:
         return True
 
     # Quilt (patch application) changing isn't likely to affect anything
-    if depname == "quilt-native":
+    if depname == "quilt-native" and recipename != "quilt-native":
         return False
     # Don't change native/cross/nativesdk recipe dependencies any further
     if isNative(recipename) or isCross(recipename) or isNativeSDK(recipename):
@@ -30,6 +33,17 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname):
     if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-files']:
         return False
 
+    # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
+    # if we're just doing an RRECOMMENDS_xxx = "kernel-module-*", not least because the checksum
+    # is machine specific.
+    # Therefore if we're not a kernel or a module recipe (inheriting the kernel classes)
+    # and we reccomend a kernel-module, we exclude the dependency.
+    depfn = dep.rsplit(".", 1)[0]
+    if dataCache and isKernel(depfn) and not isKernel(fn):
+        for pkg in dataCache.runrecs[fn]:
+            if " ".join(dataCache.runrecs[fn][pkg]).find("kernel-module-") != -1:
+                return False
+
     # Default to keep dependencies
     return True
 
@@ -37,15 +51,15 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
         pass
-    def rundep_check(self, fn, recipename, task, dep, depname):
-        return sstate_rundepfilter(fn, recipename, task, dep, depname)
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
+        return sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache)
 
 class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"
     def init_rundepcheck(self, data):
         pass
-    def rundep_check(self, fn, recipename, task, dep, depname):
-        return sstate_rundepfilter(fn, recipename, task, dep, depname)
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
+        return sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache)
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
-- 
1.7.5.4



