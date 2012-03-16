Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8cWM-0004dV-SC
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129848255"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:00:06 -0700
Message-Id: <a5089dad538aae9ef7af154a101f78a1912e3190.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331924359.git.nitin.a.kamble@intel.com>
References: <cover.1331924359.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/7] pciutils: fix a do_compile failure
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Avoid this issue:

| ln -s libpci.so.3.1.9 libpci.so
| ln: failed to create symbolic link `libpci.so': File exists
| make[1]: *** [libpci.so] Error 1
| make[1]: Leaving directory `/srv/home/nitin/builds/build-multilib/tmp/work/x86_64-poky-linux/pciutils-3.1.9-r0/pciutils-3.1.9/lib'
| make: *** [lib/libpci.so] Error 2
| ERROR: oe_runmake failed
NOTE: package pciutils-3.1.9-r0: task do_compile: Failed

PR not bumped as there are no changes in the output packages.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.1.9.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
index 51e7476..2c969d9 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
@@ -33,6 +33,11 @@ do_configure () {
 	)
 }
 
+do_compile_prepend () {
+	# Avoid this error:  ln: failed to create symbolic link `libpci.so': File exists
+	rm -f ${S}/lib/libpci.so
+}
+
 export PREFIX = "${prefix}"
 export SBINDIR = "${sbindir}"
 export SHAREDIR = "${datadir}"
-- 
1.7.7.6



