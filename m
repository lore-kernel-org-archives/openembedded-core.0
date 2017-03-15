Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0724F730F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489616021; x=1521152021;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=doflVjgOQDq1OCrZbzygFhP27f2nV1WdNsSkab2PLow=;
	b=sOtu9+W1cYZ3qJgk72hFJctJBaI9K0uypu433CZjnMV/yXXFLBKYjsMH
	EdxNGkELkjZtZYxTZfPWdIhZSfSd+g==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 15:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1108897483"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 15:13:40 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 15:13:37 -0700
Message-Id: <1489616018-8969-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
References: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/3] build-appliance-image: fix build errors
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
X-List-Received-Date: Wed, 15 Mar 2017 22:13:40 -0000

Remove any symlinks before creating new ones to avoid potential build
errors such as:

FileExistsError: [Errno 17] File exists: '../../usr/src/kernel' -> ... '

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 730989e..b1d2250 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -60,6 +60,7 @@ fakeroot do_populate_poky_src () {
 	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
 	# Create a symlink, needed for out-of-tree kernel modules build
+	rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
 	lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
 
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
@@ -87,6 +88,7 @@ fakeroot do_populate_poky_src () {
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
 
 	# Load tap/tun at startup
+	rm -f ${IMAGE_ROOTFS}/sbin/iptables
 	lnr ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
 	echo "tun" >> ${IMAGE_ROOTFS}/etc/modules
 
-- 
2.7.4


