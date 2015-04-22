Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 445CF71E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:03 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so35183090igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dA1zJQ8MdhU+3deJQVZfTT2M4kI4hxZN5XZqI2LZZaA=;
	b=grpljtmqqt9+I0RDqvJLBZINJDEuYiwemzwBAMXVFBg67YKiQixfiMmXEgxhmHATsb
	tN87d5bVNZYOj4/MtTVlOKJtJZc1WhALQBJlZo9BInR14lbG+5H064hv9LYvmUCeM4Bx
	wCNYF76Gvl1ryYAmfj3AeTiBneryGNe4gLlzMDFyc4ZGkbSOJnLZVSCI42roiY25GiAR
	8hoFCfqhEK0qNqI4LKv/A2+CggXtP33PKlM5lb7WGNwT+CyaPfLTzeFTpRXmjsU6ldXr
	zoUWpQeLaQalY9yKrgFyofJ5CRypRwpVGr2WhmHjNB3tLe60yAqGyHwbQ5mQK+1au+9B
	IdBg==
X-Received: by 10.107.154.70 with SMTP id c67mr33932109ioe.22.1429689005087;
	Wed, 22 Apr 2015 00:50:05 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:50 +0000
Message-Id: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 01/10] connman: Fix builds to compile on musl
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:04 -0000

Add explicit includes for headers which are indirectly included on glibc
Dont use backtrace APIs on non-glibc C libs
res_nimit is a glibc specific API in resolvers so we avoid it

Change-Id: I78a173f02f8c117ebb513311f27a48bc8d645efe
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cktrace-API-only-when-compiling-for-glibc.patch |  41 ++++
 .../connman/connman/0002-musl-header-fixes.patch   | 235 +++++++++++++++++++++
 ...resolve-musl-does-not-implement-res_ninit.patch |  77 +++++++
 ...Fix-duplicate-definitions-issue-with-musl.patch |  43 ++++
 meta/recipes-connectivity/connman/connman_1.28.bb  |   4 +
 5 files changed, 400 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch b/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
