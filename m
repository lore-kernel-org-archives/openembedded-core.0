Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuNxu-0008HW-TJ for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:18:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD7Np7021454
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:07:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21192-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:07:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QD7Ec2021447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:07:15 +0100
Message-ID: <1343308034.29991.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:07:14 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Add a string representing the lsb release to native/cross sstate
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
X-List-Received-Date: Thu, 26 Jul 2012 13:18:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch adds the lsb name and revision to the path used for sstate files.
This means that reuse of sstate files between different distributions is restricted
by default. The behaviour can be configured using mirror urls, for example:

SSTATE_MIRRORS = "file://Ubuntu-11.10/(.*) file://Ubuntu/\1 \n"

would map Ubuntu 11.10 to a more generic "Ubuntu" named sstate feed.

Usually, more modern distros have increased libc versions for example
so whilst more older native/cross sstate packages will usually work on newer
distros, the opposite is not true. This patch allows development of policy
to better handle this although no default policy is currently being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d00779a..e87f3c0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -11,14 +11,17 @@ def generate_sstatefn(spec, hash, d):
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
-SSTATE_PKGNAME    = "${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
+SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
-SSTATE_PATHSPEC   = "${SSTATE_DIR}/*/${SSTATE_PKGSPEC}"
+SSTATE_EXTRAPATH   = ""
+SSTATE_EXTRAPATHWILDCARD = ""
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
+
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
-BB_HASHFILENAME = "${SSTATE_PKGSPEC}"
+BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -43,6 +46,10 @@ python () {
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${MACHINE}"))
 
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d):
+        d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
+        d.setVar('SSTATE_EXTRAPATHWILDCARD', "*/")
+
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
@@ -524,7 +531,10 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     }
 
     for task in range(len(sq_fn)):
-        sstatefile = d.expand("${SSTATE_DIR}/" + generate_sstatefn(sq_hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
+        spec = sq_hashfn[task].split(" ")[1]
+        extrapath = sq_hashfn[task].split(" ")[0]
+
+        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             ret.append(task)
@@ -548,7 +558,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            sstatefile = d.expand(generate_sstatefn(sq_hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
+            spec = sq_hashfn[task].split(" ")[1]
+            extrapath = sq_hashfn[task].split(" ")[0]
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
 
             srcuri = "file://" + sstatefile
             localdata.setVar('SRC_URI', srcuri)




