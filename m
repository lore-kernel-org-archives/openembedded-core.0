Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id B8C7A62133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:08 +0000 (UTC)
Received: by qkas77 with SMTP id s77so27965698qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tq0hvJQllFeOfMkwg8iD75mN89RiugtBojKjBm6bNMU=;
	b=ZxJCyVWAI2vfTgkIZeIbfSiEAbFBn4A9hyVA80SmjtOB5e3J0MYkVYFRi/D4/F7ml4
	PPXTnotfucI7B1QAM26VlndOh+Dlz6NQiR3xB/tQm7mibOOH+ns30h0jL0fBHin7JcB0
	+bgR4vTeEbQ4ztsrTHqPRUigNDjqhOcX3OOKb/bQGgVoQaEJyjIxzEzZXuzSDxjtSQ5G
	VSSqQDTcxgvIN/ttKQmFZs12X1zmjJkfBlyiZYrPDuwlASbe/6HkJoDd1xFpvjvPXGew
	BJGpkPp5JyRO8jUFLTJiDB0rgt+34jzdGbvK40tcg9GhXz84myZ/uPvY+0YrdKB5eFYW
	7g1w==
X-Received: by 10.55.71.203 with SMTP id u194mr7873045qka.14.1447953069436;
	Thu, 19 Nov 2015 09:11:09 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:55 +0000
Message-Id: <52fa6b6eec33aec355d1e7652dfdcd1997ea5c9a.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/musl.patch | 74 ++++++++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/musl.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/musl.patch b/meta/recipes-core/sysvinit/sysvinit/musl.patch
new file mode 100644
index 0000000..4789029
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/musl.patch
@@ -0,0 +1,74 @@
+Fix build on musl use realpath() API its available on all libcs
+
+Upstream-Status: Pending
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
index 5dfe39e..394fc1a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://bootlogd.init \
            file://01_bootlogd \
 "
+SRC_URI_append_libc-musl = " file://musl.patch "
 
 SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
 SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
-- 
2.6.3


