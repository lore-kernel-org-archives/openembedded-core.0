Return-Path: <ismo.puustinen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4199871A5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:59:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 09 Mar 2017 05:59:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,268,1486454400"; d="scan'208";a="942433361"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2017 05:59:39 -0800
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 15:59:33 +0200
Message-Id: <20170309135933.1232-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gcc: let cpp rrecommend gcc.
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
X-List-Received-Date: Thu, 09 Mar 2017 13:59:40 -0000

The file /usr/libexec/gcc/.../cc1 has been installed in package "gcc"
instead of package "cpp", because FILES statements for both packages
match the cc1 binary. Remove the attempt to install the file in cpp to
avoid confusion.

However, cpp uses cc1. If cc1 is not installed, there are error messages
such as: "cpp: error trying to exec 'cc1': execvp: No such file or
directory". Add gcc to RRECOMMENDS_cpp to fix the problem.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index f436fa2..3a2927e 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -93,8 +93,9 @@ FILES_gfortran-symlinks = "\
 FILES_cpp = "\
     ${bindir}/${TARGET_PREFIX}cpp* \
     ${base_libdir}/cpp \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
+"
 FILES_cpp-symlinks = "${bindir}/cpp"
+RRECOMMENDS_cpp = "${PN}"
 
 FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov* \
     ${bindir}/${TARGET_PREFIX}gcov-tool* \
-- 
2.9.3


