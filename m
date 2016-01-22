Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 477E174197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MHHD7L010488 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:17:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d8vDVFB1FaVW
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:17:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MHHARB010484
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:17:11 GMT
Message-ID: <1453483030.6378.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 17:17:10 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative: Fix conflicts with normal sysroot
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
X-List-Received-Date: Fri, 22 Jan 2016 17:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently this code installs into the standard sysroot, however this causes
some conflicts when linking since the linker can look specifically for
versioned .so files (e.g. like libpthreads.so.0). This breaks builds
of util-linux-native for example.

The easiest solution is to install uninative into its own separate sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index fe1e89b..8686159 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,6 +1,6 @@
 NATIVELSBSTRING = "universal"
 
-UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64', '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2', '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
+UNINATIVE_LOADER ?= "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
 
 UNINATIVE_URL ?= "unset"
 UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
@@ -41,7 +41,8 @@ python uninative_eventhandler() {
                 fetcher.download()
             except Exception as exc:
                 bb.fatal("Unable to download uninative tarball: %s" % str(exc))
-        cmd = e.data.expand("mkdir -p ${STAGING_DIR}; cd ${STAGING_DIR}; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}/relocate_sdk.py ${STAGING_DIR_NATIVE} ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_BINDIR_NATIVE}/patchelf-uninative")
+
+        cmd = e.data.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/patchelf-uninative")
         try:
             subprocess.check_call(cmd, shell=True)
         except subprocess.CalledProcessError as exc:
@@ -51,6 +52,8 @@ python uninative_eventhandler() {
 
 SSTATEPOSTUNPACKFUNCS_append = " uninative_changeinterp"
 
+PATH_prepend = "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:"
+
 python uninative_changeinterp () {
     import subprocess
     import stat



