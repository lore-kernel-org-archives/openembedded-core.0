Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBC56D684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 10:51:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAEApVDF021537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 02:51:32 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 02:51:31 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 18:51:28 +0800
Message-ID: <1384426288-3534-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] sstate: Add optimizing logic for crosssdk setscene dependencies
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
X-List-Received-Date: Thu, 14 Nov 2013 10:51:31 -0000
Content-Type: text/plain

This patch mainly aims to add optimisation for crosssdk setscene dependency
validating which we haven't handled in current logic, and which I think we
could have as we've already implemented to native/cross, although there
are albeit not many crossdk tasks, we could still get some performance
enhancement.

And it also fix a vulnerability of some certain workflow, think about the
following scenario with current logic:
    bitbake nativesdk-eglibc-initial -c cleansstate
    bitbake gcc-crosssdk-initial -c clean
    bitbake gmp-native -c clean
    bitbake libmpc-native -c clean
    bitbake mpfr-native -c clean
    bitbake gcc-crosssdk-initial
    bitbake nativesdk-eglibc-initial

Aboving will fail for absence of a few native libraries required by
gcc-crosssdk-initial.

Also modified some places in current code except the optimisation, as
following:
1 Remove isNative function since no code is referring it.
2 Add do_package to the list that don't exist and are noexec.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/sstate.bbclass | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 517c100..49f92f9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -666,12 +666,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
 
     bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
 
-    def isNative(x):
-        return x.endswith("-native")
-    def isNativeCross(x):
-        return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
+    def isNativeCrossCrosssdk(x):
+        return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-crosssdk") or x.endswith("-crosssdk-initial")
     def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial", "gcc-crosssdk", "binutils-crosssdk", "gcc-crosssdk-initial"]:
             return True
         return False
     def isPostInstDep(x):
@@ -701,8 +699,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             if isPostInstDep(taskdependees[task][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
                 return False
             continue
-        # Native/Cross packages don't exist and are noexec anyway
-        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
+        # Native/Cross/Crosssdk packages don't exist and are noexec anyway
+        if isNativeCrossCrosssdk(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package']:
             continue
 
         # Consider sysroot depending on sysroot tasks
@@ -713,14 +711,14 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             # Nothing need depend on libc-initial/gcc-cross-initial
             if taskdependees[task][0].endswith("-initial"):
                 continue
-            # Native/Cross populate_sysroot need their dependencies
-            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
+            # Native/Cross/Crosssdk populate_sysroot need their dependencies
+            if isNativeCrossCrosssdk(taskdependees[task][0]) and isNativeCrossCrosssdk(taskdependees[dep][0]):
                 return False
-            # Target populate_sysroot depended on by cross tools need to be installed
-            if isNativeCross(taskdependees[dep][0]):
+            # Target/Nativesdk populate_sysroot depended on by cross/crosssdk tools need to be installed
+            if isNativeCrossCrosssdk(taskdependees[dep][0]):
                 return False
-            # Native/cross tools depended upon by target sysroot are not needed
-            if isNativeCross(taskdependees[task][0]):
+            # Native,Cross/Crosssdk tools depended upon by target/nativesdk sysroot are not needed
+            if isNativeCrossCrosssdk(taskdependees[task][0]):
                 continue
             # Target populate_sysroot need their dependencies
             return False
-- 
1.8.4.1


