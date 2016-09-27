Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A19F4607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 12:20:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 27 Sep 2016 05:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,405,1470726000"; d="scan'208";a="1037091249"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 27 Sep 2016 05:20:53 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 15:18:56 +0300
Message-Id: <1474978736-29303-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oeqa: Regenerate galculator configure
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
X-List-Received-Date: Tue, 27 Sep 2016 12:20:53 -0000

galculator configure seems to be so old it does not
recognise --with-libtool-sysroot: regenerate configure.

Fixes [YOCTO #10191].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/lib/oeqa/sdk/buildgalculator.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildgalculator.py b/meta/lib/oeqa/sdk/buildgalculator.py
index be14d22..2629a55 100644
--- a/meta/lib/oeqa/sdk/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/buildgalculator.py
@@ -15,8 +15,15 @@ class GalculatorTest(oeSDKTest):
 
             project.download_archive()
 
-            self.assertEqual(project.run_configure(), 0,
-                            msg="Running configure failed")
+            # regenerate configure to get support for --with-libtool-sysroot
+            legacy_preconf=("libtoolize --automake;"
+                            "aclocal -I ${OECORE_TARGET_SYSROOT}/usr/share/aclocal -I m4;"
+                            "autoconf;"
+                            "autoheader;"
+                            "automake -a;")
+
+            self.assertEqual(project.run_configure(extra_cmds=legacy_preconf),
+                             0, msg="Running configure failed")
 
             self.assertEqual(project.run_make(), 0,
                             msg="Running make failed")
-- 
2.1.4


