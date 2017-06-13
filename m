Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 16CBD6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:22:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 06:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="273651101"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2017 06:22:59 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 16:23:33 +0300
Message-Id: <1497360213-27709-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
References: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
Subject: [PATCH v4 7/8] image: create symlinks needed for merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 13:23:00 -0000

Prepare the symlinks required for merged /usr at the time of rootfs creation.

The links created in rootfs are:
/bin --> /usr/sbin
/sbin --> /usr/sbin
/lib --> /usr/lib
/lib64 --> /usr/lib64

We cannot make these symlinks as part of 'base-files' or some other package.
Because at rootfs creation, installation of the package(say kernel) that depends
on these root folders/links fails, if package manager installs this package
prior to base-files.

These symbolic links in top level folder should be present as long as
 - kernel tools use /lib/{module,firmware}
 - shell scripts uses "#!/bin/sh"

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/image.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 85f6b9a..2a3c1e3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -617,3 +617,24 @@ do_bundle_initramfs () {
 	:
 }
 addtask bundle_initramfs after do_image_complete
+
+# Prepare the root links to point to the /usr counterparts.
+create_merged_usr_symlinks() {
+    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}${base_libdir}
+    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
+    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
+    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
+
+    if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
+       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
+       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
+    fi
+
+    # create base links for multilibs
+    multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
+    for d in $multi_libdirs; do
+        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
+        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
+    done
+}
+ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks; ', '',d)}"
-- 
2.7.4


