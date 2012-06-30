Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SkpwB-0004bM-8T
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 07:09:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5U4wgQf028973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 21:58:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 21:58:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jun 2012 00:07:45 -0500
Message-ID: <28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341032578.git.mark.hatle@windriver.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Sat, 30 Jun 2012 05:09:40 -0000
Content-Type: text/plain

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
index 4f50376..7e41982 100644
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
1.7.3.4



