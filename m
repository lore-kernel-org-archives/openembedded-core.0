Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1E977BD3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id E2E122656B7
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Wed,  5 Apr 2017 17:05:20 +0200
Message-Id: <20170405150521.19160-2-romain.perier@collabora.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170405150521.19160-1-romain.perier@collabora.com>
References: <20170405150521.19160-1-romain.perier@collabora.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] logrotate: Bump to 3.11.0
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
X-List-Received-Date: Wed, 05 Apr 2017 15:05:43 -0000

This commit updates the recipe to the last upstream tag. Then, as the
tarball no longer contains the pre-generated Makefile, inherit from
autotools

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---
 .../{logrotate_3.9.1.bb => logrotate_3.11.0.bb}    | 23 +++++++++++-----------
 1 file changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.9.1.bb => logrotate_3.11.0.bb} (69%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.11.0.bb
similarity index 69%
rename from meta/recipes-extended/logrotate/logrotate_3.9.1.bb
rename to meta/recipes-extended/logrotate/logrotate_3.11.0.bb
index 9c2dfe0..d72c7f0 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.11.0.bb
@@ -3,23 +3,25 @@ SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/logrotate/"
 LICENSE = "GPLv2"
 
-# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
 # TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
 
 DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
+# TODO: We need to decide if we github or downloads.yoctoproject.org
+SRC_URI = "https://github.com/logrotate/logrotate/releases/download/${PV}/logrotate-${PV}.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
             "
+SRC_URI[md5sum] = "15db4027b07b3e239297e4c87c6da2e9"
+SRC_URI[sha256sum] = "7dcb440ed2f1937459e1e06f841c6af1e564b77b2df8009147b56c8649197910"
 
-SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
-SRC_URI[sha256sum] = "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
+PACKAGECONFIG ?= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
 
 PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
@@ -44,17 +46,14 @@ EXTRA_OEMAKE = "\
 # INSTALL=install and BASEDIR=/usr.
 OS_NAME = "Linux"
 
-do_compile_prepend() {
-    # Make sure the recompile is OK
-    rm -f ${B}/.depend
-}
+inherit autotools
 
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
-    install -p -m 644 examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
-    install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
+    install -p -m 644 ${S}/examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
+    install -p -m 755 ${S}/examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     touch ${D}${localstatedir}/lib/logrotate.status
 }
-- 
2.9.3


