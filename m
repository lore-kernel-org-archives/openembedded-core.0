Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D4B0C6006E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 12:57:23 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 04:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="74212306"
Received: from summit.tm.intel.com ([10.237.55.181])
	by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2017 04:57:23 -0800
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 14:57:40 +0200
Message-Id: <20170308125740.15544-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gcc-runtime: Enable libmpx for x86-64
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
X-List-Received-Date: Wed, 08 Mar 2017 12:57:24 -0000

Intel MPX was recently enabled on x86 (_append_x86) but that didn't
enable it on x86-64. Explicitly enable libmpx on x86-64 too.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index a5be491ad3..0dc405c591 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -25,6 +25,7 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
 RUNTIMETARGET_append_x86 = " libmpx"
+RUNTIMETARGET_append_x86-64 = " libmpx"
 RUNTIMETARGET_remove_libc-musl = "libmpx"
 
 # libiberty
@@ -146,6 +147,12 @@ PACKAGES_append_x86 = "\
     libmpx-staticdev \
 "
 
+PACKAGES_append_x86-64 = "\
+    libmpx \
+    libmpx-dev \
+    libmpx-staticdev \
+"
+
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
 
-- 
2.11.0


