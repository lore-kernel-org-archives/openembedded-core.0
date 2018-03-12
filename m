Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF54F7886A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:13:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9DEG2017349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:13:15 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:12:36 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:12:57 -0700
Message-ID: <20180312091303.121887-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:13:13 -0000
Content-Type: text/plain

Config file udev.pc conflicts between 32 and 64 bit packages.
Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-core/udev/eudev_3.2.5.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-core/udev/eudev_3.2.5.bb
index 88ad8f1b37..d567c11272 100644
--- a/meta/recipes-core/udev/eudev_3.2.5.bb
+++ b/meta/recipes-core/udev/eudev_3.2.5.bb
@@ -23,7 +23,20 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
 SRC_URI[sha256sum] = "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
 
-inherit autotools update-rc.d qemu pkgconfig distro_features_check
+inherit autotools update-rc.d qemu pkgconfig distro_features_check update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE_${PN}-dev = "udev.pc"
+ALTERNATIVE_LINK_NAME[udev.pc] = "${datadir}/pkgconfig/udev.pc"
+ALTERNATIVE_TARGET[udev.pc] = "${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "eudev_alternative_rename"
+
+eudev_alternative_rename() {
+       # rename udev.pc
+       mv ${PKGD}${datadir}/pkgconfig/udev.pc ${PKGD}${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}
+}
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -65,7 +78,7 @@ PACKAGES =+ "eudev-hwdb"
 
 
 FILES_${PN} += "${libexecdir} ${base_libdir}/udev ${bindir}/udevadm"
-FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
+FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX} \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
                    ${includedir}/udev.h ${libdir}/libudev.la \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
-- 
2.11.0


