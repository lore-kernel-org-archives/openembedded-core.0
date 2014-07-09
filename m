Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10FA17047B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:15:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KFir2019112 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:15:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L7n6LR4EKx3b
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 21:15:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69KFerD019063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:15:42 +0100
Message-ID: <1404936934.15985.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Jul 2014 21:15:34 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Wed, 09 Jul 2014 20:15:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its possible to run the package QA checks as a separate task rather than
as part of the do_package task. This offers more parallelism but the
fact that made me propose this is that ideally we'd like to access
pkgdata to help add new tests and to do that, we need to run later in
the task list. We also need to add in RDEPENDS to the task which apply
to do_package_write_* but not do_package. See the subsequent patches
for why this is desireable.

If we split into a separate task, we need to add in calls to read
the sub package data, build the cache structure used by do_package and
cover the task with sstate (which is empty and just acts as a stamp
saying it passed package QA). We also need to handle our own
dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 825ff04..2c60917 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,9 +17,6 @@
 #   files under exec_prefix
 
 
-PACKAGE_DEPENDS += "${QADEPENDS}"
-PACKAGEFUNCS += " do_package_qa "
-
 # unsafe-references-in-binaries requires prelink-rtld from
 # prelink-native, but we don't want this DEPENDS for -native builds
 QADEPENDS = "prelink-native"
@@ -831,6 +828,8 @@ python do_package_qa () {
 
     bb.note("DO PACKAGE QA")
 
+    bb.build.exec_func("read_subpackage_metadata", d)
+
     logdir = d.getVar('T', True)
     pkg = d.getVar('PN', True)
 
@@ -858,6 +857,15 @@ python do_package_qa () {
     pkgdest = d.getVar('PKGDEST', True)
     packages = d.getVar('PACKAGES', True)
 
+    cpath = oe.cachedpath.CachedPath()
+    global pkgfiles
+    pkgfiles = {}
+    for pkg in (packages or "").split():
+        pkgfiles[pkg] = []
+        for walkroot, dirs, files in cpath.walk(pkgdest + "/" + pkg):
+            for file in files:
+                pkgfiles[pkg].append(walkroot + os.sep + file)
+
     # no packages should be scanned
     if not packages:
         return
@@ -912,6 +920,15 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
+addtask do_package_qa after do_package before do_build
+
+SSTATETASKS += "do_package_qa"
+do_package_qa[sstate-inputdirs] = ""
+do_package_qa[sstate-outputdirs] = ""
+python do_package_qa_setscene () {
+    sstate_setscene(d)
+}
+addtask do_package_qa_setscene
 
 python do_qa_staging() {
     bb.note("QA checking staging")
@@ -1021,6 +1038,8 @@ python () {
 
     issues = []
     if (d.getVar('PACKAGES', True) or "").split():
+        for dep in (d.getVar('QADEPENDS', True) or "").split():
+            d.appendVarFlag('do_package_qa', 'depends', " %s:do_populate_sysroot" % dep)
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var):
                 issues.append(var)



