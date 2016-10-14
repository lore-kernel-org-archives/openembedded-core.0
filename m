Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A37471AED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 01:08:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9E18vCx028283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:08:57 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Oct 2016 18:08:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 08:50:11 +0800
Message-ID: <07b4065b12f5cf9dfe816e7cdb68a5e7d83e04c0.1476345470.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1476345470.git.jackie.huang@windriver.com>
References: <cover.1476345470.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ppp: fix building with linux-4.8
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
X-List-Received-Date: Fri, 14 Oct 2016 01:08:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix a build error when using the linux-4.8 headers that results in:

In file included from pppoe.h:87:0,
                 from plugin.c:29:
../usr/include/netinet/in.h:211:8: note: originally defined here
 struct in6_addr
        ^~~~~~~~
In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
                 from ../usr/include/linux/if_pppox.h:26,
                 from plugin.c:52:
../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
 struct sockaddr_in6 {
        ^~~~~~~~~~~~

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ++++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
new file mode 100644
index 0000000..f77b0de
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
@@ -0,0 +1,44 @@
+From 3da19af53e2eee2e77b456cfbb9d633b06656d38 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 13 Oct 2016 13:41:43 +0800
+Subject: [PATCH] ppp: fix building with linux-4.8
+
+Fix a build error when using the linux-4.8 headers that results in:
+
+In file included from pppoe.h:87:0,
+                 from plugin.c:29:
+../usr/include/netinet/in.h:211:8: note: originally defined here
+ struct in6_addr
+        ^~~~~~~~
+In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
+                 from ../usr/include/linux/if_pppox.h:26,
+                 from plugin.c:52:
+../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
+ struct sockaddr_in6 {
+        ^~~~~~~~~~~~
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/paulusmack/ppp/pull/69
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ pppd/plugins/rp-pppoe/pppoe.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..96d2794 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
+ #include <linux/if_ether.h>
+ #endif
+ 
+-#include <netinet/in.h>
++#include <linux/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
+ #include <sys/types.h>
+-- 
+2.8.3
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 4437b5c..56dbd98 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
            file://ppp@.service \
            file://fix-CVE-2015-3310.patch \
+           file://ppp-fix-building-with-linux-4.8.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.8.3


