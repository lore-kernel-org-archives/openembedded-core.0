Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFV-0001HK-3c
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:17 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=97SrYhwl6QdP/HHtOPoJefFwf8NMTUpXjpPO+7uLgzs=;
	b=OSAWB0vMkv9+t8V2qE7aoLASCEoxWr1ZrAYiRRkE9RrsUH9TdjThP0kw2rwCV9iBZu
	2Zd4vSInQSL3c3JkHbjCdjZnM+dvLVmTfkLSDoGDJEqO/2R2Z2AwnTOy9CasCLs/jjY6
	DV2ONY7kYdeznyieau1VbFUXFNi/z27VAFflZpVIyUunTMcnNS/UYIymh/3pKjObdsUF
	V+TOpEPHT9/TSaF4zKa8njkj8SJzKQ/3/6iRK/j8JV0FXOszA7qmyTq/75P5zxs8lNPz
	SnYvjHrsoCNTc+2g08dbUx8xWmS5enzwRcQlaSVEMfIyWNUuCDW8hOmfnphl2yBmI9pa
	c7wg==
Received: by 10.68.236.168 with SMTP id uv8mr9595244pbc.25.1341763870763;
	Sun, 08 Jul 2012 09:11:10 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:21 -0700
Message-Id: <b2b4c277c5a57ba13272015a6ba349d7db341131.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 03/19] busybox: Include sys/resource.h for rusage definition
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:17 -0000

Seen with eglibc 2.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox-1.19.4/sys_resource.patch      |   99 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 2 files changed, 101 insertions(+), 1 deletion(-)
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
1.7.9.5



