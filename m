Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 607D26F584
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:27:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s238RqOw010336
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 00:27:52 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 00:27:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 16:27:32 +0800
Message-ID: <0e2e1178c038894f7511df7fdaf266cb546d4535.1393835059.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393835059.git.hongxu.jia@windriver.com>
References: <cover.1393835059.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] ppp: drop if_pppol2tp.h patches
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
X-List-Received-Date: Mon, 03 Mar 2014 08:27:52 -0000
Content-Type: text/plain

The old version of Linux if_pppol2tp.h was removed, so droped the
related patches.

Here is the commit from git://github.com/paulusmack/ppp.git
...
commit c41092dd4c49267f232f6cba3d31c6c68bfdf68d
Author: Paul Mackerras <paulus@samba.org>
Date:   Sun May 20 16:48:17 2012 +1000

Remove old version of Linux if_pppol2tp.h

This has been in the Linux kernel source now for long enough that we
can rely on getting a usable version from /usr/include on all
distributions that we care about.  The version we have here had started
to lag behind what is in the Linux kernel, causing compilation errors
due to struct pppol2tpv3_addr being undefined.  Removing our local
version means we will use what is in /usr/include instead.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-ppp-Add-two-structures-in-if_pppol2tp.h.patch | 60 ----------------------
 .../ppp/ppp-2.4.5/update_if_pppol2tp.patch         | 54 -------------------
 2 files changed, 114 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
deleted file mode 100644
index 33b200a..0000000
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 17ffc69db08c809c069e73aa2f2ed2ce02df5fa8 Mon Sep 17 00:00:00 2001
-From: Lu Chong <Chong.Lu@windriver.com>
-Date: Sat, 2 Nov 2013 14:34:24 +0800
-Subject: [PATCH] ppp: Add two structures in if_pppol2tp.h
-
-Some further structure definitions are needed in include/linux/if_pppol2tp.h for IPv6 support.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
----
- include/linux/if_pppol2tp.h |   25 +++++++++++++++++++++++++
- 1 file changed, 25 insertions(+)
-
-diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
-index 7ee86b2..9d626d1 100644
---- a/include/linux/if_pppol2tp.h
-+++ b/include/linux/if_pppol2tp.h
-@@ -32,6 +32,20 @@ struct pppol2tp_addr {
- 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
- };
- 
-+/* Structure used to connect() the socket to a particular tunnel UDP
-+ * socket over IPv6.
-+ */
-+struct pppol2tpin6_addr {
-+        __kernel_pid_t  pid;            /* pid that owns the fd.
-+                                         * 0 => current */
-+        int     fd;                     /* FD of UDP socket to use */
-+
-+        __u16 s_tunnel, s_session;      /* For matching incoming packets */
-+        __u16 d_tunnel, d_session;      /* For sending outgoing packets */
-+
-+        struct sockaddr_in6 addr;       /* IP address and port to send to */
-+};
-+
- /* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
-  * bits. So we need a different sockaddr structure.
-  */
-@@ -46,6 +60,17 @@ struct pppol2tpv3_addr {
- 	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
- };
- 
-+struct pppol2tpv3in6_addr {
-+        __kernel_pid_t  pid;            /* pid that owns the fd.
-+                                         * 0 => current */
-+        int     fd;                     /* FD of UDP or IP socket to use */
-+
-+        __u32 s_tunnel, s_session;      /* For matching incoming packets */
-+        __u32 d_tunnel, d_session;      /* For sending outgoing packets */
-+
-+        struct sockaddr_in6 addr;       /* IP address and port to send to */
-+};
-+
- /* Socket options:
-  * DEBUG	- bitmask of debug message categories
-  * SENDSEQ	- 0 => don't send packets with sequence numbers
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
deleted file mode 100644
index e034f19..0000000
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Pending
-diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
-index 4113d6a..7ee86b2 100644
---- a/include/linux/if_pppol2tp.h
-+++ b/include/linux/if_pppol2tp.h
-@@ -2,7 +2,7 @@
-  * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
-  *
-  * This file supplies definitions required by the PPP over L2TP driver
-- * (pppol2tp.c).  All version information wrt this file is located in pppol2tp.c
-+ * (l2tp_ppp.c).  All version information wrt this file is located in l2tp_ppp.c
-  *
-  * License:
-  *		This program is free software; you can redistribute it and/or
-@@ -15,14 +15,14 @@
- #ifndef __LINUX_IF_PPPOL2TP_H
- #define __LINUX_IF_PPPOL2TP_H
- 
--#include <asm/types.h>
-+#include <linux/types.h>
-+
- 
- /* Structure used to connect() the socket to a particular tunnel UDP
-  * socket.
-  */
--struct pppol2tp_addr
--{
--	pid_t	pid;			/* pid that owns the fd.
-+struct pppol2tp_addr {
-+	__kernel_pid_t	pid;		/* pid that owns the fd.
- 					 * 0 => current */
- 	int	fd;			/* FD of UDP socket to use */
- 
-@@ -32,6 +32,20 @@ struct pppol2tp_addr
- 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
- };
- 
-+/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
-+ * bits. So we need a different sockaddr structure.
-+ */
-+struct pppol2tpv3_addr {
-+	pid_t	pid;			/* pid that owns the fd.
-+					 * 0 => current */
-+	int	fd;			/* FD of UDP or IP socket to use */
-+
-+	struct sockaddr_in addr;	/* IP address and port to send to */
-+
-+	__u32 s_tunnel, s_session;	/* For matching incoming packets */
-+	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
-+};
-+
- /* Socket options:
-  * DEBUG	- bitmask of debug message categories
-  * SENDSEQ	- 0 => don't send packets with sequence numbers
-- 
1.8.1.2


