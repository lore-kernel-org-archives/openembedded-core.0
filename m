Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CA0FE6AE14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:06:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34H6gvR025037 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:06:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mC-3JnQJ3Yqh
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 18:06:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34H6cX7025022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 18:06:39 +0100
Message-ID: <1396631192.13862.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Apr 2014 18:06:32 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Remove name sstate parameter
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
X-List-Received-Date: Fri, 04 Apr 2014 17:06:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A while ago we stopped supporting sstate names which were different from the
taskname. This patch finishes cleaning up some code remnants from that
which were causing data duplication and confusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f371fda..297e29f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -78,10 +78,9 @@ python () {
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
 }
 
-def sstate_init(name, task, d):
+def sstate_init(task, d):
     ss = {}
     ss['task'] = task
-    ss['name'] = name
     ss['dirs'] = []
     ss['plaindirs'] = []
     ss['lockfiles'] = []
@@ -95,24 +94,22 @@ def sstate_state_fromvars(d, task = None):
             bb.fatal("sstate code running without task context?!")
         task = task.replace("_setscene", "")
 
-    name = task
     if task.startswith("do_"):
-        name = task[3:]
-        task = name
+        task = task[3:]
     inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs', True) or "").split()
     outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs', True) or "").split()
     plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs', True) or "").split()
     lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile', True) or "").split()
     lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared', True) or "").split()
     interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs', True) or "").split()
-    if not name or len(inputs) != len(outputs):
+    if not task or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
 
-    if name == "populate_lic":
+    if task == "populate_lic":
         d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
         d.setVar("SSTATE_EXTRAPATH", "")
 
-    ss = sstate_init(name, task, d)
+    ss = sstate_init(task, d)
     for i in range(len(inputs)):
         sstate_add(ss, inputs[i], outputs[i], d)
     ss['lockfiles'] = lockfiles
@@ -144,7 +141,7 @@ def sstate_install(ss, d):
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
-    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['task'])
 
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
@@ -230,9 +227,9 @@ def sstate_installpkg(ss, d):
         bb.utils.mkdirhier(dir)
         oe.path.remove(dir)
 
-    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
-    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] + ".tgz"
-    sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
+    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
+    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['task'] + ".tgz"
+    sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['task'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, sstatepkg, d)
@@ -302,7 +299,7 @@ def sstate_installpkg(ss, d):
 def sstate_clean_cachefile(ss, d):
     import oe.path
 
-    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['name'] + ".tgz*"
+    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['task'] + ".tgz*"
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
@@ -350,7 +347,7 @@ def sstate_clean(ss, d):
     else:
         wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])
 
-    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['task'])
 
     if os.path.exists(manifest):
         locks = []
@@ -483,8 +480,8 @@ def sstate_package(ss, d):
 
     tmpdir = d.getVar('TMPDIR', True)
 
-    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['name'])
-    sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['name'] + ".tgz"
+    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
+    sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + ".tgz"
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
     bb.utils.mkdirhier(os.path.dirname(sstatepkg))



