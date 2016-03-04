Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D19336FF22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 17:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24HAnZw004514 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 17:10:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 54GMvvlfA15p
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 17:10:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24HAmlm004510
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 17:10:49 GMT
Message-ID: <1457111448.2804.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 17:10:48 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Allow late expansion of NATIVELSBSTRING
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
X-List-Received-Date: Fri, 04 Mar 2016 17:10:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

uninative needs to adjust NATIVELSBSTRING fairly late in the
configuration parsing process but the sstate code encodes it into
variables. Since this string doesn't vary on a per recipe basis, we
defer its expansion until usage time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3499d2e..6f285da 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -31,7 +31,7 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
-BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
+BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
@@ -79,6 +79,7 @@ python () {
 
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
+        d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "*/")
 
     # These classes encode staging paths into their scripts data so can only be
@@ -721,7 +722,10 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         # Magic data from BB_HASHFILENAME
         splithashfn = sq_hashfn[task].split(" ")
         spec = splithashfn[1]
-        extrapath = splithashfn[0]
+        if splithashfn[0] == "True":
+            extrapath = d.getVar("NATIVELSBSTRING", True) + "/"
+        else:
+            extrapath = ""
 
         tname = sq_task[task][3:]
 



