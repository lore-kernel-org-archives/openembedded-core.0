Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPy-0006xS-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:21:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158090"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:44 -0700
Message-Id: <a0de2a56f19ae4d8cd88e46e96917a7a019fe1ab.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/17] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Tue, 03 Jul 2012 07:21:03 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When building an image recipe, you can now build a companion SDK by
calling the populate_sdk task:
  bitbake -c populate_sdk core-image-minimal

Note: there are still issues w/ the SDK not working completely with
multilibs.

A lock is required between rootfs and populate_sdk activities to prevent
configuration file clashes and similar package management problems in ipk
and deb based systems.  (RPM already had a lock for a different reason.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass             |    5 +++++
 meta/classes/populate_sdk_base.bbclass |    1 +
 meta/classes/populate_sdk_deb.bbclass  |    2 ++
 meta/classes/populate_sdk_ipk.bbclass  |    2 ++
 meta/classes/rootfs_deb.bbclass        |    2 ++
 meta/classes/rootfs_ipk.bbclass        |    2 ++
 6 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9fae1fe..24fd868 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -3,6 +3,11 @@ inherit rootfs_${IMAGE_PKGTYPE}
 IMAGETEST ?= "dummy"
 inherit imagetest-${IMAGETEST}
 
+inherit populate_sdk_base
+
+TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
+TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY} ${PACKAGE_GROUP_dev-pkgs} ${PACKAGE_GROUP_dbg-pkgs}"
+
 inherit gzipnative
 
 LICENSE = "MIT"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6dc66fb..ed2dca0 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -120,6 +120,7 @@ populate_sdk_log_check() {
 	done
 }
 
+do_populate_sdk[dirs] = "${TOPDIR}"
 do_populate_sdk[nostamp] = "1"
 do_populate_sdk[depends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index c3b3e0c..9e9e1e1 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -6,6 +6,8 @@ DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
                 [d.getVar('SDK_ARCH', True) in \
                 ["x86", "i486", "i586", "i686", "pentium"]]}"
 
+do_populate_sdk[lockfiles] += "${WORKDIR}/deb.lock"
+
 populate_sdk_post_deb () {
 
 	local target_rootfs=$1
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index aa3efde..4321afb 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -1,6 +1,8 @@
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_populate_sdk[recrdeptask] += "do_package_write_ipk"
 
+do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
+
 populate_sdk_ipk() {
 
 	rm -f ${IPKGCONF_TARGET}
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 6c9767f..4ea71da 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,6 +8,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 
+do_rootfs[lockfiles] += "${WORKDIR}/deb.lock"
+
 DEB_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
 
 opkglibdir = "${localstatedir}/lib/opkg"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 1580086..9732385 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -12,6 +12,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 
+do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
+
 IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
-- 
1.7.7.6



