Return-Path: <Kai.Kang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 390766B8A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 02:20:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7K2KIWH000080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2013 22:20:19 -0400 (EDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 19 Aug 2013 19:20:17 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 20 Aug 2013 10:20:08 +0800
Message-ID: <5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376965065.git.kai.kang@windriver.com>
References: <cover.1376965065.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] bc: fix segmentation fault
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
X-List-Received-Date: Tue, 20 Aug 2013 02:20:20 -0000
Content-Type: text/plain

When run 'bc -l', it segmentation faults. Apply patch from BLFS to fix it.

Ref:
http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04601.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/bc/bc_1.06.bb                |  3 ++-
 .../bc/files/fix-segment-fault.patch               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index fe9c3f4..4b28fad 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -13,7 +13,8 @@ SECTION = "base"
 DEPENDS = "flex"
 PR = "r2"
 
-SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
+           file://fix-segment-fault.patch "
 
 SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
 SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
diff --git a/meta/recipes-extended/bc/files/fix-segment-fault.patch b/meta/recipes-extended/bc/files/fix-segment-fault.patch
new file mode 100644
index 0000000..20c0da2
--- /dev/null
+++ b/meta/recipes-extended/bc/files/fix-segment-fault.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+when run command such as 'echo "a = 13" | bc -l', it segmentation faults.
+This patch is from http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04602.html.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+--- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
++++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
+@@ -34,6 +34,7 @@
+ #include <number.h>
+ #include <assert.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <ctype.h>/* Prototypes needed for external utility routines. */
+ 
+ #define bc_rt_warn rt_warn
+--- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
++++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
+@@ -156,7 +156,7 @@
+   long  label_no;
+   long  vaf_name;	/* variable, array or function number. */
+   long  func;
+-  program_counter save_adr;
++  static program_counter save_adr;
+ 
+   /* Initialize. */
+   str = code;
-- 
1.8.1.2


