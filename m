Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F317A60559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 12:29:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s49CTPUh028488 for <openembedded-core@lists.openembedded.org>;
	Fri, 9 May 2014 13:29:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4IfwFakRliXf
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 13:29:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s49CTJSi028485
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 May 2014 13:29:21 +0100
Message-ID: <1399638553.31891.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 09 May 2014 13:29:13 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] classes/lib/oe: Fix cross/crosssdk references
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
X-List-Received-Date: Fri, 09 May 2014 12:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the renaming of the cross packages, its no longer possible to use 
endswith("-cross") and similar to detect cross packages. Replace these
references with other techniques.

This resolves certain build from sstate failures which were due to the 
system believing cross packages were target packages and therefore 
dependency handling was altered. 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 899629b..4293055 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -182,7 +182,7 @@ def preferred_ml_updates(d):
     for prov in providers:
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
+        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
             continue
         if 'cross-canadian' in pkg:
             for p in prefixes:
@@ -229,7 +229,7 @@ def preferred_ml_updates(d):
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith(("-native", "-crosssdk")) or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
+        if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
             continue
         virt = ""
         if p.startswith("virtual/"):
@@ -416,7 +416,7 @@ python () {
             appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
             newappends = []
             for a in appends:
-                if a.endswith("-native") or a.endswith("-cross"):
+                if a.endswith("-native") or ("-cross-" in a):
                     newappends.append(a)
                 elif a.startswith("virtual/"):
                     subs = a.split("/", 1)[1]
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 2d182f0..31f1c41 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -125,7 +125,7 @@ python native_virtclass_handler () {
         deps = bb.utils.explode_deps(deps)
         newdeps = []
         for dep in deps:
-            if dep.endswith("-cross"):
+            if "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
                 newdeps.append(dep + "-native")
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 46cc267..796c1a9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -715,7 +715,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
 
     def isNativeCross(x):
-        return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-crosssdk") or x.endswith("-crosssdk-initial")
+        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x
 
     def isPostInstDep(x):
         if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
@@ -750,7 +750,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             if taskdependees[dep][0].endswith(("base-passwd", "shadow-sysroot")):
                 continue
             # Nothing need depend on libc-initial/gcc-cross-initial
-            if taskdependees[task][0].endswith("-initial"):
+            if "-initial" in taskdependees[task][0]:
                 continue
             # Native/Cross populate_sysroot need their dependencies
             if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index e2ae7e9..14d6f20a 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -52,7 +52,7 @@ class ClassExtender(object):
         return newdata
 
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime", "-crosssdk")) or ('nativesdk-' in dep) or ('cross-canadian' in dep):
+        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep) or ('-crosssdk-' in dep):
             return dep
         else:
             return self.extend_name(dep)
@@ -96,9 +96,9 @@ class ClassExtender(object):
 
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime", "-cross", "-crosssdk")) or ('nativesdk-' in dep):
-            return dep
-        elif dep.endswith(("-gcc-intermediate", "-gcc-initial", "-gcc", "-g++")):
+        if dep.endswith(("-gcc-initial", "-gcc", "-g++")):
             return dep + "-crosssdk"
+        elif dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):
+            return dep
         else:
             return self.extend_name(dep)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa25c3a..40f9974 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -5,7 +5,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isNative(x):
         return x.endswith("-native")
     def isCross(x):
-        return x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-cross-intermediate")
+        return "-cross-" in x
     def isNativeSDK(x):
         return x.startswith("nativesdk-")
     def isKernel(fn):
@@ -139,7 +139,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
-            if pn.endswith('-native') or pn.endswith('-crosssdk') or pn.endswith('-cross'):
+            if pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
             sstatename = taskname[3:]
             filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG', True), sstatename)



