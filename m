Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B915476551
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAcdO1020832 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:38:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VXQ7Fm9cBgNj
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:38:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAcOdB020794
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:38:35 +0100
Message-ID: <1438339104.22462.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:38:24 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian/gcc: Various mips64 fixes
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
X-List-Received-Date: Fri, 31 Jul 2015 10:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"n32" is a mips64 variant we need to consider when processing the TARGET_OS
extensions. Also add the multilib extensions for mips64.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 832934b..40eb511 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -31,7 +31,7 @@ python () {
 
     tos = d.getVar("TARGET_OS", True)
     whitelist = []
-    for variant in ["", "spe", "x32", "eabi"]:
+    for variant in ["", "spe", "x32", "eabi", "n32"]:
         for libc in ["", "uclibc", "musl"]:
             entry = "linux"
             if variant and libc:
@@ -62,6 +62,8 @@ python () {
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
         d.appendVar("CANADIANEXTRAOS", " linux-gnuspe linux-uclibcspe linux-muslspe")
+    elif tarch == "mips64":
+        d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
     if tarch == "arm":
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 8c07c2d..2e746e5 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -123,6 +123,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/t-linux64'],
         'i686'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
+        'mips64'    : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
     }
@@ -132,6 +133,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/linux64.h'],
         'i686'      : ['gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/mips/linux64.h'],
+        'mips64'    : ['gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
     }



