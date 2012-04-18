Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SKUV2-0001UP-Kz
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 15:00:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2012 05:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155107840"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2012 05:51:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 20:48:16 +0800
Message-Id: <484d14f90205202e85346dfc53fcc4a273b3087c.1334751924.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1334751924.git.dongxiao.xu@intel.com>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1334751924.git.dongxiao.xu@intel.com>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] packageinfo.bbclass: A workaround for RPM architecture renaming
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
X-List-Received-Date: Wed, 18 Apr 2012 13:00:45 -0000

For beagleboard platform, the PACKAGE_ARCH for certain recipes is
"armv7a-vfp-neon", however, the architecture label in RPM file name is
"arm" due to a potential bug in RPM backend.

This commit is a workaround to make Hob work in this case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/packageinfo.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
index 46b9097..26cce60 100644
--- a/meta/classes/packageinfo.bbclass
+++ b/meta/classes/packageinfo.bbclass
@@ -20,14 +20,25 @@ python packageinfo_handler () {
                         pkgrename = sdata['PKG_%s' % pkgname]
                         pkgv = sdata['PKGV'].replace('-', '+')
                         pkgr = sdata['PKGR']
+                        # We found there are some renaming issue with certain architecture.
+                        # For example, armv7a-vfp-neon, it will use armv7a in the rpm file. This is the workaround for it.
+                        arch_tmp = arch.split('-')[0]
                         if os.path.exists(deploy_dir + '/' + arch + '/' + \
                                           pkgname + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
                            os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
                                           pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
                            os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
                                           pkgname + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
                            os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging):
+                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
+                           os.path.exists(deploy_dir + '/' + arch + '/' + \
+                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging):
                             pkginfolist.append(sdata)
         bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
 }
-- 
1.7.4.1



