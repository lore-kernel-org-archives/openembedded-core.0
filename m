Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5A074719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:24:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 01 Jun 2017 05:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="1136916510"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.23.138])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2017 05:24:10 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:24:05 +0100
Message-Id: <3481b946fa892f7ecc6fb0ca5376ab9bcb85c529.1496319716.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1496319716.git.joshua.g.lock@intel.com>
References: <cover.1496319716.git.joshua.g.lock@intel.com>
Subject: [morty][PATCH 1/1] perf: add perf-feature for systemtap
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
X-List-Received-Date: Thu, 01 Jun 2017 12:24:10 -0000

Based on OE-Core rev: 8aafed5f4757550f2ff688e1b8981e5e8e6e3428 if systemtap
isn't disabled it's possible to race with systemtap headers being present
during autodetection and disappearing during the build:

    tests/sdt.c:14:21: fatal error: sys/sdt.h: No such file or directory
     #include <sys/sdt.h>

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 471023d..03ae446 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -66,6 +66,7 @@ SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
 LIBNUMA_DEFINES = "${@perf_feature_enabled('perf-libnuma', '', 'NO_LIBNUMA=1',d)}"
+SYSTEMTAP_DEFINES = "${@perf_feature_enabled('perf-systemtap', '', 'NO_SDT=1', d)}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
@@ -83,7 +84,7 @@ EXTRA_OEMAKE = '\
     EXTRA_CFLAGS="-ldw" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
-    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
+    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} ${SYSTEMTAP_DEFINES} \
 '
 
 EXTRA_OEMAKE += "\
-- 
2.9.4


