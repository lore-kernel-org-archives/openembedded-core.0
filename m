Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFD660017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 12:48:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2016 05:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,405,1470726000"; d="scan'208";a="766416673"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2016 05:48:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 15:48:41 +0300
Message-Id: <1474980521-23275-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1474978736-29303-1-git-send-email-jussi.kukkonen@intel.com>
References: <1474978736-29303-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCHv2] lib/oeqa: Regenerate galculator configure
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
X-List-Received-Date: Tue, 27 Sep 2016 12:48:49 -0000

galculator configure seems to be so old it does not
recognise --with-libtool-sysroot: regenerate configure.

Fixes [YOCTO #10191].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Use autoreconf instead of individual auto* scripts

 meta/lib/oeqa/sdk/buildgalculator.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildgalculator.py b/meta/lib/oeqa/sdk/buildgalculator.py
index be14d22..dc2fa9c 100644
--- a/meta/lib/oeqa/sdk/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/buildgalculator.py
@@ -15,8 +15,11 @@ class GalculatorTest(oeSDKTest):
 
             project.download_archive()
 
-            self.assertEqual(project.run_configure(), 0,
-                            msg="Running configure failed")
+            # regenerate configure to get support for --with-libtool-sysroot
+            legacy_preconf=("autoreconf -i -f -I ${OECORE_TARGET_SYSROOT}/usr/share/aclocal -I m4;")
+
+            self.assertEqual(project.run_configure(extra_cmds=legacy_preconf),
+                             0, msg="Running configure failed")
 
             self.assertEqual(project.run_make(), 0,
                             msg="Running make failed")
-- 
2.1.4


