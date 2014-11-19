Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE9D72156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 02:41:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ2ficP004241
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 18:41:44 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 18:41:44 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 20:41:43 -0600
Message-ID: <1416364903-214029-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH][dizzy] util-linux-native: workaround the build on CentOS 5.10
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
X-List-Received-Date: Wed, 19 Nov 2014 02:41:44 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

[ Sent for Yocto Project compliance, unlikely to be generally applicable ]

There are no MS_* macros are added after glibc 2.7.0, but it is 2.5 on
CentOS 5.10, so workaround atm, I think that we can try to use the
macros from libmount.h as a fix.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../util-linux/util-linux-native-MS.patch          | 48 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.2.bb  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-MS.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-MS.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-MS.patch
new file mode 100644
index 0000000..971050c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-native-MS.patch
@@ -0,0 +1,48 @@
+From 3664b148e8f72be2d70dc66265edd9f52940ac00 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 27 Mar 2014 13:56:40 +0000
+Subject: [PATCH] sys-utils/unshare.c: fix build on CentOS 10
+
+There are no MS_* macros are added after glibc 2.7.0, but it is 2.5 on
+CentOS 5.10, so workaround atm, I think that we can try to use the
+macros from libmount.h as a fix.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ sys-utils/unshare.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/sys-utils/unshare.c b/sys-utils/unshare.c
+index 114f17d..f293c03 100644
+--- a/sys-utils/unshare.c
++++ b/sys-utils/unshare.c
+@@ -33,6 +33,26 @@
+ #include "namespace.h"
+ #include "exec_shell.h"
+ 
++#ifndef MS_PRIVATE
++#define MS_PRIVATE      (1<<18) /* 262144 Private*/
++#endif
++
++#ifndef MS_REC
++#define MS_REC          0x4000  /* 16384: Recursive loopback */
++#endif
++
++#ifndef MS_NOSUID
++#define MS_NOSUID        2      /* Ignore suid and sgid bits */
++#endif
++
++#ifndef MS_NOEXEC
++#define MS_NOEXEC        8      /* Disallow program execution */
++#endif
++
++#ifndef MS_NODEV
++#define MS_NODEV         4      /* Disallow access to device special files */
++#endif
++
+ static void usage(int status)
+ {
+ 	FILE *out = status == EXIT_SUCCESS ? stdout : stderr;
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.2.bb b/meta/recipes-core/util-linux/util-linux_2.24.2.bb
index ed753e4..d0fc3de 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.2.bb
@@ -7,6 +7,7 @@ PR = "r1"
 OLDHOST = ""
 OLDHOST_class-native = "file://util-linux-native.patch \
                         file://util-linux-native-qsort.patch \
+                        file://util-linux-native-MS.patch \
 			"
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
-- 
1.9.3


