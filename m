Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UC8td-0006zo-5Q for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 14:24:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23DFEod028026; Sun, 3 Mar 2013 13:15:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XWoZ3L3McJTX; Sun,  3 Mar 2013 13:15:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23DF5EP028021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 3 Mar 2013 13:15:08 GMT
Message-ID: <1362316038.4325.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 03 Mar 2013 13:07:18 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] buildhistory: Allow the version backwards check to be disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Mar 2013 13:24:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When the PR service is not enabled, the versions can go backwards and there
are cases we don't want to know about this. This patch adds a variable
allowing these checks to be turned off whilst still using buildhistory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a20d03d..43780ad 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -14,6 +14,7 @@ BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
+BUILDHISTORY_CHECKVERBACKWARDS ?= "1"
 
 # Must inherit package first before changing PACKAGEFUNCS
 inherit package
@@ -183,14 +184,15 @@ python buildhistory_emit_pkghistory() {
         # Find out what the last version was
         # Make sure the version did not decrease
         #
-        lastversion = getlastpkgversion(pkg)
-        if lastversion:
-            last_pkge = lastversion.pkge
-            last_pkgv = lastversion.pkgv
-            last_pkgr = lastversion.pkgr
-            r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
-            if r < 0:
-                bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr))
+        if d.getVar("BUILDHISTORY_CHECKVERBACKWARDS", True) == "1":
+            lastversion = getlastpkgversion(pkg)
+            if lastversion:
+                last_pkge = lastversion.pkge
+                last_pkgv = lastversion.pkgv
+                last_pkgr = lastversion.pkgr
+                r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
+                if r < 0:
+                    bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr))
 
         pkginfo = PackageInfo(pkg)
         # Apparently the version can be different on a per-package basis (see Python)




