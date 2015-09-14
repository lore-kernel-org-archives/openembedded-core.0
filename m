Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9106C77016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:36 +0000 (UTC)
Received: by qgez77 with SMTP id z77so120011531qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O7bGTr5FpcZD8tE86d2vgkTgDUn7sXzT1ggpnDXodIU=;
	b=BV+q33tkcSJF80O0fA5eWPwlL9w/VV8Ac+m3WfQEdQoXxS/BWsXxFX9Ur3nhwnioqx
	P0E2puLTFJNjm42QnIPgMJ27hND4zRtKFs4t9NCbWtNjas0NYlICsfshaYPx5vbDKO0b
	1RZN6C5QQKN57mnk9SD45huAQHa+eYIQiRjShQrPGFFKIU+1X5s/PdmIuSPKFtgRMRse
	fryEX/OMgmU8hWh01v2RtK56uzBYwu57oCak1QNs3fNReNNGyRC6xU0S7ABw/DjCmV1G
	0vTGroXQrtKghtM8Nv3c1NjJDgUe/iP0r7JDUskS1rGWdGwfSkjrpt6LTEikhJJY+7Ie
	fQXA==
X-Received: by 10.140.218.133 with SMTP id o127mr24995398qhb.4.1442248296366; 
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:25 +0000
Message-Id: <34c5b615bb018c7e8adfe2f94accba9543a8c066.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 10/12] connman: Fix build with musl
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc      |  1 +
 ...acktrace-API-availability-before-using-it.patch | 55 ++++++++++++++
 ...resolve-musl-does-not-implement-res_ninit.patch | 77 ++++++++++++++++++++
 .../0003-Fix-header-inclusions-for-musl.patch      | 85 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.30.bb  |  3 +
 5 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 17dc4b9..fd9640e 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -30,6 +30,7 @@ EXTRA_OECONF += "\
     --disable-polkit \
     --enable-client \
 "
+CFLAGS += "-D_GNU_SOURCE"
 
 PACKAGECONFIG ??= "wispr \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
