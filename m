Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 153357898E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053997"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:51 +0200
Message-Id: <20180308181804.31261-29-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/42] iptables: drop unnecessary patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:26 -0000

These were adding definitions for the second time
(see bug #10450 for why) or adding an include that isn't anymore
necessary for musl builds.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iptables/0001-fix-build-with-musl.patch        | 46 --------------------
 ...d-defines-that-are-required-for-if_packet.patch | 49 ----------------------
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |  2 -
 3 files changed, 97 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/types.h-add-defines-that-are-required-for-if_packet.patch

diff --git a/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch b/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
deleted file mode 100644
index f1f85a6fa0e..00000000000
--- a/meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-[PATCH] fix build with musl
-
-Define additional TCOPTS if not there
-u_initX types are in sys/types.h be explicit about it
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur iptables-1.6.0-origin/extensions/libxt_TCPOPTSTRIP.c iptables-1.6.0/extensions/libxt_TCPOPTSTRIP.c
---- iptables-1.6.0-origin/extensions/libxt_TCPOPTSTRIP.c	2015-12-09 14:55:06.000000000 +0200
-+++ iptables-1.6.0/extensions/libxt_TCPOPTSTRIP.c	2015-12-29 14:44:32.585327077 +0200
-@@ -12,6 +12,21 @@
- #ifndef TCPOPT_MD5SIG
- #	define TCPOPT_MD5SIG 19
- #endif
-+#ifndef TCPOPT_MAXSEG
-+#define TCPOPT_MAXSEG 2
-+#endif
-+#ifndef TCPOPT_WINDOW
-+#define TCPOPT_WINDOW 3
-+#endif
-+#ifndef TCPOPT_SACK_PERMITTED
-+#define TCPOPT_SACK_PERMITTED 4
-+#endif
-+#ifndef TCPOPT_SACK
-+#define TCPOPT_SACK 5
-+#endif
-+#ifndef TCPOPT_TIMESTAMP
-+#define TCPOPT_TIMESTAMP 8
-+#endif
- 
- enum {
- 	O_STRIP_OPTION = 0,
-diff -Naur iptables-1.6.0-origin/include/linux/netfilter_ipv4/ip_tables.h iptables-1.6.0/include/linux/netfilter_ipv4/ip_tables.h
---- iptables-1.6.0-origin/include/linux/netfilter_ipv4/ip_tables.h	2015-12-09 14:55:06.000000000 +0200
-+++ iptables-1.6.0/include/linux/netfilter_ipv4/ip_tables.h	2015-12-29 14:40:21.250469195 +0200
-@@ -15,6 +15,7 @@
- #ifndef _IPTABLES_H
- #define _IPTABLES_H
- 
-+#include <sys/types.h>
- #include <linux/types.h>
- 
- #include <linux/netfilter_ipv4.h>
diff --git a/meta/recipes-extended/iptables/iptables/types.h-add-defines-that-are-required-for-if_packet.patch b/meta/recipes-extended/iptables/iptables/types.h-add-defines-that-are-required-for-if_packet.patch
deleted file mode 100644
index 24ee29e2d10..00000000000
--- a/meta/recipes-extended/iptables/iptables/types.h-add-defines-that-are-required-for-if_packet.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 19593491f43b70c1a71c3b9b8f4ff4fd14500014 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Fri, 23 Mar 2012 14:27:20 -0400
-Subject: [PATCH] types.h: add defines that are required for if_packet.h
-
-The iptables local linux/types.h overrides the kernel/sysroot
-types.h. As such, we need to provide some defines that are required
-to build against 3.2+ kernel headers.
-
-ifndef protection is provided for the defines to ensure that
-configuration that already have these defines are still buildable.
-
-This commit is temporary until a new version of iptables can be
-used that contains the defines.
-
-This is similar to the commit in the iptables git repository:
-
-  https://git.netfilter.org/cgi-bin/gitweb.cgi?p=iptables.git;a=commit;h=dbe77cc974cee656eae37e75039dd1a410a4535b
-
-Upstream-Status: Backport
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- include/linux/types.h |   10 ++++++++++
- 1 files changed, 10 insertions(+), 0 deletions(-)
-
-diff --git a/include/linux/types.h b/include/linux/types.h
-index 8b483c8..ebf6432 100644
---- a/include/linux/types.h
-+++ b/include/linux/types.h
-@@ -34,5 +34,15 @@ typedef __u64 __bitwise __be64;
- typedef __u16 __bitwise __sum16;
- typedef __u32 __bitwise __wsum;
- 
-+#ifndef __aligned_u64
-+#define __aligned_u64 __u64 __attribute__((aligned(8)))
-+#endif
-+#ifndef __aligned_be64
-+#define __aligned_be64 __be64 __attribute__((aligned(8)))
-+#endif
-+#ifndef __aligned_le64
-+#define __aligned_le64 __le64 __attribute__((aligned(8)))
-+#endif
-+
- #endif /*  __ASSEMBLY__ */
- #endif /* _LINUX_TYPES_H */
--- 
-1.7.0.4
-
diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index b37c55a64ea..d6e36fbee9a 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -19,10 +19,8 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
 FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
-           file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-           file://0001-fix-build-with-musl.patch \
 "
 
 SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
-- 
2.16.1


