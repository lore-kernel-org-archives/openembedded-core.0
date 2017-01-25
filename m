Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6E9B71E4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeOfE022766; Wed, 25 Jan 2017 11:40:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cs16KJMMPMGF; Wed, 25 Jan 2017 11:40:24 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeLpL022744
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:40:22 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWLw5-0001ND-Qg; Wed, 25 Jan 2017 11:40:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:40:15 +0000
Message-Id: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] staging: Remove hardcoded PACKAGE_ARCHS from the class
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
X-List-Received-Date: Wed, 25 Jan 2017 11:40:26 -0000

The code was making an assumption that the only PACKAGE_ARCH in use
was TUNE_PKGARCH. This is incorrect so iterate over the list from
PACKAGE_EXTRA_ARCH instead.

[Thanks to Andrew Goodbody <andrew.goodbody@cambrionix.com> for
testing/fixing]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fc387ea..db99518 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -304,7 +304,9 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
         pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
         targetdir = nativesysroot
     else:
-        pkgarchs = ['${MACHINE_ARCH}', '${TUNE_PKGARCH}', 'allarch']
+        pkgarchs = ['${MACHINE_ARCH}']
+        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
+        pkgarchs.append('allarch')
         targetdir = targetsysroot
 
     bb.utils.mkdirhier(targetdir)
@@ -528,11 +530,13 @@ python extend_recipe_sysroot() {
             manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
             native = True
         else:
-            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE_ARCH}-%s.populate_sysroot" % c)
-            if not os.path.exists(manifest):
-                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${TUNE_PKGARCH}-%s.populate_sysroot" % c)
-            if not os.path.exists(manifest):
-                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-allarch-%s.populate_sysroot" % c)
+            pkgarchs = ['${MACHINE_ARCH}']
+            pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
+            pkgarchs.append('allarch')
+            for pkgarch in pkgarchs:
+                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.populate_sysroot" % (pkgarch, c))
+                if os.path.exists(manifest):
+                    break
         if not os.path.exists(manifest):
             bb.warn("Manifest %s not found?" % manifest)
         else:
-- 
2.7.4


