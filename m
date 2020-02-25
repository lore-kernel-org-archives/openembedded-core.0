Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 94ECA60FFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 17:49:32 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01PHnT34005183
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:49:30 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 11:49:29 -0600
Message-Id: <20200225174929.112448-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sysvinit: Fix install order/dependency
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
X-List-Received-Date: Tue, 25 Feb 2020 17:49:32 -0000

It is possible for sysvinit to be installed before the passwd/group
files are installed from base-passwd.  This results in an warning that
the shutdown group can't be found.

Adding a dependeny on base-passwd will resolve this issue.

This has similar symptoms to the problem that oe-core commit
0227e929021263c51d2e7db36224000fecb01f1c fixed.  The fix is simular in that
it ensures that base-passwd is installed first, just at runtime vs setscene
time.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index 21ef0e9cf3..63c10848b4 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -70,7 +70,7 @@ FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
 FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"
 
-RDEPENDS_${PN} += "sysvinit-pidof initd-functions"
+RDEPENDS_${PN} += "sysvinit-pidof initd-functions base-passwd"
 
 CFLAGS_prepend = "-D_GNU_SOURCE "
 export LCRYPT = "-lcrypt"
-- 
2.17.1


