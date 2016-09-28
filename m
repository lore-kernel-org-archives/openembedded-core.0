Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF17D605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 14:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8SExbhF001496; Wed, 28 Sep 2016 15:59:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ka9ubEcu9Kgy; Wed, 28 Sep 2016 15:59:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8SExYVI001493
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 28 Sep 2016 15:59:35 +0100
Message-ID: <1475074774.30475.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2016 15:59:34 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian/libgcc-common: Fixes for arm multilib
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
X-List-Received-Date: Wed, 28 Sep 2016 14:59:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Arm is unusual in that we force it to "linux-gnueabi" and "linux" doesn't
build. This was causing problems for multilib configurations which were assuming
"linux" was the default compiler rather than linux-gnueabi.

This change does two things, ensures symlinks are generated for linux-gnueabi
and also adapts the libgcc code to account for the difference on arm.

It still needs to immediately expand/save TARGET_VENDOR but we defer
deciding what TARGET_OS should be until we know TARGET_ARCH (which the
multilib code may change).

[YOCTO #8642]

Note that sanity tests of a 32 bit arm multilib still break due to issues
with the kernel headers on a mixed bit system. This looks to be a general
headers issue for the platform though and a different type of bug.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 099c0da..21921b3 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -80,7 +80,7 @@ python () {
         for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
             d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
     if tarch == "arm" or tarch == "armeb":
-        d.appendVar("CANADIANEXTRAOS", " linux-musleabi linux-uclibceabi")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi linux-uclibceabi")
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 4e4f0fd..1549eb4 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -123,15 +123,18 @@ fakeroot python do_multilib_install() {
         os.symlink(src, dest)
 }
 
-def get_original_vendoros(d):
-    vendoros = d.expand('${TARGET_VENDOR}-${TARGET_OS}')
+def get_original_os(d):
+    vendoros = d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_OS}')
     for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
         if suffix and vendoros.endswith(suffix):
             vendoros = vendoros[:-len(suffix)]
+    # Arm must use linux-gnueabi not linux as only the former is accepted by gcc
+    if vendoros.startswith("arm-") and not vendoros.endswith("-gnueabi"):
+        vendoros = vendoros + "-gnueabi"
     return vendoros
 
-ORIG_TARGET_VENDOROS := "${@get_original_vendoros(d)}"
-BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
+ORIG_TARGET_VENDOR := "${TARGET_VENDOR}"
+BASETARGET_SYS = "${@get_original_os(d)}"
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {



