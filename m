Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 448CD77226
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 16:07:22 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id o80so45262953wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o5v1sCsunXj85J0Qo8WLgRnlFCS4xNxvXrRvVjXmBks=;
	b=GTcfNVefiwMaG+2uXUgGE/JMCrkjpVp1YwqDeifTW/oDvKUrrnm5YyMRiKsZu+g/Dl
	ezmD4nK67a+YgfvOhJLomNZVhkCqPWdKH1ixzD+CEmmF1cBAi7qalLJH5Z7AW5H7AFFU
	guOcRI21fivKM1842kanX1T/CQ1OOLdrsM8b4sDRqDB+kJY7CzblC1qE8cMozr8SfHrb
	RH+0svakkyupSAjRtJuScuG5eWTJSAWkAcD6MI3TmCdOxrlWsb98clTvK1nQx+6RJt7Z
	u5OFUuOBlf5+eGu46J8yYC/M069GwTakNZpoQ54R2g7A/YvCaao4nd2IFXgeQR4Tf4Lt
	qoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o5v1sCsunXj85J0Qo8WLgRnlFCS4xNxvXrRvVjXmBks=;
	b=RL1p/pu2z2hndnlj/G8ofkWC0GYUob6v6kBENd4tTQp5VbaiLCkewSIJIRDDIymokn
	HgFdcQNG9Lpoe068a85DgctYlq3I6RSsfvAEPlxAIr5Hev5CfITXrkcJ1Liw7gjNOmZO
	Uy7/mDDuKHcf1uaA7caBDHt/x6CqmGNXBkw+UkrRNSuarYIjql82WXTnQO9IIFLLIJyn
	cw3/6FIV8TSStMqenyX9ZESRgKYI0HCXPDa8S2F+M2OEYcAQMhTeip4/+e9y4k7KW6mL
	P0wwGkFk+M8Qx745DUxOvoBNkUIktmxntXYj9KS1cwKoePZZda6jDrV5kZPsZiPNYwW3
	Fr+g==
X-Gm-Message-State: AEkoousRerdrX33IIYMcKLvmnn4LD9uhqEotvITE7AEYzFU1ouRSX5qIbj7dQWcfx+04/Gbe
X-Received: by 10.28.232.145 with SMTP id f17mr21884047wmi.15.1470758842552;
	Tue, 09 Aug 2016 09:07:22 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g184sm3985057wme.15.2016.08.09.09.07.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 09:07:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 17:07:17 +0100
Message-Id: <1470758837-6835-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470758837-6835-1-git-send-email-ross.burton@intel.com>
References: <1470758837-6835-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] connman: clean up musl fixes
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
X-List-Received-Date: Tue, 09 Aug 2016 16:07:23 -0000

The upstreamable include fixes have been sent upstream.  The patch set adds
AC_USE_SYSTEM_EXTENSIONS so we don't need to explictly define _GNU_SOURCE
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |   1 -
 .../0003-Fix-header-inclusions-for-musl.patch      | 118 ------
 .../connman/connman/includes.patch                 | 423 +++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |   5 +-
 4 files changed, 425 insertions(+), 122 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/includes.patch

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f09a2de..35a7eed 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -29,7 +29,6 @@ EXTRA_OECONF += "\
     --disable-polkit \
     --enable-client \
 "
-CFLAGS += "-D_GNU_SOURCE"
 
 PACKAGECONFIG ??= "wispr \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
