Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma1-0004dR-AF
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809717"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:49:59 -0700
Message-Id: <bcf055fdf0c3f1440e7c8140ca2f3d90aa0441c9.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/25] package_rpm.bbclass: Update the platform config and --target
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:00 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When constructing the /etc/rpm/platform file, we need to ensure that
the any, all, and noarch platforms will allow any "linux" variant to
be installable, not just matching variants.. i.e.

arm-oe-linux-gnueabi should be able to install noarch-oe-linux

Also ensure that we pass the full canonical arch via the --target=
parameter.  This allows us to define the proper platform settings
for all packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 59e8d48..5c67f69 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -177,7 +177,15 @@ package_install_internal_rpm () {
 	echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
 	if [ ! -z "$platform_extra" ]; then
 		for pt in $platform_extra ; do
-			echo "$pt-.*-${TARGET_OS}" >> ${target_rootfs}/etc/rpm/platform
+			case $pt in
+				noarch | any | all)
+					os="`echo ${TARGET_OS} | sed "s,-.*,,"`.*"
+					;;
+				*)
+					os="${TARGET_OS}"
+					;;
+			esac
+			echo "$pt-.*-$os" >> ${target_rootfs}/etc/rpm/platform
 		done
 	fi
 
@@ -821,13 +829,13 @@ python do_package_rpm () {
 	targetsys = bb.data.getVar('TARGET_SYS', d, True)
 	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
-	pkgarch = bb.data.expand('${PACKAGE_ARCH}', d)
+	pkgarch = bb.data.expand('${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d)
 	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
 
 	cmd = rpmbuild
-	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + targetvendor + "-linux-gnu --buildroot " + pkgd
+	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
 	cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
 	cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
 	cmd = cmd + " --define '_use_internal_dependency_generator 0'"
-- 
1.7.3.4



