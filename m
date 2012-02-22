Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0L9U-0002mk-E6 for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 23:59:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MMoqmp002680
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:50:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01655-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:50:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MMoimL002674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:50:45 GMT
Message-ID: <1329951044.32110.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 22:50:44 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstatesig.py: Add handling for machine specific module depenedencies
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
X-List-Received-Date: Wed, 22 Feb 2012 22:59:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

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




