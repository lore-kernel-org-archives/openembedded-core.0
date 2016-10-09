Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F749719CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 01:14:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u991EVOt000970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Oct 2016 18:14:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sat, 8 Oct 2016 18:14:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Oct 2016 08:56:06 +0800
Message-ID: <fc1b7a7a722d7773af1919bc1fc087d0610f13da.1475973333.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1475973333.git.jackie.huang@windriver.com>
References: <cover.1475973333.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "linux-libc-headers: if_tunnel: remove include of if/ip/in6.h"
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
X-List-Received-Date: Sun, 09 Oct 2016 01:14:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The issue is fixed in net-tools.

This reverts commit fb71f34d7379569c23cc00e18d134093147613f5.
---
 ...1-if_tunnel-remove-include-of-if-ip-in6.h.patch | 33 ----------------------
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
deleted file mode 100644
index f201188..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 017ae5929312685c4c044765445bfd4d2a4abb5c Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Mon, 3 Oct 2016 12:27:57 -0400
-Subject: [PATCH] if_tunnel: remove include of if/ip/in6.h
-
-commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h, linux/ip.h and linux/in6.h]
-breaks the builds of net-tools.
-
-We remove the new includes until such a time that userspace can adapt to the
-new kernel headers.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- include/uapi/linux/if_tunnel.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/include/uapi/linux/if_tunnel.h b/include/uapi/linux/if_tunnel.h
-index 777b6cd..1046f55 100644
---- a/include/uapi/linux/if_tunnel.h
-+++ b/include/uapi/linux/if_tunnel.h
-@@ -2,9 +2,6 @@
- #define _UAPI_IF_TUNNEL_H_
- 
- #include <linux/types.h>
--#include <linux/if.h>
--#include <linux/ip.h>
--#include <linux/in6.h>
- #include <asm/byteorder.h>
- 
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
index ee2d829..778f0b6 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -10,7 +10,6 @@ SRC_URI_append_libc-musl = "\
 
 SRC_URI_append = "\
     file://0001-ppp-fix-in-if.h-includes.patch \
-    file://0001-if_tunnel-remove-include-of-if-ip-in6.h.patch \
     "
 
 SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
-- 
2.8.3


