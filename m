Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8Y3E-0006Al-CG
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:50:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 06:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,449,1312182000"; d="scan'208";a="71186872"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 06:44:57 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 21:52:58 +0800
Message-Id: <5dd7148b479c0d948ae4b5fc479960f1c9ffd121.1317131373.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317131373.git.dongxiao.xu@intel.com>
References: <cover.1317131373.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317131373.git.dongxiao.xu@intel.com>
References: <cover.1317131373.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/4] tune-i586: fix hardcoded TUNE_PKGARCH
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
X-List-Received-Date: Tue, 27 Sep 2011 13:50:24 -0000

Use TUNE_FEATURES to determine the setting to TUNE_PKGARCH, which fixes
the wrong setting of PACKAGE_ARCH in multilib case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/machine/include/tune-i586.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index ba655b9..963afb8 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,5 +1,6 @@
 DEFAULTTUNE ?= "i586"
-TUNE_PKGARCH ?= "i586"
+TUNE_PKGARCH_TMP := "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "i586", "i586", TUNE_PKGARCH_TMP, d)}"
 
 require conf/machine/include/ia32/arch-ia32.inc
 
-- 
1.7.1



