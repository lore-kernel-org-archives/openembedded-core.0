Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D74F3719F9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 01:14:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u991EXvD024630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Oct 2016 18:14:33 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sat, 8 Oct 2016 18:14:32 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Oct 2016 08:56:07 +0800
Message-ID: <c29cd7e54cfdba0c62f2836b920d299e8215ec24.1475973333.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1475973333.git.jackie.huang@windriver.com>
References: <cover.1475973333.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] net-tools: fix building with linux-4.8
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
X-List-Received-Date: Sun, 09 Oct 2016 01:14:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix a build error when using the linux-4.8 headers that results in:

In file included from
.../sysroots/qemuarm64/usr/include/linux/if_tunnel.h:6:0,
                  from iptunnel.c:39:
.../qemuarm64/usr/include/linux/ip.h:85:8: error: redefinition of
'struct iphdr'
  struct iphdr {
         ^~~~~
In file included from iptunnel.c:29:0:
.../qemuarm64/usr/include/netinet/ip.h:44:8: note: originally defined here
  struct iphdr
         ^~~~~
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../net-tools-fix-building-with-linux-4.8.patch    | 52 ++++++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch b/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
new file mode 100644
index 0000000..505eeb0
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
@@ -0,0 +1,52 @@
+From 4d56645ea144a34f7cdd3e3ede6452d81fbae251 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Sat, 8 Oct 2016 14:42:54 +0800
+Subject: [PATCH] iptunnel.c: include linux/ip.h to fix building with linux-4.8
+
+Fix a build error when using the linux-4.8 headers that results in:
+
+In file included from
+.../sysroots/qemuarm64/usr/include/linux/if_tunnel.h:6:0,
+                  from iptunnel.c:39:
+.../qemuarm64/usr/include/linux/ip.h:85:8: error: redefinition of
+'struct iphdr'
+  struct iphdr {
+         ^~~~~
+In file included from iptunnel.c:29:0:
+.../qemuarm64/usr/include/netinet/ip.h:44:8: note: originally defined here
+  struct iphdr
+         ^~~~~
+
+Upstream-Status: Submitted [1]
+
+[1] https://sourceforge.net/p/net-tools/mailman/message/35413022/
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ iptunnel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptunnel.c b/iptunnel.c
+index 4943d83..acfcbc7 100644
+--- a/iptunnel.c
++++ b/iptunnel.c
+@@ -26,7 +26,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <netinet/in.h>
+-#include <netinet/ip.h>
+ #include <arpa/inet.h>
+ #if defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))
+ #include <net/if.h>
+@@ -36,6 +35,7 @@
+ #include <linux/if_arp.h>
+ #endif
+ #include <linux/types.h>
++#include <linux/ip.h>
+ #include <linux/if_tunnel.h>
+ 
+ #include "config.h"
+-- 
+2.8.3
+
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 9c2adfa..47a68a5 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-1.60-sctp2-quiet.patch \
            file://net-tools-1.60-sctp3-addrs.patch \
            file://0001-lib-inet6.c-INET6_rresolve-various-fixes.patch \
+           file://net-tools-fix-building-with-linux-4.8.patch \
           "
 
 # for this package we're mostly interested in tracking debian patches,
-- 
2.8.3


