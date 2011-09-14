Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3idT-0003xO-U4
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 08:07:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2011 23:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48146881"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2011 23:02:40 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 14:08:16 +0800
Message-Id: <d993fc546f234117bc751192e17b46e9dfc1e249.1315980095.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315980095.git.dongxiao.xu@intel.com>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315980095.git.dongxiao.xu@intel.com>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/3] rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
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
X-List-Received-Date: Wed, 14 Sep 2011 06:07:52 -0000

Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
a lib32 version of rpm package will override a normal rpm package if its
PACKAGE_ARCH is ${MACHINE_ARCH}.

Take netbase as an example, which the PACKAGE_ARCH = MACHINE_ARCH. Both
the normal version of netbase package and the lib32 version are named as
"netbase-4.45-r1.qemux86_64.rpm" putting in tmp/deploy/rpm/qemux86-64
directory, so we need to differentiate them.

Here we define spedific MACHINE_virtclass-multilib-lib(xx) to override
the default MACHINE value, thus got different MACHINE_ARCH to fix this
issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 135ca75..56c1a85 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -218,6 +218,9 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
+            machine = localdata.getVar("MACHINE_virtclass-multilib-" + eext[1], False)
+            if machine:
+                localdata.setVar("MACHINE", machine)
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
-- 
1.7.1



