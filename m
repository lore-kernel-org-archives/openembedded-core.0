Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1USq20-0004DL-61
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:41:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2013 07:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,502,1363158000"; d="scan'208";a="228836009"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2013 07:23:53 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 17:27:28 +0300
Message-Id: <1366295248-7766-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] package_rpm.bbclass: fix /etc/rpm/platform generation
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
X-List-Received-Date: Thu, 18 Apr 2013 14:41:54 -0000

For some platforms (for example emenlow) the RPM installer prefers
an invalid package architecture (for example i586 over core2) because
/etc/rpm/platform is not properly generated (for example, i586 is
listed before core2 in /etc/rpm/platform).

[YOCTO #3864]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/classes/package_rpm.bbclass |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3a29976..1bee4b1 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -276,7 +276,6 @@ package_install_internal_rpm () {
 		# Setup base system configuration
 		echo "Note: configuring RPM platform settings"
 		mkdir -p ${target_rootfs}/etc/rpm/
-		echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/platform
 
 		if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
 			for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
-- 
1.7.10.4



