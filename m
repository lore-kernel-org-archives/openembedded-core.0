Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C28647649D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VASaGa020177 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:28:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MqAAp6FO-sCV
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:28:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VASMvM020174
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:28:33 +0100
Message-ID: <1438338502.22462.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:28:22 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] libgcc: Fix symlink handling in cross-arch multilib cases
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
X-List-Received-Date: Fri, 31 Jul 2015 10:28:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The symlink being generated needs to match both the current arch (e.g. mips
or mips64) but also use the underlying TARGET_SYS without multilib extensions
to TARGET_VENDOR or extensions to TARGET_OS.

The way multilib changes TARGET_VENDOR meant this code did not have
a way of removing that change. The method of removing some TARGET_OS
suffixes was also not working.

By using immediate expansion to run this code, we can run before the
multilib code changes it and get the original values.

We then use the *current* TARGET_ARCH value in case this does get changed
by the multilib since we need to point at the right compiler (32 bit one
for 32 bit code).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 3101762..22da03b 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -116,23 +116,23 @@ fakeroot python do_multilib_install() {
         os.symlink(src, dest)
 }
 
+def get_original_vendoros(d):
+    vendoros = d.expand('${TARGET_VENDOR}-${TARGET_OS}')
+    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
+        if suffix and vendoros.endswith(suffix):
+            vendoros = vendoros[:-len(suffix)]
+    return vendoros
+
+ORIG_TARGET_VENDOROS := "${@get_original_vendoros(d)}"
+BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
+
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {
-    targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
+    targetsys = d.getVar('BASETARGET_SYS', True)
 
-    if targetsysnoext != d.getVar('TARGET_SYS', True):
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsysnoext
+    if targetsys != d.getVar('TARGET_SYS', True):
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsys
         src = d.getVar('TARGET_SYS', True)
         if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
             os.symlink(src, dest)
 }
-
-python () {
-    targetsysnoext = d.getVar('TARGET_SYS', True)
-
-    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
-        if suffix and targetsysnoext.endswith(suffix):
-            targetsysnoext = targetsysnoext[:-len(suffix)]
-
-    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
-}
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 35432c7..739adbd 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -24,7 +24,7 @@ FILES_${PN}-dev = "\
     ${libdir}/${TARGET_SYS}/${BINV}/x32 \
     ${libdir}/${TARGET_SYS}/${BINV}/n32 \
     ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
-    ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)} \
+    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
 "
 



