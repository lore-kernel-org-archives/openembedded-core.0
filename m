Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC7726F7C6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 15:47:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Mar 2014 08:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,761,1389772800"; d="scan'208";a="510767225"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2014 08:47:42 -0700
Received: from sstanacx-mobl1.ger.corp.intel.com (sstanacx-mobl1.rb.intel.com
	[10.237.105.81])
	by linux.intel.com (Postfix) with ESMTP id 4D97F6A4083
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 08:47:26 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Mar 2014 17:47:34 +0300
Message-Id: <869ad3f92f849ae98d82d9c2aed397d0d323822f.1396188987.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/3] recipes-extended: add master image for testing purposes
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
X-List-Received-Date: Sun, 30 Mar 2014 15:47:44 -0000

Add a custom recipe with custom initramfs and installers, that makes
it easy to deploy a master image for testing purposes.
We need a master image running on the target hardware, that should be a
known good build, with a set of utilities installed so that we use it
to deploy the images under test.

This core-image-testmaster recipe isn't a requirement per se, any image can
be used as long as the required conditions are met.
The test code assumes:
 - that the device has a second rootfs labeled as testrootfs
 - it has a properly configured bootloader entry (called test) for the second kernel and rootfs
 - the master image has a /etc/masterimage file so it can differentiate between master
and test images
 - the master image has tar, mount, bash (basically the normal linux utilities not the busybox
ones)

[YOCTO #5614]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../images/core-image-testmaster-initramfs.bb         | 19 +++++++++++++++++++
 meta/recipes-extended/images/core-image-testmaster.bb | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/images/core-image-testmaster-initramfs.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster.bb

diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
new file mode 100644
index 0000000..563260d
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Small image capable of booting a device with custom install scripts, \
+adding a second rootfs, used for testing."
+
+# use -testfs live-install scripts
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
+BAD_RECOMMENDATIONS += "busybox-syslog"
diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testmaster.bb
new file mode 100644
index 0000000..ac2fdbe
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-testmaster.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "A master image to be deployed on a target useful for testing other images"
+
+IMAGE_FEATURES += "ssh-server-openssh package-management"
+
+inherit core-image
+
+# the deploy code requires bash and
+# normal linux utilities not busybox ones
+IMAGE_INSTALL += "\
+    bash coreutils util-linux tar gzip kmod \
+    python-modules python-misc \
+    e2fsprogs e2fsprogs-mke2fs parted \
+    "
+# we need a particular initramfs for live images
+# that pulls custom install scripts which take
+# care of partitioning for us
+INITRD_IMAGE = "core-image-testmaster-initramfs"
+
-- 
1.8.5.3