new file mode 100644
index 0000000..873843b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
@@ -0,0 +1,41 @@
+From b736e90681e135e0cccb143a9ce8b7049e1ec0f0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 22:57:20 -0700
+Subject: [PATCH 1/4] Enable backtrace() API only when compiling for glibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/log.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/log.c b/src/log.c
+index a693bd0..3bf9fcc 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -30,7 +30,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -215,9 +217,9 @@ static void print_backtrace(unsigned int offset)
+ static void signal_handler(int signo)
+ {
+ 	connman_error("Aborting (signal %d) [%s]", signo, program_exec);
+-
++#ifdef __GLIBC__
+ 	print_backtrace(2);
+-
++#endif
+ 	exit(EXIT_FAILURE);
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch b/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
new file mode 100644
index 0000000..058f1dc
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
@@ -0,0 +1,235 @@
+From b6ff3a5989e72307cd54a840179ea072c4e0213e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 22:59:55 -0700
+Subject: [PATCH 2/4] musl header fixes
+
+ported from
+http://git.alpinelinux.org/cgit/aports/plain/testing/connman/musl-fixes.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                 | 1 +
+ gdhcp/common.c               | 6 +++++-
+ gweb/gresolv.c               | 1 +
+ plugins/wifi.c               | 3 +--
+ src/ippool.c                 | 2 +-
+ src/iptables.c               | 2 +-
+ src/log.c                    | 2 ++
+ src/ntp.c                    | 2 +-
+ src/tethering.c              | 2 --
+ tools/dhcp-test.c            | 1 -
+ tools/dnsproxy-test.c        | 1 +
+ tools/private-network-test.c | 2 +-
+ tools/tap-test.c             | 2 +-
+ 13 files changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6fa01ba..493a5f1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,6 +165,7 @@ fi
+ AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
+ AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
+ 
++AC_CHECK_HEADERS(execinfo.h)
+ AC_CHECK_HEADERS(resolv.h, dummy=yes,
+ 	AC_MSG_ERROR(resolver header files are required))
+ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+diff --git a/gdhcp/common.c b/gdhcp/common.c
+index 48fcdef..40ade87 100644
+--- a/gdhcp/common.c
++++ b/gdhcp/common.c
+@@ -22,6 +22,7 @@
+ #include <config.h>
+ #endif
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <errno.h>
+@@ -31,7 +32,6 @@
+ #include <string.h>
+ #include <endian.h>
+ #include <net/if_arp.h>
+-#include <linux/if.h>
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>
+ #include <arpa/inet.h>
+@@ -40,6 +40,8 @@
+ #include "gdhcp.h"
+ #include "common.h"
+ 
++#include <linux/if.h>
++
+ static const DHCPOption client_options[] = {
+ 	{ OPTION_IP,			0x01 }, /* subnet-mask */
+ 	{ OPTION_IP | OPTION_LIST,	0x03 }, /* routers */
+@@ -474,10 +476,12 @@ static const struct in6_addr in6addr_all_dhcp_relay_agents_and_servers_mc =
+ 	IN6ADDR_ALL_DHCP_RELAY_AGENTS_AND_SERVERS_MC_INIT;
+ 
+ /* from netinet/in.h */
++#if 0
+ struct in6_pktinfo {
+ 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
+ 	unsigned int ipi6_ifindex;  /* send/recv interface index */
+ };
++#endif
+ 
+ int dhcpv6_send_packet(int index, struct dhcpv6_packet *dhcp_pkt, int len)
+ {
+diff --git a/gweb/gresolv.c b/gweb/gresolv.c
+index 5cf7a9a..c11a1d9 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -24,6 +24,7 @@
+ #endif
+ 
+ #include <errno.h>
++#include <stdio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <string.h>
+diff --git a/plugins/wifi.c b/plugins/wifi.c
+index 1f90a31..427c552 100644
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
+diff --git a/src/ippool.c b/src/ippool.c
+index bb8568d..f1eb1f3 100644
+--- a/src/ippool.c
++++ b/src/ippool.c
+@@ -28,7 +28,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <sys/socket.h>
+ 
+ #include "connman.h"
+diff --git a/src/iptables.c b/src/iptables.c
+index 8d583ea..a91a451 100644
+--- a/src/iptables.c
++++ b/src/iptables.c
+@@ -28,7 +28,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <sys/socket.h>
+ #include <xtables.h>
+ 
+diff --git a/src/log.c b/src/log.c
+index 3bf9fcc..3b9843f 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -114,6 +114,7 @@ void connman_debug(const char *format, ...)
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#ifdef HAVE_EXECINFO_H
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -212,6 +213,7 @@ static void print_backtrace(unsigned int offset)
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_EXECINFO_H */
+ }
+ 
+ static void signal_handler(int signo)
+diff --git a/src/ntp.c b/src/ntp.c
+index abb2caa..dd50532 100644
+--- a/src/ntp.c
++++ b/src/ntp.c
+@@ -180,7 +180,7 @@ static void send_packet(int fd, const char *server, uint32_t timeout)
+ 	msg.xmttime.fraction = htonl(transmit_timeval.tv_usec * 1000);
+ 
+ 	len = sendto(fd, &msg, sizeof(msg), MSG_DONTWAIT,
+-						&addr, sizeof(addr));
++						(struct sockaddr *) &addr, sizeof(addr));
+ 	if (len < 0) {
+ 		connman_error("Time request for server %s failed (%d/%s)",
+ 			server, errno, strerror(errno));
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
+index 551cae9..371e2e2 100644
+--- a/tools/dnsproxy-test.c
++++ b/tools/dnsproxy-test.c
+@@ -24,6 +24,7 @@
+ #endif
+ 
+ #include <errno.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+diff --git a/tools/private-network-test.c b/tools/private-network-test.c
+index 3dd115b..2828bb3 100644
+--- a/tools/private-network-test.c
++++ b/tools/private-network-test.c
+@@ -32,7 +32,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <signal.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/signalfd.h>
+ #include <unistd.h>
+ 
+diff --git a/tools/tap-test.c b/tools/tap-test.c
+index fdc098a..ea9a567 100644
+--- a/tools/tap-test.c
++++ b/tools/tap-test.c
+@@ -29,7 +29,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <string.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/ioctl.h>
+ 
+ #include <netinet/in.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
new file mode 100644
index 0000000..28931c1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
@@ -0,0 +1,77 @@
+From 93bb904cc4e1e97152e6408077ba136fc883b6bb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 23:02:21 -0700
+Subject: [PATCH 3/4] resolve: musl does not implement res_ninit
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
+index c11a1d9..991b14c 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)
+ 	resolv->index = index;
+ 	resolv->nameserver_list = NULL;
+ 
+-	res_ninit(&resolv->res);
+-
+ 	return resolv;
+ }
+ 
+@@ -917,8 +915,6 @@ void g_resolv_unref(GResolv *resolv)
+ 
+ 	flush_nameservers(resolv);
+ 
+-	res_nclose(&resolv->res);
+-
+ 	g_free(resolv);
+ }
+ 
+@@ -1021,24 +1017,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
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
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch b/meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch
new file mode 100644
index 0000000..80a4831
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch
@@ -0,0 +1,43 @@
+From 6c1854401b4888fbf420ceb7b1e18097b91fb488 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 23:48:23 -0700
+Subject: [PATCH 4/4] tethering: Fix duplicate definitions issue with musl
+
+We just need this one define BRCTL_GET_VERSION
+from linux/if_bridge.h
+So lets define it if not defined already and remove
+including linux/if_bridge.h because it include's linux/in6.h
+which then conflicts with musl's netinet/in.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tethering.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/tethering.c b/src/tethering.c
+index c44cb36..62fce36 100644
+--- a/src/tethering.c
++++ b/src/tethering.c
+@@ -34,14 +34,15 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+-#include <linux/if_bridge.h>
+ 
+ #include "connman.h"
+ 
+ #include <gdhcp/gdhcp.h>
+ 
+ #include <gdbus.h>
+-
++#ifndef BRCTL_GET_VERSION
++#define BRCTL_GET_VERSION 0
++#endif
+ #ifndef DBUS_TYPE_UNIX_FD
+ #define DBUS_TYPE_UNIX_FD -1
+ #endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.28.bb b/meta/recipes-connectivity/connman/connman_1.28.bb
index 53e71fa..a395d63 100644
--- a/meta/recipes-connectivity/connman/connman_1.28.bb
+++ b/meta/recipes-connectivity/connman/connman_1.28.bb
@@ -3,6 +3,10 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
+	    file://0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch \
+	    file://0002-musl-header-fixes.patch \
+	    file://0003-resolve-musl-does-not-implement-res_ninit.patch \
+	    file://0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch \
             file://connman \
             "
 SRC_URI[md5sum] = "6e07c93877f80bb73c9d4dbfc697f3fc"
-- 
2.1.4


