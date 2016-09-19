Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61F696FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 17:16:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 19 Sep 2016 10:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,362,1470726000"; d="scan'208";a="10901981"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.26.249])
	by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2016 10:16:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 19 Sep 2016 10:16:00 -0700
Message-Id: <1474305360-24208-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Haitao Huang <haitao.huang@intel.com>
Subject: [PATCH v2] gcc-configure: Enable initfini-array
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
X-List-Received-Date: Mon, 19 Sep 2016 17:16:03 -0000

This adds the correct support for initfini-array which replaces .init
and .fini with .init-array and .fini-array.  There is no appreciable
size difference with this change.

The change is needed since configure will not correctly detect support
when building cross-compilers.

Signed-off-by: Haitao Huang <haitao.huang@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v2: Enable for all Architectures

 meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index f4f76bd..b374c30 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -44,6 +44,10 @@ EXTRA_OECONF = "\
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
 
+# Set this here since GCC configure won't auto-detect and enable
+# initfini-arry when cross compiling.
+EXTRA_OECONF_append = " --enable-initfini-array"
+
 export gcc_cv_collect2_libs = 'none required'
 # We need to set gcc_cv_collect2_libs else there is cross-compilation badness
 # in the config.log files (which might not get generated until do_compile
-- 
2.5.0


