Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1020A72052
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989837"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:44 -0800
Message-Id: <994a6eeed0716943ce3b50711d044c0436b0a8ab.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 19/19] watchdog: Upgrade to 5.14
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:59 -0000

Move the patches from generic files to watchdog
Rebased the fix-ping due to code reorg on the source

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{files => watchdog}/fix-ping-failure.patch     | 56 ++++++++++++++--------
 .../watchdog/{files => watchdog}/fixsepbuild.patch |  0
 .../{watchdog_5.13.bb => watchdog_5.14.bb}         |  5 +-
 3 files changed, 38 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/watchdog/{files => watchdog}/fix-ping-failure.patch (58%)
 rename meta/recipes-extended/watchdog/{files => watchdog}/fixsepbuild.patch (100%)
 rename meta/recipes-extended/watchdog/{watchdog_5.13.bb => watchdog_5.14.bb} (81%)

diff --git a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch b/meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
similarity index 58%
rename from meta/recipes-extended/watchdog/files/fix-ping-failure.patch
rename to meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
index f5976eb..14ab9c5 100644
--- a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
+++ b/meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
@@ -33,11 +33,11 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  src/watchdog.c |    5 ++++-
  2 files changed, 5 insertions(+), 2 deletions(-)
 
-Index: watchdog-5.13/src/watchdog.c
+Index: watchdog-5.14/src/watchdog.c
 ===================================================================
---- watchdog-5.13.orig/src/watchdog.c	2013-02-01 03:15:44.000000000 -0800
-+++ watchdog-5.13/src/watchdog.c	2013-03-11 22:27:48.741657881 -0700
-@@ -28,6 +28,7 @@
+--- watchdog-5.14.orig/src/watchdog.c
++++ watchdog-5.14/src/watchdog.c
+@@ -24,6 +24,7 @@
  #include <sys/types.h>
  #include <sys/ioctl.h>
  #include <linux/oom.h>
@@ -45,21 +45,35 @@ Index: watchdog-5.13/src/watchdog.c
  #include <linux/watchdog.h>
  #include <string.h>
  
-@@ -567,6 +568,8 @@
-     pid_t child_pid;
-     int oom_adjusted = 0;
-     struct stat s;
-+    struct icmp_filter filt;
-+    filt.data = ~(1<<ICMP_ECHOREPLY);
+Index: watchdog-5.14/src/net.c
+===================================================================
+--- watchdog-5.14.orig/src/net.c
++++ watchdog-5.14/src/net.c
+@@ -11,7 +11,8 @@
+ #include <errno.h>
+ #include <sys/time.h>
+ #include <netinet/ip.h>
+-#include <netinet/ip_icmp.h>
++#include <linux/icmp.h>
++//#include <netinet/ip_icmp.h>
+ #include <fcntl.h>
+ #include <string.h>
+ #include <unistd.h>		/* for gethostname() etc */
+@@ -179,6 +180,9 @@ int open_netcheck(struct list *tlist)
+ {
+ 	struct list *act;
+ 	int hold = 0;
++	struct icmp_filter filt;
++	filt.data = ~(1<<ICMP_ECHOREPLY);
++
+ 
+ 	if (tlist != NULL) {
+ 		for (act = tlist; act != NULL; act = act->next) {
+@@ -202,6 +206,7 @@ int open_netcheck(struct list *tlist)
+ 			    fatal_error(EX_SYSERR, "error opening socket (%s)", strerror(errno));
+ 			}
+ 
++			setsockopt(net->sock_fp, SOL_RAW, ICMP_FILTER, (char*)&filt, sizeof(filt));
+ 			/* this is necessary for broadcast pings to work */
+ 			(void)setsockopt(net->sock_fp, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));
  
- #if USE_SYSLOG
-     char *opts = "d:i:n:Ffsvbql:p:t:c:r:m:a:";
-@@ -703,7 +706,7 @@
- 		perror(progname);
- 		exit(1);
- 	    }
--	    
-+	    setsockopt(net->sock_fp, SOL_RAW, ICMP_FILTER, (char*)&filt, sizeof(filt));
- 	    /* this is necessary for broadcast pings to work */
- 	    (void) setsockopt(net->sock_fp, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));
-     
diff --git a/meta/recipes-extended/watchdog/files/fixsepbuild.patch b/meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
similarity index 100%
rename from meta/recipes-extended/watchdog/files/fixsepbuild.patch
rename to meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
diff --git a/meta/recipes-extended/watchdog/watchdog_5.13.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
similarity index 81%
rename from meta/recipes-extended/watchdog/watchdog_5.13.bb
rename to meta/recipes-extended/watchdog/watchdog_5.14.bb
index b9e29d2..c77d91d 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.13.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://fixsepbuild.patch \
 	   file://fix-ping-failure.patch"
-SRC_URI[md5sum] = "153455f008f1cf8f65f6ad9586a21ff1"
-SRC_URI[sha256sum] = "141e0faf3ee4d8187a6ff4e00b18ef7b7a4ce432a2d4c8a6e6fdc62507fc6eb0"
+
+SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
+SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
 
 inherit autotools
 
-- 
1.8.3.1


