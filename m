Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0397570D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:44 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id e32so258872856qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ie5arKgbwHRjYvfnprHLTG+oCrZtFrTcPPYWmRzSW5s=;
	b=LHfdWEMoVrD8XdXsNIIkhCAUGbQaYZvkBvmuNP1SyLpC8u/Uv9gsQeiEg0PRbVLle9
	lAeRNvIHAMCy8yMBcJVwu/WK/Q4LaVv9wt6KAiaENgGkYJodJA8GmhXbwsJeKyMqQl4g
	qKo4K2MLQXezWxDwErZC8rDzRvAwDJQDkURGL16I4djjhcf++09nsNsjNk6MZPmC2LTH
	jIOtqqqbLAez/z0Ciq70mzGUFK3mRRw5D3EJKfRhdOAp8YEnRduYCUU7yYh9gN8hU6d+
	XS5xhST/JH0RPUXUoYTsdglomCD2BiktoM/j+hn6pAeaAXd2FpmU0siRvVdcFVV+H33v
	xNEA==
X-Received: by 10.140.222.79 with SMTP id s76mr149632246qhb.21.1452248384790; 
	Fri, 08 Jan 2016 02:19:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:54 +0000
Message-Id: <d46ceb3f83b35ce6e92a038a843e126ee40a45aa.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 26/53] watchdog: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:45 -0000

This patch is generic but is found during compiling watchdog with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-issues-found-with-non-glibc-C-libraries.patch | 99 ++++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |  8 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch b/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
new file mode 100644
index 0000000..8afed5c
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
@@ -0,0 +1,99 @@
+From 83ec34df357218a1c9cfc13a23d3367d333652c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 01:01:15 +0000
+Subject: [PATCH] Fix build issues found with non glibc C libraries
+
+Add time.h for getting time_t definition
+limits.h for PATH_MAX
+linux/param.h for EXEC_PAGESIZE
+Replace deprecated MNTTAB with _PATH_MNTTAB
+include ext2_mnt.h for MNTOPT_USRQUOTA and MNTOPT_GRPQUOTA and
+MNTTYPE_EXT2
+Include sys/types.h for u_char definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+Upstream-Status: Submitted
+
+ include/extern.h | 1 +
+ src/configfile.c | 1 +
+ src/memory.c     | 3 +++
+ src/net.c        | 1 +
+ src/shutdown.c   | 3 ++-
+ 5 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/include/extern.h b/include/extern.h
+index 21db11b..04b16bc 100644
+--- a/include/extern.h
++++ b/include/extern.h
+@@ -3,6 +3,7 @@
+ 
+ #include <netinet/in.h>
+ #include <stdio.h>
++#include <time.h>
+ 
+ #include "logmessage.h"
+ #include "xmalloc.h"
+diff --git a/src/configfile.c b/src/configfile.c
+index be5d7b3..7c1d1dd 100644
+--- a/src/configfile.c
++++ b/src/configfile.c
+@@ -16,6 +16,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <dirent.h>
++#include <limits.h>
+ #include <sys/stat.h>
+ 
+ #include "extern.h"
+diff --git a/src/memory.c b/src/memory.c
+index e9607e4..b5e08aa 100644
+--- a/src/memory.c
++++ b/src/memory.c
+@@ -21,6 +21,9 @@
+ #include <sys/stat.h>
+ #include <sys/param.h>
+ #include <sys/mman.h>
++#ifdef __linux__
++#include <linux/param.h>
++#endif
+ 
+ #include "extern.h"
+ #include "watch_err.h"
+diff --git a/src/net.c b/src/net.c
+index 21823ae..8930caf 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -17,6 +17,7 @@
+ #include <string.h>
+ #include <unistd.h>		/* for gethostname() etc */
+ #include <netdb.h>		/* for gethostbyname() */
++#include <sys/types.h>
+ #include <sys/param.h>	/* for MAXHOSTNAMELEN */
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 74aafa5..46b99cf 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -25,6 +25,7 @@
+ 
+ #include "watch_err.h"
+ #include "extern.h"
++#include "ext2_mnt.h"
+ 
+ #if defined __GLIBC__
+ #include "ext2_mnt.h"
+@@ -123,7 +124,7 @@ static void mnt_off()
+ 	FILE *fp;
+ 	struct mntent *mnt;
+ 
+-	fp = setmntent(MNTTAB, "r");
++	fp = setmntent(_PATH_MNTTAB, "r");
+ 	/* in some rare cases fp might be NULL so be careful */
+ 	while (fp != NULL && ((mnt = getmntent(fp)) != (struct mntent *)0)) {
+ 		/* First check if swap */
+-- 
+2.6.4
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index 9cb89d5..fc717bc 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -12,7 +12,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://fixsepbuild.patch \
 	   file://fix-ping-failure.patch \
 	   file://watchdog-init.patch \
-	   file://watchdog-conf.patch"
+	   file://watchdog-conf.patch \
+	   file://0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch \
+"
 
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
 SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
@@ -23,6 +25,10 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 inherit autotools
 inherit update-rc.d
 
+DEPENDS_append_libc-musl = " libtirpc "
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
+LDFLAGS_append_libc-musl = " -ltirpc "
+
 INITSCRIPT_NAME = "watchdog.sh"
 INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
-- 
2.7.0


