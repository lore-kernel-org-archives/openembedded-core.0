Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 648A865FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s88Jtdoh019781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:39 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:23 -0400
Message-ID: <4acec69d24f74514f78156cb21ed8e0f57e89532.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] perf: fix v3.17 powerpc compilation issues
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:47 -0000
Content-Type: text/plain

The powerpc perf arch port has two issues in the current 3.17-rc
seriers. Undefined dwarf symbols and undefined pr_debug calls.

commit a60335ba [perf tools powerpc: Adjust callchain based on DWARF debug info]
introduces skip-callchain-idx.c, and breaks the perf build.

Unitl fixes get into the mainline kernel, we temporarily fix the issues by
adding a forced linke to -ldw and modifying skip-callchain-idx.c to include
the proper debug files for pr_debug.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ebfedb91d715..5bf7af9d4a7c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -75,6 +75,7 @@ EXTRA_OEMAKE = '\
     ARCH=${ARCH} \
     CC="${CC}" \
     AR="${AR}" \
+    EXTRA_CFLAGS="-ldw" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
 '
@@ -140,6 +141,10 @@ do_configure_prepend () {
     if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
         sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
     fi
+    # 3.17-rc1+ has a include issue for powerpc. Temporarily sed in the appropriate include
+    if [ -e "${S}/tools/perf/arch/powerpc/util/skip-callchain-idx.c" ]; then
+        sed -i 's,#include "util/callchain.h",#include "util/callchain.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/powerpc/util/skip-callchain-idx.c
+    fi
 }
 
 python do_package_prepend() {
-- 
1.8.1.2


