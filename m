Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CCBB1788C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:41:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FDf4oX016288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 13:41:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002Qf-F0; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:54 -0700
Message-Id: <1521121262-9269-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [pyro][PATCH 05/13] libtirpc: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Thu, 15 Mar 2018 13:41:13 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-include-stdint.h-for-uintptr_t.patch      | 32 ++++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
new file mode 100644
index 0000000..1fe9833
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
@@ -0,0 +1,32 @@
+From b80d3b573c1dade2b29b22f8acc3b9e2c7ddefd7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 13:36:43 -0700
+Subject: [PATCH] include stdint.h for uintptr_t
+
+Fixes
+| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+|   if (len < (uintptr_t)xdrs->x_base) {
+|              ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/xdr_sizeof.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
+index d23fbd1..79d6707 100644
+--- a/src/xdr_sizeof.c
++++ b/src/xdr_sizeof.c
+@@ -39,6 +39,7 @@
+ #include <rpc/xdr.h>
+ #include <sys/types.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include "un-namespace.h"
+ 
+ /* ARGSUSED */
+-- 
+2.13.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 662c899..5518fb3 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://libtirpc-0.2.1-fortify.patch \
            file://export_key_secretkey_is_set.patch \
            file://0001-replace-__bzero-with-memset-API.patch \
+           file://0001-include-stdint.h-for-uintptr_t.patch \
            "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.7.4


