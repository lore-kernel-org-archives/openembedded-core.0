Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAE679C29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:59:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9P9woiH009710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 02:59:00 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 25 Oct 2018 02:58:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 05:58:26 -0400
Message-ID: <20181025095826.163943-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181025095826.163943-1-mark.hatle@windriver.com>
References: <20181025095826.163943-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3] weston: Split out machine specific configuration
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
X-List-Received-Date: Thu, 25 Oct 2018 09:59:09 -0000
Content-Type: text/plain

Weston needs to be configured to load the fbdev driver when run on a QEMU system.
Other MACHINEs may want to also provider their own configuration as well..

Adding a new RRECOMMEND configuration package will allow this, but avoid
installing empty packages/files in the majority case where it is not needed.

Add maintainer entry as well.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/conf/layer.conf                          |  1 +
 meta/recipes-graphics/wayland/weston-conf.bb  | 35 +++++++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_5.0.0.bb |  8 +-----
 4 files changed, 38 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-conf.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d32e07d..1278593 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -678,6 +678,7 @@ RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-weston-conf = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Ross Burton <ross.burton@intel.com>"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 504f7fa..c67dec4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -75,6 +75,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   font-alias->font-util \
   systemd-boot->systemd-bootconf \
   systemd->systemd-conf \
+  weston->weston-conf \
   weston-init->weston \
   weston-init->kbd \
 "
diff --git a/meta/recipes-graphics/wayland/weston-conf.bb b/meta/recipes-graphics/wayland/weston-conf.bb
new file mode 100644
index 0000000..f52200c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-conf.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Weston, a Wayland compositor, configuration files"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CONFFILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
+
+FILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
+
+PACKAGES = "${PN}"
+
+do_configure[noexec] = '1'
+do_compile[noexec] = '1'
+
+do_install() {
+	:
+}
+
+do_install_qemux86() {
+	mkdir -p ${D}/${sysconfdir}/xdg/weston
+	cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
+[core]
+backend=fbdev-backend.so
+EOF
+}
+
+do_install_qemux86-64() {
+	mkdir -p ${D}/${sysconfdir}/xdg/weston
+	cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
+[core]
+backend=fbdev-backend.so
+EOF
+}
diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_5.0.0.bb
index 299408b..e517109 100644
--- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_5.0.0.bb
@@ -29,12 +29,6 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
                 "
-EXTRA_OECONF_append_qemux86 = "\
-		WESTON_NATIVE_BACKEND=fbdev-backend.so \
-		"
-EXTRA_OECONF_append_qemux86-64 = "\
-		WESTON_NATIVE_BACKEND=fbdev-backend.so \
-		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
@@ -107,7 +101,7 @@ FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
 RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "liberation-fonts"
+RRECOMMENDS_${PN} = "weston-conf liberation-fonts"
 RRECOMMENDS_${PN}-dev += "wayland-protocols"
 
 USERADD_PACKAGES = "${PN}"
-- 
1.8.3.1