diff --git a/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch b/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
deleted file mode 100644
index eefc683..0000000
--- a/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 67645a01a2f3f52625d8dd77f2811a9e213e1b7d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 13 Sep 2015 13:28:20 -0700
-Subject: [PATCH] Fix header inclusions for musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gweb/gresolv.c        | 1 +
- plugins/wifi.c        | 3 +--
- src/tethering.c       | 2 --
- tools/dhcp-test.c     | 1 -
- tools/dnsproxy-test.c | 1 +
- 5 files changed, 3 insertions(+), 5 deletions(-)
-
-Index: connman-1.30/gweb/gresolv.c
-===================================================================
---- connman-1.30.orig/gweb/gresolv.c
-+++ connman-1.30/gweb/gresolv.c
-@@ -28,6 +28,7 @@
- #include <stdarg.h>
- #include <string.h>
- #include <stdlib.h>
-+#include <stdio.h>
- #include <resolv.h>
- #include <sys/types.h>
- #include <sys/socket.h>
-Index: connman-1.30/plugins/wifi.c
-===================================================================
---- connman-1.30.orig/plugins/wifi.c
-+++ connman-1.30/plugins/wifi.c
-@@ -30,9 +30,8 @@
- #include <string.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
--#include <linux/if_arp.h>
--#include <linux/wireless.h>
- #include <net/ethernet.h>
-+#include <linux/wireless.h>
- 
- #ifndef IFF_LOWER_UP
- #define IFF_LOWER_UP	0x10000
-Index: connman-1.30/src/tethering.c
-===================================================================
---- connman-1.30.orig/src/tethering.c
-+++ connman-1.30/src/tethering.c
-@@ -31,10 +31,8 @@
- #include <stdio.h>
- #include <sys/ioctl.h>
- #include <net/if.h>
--#include <linux/sockios.h>
- #include <string.h>
- #include <fcntl.h>
--#include <linux/if_tun.h>
- #include <netinet/in.h>
- #include <linux/if_bridge.h>
- 
-Index: connman-1.30/tools/dhcp-test.c
-===================================================================
---- connman-1.30.orig/tools/dhcp-test.c
-+++ connman-1.30/tools/dhcp-test.c
-@@ -33,7 +33,6 @@
- #include <arpa/inet.h>
- #include <net/route.h>
- #include <net/ethernet.h>
--#include <linux/if_arp.h>
- 
- #include <gdhcp/gdhcp.h>
- 
-Index: connman-1.30/tools/dnsproxy-test.c
-===================================================================
---- connman-1.30.orig/tools/dnsproxy-test.c
-+++ connman-1.30/tools/dnsproxy-test.c
-@@ -27,6 +27,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-+#include <stdio.h>
- #include <arpa/inet.h>
- #include <netinet/in.h>
- #include <sys/types.h>
-Index: connman-1.30/configure.ac
-===================================================================
---- connman-1.30.orig/configure.ac
-+++ connman-1.30/configure.ac
-@@ -173,6 +173,8 @@ AM_CONDITIONAL(PPTP_BUILTIN, test "${ena
- 
- AC_CHECK_HEADERS([execinfo.h])
- 
-+AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
-+
- AC_CHECK_HEADERS(resolv.h, dummy=yes,
- 	AC_MSG_ERROR(resolver header files are required))
- AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
-Index: connman-1.30/gdhcp/common.h
-===================================================================
---- connman-1.30.orig/gdhcp/common.h
-+++ connman-1.30/gdhcp/common.h
-@@ -19,6 +19,7 @@
-  *
-  */
- 
-+#include <config.h>
- #include <netinet/udp.h>
- #include <netinet/ip.h>
- 
-@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths
- 	[OPTION_U32]	= 4,
- };
- 
--/* already defined within netinet/in.h if using GNU compiler */
--#ifndef __USE_GNU
-+/* already defined within netinet/in.h if using GNU or musl libc */
-+#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
- struct in6_pktinfo {
- 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
- 	unsigned int ipi6_ifindex;  /* send/recv interface index */
diff --git a/meta/recipes-connectivity/connman/connman/includes.patch b/meta/recipes-connectivity/connman/connman/includes.patch
new file mode 100644
index 0000000..55cb187
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/includes.patch
@@ -0,0 +1,423 @@
+Fix various issues which cause problems under musl.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 630516bcc0233b047f65665c003201ba6e77453d Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 16:22:36 +0100
+Subject: [PATCH 1/3] Use AC_USE_SYSTEM_EXTENSIONS
+
+Instead of using #define _GNU_SOURCE in some source files which causes problems
+when building with musl as more files need the define, simply use
+AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined globally.
+---
+ configure.ac       | 1 +
+ gdhcp/client.c     | 1 -
+ plugins/tist.c     | 1 -
+ src/backtrace.c    | 1 -
+ src/inet.c         | 1 -
+ src/log.c          | 1 -
+ src/ntp.c          | 1 -
+ src/resolver.c     | 1 -
+ src/rfkill.c       | 1 -
+ src/stats.c        | 1 -
+ src/timezone.c     | 1 -
+ tools/stats-tool.c | 1 -
+ tools/tap-test.c   | 1 -
+ tools/wispr.c      | 1 -
+ vpn/plugins/vpn.c  | 1 -
+ 15 files changed, 1 insertion(+), 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6e66ab3..bacf5ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,6 +20,7 @@ AC_SUBST(abs_top_srcdir)
+ AC_SUBST(abs_top_builddir)
+ 
+ AC_LANG_C
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index fbb40ab..3aeb089 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <unistd.h>
+diff --git a/plugins/tist.c b/plugins/tist.c
+index ad5ef79..cc2800a 100644
+--- a/plugins/tist.c
++++ b/plugins/tist.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
+diff --git a/src/backtrace.c b/src/backtrace.c
+index 6a66c0a..4dbdda8 100644
+--- a/src/backtrace.c
++++ b/src/backtrace.c
+@@ -24,7 +24,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+diff --git a/src/inet.c b/src/inet.c
+index 69ded19..81d92c2 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -25,7 +25,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <unistd.h>
+diff --git a/src/log.c b/src/log.c
+index 9bae4a3..f7e82e5 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+diff --git a/src/ntp.c b/src/ntp.c
+index dd246eb..db8ae96 100644
+--- a/src/ntp.c
++++ b/src/ntp.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+diff --git a/src/resolver.c b/src/resolver.c
+index fbe4be7..ef61f92 100644
+--- a/src/resolver.c
++++ b/src/resolver.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/src/rfkill.c b/src/rfkill.c
+index 2bfb092..af49d12 100644
+--- a/src/rfkill.c
++++ b/src/rfkill.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/src/stats.c b/src/stats.c
+index 26343b1..cfcdc94 100644
+--- a/src/stats.c
++++ b/src/stats.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <errno.h>
+ #include <sys/mman.h>
+ #include <sys/types.h>
+diff --git a/src/timezone.c b/src/timezone.c
+index e346b11..8e91267 100644
+--- a/src/timezone.c
++++ b/src/timezone.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <errno.h>
+ #include <stdio.h>
+ #include <fcntl.h>
+diff --git a/tools/stats-tool.c b/tools/stats-tool.c
+index b076478..428d94b 100644
+--- a/tools/stats-tool.c
++++ b/tools/stats-tool.c
+@@ -22,7 +22,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <sys/mman.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+diff --git a/tools/tap-test.c b/tools/tap-test.c
+index fdc098a..57917f5 100644
+--- a/tools/tap-test.c
++++ b/tools/tap-test.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/tools/wispr.c b/tools/wispr.c
+index d5f9341..e56dfc1 100644
+--- a/tools/wispr.c
++++ b/tools/wispr.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c
+index 9a42385..479c3a7 100644
+--- a/vpn/plugins/vpn.c
++++ b/vpn/plugins/vpn.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <string.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+-- 
+2.8.1
+
+
+From b8b7878e6cb2a1ed4fcfa256f7e232511a40e3d9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 15:37:50 +0100
+Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr explicitly
+
+Instead of assuming that just glibc has this structure, check for it at
+configure as musl also has it.
+
+Based on work by Khem Raj <raj.khem@gmail.com>.
+---
+ configure.ac   | 2 ++
+ gdhcp/common.h | 5 +++--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bacf5ec..ad00456 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -186,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+ AC_CHECK_HEADERS([execinfo.h])
+ AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" = "yes"])
+ 
++AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
+diff --git a/gdhcp/common.h b/gdhcp/common.h
+index 75abc18..6899499 100644
+--- a/gdhcp/common.h
++++ b/gdhcp/common.h
+@@ -19,6 +19,7 @@
+  *
+  */
+ 
++#include <config.h>
+ #include <netinet/udp.h>
+ #include <netinet/ip.h>
+ 
+@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths[] = {
+ 	[OPTION_U32]	= 4,
+ };
+ 
+-/* already defined within netinet/in.h if using GNU compiler */
+-#ifndef __USE_GNU
++/* already defined within netinet/in.h if using glibc or musl */
++#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
+ struct in6_pktinfo {
+ 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
+ 	unsigned int ipi6_ifindex;  /* send/recv interface index */
+-- 
+2.8.1
+
+
+From c0726e432fa0274a2b9c70179b03df6720972816 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 15:19:23 +0100
+Subject: [PATCH 3/3] Rationalise includes
+
+gweb/gresolv.c uses snprintf() and isspace() so it should include stdio.h and
+ctype.h.
+
+tools/dnsproxy-test uses functions from stdio.h.
+
+musl warns when sys/ headers are included when the non-sys form should be used,
+so switch sys/errno.h and so on to errno.h.
+
+musl also causes redefinition errors when pieces of the networking headers are
+included, so remove the redundant includes.
+
+Based on work by Khem Raj <raj.khem@gmail.com>.
+---
+ gweb/gresolv.c               | 2 ++
+ plugins/wifi.c               | 3 +--
+ src/ippool.c                 | 1 -
+ src/iptables.c               | 2 +-
+ src/tethering.c              | 2 --
+ tools/dhcp-test.c            | 1 -
+ tools/dnsproxy-test.c        | 1 +
+ tools/private-network-test.c | 2 +-
+ tools/tap-test.c             | 2 +-
+ 9 files changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/gweb/gresolv.c b/gweb/gresolv.c
+index 8a51a9f..d55027c 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -23,11 +23,13 @@
+ #include <config.h>
+ #endif
+ 
++#include <ctype.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stdio.h>
+ #include <resolv.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+diff --git a/plugins/wifi.c b/plugins/wifi.c
+index 9d56671..148131d 100644
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
+index cea1dcc..8a645da 100644
+--- a/src/ippool.c
++++ b/src/ippool.c
+@@ -28,7 +28,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/errno.h>
+ #include <sys/socket.h>
+ 
+ #include "connman.h"
+diff --git a/src/iptables.c b/src/iptables.c
+index 5ef757a..82e3ac4 100644
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
+ #include <inttypes.h>
+diff --git a/src/tethering.c b/src/tethering.c
+index 3153349..ad062d5 100644
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
+index 57917f5..cb3ee62 100644
+--- a/tools/tap-test.c
++++ b/tools/tap-test.c
+@@ -28,7 +28,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <string.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/ioctl.h>
+ 
+ #include <netinet/in.h>
+-- 
+2.8.1
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 5485c15..6c7e10c 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -4,10 +4,9 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://connman \
             file://no-version-scripts.patch \
+            file://includes.patch \
             "
-SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-                            file://0003-Fix-header-inclusions-for-musl.patch \
-                           "
+SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
 SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
 SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
-- 
2.8.1


