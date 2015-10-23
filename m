Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E8E4975D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 20:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="670011202"
Received: from bitbang.jf.intel.com ([10.7.199.99])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 20:30:42 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 20:30:37 -0700
Message-Id: <e1468da7831f8cffa9d4c4c013f3d788d96e692c.1445570852.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
References: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1445570852.git.randy.e.witt@linux.intel.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 4/5] mtools_4.0.18.bb: Use create_wrapper() for mcopy
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
X-List-Received-Date: Fri, 23 Oct 2015 03:30:42 -0000

mcopy uses the IBM850 codepage from gconv. The default install location
for gconv will not match the actual install location since it can be
pulled from sstate. This patch overrides the default location when
running by adding GCONV_PATH to the environment for mcopy.

[YOCTO #7629]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 52decfd..24c9d49 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -45,3 +45,8 @@ do_install_prepend () {
     mkdir -p ${D}/${bindir}
     mkdir -p ${D}/${datadir}
 }
+
+do_install_append_class-native () {
+    create_wrapper ${D}${bindir}/mcopy \
+        GCONV_PATH=${libdir}/gconv
+}
-- 
2.4.3


