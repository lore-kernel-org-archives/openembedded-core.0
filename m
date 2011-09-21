Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R6SVO-0003F7-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:30:51 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(overflow-147-248.ottawa.windriver.com [128.224.147.248])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8LJPSVT023222;
	Wed, 21 Sep 2011 12:25:29 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Sep 2011 15:25:21 -0400
Message-Id: <fff8c4d127be53175b8652e222ce8d92e33d4419.1316632767.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316632767.git.bruce.ashfield@windriver.com>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1316632767.git.bruce.ashfield@windriver.com>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: simplify kernel configuration check expression
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
X-List-Received-Date: Wed, 21 Sep 2011 19:30:51 -0000

kernel configuration validation takes place between two files. An
unprocessed configuration file (which is all the options found in
the various configuration fragments) and the final .config produced
by the lkc.

The unprocessed configuration file's name historically is based on
the name of the branch that was used to build the BSP. But with the
ability to map machine names to arbitrary branches, this is no longer
always true.

Searching for the pattern *-config-* in the meta subdirectory will
only match the config file, and frees the config validation phase
from being concerned with what branch was used to build the BSP.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0f92267..2205686 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -105,7 +105,7 @@ python do_kernel_configcheck() {
     bb.plain("NOTE: validating kernel configuration")
 
     pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
-    cmd = bb.data.expand("cd ${B}/..; kconf_check -${LINUX_KERNEL_TYPE}-config- ${B} ${S} ${B} ${KBRANCH}",d )
+    cmd = bb.data.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
-- 
1.7.4.1



