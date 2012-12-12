Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKV-0003Mk-7H
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101106"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:30 +0000
Message-Id: <12fac0f79c482879c42dc433dd3311edc8ef3f9f.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 06/13] package_rpm.bbclass: Fix the way the RPM platform file is generated
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 18:46:51 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When generating an SDK, we need to use either the SDK or TARGET version
of the OS.  They are not interchangable!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4f60daf..fdca2c3 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -262,16 +262,26 @@ package_install_internal_rpm () {
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
 		# Setup base system configuration
 		mkdir -p ${target_rootfs}/etc/rpm/
-		echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
+		if [ -n "${sdk_mode}" ]; then
+			platform_vendor="${SDK_VENDOR}"
+			platform_os="${SDK_OS}"
+		else
+			platform_vendor="${TARGET_VENDOR}"
+			platform_os="${TARGET_OS}"
+		fi
+
+		echo "${platform}${platform_vendor}-${platform_os}" > ${target_rootfs}/etc/rpm/platform
+
+
 		if [ ! -z "$platform_extra" ]; then
 			for pt in $platform_extra ; do
 				channel_priority=$(expr $channel_priority + 5)
 				case $pt in
 					noarch | any | all)
-						os="`echo ${TARGET_OS} | sed "s,-.*,,"`.*"
+						os="`echo ${platform_os} | sed "s,-.*,,"`.*"
 						;;
 					*)
-						os="${TARGET_OS}"
+						os="${platform_os}"
 						;;
 				esac
 				echo "$pt-.*-$os" >> ${target_rootfs}/etc/rpm/platform
-- 
1.7.10.4



