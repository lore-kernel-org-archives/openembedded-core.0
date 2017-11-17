Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA7578827
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 02:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAH2IaoL031973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:18:37 -0800
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 16 Nov 2017 18:18:35 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jackie.huang@windriver.com>
Date: Fri, 17 Nov 2017 10:17:13 +0800
Message-ID: <1510885033-25394-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH] ppp: include netinet/in.h before linux/in.h in pppoe.h
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
X-List-Received-Date: Fri, 17 Nov 2017 02:18:36 -0000
Content-Type: text/plain

The patch ppp-fix-building-with-linux-4.8.patch tries to fix build error
with 4.8 or newer linux headers, but it would break building with kernel
< 4.8. There is a better solution to fix this issue in upstream.
Backport the upstream patch and replace the old one.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...oe-include-netinet-in.h-before-linux-in.h.patch | 54 ++++++++++++++++++++++
 .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ------------------
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  2 +-
 3 files changed, 55 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
new file mode 100644
index 0000000..9362d12
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
@@ -0,0 +1,54 @@
+From 50a2997b256e0e0ef7a46fae133f56f60fce539c Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Mon, 9 Jan 2017 13:34:23 +0000
+Subject: [PATCH] pppoe: include netinet/in.h before linux/in.h
+
+This fixes builds with newer kernels. Basically, <netinet/in.h> needs to be
+included before <linux/in.h> otherwise the earlier, unaware of the latter,
+tries to redefine symbols and structures. Also, <linux/if_pppox.h> doesn't work
+alone anymore, since it pulls the headers in the wrong order, so we better
+include <netinet/in.h> early.
+
+Upstream-Status: Backport
+[https://github.com/paulusmack/ppp/commit/50a2997b256e0e0ef7a46fae133f56f60fce539c]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ pppd/plugins/rp-pppoe/pppoe.h | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..c4aaa6e 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -47,6 +47,10 @@
+ #include <sys/socket.h>
+ #endif
+ 
++/* This has to be included before Linux 4.8's linux/in.h
++ * gets dragged in. */
++#include <netinet/in.h>
++
+ /* Ugly header files on some Linux boxes... */
+ #if defined(HAVE_LINUX_IF_H)
+ #include <linux/if.h>
+@@ -84,8 +88,6 @@ typedef unsigned long UINT32_t;
+ #include <linux/if_ether.h>
+ #endif
+ 
+-#include <netinet/in.h>
+-
+ #ifdef HAVE_NETINET_IF_ETHER_H
+ #include <sys/types.h>
+ 
+@@ -98,7 +100,6 @@ typedef unsigned long UINT32_t;
+ #endif
+ 
+ 
+-
+ /* Ethernet frame types according to RFC 2516 */
+ #define ETH_PPPOE_DISCOVERY 0x8863
+ #define ETH_PPPOE_SESSION   0x8864
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
deleted file mode 100644
index f77b0de..0000000
--- a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3da19af53e2eee2e77b456cfbb9d633b06656d38 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 13 Oct 2016 13:41:43 +0800
-Subject: [PATCH] ppp: fix building with linux-4.8
-
-Fix a build error when using the linux-4.8 headers that results in:
-
-In file included from pppoe.h:87:0,
-                 from plugin.c:29:
-../usr/include/netinet/in.h:211:8: note: originally defined here
- struct in6_addr
-        ^~~~~~~~
-In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
-                 from ../usr/include/linux/if_pppox.h:26,
-                 from plugin.c:52:
-../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
- struct sockaddr_in6 {
-        ^~~~~~~~~~~~
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/paulusmack/ppp/pull/69
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- pppd/plugins/rp-pppoe/pppoe.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index 9ab2eee..96d2794 100644
---- a/pppd/plugins/rp-pppoe/pppoe.h
-+++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
- #include <linux/if_ether.h>
- #endif
- 
--#include <netinet/in.h>
-+#include <linux/in.h>
- 
- #ifdef HAVE_NETINET_IF_ETHER_H
- #include <sys/types.h>
--- 
-2.8.3
-
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index b2c4d4c..a5f764f 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
            file://ppp@.service \
            file://fix-CVE-2015-3310.patch \
-           file://ppp-fix-building-with-linux-4.8.patch \
+           file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
 "
 
-- 
2.7.4


