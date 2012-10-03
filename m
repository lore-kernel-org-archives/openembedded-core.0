Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TJNoI-0007en-Vn
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:12:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Oct 2012 04:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="151902243"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Oct 2012 04:59:17 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:02:47 +0300
Message-Id: <1349265768-17088-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nativesdk-ncurses: skip installed_vs_shipped test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:12:19 -0000

Fixes [Yocto #3174]

In FILE_*, the conditional append to clear and reset files is
evaluating ${PN} against "ncurses". When building nativesdk
package, ${PN} = "nativesdk-ncurses" and thus the condition
evaluates to False and thus we get an empty string appended
instead of .${BPN}. This causes a warning in installed_vs_shipped
test.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ed7f001..86be6bc 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -250,6 +250,8 @@ FILES_${PN}-tools = "\
   ${bindir}/tabs \
 "
 
+INSANE_SKIP_nativesdk-${BPN} = "installed_vs_shipped"
+
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
 RDEPENDS_${PN}-tools = "${PN}"
 
-- 
1.7.9.5



