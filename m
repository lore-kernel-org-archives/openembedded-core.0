Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CC6C7719E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 17:11:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Nov 2016 10:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,583,1473145200"; d="scan'208";a="186836107"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2016 10:11:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 19:09:27 +0200
Message-Id: <20161102170928.14841-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH 1/2] lttng-tools: do not install shared libraries in ptest package
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
X-List-Received-Date: Wed, 02 Nov 2016 17:12:03 -0000

This was creating a race in runtime library dependency resolution
where sometimes the library was assumed to be provided by the ptest
package.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-tools_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 016346f..0d2bd00 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -113,4 +113,7 @@ do_install_ptest () {
 	# checkpatch.pl is unneeded on target and causes file-rdeps QA
 	# warnings.
 	rm -f ${D}${PTEST_PATH}/extras/checkpatch.pl
+
+        # Remove built libraries as they confuse the packages' runtime dependency resolution
+        rm -rf ${D}${PTEST_PATH}/src/lib/lttng-ctl/.libs/
 }
-- 
2.10.1


