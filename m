Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqOA-00072e-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2011 10:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="893055807"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2011 10:00:36 -0800
Message-Id: <bf536c8e06b35b8f72077fd7a39104eb5543a434.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Tue, 1 Mar 2011 18:33:05 +0000
Date: Wed, 02 Mar 2011 10:00:36 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:49 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 21/26] util-linux: split out uuidgen to a separate package
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
X-List-Received-Date: Wed, 02 Mar 2011 18:03:06 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

uuidgen is needed by zypper and we don't want to drag in everything else
in util-linux, so split it out to a separate package.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.17.2.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3f3ee35..6f8bcb3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -30,7 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${MAJOR_VERSION}/u
 PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-swaponoff \
                     util-linux-losetup util-linux-umount util-linux-mount util-linux-readprofile \
                     util-linux-libblkid util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-                    util-linux-lscpu \
+                    util-linux-lscpu util-linux-uuidgen \
                    "
 
 S = "${WORKDIR}/util-linux-ng-${PV}"
@@ -50,6 +50,7 @@ FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
+FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.a ${libdir}/libblkid.la ${includedir}/blkid"
diff --git a/meta/recipes-core/util-linux/util-linux_2.17.2.bb b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
index e0904db..190a9e3 100644
--- a/meta/recipes-core/util-linux/util-linux_2.17.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
@@ -1,6 +1,6 @@
 MAJOR_VERSION = "2.17"
 require util-linux.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://uclibc-compile.patch \
 	          file://util-linux-ng-replace-siginterrupt.patch \
-- 
1.7.1



