Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4704C73D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:01 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so37722805pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=lYWKcuAnEWkSBJ8AvOrTEgzfKNNCFo2igdKfQIe8vRs=;
	b=yPrz1ZZDRsTT0vR8KGhCa30yfCtCd7Gft3Wn9cdP3n8C0T86ZMayEC8EnUnovunpDO
	Dg+xrnCOrM0ZNw/LeXCSeWUReLl9dmEwJfALUBTJuWhJexBo8Gmpzxw2HXvIZ4UQdCgV
	Q12kM6XQSGp/wVJqIhPUXECSXwn+hjOcamQFN4/Z81n4xN6n3H/kHwgrvCVpt3B0TWzl
	ZeBf6rzp2kvYNLwVR8IHTvOf4sofm4iX/cD+uFzOFgiKqHjk1IqYasAowMV97ltY858s
	Ho9pu042bYeisDpAA76wOmU8as21O4fyx+OiyZI41AqHkMIH1FEReKPZdwzh8ueoCOLH
	tEFg==
X-Received: by 10.68.223.130 with SMTP id qu2mr7260838pbc.116.1428715263433;
	Fri, 10 Apr 2015 18:21:03 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:41 -0700
Message-Id: <f33d7bfc844cb266a84f8f7c9b59e0f6d4c93e65.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 10/17] iptables: Fix build on musl
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:02 -0000

Added needed headers and resuffled existing ones to get it portable
Added defined for missing TCOPTS*

Change-Id: I74977dd052c5569b00631379d7f4bacfb86cf381
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iptables/0001-fix-build-with-musl.patch        | 89 ++++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch

diff --git a/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch b/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
new file mode 100644
index 0000000..7a003d9
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
@@ -0,0 +1,89 @@
+From 7c07b7fd4fdd7844dd032af822306f08e4422c34 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 20:47:29 -0700
+Subject: [PATCH] fix build with musl
+
+Add needed headers they are just not needed for glibc6+ but also
+for musl
+Define additional TCOPTS if not there
+
+u_initX types are in sys/types.h be explicit about it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extensions/libxt_TCPOPTSTRIP.c           | 15 +++++++++++++++
+ include/libiptc/ipt_kernel_headers.h     | 12 ------------
+ include/linux/netfilter_ipv4/ip_tables.h |  1 +
+ 3 files changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/extensions/libxt_TCPOPTSTRIP.c b/extensions/libxt_TCPOPTSTRIP.c
+index 6897857..8a170b2 100644
+--- a/extensions/libxt_TCPOPTSTRIP.c
++++ b/extensions/libxt_TCPOPTSTRIP.c
+@@ -12,6 +12,21 @@
+ #ifndef TCPOPT_MD5SIG
+ #	define TCPOPT_MD5SIG 19
+ #endif
++#ifndef TCPOPT_MAXSEG
++#	define TCPOPT_MAXSEG 2
++#endif
++#ifndef TCPOPT_WINDOW
++#	define TCPOPT_WINDOW 3
++#endif
++#ifndef TCPOPT_SACK_PERMITTED
++#	define TCPOPT_SACK_PERMITTED 4
++#endif
++#ifndef TCPOPT_SACK
++#	define TCPOPT_SACK 5
++#endif
++#ifndef TCPOPT_TIMESTAMP
++#	define TCPOPT_TIMESTAMP 8
++#endif
+ 
+ enum {
+ 	O_STRIP_OPTION = 0,
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index 18861fe..a5963e9 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -5,7 +5,6 @@
+ 
+ #include <limits.h>
+ 
+-#if defined(__GLIBC__) && __GLIBC__ == 2
+ #include <netinet/ip.h>
+ #include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+@@ -13,15 +12,4 @@
+ #include <netinet/udp.h>
+ #include <net/if.h>
+ #include <sys/types.h>
+-#else /* libc5 */
+-#include <sys/socket.h>
+-#include <linux/ip.h>
+-#include <linux/in.h>
+-#include <linux/if.h>
+-#include <linux/icmp.h>
+-#include <linux/tcp.h>
+-#include <linux/udp.h>
+-#include <linux/types.h>
+-#include <linux/in6.h>
+-#endif
+ #endif
+diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
+index 57fd82a..4807246 100644
+--- a/include/linux/netfilter_ipv4/ip_tables.h
++++ b/include/linux/netfilter_ipv4/ip_tables.h
+@@ -15,6 +15,7 @@
+ #ifndef _IPTABLES_H
+ #define _IPTABLES_H
+ 
++#include <sys/types.h>
+ #include <linux/types.h>
+ 
+ #include <linux/netfilter_ipv4.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index dc17d57..31c017b 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -22,6 +22,7 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+           file://0001-fix-build-with-musl.patch \
           "
 
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
-- 
2.1.4


