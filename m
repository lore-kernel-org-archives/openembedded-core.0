Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSDtS-0000uE-T7
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:49:24 +0200
Received: by pvc30 with SMTP id 30so579063pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=INN+ny4Gc2/Z/k8hRgJ8ia9hUS3JNUBr86H11x2wsow=;
	b=FdsiwnQuwgQJP7FfAfGhHuuVciuwib3kE1q5g9PXXKTW7ooA9n44ejLQqmw0ITsulM
	Ww7PVAqu0GkVgSXsyya4FGV6xkXH0cV0NRjbCFTYLfe2A3cMFDBFa14XSMAxZegFxC1j
	j4r6tencY35DNqrRd8R6ATCPWLHz2E+ku+1Ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JF4R66w7foD21j02lc3NlPBwxTxdnvmrV0n+/m2Sxnivak6ICr8d5kZJG8uCQfFz6W
	ic782XDc8h66LbMy5O4lF0aH9Yb10qUFcYf1pdOkmCIheRuElkJKE0zUGviZrlPIcLdu
	i9jPLqD9lh9l54tqyzEaCMbHZwdRe2KAmX7r8=
Received: by 10.142.62.29 with SMTP id k29mr153735wfa.397.1307043966691;
	Thu, 02 Jun 2011 12:46:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f3sm803486pbj.32.2011.06.02.12.46.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:46:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 12:45:26 -0700
Message-Id: <1307043926-18177-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
References: <1307043926-18177-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] util-linux_2.19.1.bb: Fix compliation on uclibc
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
X-List-Received-Date: Thu, 02 Jun 2011 19:49:24 -0000

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
1.7.4.1



