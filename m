Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 972FE65E2B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s914hm43007898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:48 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:36 -0400
Message-ID: <eb8c936aec007c2fe418c97ea4d89233bce05113.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] perf: fix undefined pr_* routines
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:51 -0000
Content-Type: text/plain

When cross compiling libunwind support for ARM a missing debug include means
that pr* macros are not expanded, and hence link failures on the undefined
functions.

Since we must be compatible with many versions of the kernel and perf, we
sed the proper include into the files, while the permanent fix goes upstream
to the mainline kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ea7571aa8e29..3771cdb3e9dd 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -145,9 +145,14 @@ do_configure_prepend () {
     if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
         sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
     fi
-    # 3.17-rc1+ has a include issue for powerpc. Temporarily sed in the appropriate include
-    if [ -e "${S}/tools/perf/arch/powerpc/util/skip-callchain-idx.c" ]; then
-        sed -i 's,#include "util/callchain.h",#include "util/callchain.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/powerpc/util/skip-callchain-idx.c
+
+    # 3.17-rc1+ has a include issue for arm/powerpc. Temporarily sed in the appropriate include
+    if [ -e "${S}/tools/perf/arch/$ARCH/util/skip-callchain-idx.c" ]; then
+        sed -i 's,#include "util/callchain.h",#include "util/callchain.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/$ARCH/util/skip-callchain-idx.c
+    fi
+    if [ -e "${S}/tools/perf/arch/arm/util/unwind-libunwind.c" ] && [ -e "${S}/tools/perf/arch/arm/tests/dwarf-unwind.c" ]; then
+        sed -i 's,#include "tests/tests.h",#include "tests/tests.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/arm/tests/dwarf-unwind.c
+        sed -i 's,#include "perf_regs.h",#include "perf_regs.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/arm/util/unwind-libunwind.c
     fi
 }
 
-- 
1.8.1.2


