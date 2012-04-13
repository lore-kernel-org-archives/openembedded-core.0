Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIgT4-0001Ff-NG for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 15:23:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DDDrb1002740
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 14:13:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01444-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 14:13:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DDDlIn002733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 14:13:48 +0100
Message-ID: <1334322828.7309.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 14:13:48 +0100
In-Reply-To: <1334318173.7309.70.camel@ted>
References: <1334318173.7309.70.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCHv2] gcc-4.6: Add fix for relocation problem and ccache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 13:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the toolchain is reused from sstate and ccache is installed, build failures
were occuring due to gcc trying to access the original sysroot rather than the
new one, particularly if the old sysroot existed but was not readable by the
current user.

This turns out of the an issue inside gcc to do with preservation of the sysroot
option. See the gcc patch for more details. It only triggers when preprocessed
sources are used which happens when ccache is used.

The same issue occurs with c++ and c++-cpp-output so the same fix is applied there.

[YOCTO #2074]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index d40a534..020e21b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r24"
+PR = "r25"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -73,6 +73,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://gcc-arm-set-cost.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://fortran-cross-compile-hack.patch \
+	   file://cpp-honour-sysroot.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
new file mode 100644
index 0000000..4792c20
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
@@ -0,0 +1,40 @@
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location 
+rather than the --sysroot option specified on the commandline. If access to that directory is 
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix, 
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+Upstream-Status: Pending
+
+RP 2012/04/13
+
+Index: gcc-4_6-branch/gcc/gcc.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/gcc.c	2012-04-13 12:24:37.939671140 +0000
++++ gcc-4_6-branch/gcc/gcc.c	2012-04-13 12:24:54.439670688 +0000
+@@ -953,7 +953,7 @@
+                     %W{o*:--output-pch=%*}}%V}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
+Index: gcc-4_6-branch/gcc/cp/lang-specs.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/cp/lang-specs.h	2012-04-13 12:25:01.019670594 +0000
++++ gcc-4_6-branch/gcc/cp/lang-specs.h	2012-04-13 12:25:07.567670180 +0000
+@@ -64,5 +64,5 @@
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+    "%{!M:%{!MM:%{!E:\
+-    cc1plus -fpreprocessed %i %(cc1_options) %2\
++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
+     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},




