Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBC46774FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440309"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:15:02 +0300
Message-Id: <ecf76ed142c602d1f81e393754f4792386584125.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/25] watchdog: update to 5.15
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:34 -0000

Removed patches are all merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...d-issues-found-with-non-glibc-C-libraries.patch | 99 ----------------------
 .../watchdog/watchdog/fix-ping-failure.patch       | 79 -----------------
 .../watchdog/watchdog/fixsepbuild.patch            | 27 ------
 .../{watchdog_5.14.bb => watchdog_5.15.bb}         |  7 +-
 4 files changed, 2 insertions(+), 210 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
 rename meta/recipes-extended/watchdog/{watchdog_5.14.bb => watchdog_5.15.bb} (79%)

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch b/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
deleted file mode 100644
index 8afed5c..0000000
--- a/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 83ec34df357218a1c9cfc13a23d3367d333652c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Dec 2015 01:01:15 +0000
-Subject: [PATCH] Fix build issues found with non glibc C libraries
-
-Add time.h for getting time_t definition
-limits.h for PATH_MAX
-linux/param.h for EXEC_PAGESIZE
-Replace deprecated MNTTAB with _PATH_MNTTAB
-include ext2_mnt.h for MNTOPT_USRQUOTA and MNTOPT_GRPQUOTA and
-MNTTYPE_EXT2
-Include sys/types.h for u_char definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-
-Upstream-Status: Submitted
-
- include/extern.h | 1 +
- src/configfile.c | 1 +
- src/memory.c     | 3 +++
- src/net.c        | 1 +
- src/shutdown.c   | 3 ++-
- 5 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/include/extern.h b/include/extern.h
-index 21db11b..04b16bc 100644
---- a/include/extern.h
-+++ b/include/extern.h
-@@ -3,6 +3,7 @@
- 
- #include <netinet/in.h>
- #include <stdio.h>
-+#include <time.h>
- 
- #include "logmessage.h"
- #include "xmalloc.h"
-diff --git a/src/configfile.c b/src/configfile.c
-index be5d7b3..7c1d1dd 100644
---- a/src/configfile.c
-+++ b/src/configfile.c
-@@ -16,6 +16,7 @@
- #include <errno.h>
- #include <string.h>
- #include <dirent.h>
-+#include <limits.h>
- #include <sys/stat.h>
- 
- #include "extern.h"
-diff --git a/src/memory.c b/src/memory.c
-index e9607e4..b5e08aa 100644
---- a/src/memory.c
-+++ b/src/memory.c
-@@ -21,6 +21,9 @@
- #include <sys/stat.h>
- #include <sys/param.h>
- #include <sys/mman.h>
-+#ifdef __linux__
-+#include <linux/param.h>
-+#endif
- 
- #include "extern.h"
- #include "watch_err.h"
-diff --git a/src/net.c b/src/net.c
-index 21823ae..8930caf 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -17,6 +17,7 @@
- #include <string.h>
- #include <unistd.h>		/* for gethostname() etc */
- #include <netdb.h>		/* for gethostbyname() */
-+#include <sys/types.h>
- #include <sys/param.h>	/* for MAXHOSTNAMELEN */
- #include <sys/socket.h>
- #include <netinet/in.h>
-diff --git a/src/shutdown.c b/src/shutdown.c
-index 74aafa5..46b99cf 100644
---- a/src/shutdown.c
-+++ b/src/shutdown.c
-@@ -25,6 +25,7 @@
- 
- #include "watch_err.h"
- #include "extern.h"
-+#include "ext2_mnt.h"
- 
- #if defined __GLIBC__
- #include "ext2_mnt.h"
-@@ -123,7 +124,7 @@ static void mnt_off()
- 	FILE *fp;
- 	struct mntent *mnt;
- 
--	fp = setmntent(MNTTAB, "r");
-+	fp = setmntent(_PATH_MNTTAB, "r");
- 	/* in some rare cases fp might be NULL so be careful */
- 	while (fp != NULL && ((mnt = getmntent(fp)) != (struct mntent *)0)) {
- 		/* First check if swap */
--- 
-2.6.4
-
diff --git a/meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch b/meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
deleted file mode 100644
index 14ab9c5..0000000
--- a/meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Fix ping mode failure
-
-Upstream-Status: Pending  
-
-When watchdog works on ping mode, the system will be rebooted since
-watchdog can not receive the expected ECOREPLY on a setting interval.
-
-Ping mode uses a raw socket to send a ECO packet, then uses select()
-to wait and recvfrom() to receive the ECOREPLY packet, if select()
-shows the data is ready, and the data is not the expected ECOREPLY,
-and waiting time is not overdue, it will continue use select() and
-recvfrom().
-
-Problem is that the raw socket can receive any icmp packets, if we do
-not set filters, and there are many icmp packets on socket, this
-program will not find its interested ECOREPLY packet in a special
-interval, which makes the ping mode fail.
-
-
-Other program is that watchdog sometime can not reach the call of
-recvfrom to try to receive packets since tv_sec of struct timeval
-of select parameter is 0.
-
-The timeout of select() is the result of ping interval minusing the
-time of calling gettimeofday spending, when ping interval is 1 second,
-and the call of gettimeofday() spends several useconds, the tv_sec of
-struct timeval of select parameter must be 0, at that condition, we
-should it is valid of tv_sec of struct timeval of select parameter be 0 
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- src/net.c      |    2 +-
- src/watchdog.c |    5 ++++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-Index: watchdog-5.14/src/watchdog.c
-===================================================================
---- watchdog-5.14.orig/src/watchdog.c
-+++ watchdog-5.14/src/watchdog.c
-@@ -24,6 +24,7 @@
- #include <sys/types.h>
- #include <sys/ioctl.h>
- #include <linux/oom.h>
-+#include <linux/icmp.h>
- #include <linux/watchdog.h>
- #include <string.h>
- 
-Index: watchdog-5.14/src/net.c
-===================================================================
---- watchdog-5.14.orig/src/net.c
-+++ watchdog-5.14/src/net.c
-@@ -11,7 +11,8 @@
- #include <errno.h>
- #include <sys/time.h>
- #include <netinet/ip.h>
--#include <netinet/ip_icmp.h>
-+#include <linux/icmp.h>
-+//#include <netinet/ip_icmp.h>
- #include <fcntl.h>
- #include <string.h>
- #include <unistd.h>		/* for gethostname() etc */
-@@ -179,6 +180,9 @@ int open_netcheck(struct list *tlist)
- {
- 	struct list *act;
- 	int hold = 0;
-+	struct icmp_filter filt;
-+	filt.data = ~(1<<ICMP_ECHOREPLY);
-+
- 
- 	if (tlist != NULL) {
- 		for (act = tlist; act != NULL; act = act->next) {
-@@ -202,6 +206,7 @@ int open_netcheck(struct list *tlist)
- 			    fatal_error(EX_SYSERR, "error opening socket (%s)", strerror(errno));
- 			}
- 
-+			setsockopt(net->sock_fp, SOL_RAW, ICMP_FILTER, (char*)&filt, sizeof(filt));
- 			/* this is necessary for broadcast pings to work */
- 			(void)setsockopt(net->sock_fp, SOL_SOCKET, SO_BROADCAST, (char *)&hold, sizeof(hold));
- 
diff --git a/meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch b/meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
deleted file mode 100644
index 2fad3a1..0000000
--- a/meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix out of tree build support:
-
-| installing /etc/watchdog.conf
-|  /bin/mkdir -p '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man5'
-|  /bin/mkdir -p '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man8'
-|  /usr/bin/install -c -m 644 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/watchdog.conf.5 '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man5'
-|  /usr/bin/install -c -m 644 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/watchdog.8 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/wd_keepalive.8 /media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/watchdog-5.13/wd_identify.8 '/media/build1/poky/build/tmp/work/i586-poky-linux/watchdog/5.13-r0/image/usr/share/man/man8'
-| /usr/bin/install: cannot stat `watchdog.conf': No such file or directory
-| make[2]: *** [install-etc-local] Error 1
-
-Upstream-Status: Pending
-
-RP 2013/03/21
-
-Index: watchdog-5.13/Makefile.am
-===================================================================
---- watchdog-5.13.orig/Makefile.am	2013-02-01 11:15:44.000000000 +0000
-+++ watchdog-5.13/Makefile.am	2013-03-21 11:59:35.637139031 +0000
-@@ -16,7 +16,7 @@
- 	else \
- 	        echo "installing $(CONFIG_FILENAME)"; \
- 		$(mkinstalldirs) `dirname $(DESTDIR)$(CONFIG_FILENAME)`; \
--	        $(INSTALL_DATA) watchdog.conf $(DESTDIR)$(CONFIG_FILENAME); \
-+	        $(INSTALL_DATA) $(srcdir)/watchdog.conf $(DESTDIR)$(CONFIG_FILENAME); \
- 	fi
- 
- install-data-local: install-etc-local
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
similarity index 79%
rename from meta/recipes-extended/watchdog/watchdog_5.14.bb
rename to meta/recipes-extended/watchdog/watchdog_5.15.bb
index 7330238..76a3b42 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -9,15 +9,12 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
-           file://fixsepbuild.patch \
-	   file://fix-ping-failure.patch \
 	   file://watchdog-init.patch \
 	   file://watchdog-conf.patch \
-	   file://0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch \
 "
 
-SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
-SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
+SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
+SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c18947c"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.8.1


