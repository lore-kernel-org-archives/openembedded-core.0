Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVG-0001SG-W9
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="690502009"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 22:26:19 -0700
Message-Id: <5dcfa8a0bf048bf71deea2b796217b01188c4cb9.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 13:14:31 -0500
Date: Mon, 09 May 2011 22:26:19 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 12/30] package_rpm: use target vendor information
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
X-List-Received-Date: Tue, 10 May 2011 05:29:03 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* Instead of hardcoding target vendor string "-poky"
  use TARGET_VENDOR information in case of using external
  toolchains

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/package_rpm.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 70170d1..1cf9f79 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -761,13 +761,14 @@ python do_package_rpm () {
 	# Setup the rpmbuild arguments...
 	rpmbuild = bb.data.getVar('RPMBUILD', d, True)
 	targetsys = bb.data.getVar('TARGET_SYS', d, True)
+	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
 	pkgarch = bb.data.expand('${PACKAGE_ARCH}', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
 
 	cmd = rpmbuild
-	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + "-poky-linux-gnu --buildroot " + pkgd
+	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + targetvendor + "-linux-gnu --buildroot " + pkgd
 	cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
 	cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
 	cmd = cmd + " --define '_use_internal_dependency_generator 0'"
-- 
1.7.1.1



