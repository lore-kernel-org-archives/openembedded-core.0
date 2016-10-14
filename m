Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCF971ACD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 01:08:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9E18tHf001340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:08:55 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Oct 2016 18:08:54 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 08:50:10 +0800
Message-ID: <5ad724ccd144c455ba94efa19fc57ddd61da6427.1476345470.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1476345470.git.jackie.huang@windriver.com>
References: <cover.1476345470.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "linux-libc-headers: fix in/if.h includes"
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
X-List-Received-Date: Fri, 14 Oct 2016 01:08:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This issue is fixed in the ppp recipe.

This reverts commit 7c6b78ac8e2b176f77178c3dd12d8455be10845d.
---
 .../0001-ppp-fix-in-if.h-includes.patch            | 83 ----------------------
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  4 --
 2 files changed, 87 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch
deleted file mode 100644
index f31a539..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 80f3064c378f8c919aa6450bd7833a154c184f7f Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Mon, 3 Oct 2016 01:18:13 -0400
-Subject: [PATCH] ppp: fix in/if.h includes
-
-The following kernel commits broke the compilation of ppp, due to redefined
-structures.
-
-Nothing else breaks in userspace with or without these uapi changes, so we
-revert them to keep everything building.
-		     
-   commit 05ee5de7451796cf9a8aeb2f05a57790d4fd2336
-   Author: Mikko Rapeli <mikko.rapeli@iki.fi>
-   Date:   Mon Aug 22 20:32:42 2016 +0200
-
-       include/uapi/linux/if_pppol2tp.h: include linux/in.h and linux/in6.h
-
-       Fixes userspace compilation errors like:
-
-       error: field <E2><80><98>addr<E2><80><99> has incomplete type
-	struct sockaddr_in addr; /* IP address and port to send to */
-			   ^
-       error: field <E2><80><98>addr<E2><80><99> has incomplete type
-	struct sockaddr_in6 addr; /* IP address and port to send to */
-
-       Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
-       Signed-off-by: David S. Miller <davem@davemloft.net>
-
-   commit eafe92114308acf14e45c6c3d154a5dad5523d1a
-   Author: Mikko Rapeli <mikko.rapeli@iki.fi>
-   Date:   Mon Aug 22 20:32:43 2016 +0200
-
-       include/uapi/linux/if_pppox.h: include linux/in.h and linux/in6.h
-
-       Fixes userspace compilation errors:
-
-       error: field <E2><80><98>addr<E2><80><99> has incomplete type
-	struct sockaddr_in addr; /* IP address and port to send to */
-
-       error: field <E2><80><98>addr<E2><80><99> has incomplete type
-	struct sockaddr_in6 addr; /* IP address and port to send to */
-
-       Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
-       Signed-off-by: David S. Miller <davem@davemloft.net>
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- include/uapi/linux/if_pppol2tp.h | 2 --
- include/uapi/linux/if_pppox.h    | 3 ---
- 2 files changed, 5 deletions(-)
-
-diff --git a/include/uapi/linux/if_pppol2tp.h b/include/uapi/linux/if_pppol2tp.h
-index 4bd1f55..ca559c6 100644
---- a/include/uapi/linux/if_pppol2tp.h
-+++ b/include/uapi/linux/if_pppol2tp.h
-@@ -16,8 +16,6 @@
- #define _UAPI__LINUX_IF_PPPOL2TP_H
- 
- #include <linux/types.h>
--#include <linux/in.h>
--#include <linux/in6.h>
- 
- /* Structure used to connect() the socket to a particular tunnel UDP
-  * socket over IPv4.
-diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox.h
-index d37bbb1..e128769 100644
---- a/include/uapi/linux/if_pppox.h
-+++ b/include/uapi/linux/if_pppox.h
-@@ -21,11 +21,8 @@
- #include <asm/byteorder.h>
- 
- #include <linux/socket.h>
--#include <linux/if.h>
- #include <linux/if_ether.h>
- #include <linux/if_pppol2tp.h>
--#include <linux/in.h>
--#include <linux/in6.h>
- 
- /* For user-space programs to pick up these definitions
-  * which they wouldn't get otherwise without defining __KERNEL__
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
index 778f0b6..77e0870 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -8,9 +8,5 @@ SRC_URI_append_libc-musl = "\
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
    "
 
-SRC_URI_append = "\
-    file://0001-ppp-fix-in-if.h-includes.patch \
-    "
-
 SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
 SRC_URI[sha256sum] = "3e9150065f193d3d94bcf46a1fe9f033c7ef7122ab71d75a7fb5a2f0c9a7e11a"
-- 
2.8.3


