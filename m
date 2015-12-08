Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id F3373605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:42 +0000 (UTC)
Received: by qgcc31 with SMTP id c31so9895311qgc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8WgYKaDiLeMGKb1PJAXqsXGb1JQidMa2OPFSiognvSc=;
	b=C4kEdnvMabnszxhOJYCYAqjFJ5+wKqeKGp1X/XFdVj92pn43mt/o3w7iNJrV+gwA38
	JvLfNeTElU0ob7PhXC+38lKBuHxvJ8p7crXa52gM7XLc1y6340qfRb7UuTGpeRMeUJdg
	7bQMpHTOp4rz4jz/4sIhQIIiSUgqae0lbtOP8/pXkx8aURf2wbdthSgjFFPdGNiwaG0J
	T91H5OSB050KMNHpNWW8mxd2NSJbpKtuwZ89Es+L7LZsoJVUvlAnAkO+jGhmpu9T7TRw
	RfHEe2RMYEIgMdZD0dzsTnO1wMg3p/CTJdGuX0ABx5eXgEudsX0et1TeOIeb37dMSJr9
	INmA==
X-Received: by 10.140.109.100 with SMTP id k91mr2815547qgf.23.1449562363846;
	Tue, 08 Dec 2015 00:12:43 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:28 +0000
Message-Id: <0318ee439d61fd47991f71a073b1f6e7165f26a9.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 08/13] sysvinit: Fix build with musl
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/realpath.patch | 78 ++++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
new file mode 100644
index 0000000..5e0dca3
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
@@ -0,0 +1,78 @@
+Fix build on musl use realpath() API its available on all libcs
+
+realpath() API doesnt work on systems with PATH_MAX set to be unlimited e.g. GNU/Hurd
+However for Linux it should always work
+
+Upstream-Status: Inappropriate[Linux specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: sysvinit-2.88dsf/src/ifdown.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/ifdown.c	2010-03-23 07:37:01.000000000 -0700
++++ sysvinit-2.88dsf/src/ifdown.c	2014-04-02 00:43:43.675437029 -0700
+@@ -26,11 +26,11 @@
+ #include <unistd.h>
+ #include <time.h>
+ #include <string.h>
++#include <errno.h>
+ 
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <sys/time.h>
+-#include <sys/errno.h>
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+Index: sysvinit-2.88dsf/src/init.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/init.c	2014-04-02 00:42:10.488770162 -0700
++++ sysvinit-2.88dsf/src/init.c	2014-04-02 00:42:59.432103823 -0700
+@@ -49,6 +49,7 @@
+ #include <utmp.h>
+ #include <ctype.h>
+ #include <stdarg.h>
++#include <sys/ttydefaults.h>
+ #include <sys/syslog.h>
+ #include <sys/time.h>
+ 
+Index: sysvinit-2.88dsf/src/mountpoint.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/mountpoint.c	2009-09-10 01:28:49.000000000 -0700
++++ sysvinit-2.88dsf/src/mountpoint.c	2014-04-02 00:44:18.248770942 -0700
+@@ -23,6 +23,7 @@
+  *		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+Index: sysvinit-2.88dsf/src/killall5.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/killall5.c	2014-03-26 00:49:52.982668074 -0700
++++ sysvinit-2.88dsf/src/killall5.c	2014-04-02 00:46:45.838771653 -0700
+@@ -846,9 +846,9 @@
+ 	char *oargv1, *pargv1;
+ 	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
+ 		if (o->argv1 && p->argv1) {
+-			if ((oargv1 = canonicalize_file_name(o->argv1)) == NULL)
++			if ((oargv1 = realpath(o->argv1, NULL)) == NULL)
+ 				oargv1 = strdup(o->argv1);
+-			if ((pargv1 = canonicalize_file_name(p->argv1)) == NULL)
++			if ((pargv1 = realpath(p->argv1, NULL)) == NULL)
+ 				pargv1 = strdup(p->argv1);
+ 			if (! strcmp(oargv1, pargv1)) {
+ 				ret = 1;
+Index: sysvinit-2.88dsf/src/wall.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/wall.c	2009-11-22 14:05:53.000000000 -0800
++++ sysvinit-2.88dsf/src/wall.c	2014-04-02 00:49:15.258772217 -0700
+@@ -29,6 +29,7 @@
+ #include <unistd.h>
+ #include <pwd.h>
+ #include <syslog.h>
++#include <time.h>
+ #include "init.h"
+ 
+ 
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 5dfe39e..e4aa4c3 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
            file://0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch \
+           file://realpath.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
-- 
2.6.3


