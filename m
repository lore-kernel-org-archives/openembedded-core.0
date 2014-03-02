Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C39DA6F4FE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:36:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s22Han2d023816 for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:36:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IRFgxWUNh-4x
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:36:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s22HakiV023812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:36:47 GMT
Message-ID: <1393781798.22581.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 02 Mar 2014 17:36:38 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Limit aclocal files to those in dependencies
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
X-List-Received-Date: Sun, 02 Mar 2014 17:36:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We still occasionally see race issues with cp-noerror, and it copies 
too many files, we should limit the the m4 files to those explicitly in 
the DEPENDS for the recipe.

This change takes advantage of the BB_TASKDEPDATA data from bitbake to
only copy in those files listed in the manifest of the recipes in DEPENDS.

I've had this testing locally for some time, its ready for wider 
review/testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 883eb06..01e49c9 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -130,28 +130,51 @@ autotools_postconfigure(){
 
 EXTRACONFFUNCS ??= ""
 
-do_configure[prefuncs] += "autotools_preconfigure ${EXTRACONFFUNCS}"
+do_configure[prefuncs] += "autotools_preconfigure autotools_copy_aclocals ${EXTRACONFFUNCS}"
 do_configure[postfuncs] += "autotools_postconfigure"
 
 ACLOCALDIR = "${B}/aclocal-copy"
 
-autotools_copy_aclocal () {
-	# Remove any previous copy of the m4 macros
-	rm -rf ${ACLOCALDIR}/
-
-	# The aclocal directory could get modified by other processes
-	# uninstalling data from the sysroot. See Yocto #861 for details.
-	# We avoid this by taking a copy here and then files cannot disappear.
-	# We copy native first, then target. This avoids certain races since cp-noerror
-	# won't overwrite existing files.
-	mkdir -p ${ACLOCALDIR}/
-	if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
-		cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${ACLOCALDIR}/
-	fi
-	if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/aclocal" != "${STAGING_DATADIR}/aclocal" ]; then
-		cp-noerror ${STAGING_DATADIR}/aclocal/ ${ACLOCALDIR}/
-	fi
+python autotools_copy_aclocals () {
+    s = d.getVar("S", True)
+    if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
+        return
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    pn = d.getVar("PN", True)
+    aclocaldir = d.getVar("ACLOCALDIR", True)
+    oe.path.remove(aclocaldir)
+    bb.utils.mkdirhier(aclocaldir)
+    configuredeps = []
+    for dep in taskdepdata:
+        data = taskdepdata[dep]
+        if data[1] == "do_configure" and data[0] != pn:
+            configuredeps.append(data[0])
+
+    cp = []
+    for c in configuredeps:
+        if c.endswith("-native"):
+            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
+        elif c.startswith("nativesdk-"):
+            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}-%s.populate_sysroot" % c)
+        elif c.endswith("-cross") or c.endswith("-cross-initial") or c.endswith("-crosssdk") or c.endswith("-crosssdk-initial"):
+            continue
+        else:
+            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE}-%s.populate_sysroot" % c)
+        try:
+            f = open(manifest, "r")
+            for l in f:
+                if "/aclocal/" in l and l.strip().endswith(".m4"):
+                    cp.append(l.strip())
+        except:
+            bb.warn("%s not found" % manifest)
+
+    for c in cp:
+        t = os.path.join(aclocaldir, os.path.basename(c))
+        if not os.path.exists(t):
+            os.symlink(c, t)
 }
+autotools_copy_aclocals[vardepsexclude] += "MACHINE"
 
 autotools_do_configure() {
 	# WARNING: gross hack follows:
@@ -168,7 +191,6 @@ autotools_do_configure() {
 	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
 		olddir=`pwd`
 		cd ${S}
-		autotools_copy_aclocal
 		ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=



