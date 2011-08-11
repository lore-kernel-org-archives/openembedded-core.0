Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrXUb-0001jm-Ea
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 17:48:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7BFhnTe003109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 08:43:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 11 Aug 2011 08:43:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 10:46:38 -0500
Message-ID: <68661582ede47f7b70999764ea80fe3e5e6aa78d.1313077484.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313077484.git.mark.hatle@windriver.com>
References: <cover.1313077484.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] package_rpm.bbclass: Update the platform config and --target
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
X-List-Received-Date: Thu, 11 Aug 2011 15:48:21 -0000
Content-Type: text/plain

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
index f123229..4a66b75 100644
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
 
@@ -821,12 +829,12 @@ python do_package_rpm () {
 	targetsys = bb.data.getVar('TARGET_SYS', d, True)
 	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
-	pkgarch = bb.data.expand('${PACKAGE_ARCH}', d)
+	pkgarch = bb.data.expand('${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d)
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



