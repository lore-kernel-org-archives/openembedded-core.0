Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbK-0005lt-5k
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7608986"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:10 -0700
Message-Id: <a338b32787fd68c560adca3eb4ac7b09eb04ce38.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/20] util-linux_2.19.1.bb: Fix compliation on uclibc
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:50 -0000

From: Khem Raj <raj.khem@gmail.com>

util-linux 2.19 needs this patch to successfully
compile on uclibc systems. This is a bug in util-linux
that goes unnoticed on eglibc builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc-__progname-conflict.patch               |   31 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    4 ++-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch

diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch
new file mode 100644
index 0000000..45826b1
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch
@@ -0,0 +1,31 @@
+configure should include errno.h instead of argp.h when
+checking for presence of program_invocation_short_name
+uclibc defines this to be const char* unlike util-linux-ng
+which defines this to be char* so this error goes unnoticed
+on glibc/eglibc systems.
+
+here is the error it fixes
+
+in file included from mountP.h:14:0,                                                                               
+                 from cache.c:29:                                                                                  
+/home/kraj/work/slugos/build/tmp-slugos-uclibc/sysroots/nslu2le/usr/include/errno.h:55:46: error: conflicting types for '__progname'                                                                                                  
+../../../include/c.h:118:14: note: previous declaration of '__progname' was here                                   
+make[3]: *** [cache.lo] Error 1          
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: util-linux-2.19.1/configure.ac
+===================================================================
+--- util-linux-2.19.1.orig/configure.ac
++++ util-linux-2.19.1/configure.ac
+@@ -250,7 +250,7 @@ esac
+ 
+ 
+ AC_MSG_CHECKING(whether program_invocation_short_name is defined)
+-AC_TRY_COMPILE([#include <argp.h>],
++AC_TRY_COMPILE([#include <errno.h>],
+                [program_invocation_short_name = "test";],
+                AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
+                          [Define if program_invocation_short_name is defined])
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 7fe7497..8067ab5 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -6,7 +6,9 @@ require util-linux.inc
 LICENSE_util-linux-lscpu = "GPLv3+"
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
-                  file://util-linux-ng-2.16-mount_lock_path.patch"
+            file://util-linux-ng-2.16-mount_lock_path.patch \
+            file://uclibc-__progname-conflict.patch \      
+"
 
 SRC_URI[md5sum] = "3eab06f05163dfa65479c44e5231932c"
 SRC_URI[sha256sum] = "d3eac4afcc687b3ae1ffedcab2dc12df84c7ba7045cce31386d2b7040a011c7d"
-- 
1.7.3.4



