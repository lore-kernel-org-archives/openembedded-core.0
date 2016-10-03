Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E451D70034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:54:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u93Gsk6n013036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Oct 2016 09:54:47 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 3 Oct 2016 09:54:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Mon, 3 Oct 2016 12:54:45 -0400
Message-ID: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
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
X-List-Received-Date: Mon, 03 Oct 2016 16:54:49 -0000
Content-Type: text/plain

commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h, linux/ip.h and linux/in6.h]
breaks the builds of net-tools.

We remove the new includes until such a time that userspace can adapt to the
new kernel headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...1-if_tunnel-remove-include-of-if-ip-in6.h.patch | 33 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
new file mode 100644
index 000000000000..f2011880dccb
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
@@ -0,0 +1,33 @@
+From 017ae5929312685c4c044765445bfd4d2a4abb5c Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 3 Oct 2016 12:27:57 -0400
+Subject: [PATCH] if_tunnel: remove include of if/ip/in6.h
+
+commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h, linux/ip.h and linux/in6.h]
+breaks the builds of net-tools.
+
+We remove the new includes until such a time that userspace can adapt to the
+new kernel headers.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ include/uapi/linux/if_tunnel.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/uapi/linux/if_tunnel.h b/include/uapi/linux/if_tunnel.h
+index 777b6cd..1046f55 100644
+--- a/include/uapi/linux/if_tunnel.h
++++ b/include/uapi/linux/if_tunnel.h
+@@ -2,9 +2,6 @@
+ #define _UAPI_IF_TUNNEL_H_
+ 
+ #include <linux/types.h>
+-#include <linux/if.h>
+-#include <linux/ip.h>
+-#include <linux/in6.h>
+ #include <asm/byteorder.h>
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
index 778f0b6e6443..ee2d8293450e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -10,6 +10,7 @@ SRC_URI_append_libc-musl = "\
 
 SRC_URI_append = "\
     file://0001-ppp-fix-in-if.h-includes.patch \
+    file://0001-if_tunnel-remove-include-of-if-ip-in6.h.patch \
     "
 
 SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
-- 
2.5.0


