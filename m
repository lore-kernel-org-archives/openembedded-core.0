Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA3460E01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:55:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDru8C004600 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:55:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bNTz_Fpx1o0S
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:55:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIDtCvl004719
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:55:14 GMT
Message-ID: <1387374908.6402.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 13:55:08 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate/gcc: Fix shared workdir handling for siginfo files
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
X-List-Received-Date: Wed, 18 Dec 2013 13:55:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For a shared workdir, any one of the fetch/unpack/patch tasks may run yet the 
PN and architecture fields in SSTATE_PKGSPEC may differ. This makes looking up
the appropriate siginfo file near impossible.

I've tried several different ways of resolving this and this is the neatest
solution I could find, its still rather ugly. I believe the usefulness of 
better sstate debugging outweighs the ugliness of the code.

This patch also changes the sstate_checkhashes() code to look for siginfo 
files rather than the actual sstate packages themselves. This means the
function can be used in other contexts to find info files for tasks that
may not have sstate data. It is assumed that sstate mirrors will have both
files available. This is done to allow bitbake to query whether tasks have
matching signatures in sstate directories or not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 678d5e3..9df9ac2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -10,6 +10,7 @@ def generate_sstatefn(spec, hash, d):
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
+SSTATE_SWSPEC     = ""
 SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
@@ -26,7 +27,7 @@ SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
-BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC}"
+BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -606,11 +607,28 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         e = extra.split(":")
         mapping[e[0]] = e[1]
 
+    def getpathcomponents(task, d):
+        # Magic data from BB_HASHFILENAME
+        splithashfn = sq_hashfn[task].split(" ")
+        spec = splithashfn[1]
+        extrapath = splithashfn[0]
+
+        tname = sq_task[task][3:]
+        if sq_task[task] in mapping:
+            tname = mapping[sq_task[task]]
+
+        if tname in ["fetch", "unpack", "patch"] and splithashfn[2]:
+            spec = splithashfn[2]
+            extrapath = ""
+
+        return spec, extrapath, tname
+
+
     for task in range(len(sq_fn)):
-        spec = sq_hashfn[task].split(" ")[1]
-        extrapath = sq_hashfn[task].split(" ")[0]
 
-        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
+        spec, extrapath, tname = getpathcomponents(task, d)
+
+        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz.siginfo")
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             ret.append(task)
@@ -639,9 +657,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            spec = sq_hashfn[task].split(" ")[1]
-            extrapath = sq_hashfn[task].split(" ")[0]
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
+            spec, extrapath, tname = getpathcomponents(task, d)
+
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz.siginfo")
 
             srcuri = "file://" + sstatefile
             localdata.setVar('SRC_URI', srcuri)
@@ -743,6 +761,12 @@ python sstate_eventhandler() {
     spkg = d.getVar('SSTATE_PKG', True)
     if not spkg.endswith(".tgz"):
         taskname = d.getVar("BB_RUNTASK", True)[3:]
-        bb.siggen.dump_this_task(d.getVar('SSTATE_PKG', True) + '_' + taskname + ".tgz" ".siginfo", d)
+        spec = d.getVar('SSTATE_PKGSPEC', True)
+        swspec = d.getVar('SSTATE_SWSPEC', True)
+        if taskname in ["fetch", "unpack", "patch"] and swspec:
+            d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
+            d.setVar("SSTATE_EXTRAPATH", "")
+        sstatepkg = d.getVar('SSTATE_PKG', True)
+        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 55c6185..e49d724 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -95,6 +95,7 @@ do_patch[stamp-base-clean] = "${SSCLEAN}"
 
 # SW means Shared Work directory
 SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
+SSTATE_SWSPEC = "sstate-gcc-${PV}-${PR}-${SSTATE_VERSION}-"
 WORKDIR_task-unpack = "${SW}"
 WORKDIR_task-patch = "${SW}"
 



