Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8klp-0004g9-LI
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 05:25:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2011 20:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56601914"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 27 Sep 2011 20:19:52 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 11:27:59 +0800
Message-Id: <60b6c2ad28e3c05ff9dcda10ae23cf99af077707.1317180056.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317180055.git.dongxiao.xu@intel.com>
References: <cover.1317180055.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317180055.git.dongxiao.xu@intel.com>
References: <cover.1317180055.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/5] tune-i586: fix hardcoded TUNE_PKGARCH
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
X-List-Received-Date: Wed, 28 Sep 2011 03:25:22 -0000

Use TUNE_FEATURES to determine the setting to TUNE_PKGARCH, which fixes
the wrong setting of PACKAGE_ARCH in multilib case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/machine/include/tune-i586.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index ba655b9..a40ce18 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,5 +1,6 @@
 DEFAULTTUNE ?= "i586"
-TUNE_PKGARCH ?= "i586"
+TUNE_PKGARCH_TMP = "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "i586", "i586", TUNE_PKGARCH_TMP, d)}"
 
 require conf/machine/include/ia32/arch-ia32.inc
 
-- 
1.7.1



