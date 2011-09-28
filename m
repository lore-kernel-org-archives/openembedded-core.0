Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJB-00041w-3q
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360981"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:06:01 -0700
Message-Id: <3025516f871e23f353f095b75408b0f057ad7a1e.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/29] libc-package.bbclass: add MLPREFIX when set values to PACKAGES
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:59 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