diff --git a/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch b/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
new file mode 100644
index 0000000..5dc6fd6
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
@@ -0,0 +1,55 @@
+From 00d4447395725abaa651e12ed40095081e04011e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 13 Sep 2015 13:22:01 -0700
+Subject: [PATCH 1/3] Detect backtrace() API availability before using it
+
+C libraries besides glibc do not have backtrace() implemented
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 2 ++
+ src/log.c    | 5 ++---
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 69c0eeb..90099f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -171,6 +171,8 @@ fi
+ AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
+ AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
+ 
++AC_CHECK_HEADERS([execinfo.h])
++
+ AC_CHECK_HEADERS(resolv.h, dummy=yes,
+ 	AC_MSG_ERROR(resolver header files are required))
+ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+diff --git a/src/log.c b/src/log.c
+index a693bd0..5b40c1f 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -30,7 +30,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
+-#include <execinfo.h>
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -215,9 +214,9 @@ static void print_backtrace(unsigned int offset)
+ static void signal_handler(int signo)
+ {
+ 	connman_error("Aborting (signal %d) [%s]", signo, program_exec);
+-
++#ifdef HAVE_EXECINFO_H
+ 	print_backtrace(2);
+-
++#endif /* HAVE_EXECINFO_H */
+ 	exit(EXIT_FAILURE);
+ }
+ 
+-- 
+2.5.1
+
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
new file mode 100644
index 0000000..0593427
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -0,0 +1,77 @@
+From 10b0d16d04b811b1ccd1f9b0cfe757bce8d876a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 23:02:21 -0700
+Subject: [PATCH 2/3] resolve: musl does not implement res_ninit
+
+ported from
+http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gweb/gresolv.c | 33 ++++++++++++---------------------
+ 1 file changed, 12 insertions(+), 21 deletions(-)
+
+diff --git a/gweb/gresolv.c b/gweb/gresolv.c
+index 5cf7a9a..3ad8e70 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -875,8 +875,6 @@ GResolv *g_resolv_new(int index)
+ 	resolv->index = index;
+ 	resolv->nameserver_list = NULL;
+ 
+-	res_ninit(&resolv->res);
+-
+ 	return resolv;
+ }
+ 
+@@ -916,8 +914,6 @@ void g_resolv_unref(GResolv *resolv)
+ 
+ 	flush_nameservers(resolv);
+ 
+-	res_nclose(&resolv->res);
+-
+ 	g_free(resolv);
+ }
+ 
+@@ -1020,24 +1016,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+ 	debug(resolv, "hostname %s", hostname);
+ 
+ 	if (!resolv->nameserver_list) {
+-		int i;
+-
+-		for (i = 0; i < resolv->res.nscount; i++) {
+-			char buf[100];
+-			int family = resolv->res.nsaddr_list[i].sin_family;
+-			void *sa_addr = &resolv->res.nsaddr_list[i].sin_addr;
+-
+-			if (family != AF_INET &&
+-					resolv->res._u._ext.nsaddrs[i]) {
+-				family = AF_INET6;
+-				sa_addr = &resolv->res._u._ext.nsaddrs[i]->sin6_addr;
++		FILE *f = fopen("/etc/resolv.conf", "r");
++		if (f) {
++			char line[256], *s;
++			int i;
++			while (fgets(line, sizeof(line), f)) {
++				if (strncmp(line, "nameserver", 10) || !isspace(line[10]))
++					continue;
++				for (s = &line[11]; isspace(s[0]); s++);
++				for (i = 0; s[i] && !isspace(s[i]); i++);
++				s[i] = 0;
++				g_resolv_add_nameserver(resolv, s, 53, 0);
+ 			}
+-
+-			if (family != AF_INET && family != AF_INET6)
+-				continue;
+-
+-			if (inet_ntop(family, sa_addr, buf, sizeof(buf)))
+-				g_resolv_add_nameserver(resolv, buf, 53, 0);
++			fclose(f);
+ 		}
+ 
+ 		if (!resolv->nameserver_list)
+-- 
+2.5.1
+
diff --git a/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch b/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
new file mode 100644
index 0000000..6327aa2
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
@@ -0,0 +1,85 @@
+From 67645a01a2f3f52625d8dd77f2811a9e213e1b7d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 13 Sep 2015 13:28:20 -0700
+Subject: [PATCH] Fix header inclusions for musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gweb/gresolv.c        | 1 +
+ plugins/wifi.c        | 3 +--
+ src/tethering.c       | 2 --
+ tools/dhcp-test.c     | 1 -
+ tools/dnsproxy-test.c | 1 +
+ 5 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/gweb/gresolv.c b/gweb/gresolv.c
+index 3ad8e70..61d6fe8 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -28,6 +28,7 @@
+ #include <stdarg.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stdio.h>
+ #include <resolv.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+diff --git a/plugins/wifi.c b/plugins/wifi.c
+index dfe849f..99cff3f 100644
+--- a/plugins/wifi.c
++++ b/plugins/wifi.c
+@@ -30,9 +30,8 @@
+ #include <string.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+-#include <linux/if_arp.h>
+-#include <linux/wireless.h>
+ #include <net/ethernet.h>
++#include <linux/wireless.h>
+ 
+ #ifndef IFF_LOWER_UP
+ #define IFF_LOWER_UP	0x10000
+diff --git a/src/tethering.c b/src/tethering.c
+index ceeec74..c44cb36 100644
+--- a/src/tethering.c
++++ b/src/tethering.c
+@@ -31,10 +31,8 @@
+ #include <stdio.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>
+-#include <linux/sockios.h>
+ #include <string.h>
+ #include <fcntl.h>
+-#include <linux/if_tun.h>
+ #include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ 
+diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
+index c34e10a..eae66fc 100644
+--- a/tools/dhcp-test.c
++++ b/tools/dhcp-test.c
+@@ -33,7 +33,6 @@
+ #include <arpa/inet.h>
+ #include <net/route.h>
+ #include <net/ethernet.h>
+-#include <linux/if_arp.h>
+ 
+ #include <gdhcp/gdhcp.h>
+ 
+diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
+index 551cae9..226ba86 100644
+--- a/tools/dnsproxy-test.c
++++ b/tools/dnsproxy-test.c
+@@ -27,6 +27,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <stdio.h>
+ #include <arpa/inet.h>
+ #include <netinet/in.h>
+ #include <sys/types.h>
+-- 
+2.5.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.30.bb b/meta/recipes-connectivity/connman/connman_1.30.bb
index 8c47353..9b512c5 100644
--- a/meta/recipes-connectivity/connman/connman_1.30.bb
+++ b/meta/recipes-connectivity/connman/connman_1.30.bb
@@ -3,6 +3,9 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
+            file://0001-Detect-backtrace-API-availability-before-using-it.patch \
+            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+            file://0003-Fix-header-inclusions-for-musl.patch \
             file://connman \
             "
 SRC_URI[md5sum] = "4a3efdbd6796922db9c6f66da57887fa"
-- 
2.5.2


