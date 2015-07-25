Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A2DD97627D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 13:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PDm3Q6012379 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 14:48:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nqO8q8iiqu0G
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 14:48:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PDlqGU012368
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 14:48:03 +0100
Message-ID: <1437832072.821.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Jul 2015 14:47:52 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian: Put links in place for uclibc and musl
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
X-List-Received-Date: Sat, 25 Jul 2015 13:48:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gcc-cross-canadian-<arch> is only built once. It needs to target all the
different libcs, not just the currently selected one. This change
ensures that if another libc is used, symlinks are present such that the
compiler can be found. The base version is always assumed to be "glibc"
with symlinks from musl and uclibc compiler names.

This means gcc-cross-canadian is consistent regardless of which libc is
selected when its build in multimachine builds.

[YOCTO #8025]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 18d9d9a..9e06884 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -16,7 +16,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
-CANADIANEXTRAOS = ""
+CANADIANEXTRAOS = "linux-uclibc linux-musl"
 MODIFYTOS ??= "1"
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
@@ -28,25 +28,26 @@ python () {
     # Allow the following code segment to be disabled, e.g. meta-environment
     if d.getVar("MODIFYTOS", True) != "1":
         return
+    tos = d.getVar("TARGET_OS", True)
+    if (tos != "linux" and tos != "linux-gnuspe"
+        and tos != "linux-uclibc" and tos != "linux-uclibcspe"
+        and tos != "linux-musl" and tos != "linux-muslspe"):
+            bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
+    for n in ["PROVIDES", "DEPENDS"]:
+        d.setVar(n, d.getVar(n, True))
+    d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
+    for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
+        n = prefix + "_FOR_TARGET"
+        d.setVar(n, d.getVar(n, True))
     # PowerPC can build "linux" and "linux-gnuspe"
     tarch = d.getVar("TARGET_ARCH", True)
     if tarch == "powerpc":
-        tos = d.getVar("TARGET_OS", True)
-        if (tos != "linux" and tos != "linux-gnuspe"
-            and tos != "linux-uclibc" and tos != "linux-uclibcspe"
-            and tos != "linux-musl" and tos != "linux-muslspe"):
-            bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
         # This is a bit ugly. We need to zero LIBC/ABI extension which will change TARGET_OS
         # however we need the old value in some variables. We expand those here first.
-        d.setVar("DEPENDS", d.getVar("DEPENDS", True))
-        d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
-        for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
-            n = prefix + "_FOR_TARGET"
-            d.setVar(n, d.getVar(n, True))
-
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
-        d.setVar("CANADIANEXTRAOS", "linux-gnuspe")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnuspe linux-uclibcspe linux-muslspe")
+    d.setVar("TARGET_OS", "linux")
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 



