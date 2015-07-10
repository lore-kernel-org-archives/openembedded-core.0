Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C725E73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 21:03:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jul 2015 14:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,449,1432623600"; d="scan'208";a="726663403"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 14:03:41 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 14:03:21 -0700
Message-Id: <1436562201-26998-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1436552179-25621-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1436552179-25621-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH v2] python-smartpm: Have native smart use nativepython
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
X-List-Received-Date: Fri, 10 Jul 2015 21:03:44 -0000

Currently when trying to use smart via devshell or in the bitbake
environment, it will fail without inheriting pythonnative. Since the
native tools should "just work" use nativepython in the shebang line for
smart.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-devtools/python/python-smartpm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index ed786e4..18df892 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -97,6 +97,7 @@ add_native_wrapper() {
 }
 
 do_install_append_class-native() {
+        sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/smart
         add_native_wrapper
 }
 
-- 
2.4.3


