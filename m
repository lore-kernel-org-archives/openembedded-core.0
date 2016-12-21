Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9F5A77479
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5wru001272; Wed, 21 Dec 2016 17:05:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SNYaLMYbGw3z; Wed, 21 Dec 2016 17:05:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5q6H001235
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Dec 2016 17:05:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cJkKu-0006sp-1T; Wed, 21 Dec 2016 17:05:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:05:42 +0000
Message-Id: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] uninative: Parameterise the use of STAGING_DIR
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
X-List-Received-Date: Wed, 21 Dec 2016 17:06:00 -0000

This means that a user can change TMPDIR in a multiconfig situation
and still only have one path to the uninative setup. Without this change
its not possile to make such a setup work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 177af73..03ad5d6 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,4 +1,5 @@
-UNINATIVE_LOADER ?= "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
+UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
+UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
 UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
@@ -58,7 +59,7 @@ python uninative_event_fetchloader() {
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
                     os.symlink(localpath, tarballpath)
 
-        cmd = d.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
+        cmd = d.expand("mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; cd ${UNINATIVE_STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
         subprocess.check_call(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
@@ -90,7 +91,7 @@ def enable_uninative(d):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+        d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
     import subprocess
-- 
2.7.4


