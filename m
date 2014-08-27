Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 136336FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7REljb8004582 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:48:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vhzI7L11hlji
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:48:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7REm7RO004603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:48:08 +0100
Message-ID: <1409150889.29296.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 15:48:09 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add extra intercept functions
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
X-List-Received-Date: Wed, 27 Aug 2014 14:48:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In some cases we do either need to add extra sstate manipulation
functions, or change the existing modification functions. This patch
parametrises them to SSTATECREATEFUNCS and SSTATEPOSTUNPACKFUNCS and
abstracts the "hardcoded path" functions into separate functions using
these new variables.

We may use this new functionality to improve binary relocating using
patchelf for example, this at least lets us have the hooks to be able to
experiment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3411fac..940b19e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -32,8 +32,10 @@ BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
-SSTATEPREINSTFUNCS ?= ""
-SSTATEPOSTINSTFUNCS ?= ""
+SSTATECREATEFUNCS = "sstate_hardcode_path"
+SSTATEPREINSTFUNCS = ""
+SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
+SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= ""
 
 # Specify dirs in which the shell function is executed and don't use ${B}
@@ -239,16 +241,32 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
     d.setVar('SSTATE_PKG', sstatepkg)
 
-    for preinst in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split():
-        bb.build.exec_func(preinst, d)
+    for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
+        bb.build.exec_func(f, d)
 
-    bb.build.exec_func('sstate_unpack_package', d)
+    for state in ss['dirs']:
+        prepdir(state[1])
+        os.rename(sstateinst + state[0], state[1])
+    sstate_install(ss, d)
 
+    for plain in ss['plaindirs']:
+        workdir = d.getVar('WORKDIR', True)
+        src = sstateinst + "/" + plain.replace(workdir, '')
+        dest = plain
+        bb.utils.mkdirhier(src)
+        prepdir(dest)
+        os.rename(src, dest)
+
+    return True
+
+python sstate_hardcode_path_unpack () {
     # Fixup hardcoded paths
     #
     # Note: The logic below must match the reverse logic in
     # sstate_hardcode_path(d)
+    import subprocess
 
+    sstateinst = d.getVar('SSTATE_INSTDIR', True)
     fixmefn =  sstateinst + "fixmepath"
     if os.path.isfile(fixmefn):
         staging = d.getVar('STAGING_DIR', True)
@@ -276,21 +294,7 @@ def sstate_installpkg(ss, d):
         # Need to remove this or we'd copy it into the target directory and may 
         # conflict with another writer
         os.remove(fixmefn)
-
-    for state in ss['dirs']:
-        prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
-    sstate_install(ss, d)
-
-    for plain in ss['plaindirs']:
-        workdir = d.getVar('WORKDIR', True)
-        src = sstateinst + "/" + plain.replace(workdir, '')
-        dest = plain
-        bb.utils.mkdirhier(src)
-        prepdir(dest)
-        os.rename(src, dest)
-
-    return True
+}
 
 def sstate_clean_cachefile(ss, d):
     import oe.path
@@ -395,7 +399,7 @@ python sstate_cleanall() {
         sstate_clean(shared_state, ld)
 }
 
-def sstate_hardcode_path(d):
+python sstate_hardcode_path () {
     import subprocess, platform
 
     # Need to remove hardcoded paths and fix these when we install the
@@ -449,6 +453,7 @@ def sstate_hardcode_path(d):
     else:
         bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
         subprocess.call(sstate_filelist_relative_cmd, shell=True)
+}
 
 def sstate_package(ss, d):
     import oe.path
@@ -506,9 +511,10 @@ def sstate_package(ss, d):
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
-    sstate_hardcode_path(d)
-    bb.build.exec_func('sstate_create_package', d)
-    
+
+    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package']:
+        bb.build.exec_func(f, d)
+  
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
     return



