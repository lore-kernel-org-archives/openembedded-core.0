Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIyqc-0005V7-2I
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 11:33:02 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TIye6-0003uU-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 11:20:06 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 02 Oct 2012 10:20:04 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349169606.32611.73.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 09:33:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If ${IMAGE_BUILD_DEBUG} is set, construct a parallel tree containing
the debug data for the packages that have been installed in the
rootfs, then tar it up and deploy it alongside the rootfs images.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/image.bbclass      |    9 +++++++++
 meta/classes/rootfs_ipk.bbclass |   15 +++++++++++++++
 meta/conf/bitbake.conf          |    1 +
 3 files changed, 25 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ab212b3..c82fba1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -445,3 +445,12 @@ do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
 addtask rootfs before do_build
+
+fakeroot do_capture_debug() {
+	if [ "${IMAGE_BUILD_DEBUG}" = "1" -a -n "${IMAGE_ROOTFS_DBG}" -a -d "${IMAGE_ROOTFS_DBG}" ]; then
+		tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.debug.tar.gz -C ${IMAGE_ROOTFS_DBG} .
+		[ "${IMAGE_NAME}" == "${IMAGE_LINK_NAME}" ] || ln -sf ${IMAGE_NAME}.debug.tar.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.debug.tar.gz
+	fi
+}
+
+addtask capture_debug before do_build after do_rootfs
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 46e8d60..e4e74dd 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -9,6 +9,8 @@ EXTRAOPKGCONFIG ?= ""
 ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
+IMAGE_BUILD_DEBUG ?= "0"
+
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 
@@ -17,6 +19,7 @@ do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
 # The _POST version also works when constructing the matching SDK
 IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite"
+IPKG_ARGS_DBG = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS_DBG} --force-overwrite"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
@@ -88,6 +91,18 @@ fakeroot rootfs_ipk_do_rootfs () {
 		fi
 	fi
 
+	if [ "${IMAGE_BUILD_DEBUG}" = "1" -a -n "${IMAGE_ROOTFS_DBG}" ]; then
+		all_pkgs=`opkg-cl ${IPKG_ARGS} list-installed | awk '{ print $1 }'`
+		[ "${IMAGE_ROOTFS_DBG}" -ef "${IMAGE_ROOTFS}" ] || rm -rf ${IMAGE_ROOTFS_DBG}
+		mkdir -p ${IMAGE_ROOTFS_DBG}${opkglibdir}
+		opkg-cl ${IPKG_ARGS_DBG} update
+		for p in $all_pkgs; do
+	    		if [ "`opkg-cl ${IPKG_ARGS_DBG} info $p-dbg`" != "" ]; then
+	    			opkg-cl ${IPKG_ARGS_DBG} --nodeps install $p-dbg
+			fi
+		done
+	fi
+
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 87351e0..66152fe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -399,6 +399,7 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
 ##################################################################
 
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
+IMAGE_ROOTFS_DBG = "${IMAGE_ROOTFS}.debug"
 IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
-- 
1.7.10.4





