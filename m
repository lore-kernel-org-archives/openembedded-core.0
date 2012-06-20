Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1ShGMo-0006Hn-PK
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 10:34:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2012 01:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158548956"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2012 01:23:36 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 11:25:32 +0300
Message-Id: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] linux-tools: multilib compilation fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 08:34:23 -0000

This patch makes linux-tools compile properly on multilib configurations
(which failed because of some invalid dependencies). Tested by compiling
lib32-core-image-sato-sdk.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index 3b03c05..048608c 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -34,7 +34,7 @@ do_install_perf[umask] = "022"
 
 PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
 PERFDEPENDS_libc-uclibc = ""
-PERFRDEPENDS = "python perl elfutils"
+PERFRDEPENDS = "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elfutils"
 PERFRDEPENDS_libc-uclibc = ""
 
 do_compile_perf[depends] = "${PERFDEPENDS}"
-- 
1.7.9.5



