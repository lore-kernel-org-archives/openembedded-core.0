Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PxrzY-0006tm-Bm
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:22:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Mar 2011 18:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="400968772"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by azsmga001.ch.intel.com with ESMTP; 10 Mar 2011 18:20:18 -0800
Message-Id: <1d5ca654a482f582c75faf546140dfd6064da73b.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 11:58:15 -0600
Date: Thu, 10 Mar 2011 18:20:17 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 04/12] package_rpm: Fix rootfs generation
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
X-List-Received-Date: Fri, 11 Mar 2011 02:22:12 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #797]

During rootfs generation, if other RPM packages are being wrtten
this could cause a failure during the solvedb generation.  We
add a shared lock around the RPM package building.  This will allow
multiple RPM packages to continue to be written at the same time, but
prevent rootfs generation and RPM package generation at the same time.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 60127d2..4647116 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -777,10 +777,16 @@ python do_package_rpm () {
 	cmd = cmd + " --define 'debug_package %{nil}'"
 	cmd = cmd + " -bb " + outspecfile
 
-	# Build the spec file!
+	# Take a shared lock, we can write multiple packages at the same time...
+	# but we need to stop the rootfs/solver from running while we do...
+	lf = bb.utils.lockfile(bb.data.expand("${DEPLOY_DIR_RPM}/rpm.lock", d), True)
+
+	# Build the rpm package!
 	bb.data.setVar('BUILDSPEC', cmd + "\n", d)
 	bb.data.setVarFlag('BUILDSPEC', 'func', '1', d)
 	bb.build.exec_func('BUILDSPEC', d)
+
+	bb.utils.unlockfile(lf)
 }
 
 python () {
-- 
1.7.1.1



