Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ua02Z-0004YQ-Kn
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:48:23 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r488TvnD028811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 01:29:57 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 01:29:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 16:29:48 +0800
Message-ID: <ba423dbc8b288dc7b473d5e6eeabb13b3af8a8a4.1367993762.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367993762.git.liezhi.yang@windriver.com>
References: <cover.1367993762.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: remove the default optimization
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 08:48:26 -0000
Content-Type: text/plain

We had hard coded python-native and python's default optimization to 1,
which made the "assert" statement didn't work, and removed the "-O/-OO"
(optimization options), the target python had a "-N" option to disable
the default optimization, but the native python didn't.

I think that we can set the environment variable PYTHONOPTIMIZE or use
"python -O" if we need to optimize, but I'm not sure whether we need to
set it by default, it would confuse the user or cause/hide unexpected
problems if the "assert" doesn't work.

[YOCTO #4427]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python-native/04-default-is-optimized.patch    | 20 --------
 .../recipes-devtools/python/python-native_2.7.3.bb |  2 +-
 .../python/python/04-default-is-optimized.patch    | 60 ----------------------
 .../python/99-ignore-optimization-flag.patch       | 21 --------
 meta/recipes-devtools/python/python_2.7.3.bb       |  2 -
 5 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
 delete mode 100644 meta/recipes-devtools/python/python/04-default-is-optimized.patch
 delete mode 100644 meta/recipes-devtools/python/python/99-ignore-optimization-flag.patch

diff --git a/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch b/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
deleted file mode 100644
index 8fe147e..0000000
--- a/meta/recipes-devtools/python/python-native/04-default-is-optimized.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# When compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.6.1/Python/compile.c
-===================================================================
---- Python-2.6.1.orig/Python/compile.c
-+++ Python-2.6.1/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 162eced..722d92c 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -4,7 +4,7 @@ EXTRANATIVEPATH += "bzip2-native"
 DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
 PR = "${INC_PR}.1"
 
-SRC_URI += "file://04-default-is-optimized.patch \
+SRC_URI += "\
            file://05-enable-ctypes-cross-build.patch \
            file://06-ctypes-libffi-fix-configure.patch \
            file://10-distutils-fix-swig-parameter.patch \
diff --git a/meta/recipes-devtools/python/python/04-default-is-optimized.patch b/meta/recipes-devtools/python/python/04-default-is-optimized.patch
deleted file mode 100644
index 7ce819a..0000000
--- a/meta/recipes-devtools/python/python/04-default-is-optimized.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Updated original patch for python 2.7.3
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/01
-
-
-# when compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.7.3/Python/compile.c
-===================================================================
---- Python-2.7.3.orig/Python/compile.c
-+++ Python-2.7.3/Python/compile.c
-@@ -32,7 +32,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
-Index: Python-2.7.3/Modules/main.c
-===================================================================
---- Python-2.7.3.orig/Modules/main.c
-+++ Python-2.7.3/Modules/main.c
-@@ -40,7 +40,7 @@ static char **orig_argv;
- static int  orig_argc;
- 
- /* command line options */
--#define BASE_OPTS "3bBc:dEhiJm:OQ:RsStuUvVW:xX?"
-+#define BASE_OPTS "3bBc:dEhiJm:NOQ:RsStuUvVW:xX?"
- 
- #ifndef RISCOS
- #define PROGRAM_OPTS BASE_OPTS
-@@ -69,8 +69,7 @@ Options and arguments (and corresponding
- static char *usage_2 = "\
-          if stdin does not appear to be a terminal; also PYTHONINSPECT=x\n\
- -m mod : run library module as a script (terminates option list)\n\
---O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
---OO    : remove doc-strings in addition to the -O optimizations\n\
-+-N     : do NOT optimize generated bytecode\n\
- -R     : use a pseudo-random salt to make hash() values of various types be\n\
-          unpredictable between separate invocations of the interpreter, as\n\
-          a defense against denial-of-service attacks\n\
-@@ -365,8 +364,8 @@ Py_Main(int argc, char **argv)
- 
-         /* case 'J': reserved for Jython */
- 
--        case 'O':
--            Py_OptimizeFlag++;
-+        case 'N':
-+            Py_OptimizeFlag=0;
-             break;
- 
-         case 'B':
diff --git a/meta/recipes-devtools/python/python/99-ignore-optimization-flag.patch b/meta/recipes-devtools/python/python/99-ignore-optimization-flag.patch
deleted file mode 100644
index a5d9812..0000000
--- a/meta/recipes-devtools/python/python/99-ignore-optimization-flag.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# Reinstate the empty -O option to fix weird mixing of native and target
-# binaries and libraries with LD_LIBRARY_PATH when host==target
-#
-# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
-Index: Python-2.6.6/Modules/main.c
-===================================================================
---- Python-2.6.6.orig/Modules/main.c
-+++ Python-2.6.6/Modules/main.c
-@@ -327,6 +327,9 @@ Py_Main(int argc, char **argv)
- 
-         /* case 'J': reserved for Jython */
- 
-+      	case 'O': /* ignore it */
-+      		break;
-+
-         case 'N':
-             Py_OptimizeFlag=0;
-             break;
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index aace95e..f76f218 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -7,11 +7,9 @@ DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI += "\
   file://01-use-proper-tools-for-cross-build.patch \
   file://03-fix-tkinter-detection.patch \
-  file://04-default-is-optimized.patch \
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
-  file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
   file://cgi_py.patch \
-- 
1.8.1.2



