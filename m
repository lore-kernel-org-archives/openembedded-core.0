Return-Path: <yin.thong.choong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C22B277DA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491806680; x=1523342680;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=CpPVP5CK7pnx+3H5EaLtckRcoBXYQhENQx5Y6OoSlNo=;
	b=ZwKuqbejN7XpZ50QoHU5uetJ7z7PQ3/bHaX5u6UIJY0QzECJSafantXH
	nJN2oFirUyRifL5UL8fO0zj1EwQRXA==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2017 23:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,181,1488873600"; d="scan'208";a="1153719462"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2017 23:44:39 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Apr 2017 16:33:18 -0700
Message-Id: <1491780798-1591-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491780798-1591-1-git-send-email-yin.thong.choong@intel.com>
References: <1491780798-1591-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH] logrotate: replace fedorahosted.org SRC_URI with github.com source
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 06:44:38 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to github.com.
Update the ${PN} to ${BPN} in order to pass the autobuilder
mulitlib enable configuration.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 9c2dfe0..a871b45 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
-HOMEPAGE = "https://fedorahosted.org/logrotate/"
+HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
 LICENSE = "GPLv2"
 
 # TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
@@ -10,14 +10,25 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
+# When updating logrotate to latest upstream, SRC_URI should point to
+# a proper release tarball from https://github.com/logrotate/logrotate/releases
+# and we have to take the snapshot for now because there is no such
+# tarball available for 3.9.1.
+
+S = "${WORKDIR}/${BPN}-r3-9-1"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
-SRC_URI[sha256sum] = "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
+# Checksum changed due to tarball source folder changes in upstream
+			
+SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
+SRC_URI[sha256sum] = "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7527856a0ea3617"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.7.4


