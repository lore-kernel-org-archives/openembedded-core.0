Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EDBCF730F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489616021; x=1521152021;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Tuvrlr45+txTX5pDKEsrn8JoAgnsrLGaF6Cb0Qwy4So=;
	b=KgYP17zrKy6Sk4A3lrEmZbpMszy1/qh3b3qQz0W1ba4Tx8xvwkPEgz68
	baRWcJ31q3t74+aCwYXDGhcJbZ8Eqw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 15:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1108897481"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 15:13:40 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 15:13:36 -0700
Message-Id: <1489616018-8969-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
References: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/3] build-appliance-image: use pip3-native
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

Do not rely on pip3 being installed on the host.
Use pip3-native instead.

[YOCTO#10909]
[YOCTO#11022]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 0db1fb0..730989e 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -18,10 +18,10 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 # Do a quiet boot with limited console messages
 APPEND += "rootfstype=ext4 quiet"
 
-DEPENDS = "zip-native"
+DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "vmdk"
 
-inherit core-image module-base
+inherit core-image module-base setuptools3
 
 SRCREV ?= "8343ed93c4278715aa1582d3cadedf8f197b4089"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
@@ -95,6 +95,8 @@ fakeroot do_populate_poky_src () {
 	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
 
 	# Install modules needed for toaster
+	export STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}
+	export STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
 	export HOME=${IMAGE_ROOTFS}/home/builder
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
 	pip3 install --user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt
-- 
2.7.4


