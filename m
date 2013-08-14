Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A81D56B7B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTO0P013986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:24 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:04 -0500
Message-ID: <1376512209-11622-7-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 06/11] package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:23 -0000
Content-Type: text/plain

Previous debian APT configuration was using the sysroot directory.
This not only polluted the sysroot, but violates the expectation that
the sysroot is not modified by the rootfs installation.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_deb.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 663f646..4980555 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -10,6 +10,8 @@ DPKG_ARCH ?= "${TARGET_ARCH}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
+APTCONF_TARGET = "${WORKDIR}"
+
 #
 # Update the Packages index files in ${DEPLOY_DIR_DEB}
 #
@@ -63,8 +65,9 @@ package_install_internal_deb () {
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_DEB}"
 	local task="${INSTALL_TASK_DEB}"
 
-	rm -f ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
-	rm -f ${STAGING_ETCDIR_NATIVE}/apt/preferences
+	mkdir -p ${APTCONF_TARGET}/apt
+	rm -f ${APTCONF_TARGET}/apt/sources.list.rev
+	rm -f ${APTCONF_TARGET}/apt/preferences
 
 	priority=1
 	for arch in $archs; do
@@ -72,15 +75,15 @@ package_install_internal_deb () {
 			continue;
 		fi
 
-		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
+		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${APTCONF_TARGET}/apt/sources.list.rev
 		(echo "Package: *"
 		echo "Pin: release l=$arch"
 		echo "Pin-Priority: $(expr 800 + $priority)"
-		echo) >> ${STAGING_ETCDIR_NATIVE}/apt/preferences
+		echo) >> ${APTCONF_TARGET}/apt/preferences
 		priority=$(expr $priority + 5)
 	done
 
-	tac ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev > ${STAGING_ETCDIR_NATIVE}/apt/sources.list
+	tac ${APTCONF_TARGET}/apt/sources.list.rev > ${APTCONF_TARGET}/apt/sources.list
 
 	# The params in deb package control don't allow character `_', so
 	# change the arch's `_' to `-' in it.
@@ -88,9 +91,9 @@ package_install_internal_deb () {
 	cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
 		| sed -e "s#Architecture \".*\";#Architecture \"${dpkg_arch}\";#" \
 		| sed -e "s:#ROOTFS#:${target_rootfs}:g" \
-		> "${STAGING_ETCDIR_NATIVE}/apt/apt-${task}.conf"
+		> "${APTCONF_TARGET}/apt/apt.conf"
 
-	export APT_CONFIG="${STAGING_ETCDIR_NATIVE}/apt/apt-${task}.conf"
+	export APT_CONFIG="${APTCONF_TARGET}/apt/apt.conf"
 
 	mkdir -p ${target_rootfs}/var/lib/dpkg/info
 	mkdir -p ${target_rootfs}/var/lib/dpkg/updates
-- 
1.8.1.2.545.g2f19ada


