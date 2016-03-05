Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 23A7B731C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 05:06:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,539,1449561600"; d="scan'208";a="901929339"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 21:06:30 -0800
Message-Id: <b82b129692a4eb3c216901cd57d0fc51b0715a9a.1457154293.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457154293.git.randy.e.witt@linux.intel.com>
References: <cover.1457154293.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1457154293.git.randy.e.witt@linux.intel.com>
References: <cover.1457154293.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] mtools: Make sure mcopy works when using uninative
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
X-List-Received-Date: Sat, 05 Mar 2016 05:06:34 -0000

uninative changes the location of the IBM850 codepage used by mcopy. So
make sure to set GCONV_PATH to the correct location when using
uninative.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 479fd32..691539b 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -50,6 +50,12 @@ do_install_prepend () {
 }
 
 do_install_append_class-native () {
-    create_wrapper ${D}${bindir}/mcopy \
+    if  [ "${UNINATIVE_LIBDIR}x" != "x" ]; then
+        GCONV_PATH=${UNINATIVE_LIBDIR}/gconv
+    else
         GCONV_PATH=${libdir}/gconv
+    fi
+
+    create_wrapper ${D}${bindir}/mcopy \
+        GCONV_PATH=$GCONV_PATH
 }
-- 
2.5.0


