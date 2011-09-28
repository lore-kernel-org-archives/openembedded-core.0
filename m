Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8sWM-0003Fo-S6
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:41:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Sep 2011 04:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,455,1312182000"; d="scan'208";a="56529146"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 28 Sep 2011 04:36:22 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 19:44:31 +0800
Message-Id: <0349c972b5124bb6a2ec59ee8aeb991c09093d32.1317209357.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
Subject: [PATCH 6/6] libc-package.bbclass: add MLPREFIX when set values to PACKAGES
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
X-List-Received-Date: Wed, 28 Sep 2011 11:41:51 -0000

There are some places that PACKAGES are dynamically set. To support
multilib, we need to add MLPREFIX before the package name in those
settings.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/libc-package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 9d32844..71a577b 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -311,7 +311,7 @@ python package_do_split_gconvs () {
 			raise bb.build.FuncFailed("localedef returned an error")
 
 	def output_locale(name, locale, encoding):
-		pkgname = 'locale-base-' + legitimize_package_name(name)
+		pkgname = bb.data.getVar('MLPREFIX', d) + 'locale-base-' + legitimize_package_name(name)
 		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
 		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
 		rprovides = ' virtual-locale-%s' % legitimize_package_name(name)
-- 
1.7.1



