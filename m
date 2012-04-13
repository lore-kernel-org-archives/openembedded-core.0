Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIfG2-00082n-Gj for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:05:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DBuNSh002085
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 12:56:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00827-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 12:56:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DBuDBW002078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 12:56:16 +0100
Message-ID: <1334318173.7309.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 12:56:13 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gcc-4.6: Add fix for relocation problem and ccache
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
X-List-Received-Date: Fri, 13 Apr 2012 12:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the toolchain is reused from sstate and ccache is installed, build failures
were occuring due to gcc trying to access the original sysroot rather than the
new one, particularly if the old sysroot existed but was not readable by the
current user.

This turns out of the an issue inside gcc to do with preservation of the sysroot
option. See the gcc patch for more details. It only triggers when preprocessed
sources are used which happens when ccache is used.

[YOCTO #2074]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index d40a534..3b2e97e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -73,6 +73,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://gcc-arm-set-cost.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://fortran-cross-compile-hack.patch \
+	   file://cpp-honour-sysroot.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
new file mode 100644
index 0000000..808596f
--- a/dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
@@ -0,0 +1,29 @@
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i files), the compiler will try and access the builtin sysroot location 
+rather than the --sysroot option specified on the commandline. If access to that directory is 
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default sustitutions for -iprefix, 
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
+--- gcc-4_6-branch.orig/gcc/gcc.c	2012-04-13 11:21:23.119758988 +0000
++++ gcc-4_6-branch/gcc/gcc.c	2012-04-13 11:21:54.095758269 +0000
+@@ -953,7 +953,7 @@
+                     %W{o*:--output-pch=%*}}%V}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
--
cgit 0.9.0.1




