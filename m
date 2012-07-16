Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhV-0006t0-RJ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443381"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:36 -0700
Message-Id: <7e88895c46ffa9b379c34035fb687b6f1ee15460.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/30] busybox: Include sys/resource.h for rusage definition
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:10 -0000

From: Khem Raj <raj.khem@gmail.com>

Seen with eglibc 2.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../busybox/busybox-1.19.4/sys_resource.patch      |   99 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 2 files changed, 101 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
new file mode 100644
index 0000000..bd55961
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
@@ -0,0 +1,99 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+From c5fe9f7b723f949457263ef8e22ab807d5b549ce Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 06 Jul 2012 03:19:09 +0000
+Subject: include sys/resource.h where needed
+
+We use functions from sys/resource.h in misc applets, but don't include
+the header.  This breaks building with newer glibc versions, so add the
+include where needed.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+Index: busybox-1.19.4/loginutils/passwd.c
+===================================================================
+--- busybox-1.19.4.orig/loginutils/passwd.c	2012-02-04 11:34:24.000000000 -0800
++++ busybox-1.19.4/loginutils/passwd.c	2012-07-06 17:48:27.388096092 -0700
+@@ -15,6 +15,7 @@
+ 
+ #include "libbb.h"
+ #include <syslog.h>
++#include <sys/resource.h> /* setrlimit */
+ 
+ static void nuke_str(char *str)
+ {
+Index: busybox-1.19.4/miscutils/time.c
+===================================================================
+--- busybox-1.19.4.orig/miscutils/time.c	2012-02-04 11:24:55.000000000 -0800
++++ busybox-1.19.4/miscutils/time.c	2012-07-06 17:48:27.388096092 -0700
+@@ -16,6 +16,7 @@
+ //usage:     "\n	-v	Verbose"
+ 
+ #include "libbb.h"
++#include <sys/resource.h> /* getrusage */
+ 
+ /* Information on the resources used by a child process.  */
+ typedef struct {
+Index: busybox-1.19.4/networking/inetd.c
+===================================================================
+--- busybox-1.19.4.orig/networking/inetd.c	2012-02-04 11:34:24.000000000 -0800
++++ busybox-1.19.4/networking/inetd.c	2012-07-06 17:48:54.852097259 -0700
+@@ -165,6 +165,7 @@
+ //usage:     "\n		(default: 0 - disabled)"
+ 
+ #include <syslog.h>
++#include <sys/resource.h> /* setrlimit */
+ #include <sys/un.h>
+ 
+ #include "libbb.h"
+Index: busybox-1.19.4/networking/ntpd.c
+===================================================================
+--- busybox-1.19.4.orig/networking/ntpd.c	2012-02-04 11:24:55.000000000 -0800
++++ busybox-1.19.4/networking/ntpd.c	2012-07-06 17:48:27.392096048 -0700
+@@ -46,6 +46,7 @@
+ #include "libbb.h"
+ #include <math.h>
+ #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
++#include <sys/resource.h> /* setpriority */
+ #include <sys/timex.h>
+ #ifndef IPTOS_LOWDELAY
+ # define IPTOS_LOWDELAY 0x10
+Index: busybox-1.19.4/networking/ntpd_simple.c
+===================================================================
+--- busybox-1.19.4.orig/networking/ntpd_simple.c	2012-02-04 11:24:55.000000000 -0800
++++ busybox-1.19.4/networking/ntpd_simple.c	2012-07-06 17:48:27.400095949 -0700
+@@ -7,6 +7,7 @@
+  */
+ #include "libbb.h"
+ #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
++#include <sys/resource.h> /* setpriority */
+ #ifndef IPTOS_LOWDELAY
+ # define IPTOS_LOWDELAY 0x10
+ #endif
+Index: busybox-1.19.4/runit/chpst.c
+===================================================================
+--- busybox-1.19.4.orig/runit/chpst.c	2012-02-04 11:34:24.000000000 -0800
++++ busybox-1.19.4/runit/chpst.c	2012-07-06 17:48:27.400095949 -0700
+@@ -91,6 +91,7 @@
+ //usage:     "\n			a SIGXCPU after N seconds"
+ 
+ #include "libbb.h"
++#include <sys/resource.h> /* getrlimit */
+ 
+ /*
+ Five applets here: chpst, envdir, envuidgid, setuidgid, softlimit.
+Index: busybox-1.19.4/shell/shell_common.c
+===================================================================
+--- busybox-1.19.4.orig/shell/shell_common.c	2012-02-04 11:34:24.000000000 -0800
++++ busybox-1.19.4/shell/shell_common.c	2012-07-06 17:48:27.400095949 -0700
+@@ -18,6 +18,7 @@
+  */
+ #include "libbb.h"
+ #include "shell_common.h"
++#include <sys/resource.h> /* getrlimit */
+ 
+ const char defifsvar[] ALIGN1 = "IFS= \t\n";
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index de331ad..4271c67 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-parts.in.usr-bin.patch \
            file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
+           file://sys_resource.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
-- 
1.7.7.6



