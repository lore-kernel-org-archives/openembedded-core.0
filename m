Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 36E1A6FF91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 06:46:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Feb 2016 22:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="915547015"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2016 22:46:40 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 08:46:39 +0200
Message-Id: <1455777999-14641-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] cml1.bbclass: fix do_menuconfig
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
X-List-Received-Date: Thu, 18 Feb 2016 06:46:41 -0000

The functionality got broken after bitbake commit
8bf33a8e92c0e188fa392030025756196c96fcbb
which disabled the (bitbake) variable expansion inside python functions.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/cml1.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 95cf584..4067dc0 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,7 +26,8 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make ${KCONFIG_CONFIG_COMMAND}; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
+    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+                d.getVar('PN', True ) + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
-- 
2.6.2


