Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 58E8F6F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:40:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2014 09:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="502903304"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2014 09:29:36 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 790226A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:29:22 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 18:29:35 +0200
Message-Id: <99978b525f29c0c8a11ba01a39e69ce03b5e9e1f.1395332218.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395332218.git.stefanx.stanacar@intel.com>
References: <cover.1395332218.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1395332218.git.stefanx.stanacar@intel.com>
References: <cover.1395332218.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 3/4] recipes-extended: add master image for testing purposes
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
X-List-Received-Date: Thu, 20 Mar 2014 16:40:49 -0000

Add a custom recipe with custom initramfs and installers, that makes
it easy to deploy a master image for testing purposes.

We need a master image running on the target hardware, that should be a
known good build, with a set of utilities installed so that we use it
to deploy the images under test.

This core-image-testmaster recipe isn't a requirement per se, any image can
be used as long as the required conditions are met. The test code assumes:
 - that the device has a second rootfs labeled as testrootfs
 - it has a properly configured bootloader entry for the second kernel and rootfs
 - the master image has a /etc/masterimage file so it can differentiate between master
and test images
 - the master image has tar, mount, bash (basically the normal linux utilities not the busybox
ones)

[YOCTO #5614]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../images/core-image-testmaster-initramfs.bb        | 20 ++++++++++++++++++++
 .../recipes-extended/images/core-image-testmaster.bb | 13 +++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/images/core-image-testmaster-initramfs.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster.bb

diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
new file mode 100644
index 0000000..f4de80a
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Small image capable of booting a device. The kernel includes \
+the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
+first 'init' program more efficiently."
+
+PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-live-install-efi-testfs busybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+export IMAGE_BASENAME = "core-image-testmaster-initramfs"
+IMAGE_LINGUAS = ""
+
+LICENSE = "MIT"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit core-image
+
+IMAGE_ROOTFS_SIZE = "8192"
+
+BAD_RECOMMENDATIONS += "busybox-syslog"
diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testmaster.bb
new file mode 100644
index 0000000..7a564d4
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-testmaster.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A master image to be deployed on a target useful for testing other images"
+
+IMAGE_FEATURES += "ssh-server-openssh package-management"
+
+inherit core-image
+
+IMAGE_INSTALL += "\
+    bash coreutils util-linux tar gzip kmod \
+    python-modules python-misc \
+    e2fsprogs e2fsprogs-mke2fs parted \
+    "
+INITRD_IMAGE = "core-image-testmaster-initramfs"
+
-- 
1.8.5.3


