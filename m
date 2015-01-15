Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90D947210E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0FA45J1001532 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:04:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Yh865t4oRs_l
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:04:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0FA3otv001502
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:04:01 GMT
Message-ID: <1421316230.31262.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 10:03:50 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian/meta-environment: Allow modification of TARGET_OS to be optional
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
X-List-Received-Date: Thu, 15 Jan 2015 10:04:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are some cases we want the manipulation cross-canadian performance
on TARGET_OS, there are also cases like meta-environment where we do not
want this manipulation.

We did try and use immediate expansion to avoid this problem and it
works in the non multilib case. If we have a multilib that used an
extension, like for example:

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE = "mips32r2"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

then the n32 extension case will be misconfigured.

It turns out saving an unexpanded variable is hard. The best I could
come up with was:

SAVEDTOS := "${@d.getVar('TARGET_OS', False).replace("{", "*")}"

and then

localdata.setVar("TARGET_OS", d.getVar("SAVEDOS", False).replace('*','{'))

which is rather evil, I'd challenge someone to come up with a nicer way
of making it work though!

Rather than the above madness, we modify cross-canadian to make the
problamtic code conditional.

This fixes the original issue (where a linux-gnuspe target was seeing
'linux') of
http://cgit.openembedded.org/openembedded-core/commit/?id=0038634ee6e2b6035c023a2702547f20f67c103a
but also fixes the multilib one.


Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index fec6438..824be07 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -16,6 +16,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 CANADIANEXTRAOS = ""
+MODIFYTOS = "1"
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
@@ -23,6 +24,9 @@ python () {
         sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 
+    # Allow the following code segment to be disabled, e.g. meta-environment
+    if d.getVar("MODIFYTOS", True) != "1":
+        return
     # PowerPC can build "linux" and "linux-gnuspe"
     tarch = d.getVar("TARGET_ARCH", True)
     if tarch == "powerpc":
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index b3737bb..5d72e38 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -6,9 +6,9 @@ PR = "r8"
 
 EXCLUDE_FROM_WORLD = "1"
 
-ORIGOS := "${TARGET_OS}"
+MODIFYTOS = "0"
 
-REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${ORIGOS}"
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
@@ -30,7 +30,6 @@ python do_generate_content() {
 
     # make sure we only use the SDKTARGETSYSROOT value from 'd'
     localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
-    localdata.setVar('TARGET_OS', d.getVar('ORIGOS', True))
     localdata.setVar('libdir', d.getVar('target_libdir', False))
 
     # Process DEFAULTTUNE



