Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 242ED60249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2A7NrlU028972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Mar 2016 23:23:54 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:17 -0500
Message-ID: <1355785bfbccfaa30c5c46d193565fb7c747ec8a.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/18] dtc.inc: fix buildpaths QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:54 -0000
Content-Type: text/plain

Previous Makefile define its own CFLAGS, pass DEBUG_FLAGS to
it could fix build path issue in DWARF.

[YOCTO #8457]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/dtc/dtc.inc                    |  3 ++-
 .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0c409b0..ea44877 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,9 +6,10 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
+           file://pass-DEBUG_FLAGS-to-CFLAGS.patch \
 	  "
 
-EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
+EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}" DEBUG_FLAGS="${DEBUG_FLAGS}"'
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch b/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
new file mode 100644
index 0000000..3f17ee9
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
@@ -0,0 +1,30 @@
+From 4019e29b0c1ec441fa43d9969197c24ad73f3b1a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Feb 2016 03:28:15 -0500
+Subject: [PATCH] Makefile: pass DEBUG_FLAGS to CFLAGS
+
+It fixes buildpaths issue while compiling.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 18838cc..4954f32 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
+ CPPFLAGS = -I libfdt -I .
+ WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
+-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
++CFLAGS = $(DEBUG_FLAGS) -Os -fPIC -Werror $(WARNINGS)
+ 
+ BISON = bison
+ LEX = flex
+-- 
+1.9.1
+
-- 
1.9.1


