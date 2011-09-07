Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DaT-00066S-Kb
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:34:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2011 01:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="45975049"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2011 01:29:19 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:33:41 +0800
Message-Id: <d6c365ea40f8c69e9a3a0379b2da1bbf5db754cd.1315384269.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315384269.git.dongxiao.xu@intel.com>
References: <cover.1315384269.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315384269.git.dongxiao.xu@intel.com>
References: <cover.1315384269.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] multilib_global.bbclass: handle kernel-module-* for multilib
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
X-List-Received-Date: Wed, 07 Sep 2011 08:34:28 -0000

bitbake would report failed dependency of kernel-module-* when testing
multilib. kernel-module-* are recommended by some other recipes.

Do not extend name for kernel-module-* related packages.

[YOCTO #1456]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib_global.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 217349b..1263e4e 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -17,6 +17,8 @@ python multilib_virtclass_handler_global () {
 addhandler multilib_virtclass_handler_global
 
 def multilib_extend_name(variant, name):
+    if name.startswith("kernel-module"):
+        return name
     if name.startswith("virtual/"):
         subs = name.split("/", 1)[1]
         if not subs.startswith(variant):
-- 
1.7.1



