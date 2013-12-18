Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E0FD660DCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:56:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDuDA6004760 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:56:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lXt3-odplQ7N
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:56:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDu6Pn004750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:56:08 GMT
Message-ID: <1387374962.6402.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 13:56:02 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Get rid of crazy name mapping
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
X-List-Received-Date: Wed, 18 Dec 2013 13:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When originally developed, it was thought a task may have more than one associated
sstate archive. The way the code has grown that idea is now not possible or needed.
We can therefore assume one sstate archive per task and drop the crazy name
mapping code. Simpler is better in this case.

The downside is that various sstate archives will change name so this forces a cache
rebuild. Given the other sstate changes going in at this time, this isn't really
a bad thing as things would rebuild anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 54c2344..961a532 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -45,7 +45,6 @@ ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
 ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
 
 SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
@@ -56,7 +55,6 @@ python do_archive_scripts_logs_setscene () {
 addtask do_archive_scripts_logs_setscene
 
 SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
 do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
 do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 7e9ed6d..e271a08 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -45,7 +45,6 @@ ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
 ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
 
 SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
@@ -56,7 +55,6 @@ python do_archive_scripts_logs_setscene () {
 addtask do_archive_scripts_logs_setscene
 
 SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
 do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
 do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index d8d494a..c5f5cca 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -45,7 +45,6 @@ ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
 ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
 
 SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
@@ -56,7 +55,6 @@ python do_archive_scripts_logs_setscene () {
 addtask do_archive_scripts_logs_setscene
 
 SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
 do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
 do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
 
diff --git a/meta/classes/deploy.bbclass b/meta/classes/deploy.bbclass
index c337142..78f5e4a 100644
--- a/meta/classes/deploy.bbclass
+++ b/meta/classes/deploy.bbclass
@@ -1,6 +1,5 @@
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
-do_deploy[sstate-name] = "deploy"
 do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8ad55f8..f075f59 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -351,7 +351,6 @@ def check_license_flags(d):
     return None
 
 SSTATETASKS += "do_populate_lic"
-do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44a852f..eb4cf44 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1931,7 +1931,6 @@ addtask package before do_build after do_install
 
 PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 SSTATETASKS += "do_package"
-do_package[sstate-name] = "package"
 do_package[cleandirs] = "${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
@@ -1949,7 +1948,6 @@ do_packagedata () {
 addtask packagedata before do_build after do_package
 
 SSTATETASKS += "do_packagedata"
-do_packagedata[sstate-name] = "packagedata"
 do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
 do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d18c250..82ff432 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -412,7 +412,6 @@ python do_package_deb () {
 }
 
 SSTATETASKS += "do_package_write_deb"
-do_package_write_deb[sstate-name] = "deploy-deb"
 do_package_write_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[sstate-outputdirs] = "${DEPLOY_DIR_DEB}"
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d0db945..e7b2755 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -415,7 +415,6 @@ python do_package_ipk () {
 }
 
 SSTATETASKS += "do_package_write_ipk"
-do_package_write_ipk[sstate-name] = "deploy-ipk"
 do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 346b7ab..fcde73e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1172,7 +1172,6 @@ python () {
 }
 
 SSTATETASKS += "do_package_write_rpm"
-do_package_write_rpm[sstate-name] = "deploy-rpm"
 do_package_write_rpm[sstate-inputdirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
 # Take a shared lock, we can write multiple packages at the same time...
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9df9ac2..199a5b3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -69,12 +69,9 @@ python () {
 
     unique_tasks = set((d.getVar('SSTATETASKS', True) or "").split())
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
-    namemap = []
     for task in unique_tasks:
-        namemap.append(d.getVarFlag(task, 'sstate-name'))
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
-    d.setVar('SSTATETASKNAMES', " ".join(namemap))
 }
 
 def sstate_init(name, task, d):
@@ -94,7 +91,9 @@ def sstate_state_fromvars(d, task = None):
             bb.fatal("sstate code running without task context?!")
         task = task.replace("_setscene", "")
 
-    name = d.getVarFlag("do_" + task, 'sstate-name', True)
+    name = task
+    if task.startswith("do_"):
+        name = task[3:]
     inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs', True) or "").split()
     outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs', True) or "").split()
     plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs', True) or "").split()
@@ -297,7 +296,7 @@ def sstate_clean_cachefile(ss, d):
 
 def sstate_clean_cachefiles(d):
     for task in (d.getVar('SSTATETASKS', True) or "").split():
-        ss = sstate_state_fromvars(d, task[3:])
+        ss = sstate_state_fromvars(d, task)
         sstate_clean_cachefile(ss, d)
 
 def sstate_clean_manifest(manifest, d):
@@ -365,11 +364,9 @@ python sstate_cleanall() {
     if not os.path.exists(manifest_dir):
         return
 
-    namemap = d.getVar('SSTATETASKNAMES', True).split()
     tasks = d.getVar('SSTATETASKS', True).split()
-    for name in namemap:
-        taskname = tasks[namemap.index(name)]
-        shared_state = sstate_state_fromvars(d, taskname[3:])
+    for name in tasks:
+        shared_state = sstate_state_fromvars(d, name)
         sstate_clean(shared_state, d)
 }
 
@@ -592,20 +589,11 @@ sstate_unpack_package () {
 	tar -xmvzf ${SSTATE_PKG}
 }
 
-# Need to inject information about classes not in the global configuration scope
-EXTRASSTATEMAPS += "do_deploy:deploy"
-
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
-    mapping = {}
-    for t in d.getVar("SSTATETASKS", True).split():
-        mapping[t] = d.getVarFlag(t, "sstate-name", True)
-    for extra in d.getVar("EXTRASSTATEMAPS", True).split():
-        e = extra.split(":")
-        mapping[e[0]] = e[1]
 
     def getpathcomponents(task, d):
         # Magic data from BB_HASHFILENAME
@@ -614,8 +602,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         extrapath = splithashfn[0]
 
         tname = sq_task[task][3:]
-        if sq_task[task] in mapping:
-            tname = mapping[sq_task[task]]
 
         if tname in ["fetch", "unpack", "patch"] and splithashfn[2]:
             spec = splithashfn[2]
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 3985763..d17a53e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -97,7 +97,6 @@ python do_populate_sysroot () {
 
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"
-do_populate_sysroot[sstate-name] = "populate-sysroot"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/"
 do_populate_sysroot[stamp-extra-info] = "${MACHINE}"



