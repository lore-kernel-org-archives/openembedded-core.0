Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-unauthed01.binero.net
	[195.74.38.225])
	by mail.openembedded.org (Postfix) with ESMTP id 36B9D72B1E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 14:46:35 +0000 (UTC)
X-Halon-ID: 9d18e735-98d6-11e4-8a31-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 15:40:25 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Jan 2015 15:40:14 +0100
Message-Id: <f0a5a9a1824e2276a5fae8c1460eeebcd8e46c75.1420899992.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420899992.git.petter@technux.se>
References: <cover.1420899992.git.petter@technux.se>
In-Reply-To: <cover.1420899992.git.petter@technux.se>
References: <cover.1420899992.git.petter@technux.se>
MIME-Version: 1.0
Subject: [RFC PATCH 5/5] meta: set proper S value
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
X-List-Received-Date: Sat, 10 Jan 2015 14:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After removal of auto-creating S we must ensure that all recipes are
using a proper value for S.

Fix all recipes that only need to set S equals to WORKDIR.

[YOCTO #5627]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb                              | 2 ++
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb                             | 2 ++
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                                | 2 ++
 meta/recipes-connectivity/connman/connman-conf.bb                      | 2 ++
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb                 | 2 ++
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb                   | 2 ++
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb                  | 2 ++
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb             | 2 ++
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb             | 2 ++
 .../initrdscripts/initramfs-live-install-efi-testfs_1.0.bb             | 2 ++
 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb      | 2 ++
 meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb   | 2 ++
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb          | 2 ++
 meta/recipes-core/initscripts/initscripts_1.0.bb                       | 2 ++
 meta/recipes-core/systemd/systemd-systemctl-native.bb                  | 2 ++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb                 | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb                           | 2 ++
 meta/recipes-devtools/opkg/opkg-collateral.bb                          | 2 ++
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb               | 2 ++
 meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb                 | 2 ++
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb          | 2 ++
 meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb       | 3 +++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb                            | 2 ++
 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb                  | 2 ++
 24 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 17c2d00..d0f7bb3 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -18,6 +18,8 @@ SRC_URI = "\
   file://alsa-state-init \
 "
 
+S = "${WORKDIR}"
+
 # As the recipe doesn't inherit systemd.bbclass, we need to set this variable
 # manually to avoid unnecessary postinst/preinst generated.
 python __anonymous() {
diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
index e2c7cc0..e1d4c54 100644
--- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
+++ b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
@@ -10,6 +10,8 @@ SRC_URI = "file://hostap_cs.modalias \
 
 inherit allarch
 
+S = "${WORKDIR}"
+
 do_compile() {
 }
 
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 925161b..5793a76 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -26,6 +26,8 @@ SRC_URI = "file://keymap.sh \
 INITSCRIPT_NAME = "keymap.sh"
 INITSCRIPT_PARAMS = "start 01 S ."
 
+S = "${WORKDIR}"
+
 do_install () {
     # Only install the script if 'sysvinit' is in DISTRO_FEATURES
     # THe ulitity this script provides could be achieved by systemd-vconsole-setup.service
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index af72640..2358d9d 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -9,6 +9,8 @@ SRC_URI_append_qemuall = "file://wired.config \
                          "
 PR = "r2"
 
+S = "${WORKDIR}"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} = "${localstatedir}/* ${libdir}/*"
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 68b83d0..51a76b4 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "file://host-peer \
 
 inherit allarch useradd
 
+S = "${WORKDIR}"
+
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
 	install -m 0644 ${WORKDIR}/host-peer ${D}${sysconfdir}/ppp/peers/host
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 3d88506..733ae41 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "file://copyright \
            file://interfaces \
            file://nfsroot"
 
+S = "${WORKDIR}"
+
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
 			${D}${sysconfdir}/network/if-pre-up.d \
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index 0ede20b..7ae7969 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -5,6 +5,8 @@ SRC_URI = "file://init-boot.sh"
 
 PR = "r2"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -m 0755 ${WORKDIR}/init-boot.sh ${D}/init
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 403127b..89b900d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "file://init \
            file://e2fs \
            file://debug"
 
+S = "${WORKDIR}"
+
 do_install() {
     install -d ${D}/init.d
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index ac54902..b54cb61 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -7,6 +7,8 @@ SRC_URI = "file://init-live.sh"
 
 PR = "r12"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
index a54960c..c03bd2d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -5,6 +5,8 @@ SRC_URI = "file://init-install-efi-testfs.sh"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -m 0755 ${WORKDIR}/init-install-efi-testfs.sh ${D}/install-efi.sh
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 7195dc2..b0994d7 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -7,6 +7,8 @@ PR = "r1"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -m 0755 ${WORKDIR}/init-install-efi.sh ${D}/install-efi.sh
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
index db4cf54..937bfd4 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -5,6 +5,8 @@ SRC_URI = "file://init-install-testfs.sh"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -m 0755 ${WORKDIR}/init-install-testfs.sh ${D}/install.sh
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 7bf31c9..6241a90 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -5,6 +5,8 @@ SRC_URI = "file://init-install.sh"
 
 PR = "r9"
 
+S = "${WORKDIR}"
+
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
 do_install() {
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index afdc538..dfb75b2 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -35,6 +35,8 @@ SRC_URI = "file://functions \
            file://logrotate-dmesg.conf \
 "
 
+S = "${WORKDIR}"
+
 SRC_URI_append_arm = " file://alignment.sh"
 
 KERNEL_VERSION = ""
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index 72bc77d..fbdc9c0 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -9,6 +9,8 @@ inherit native
 
 SRC_URI = "file://systemctl"
 
+S = "${WORKDIR}"
+
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 657ef02..eed2104 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -6,7 +6,7 @@ PR = "r10"
 
 SRC_URI = "file://inittab"
 
-S = "${WORKDIR}/sysvinit-${PV}"
+S = "${WORKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index d69056d..6fbd925 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -13,6 +13,8 @@ SRC_URI = " \
        file://localextra.rules \
 "
 
+S = "${WORKDIR}"
+
 
 do_install() {
     install -d ${D}${sysconfdir}/udev/rules.d
diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
index 3825ffb..0cf6b8b 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
@@ -8,6 +8,8 @@ SRC_URI = "file://opkg.conf.comments \
 	   file://dest \
 	   file://src "
 
+S = "${WORKDIR}"
+
 OPKGLIBDIR = "${localstatedir}/lib"
 do_compile () {
 	cat ${WORKDIR}/opkg.conf.comments >${WORKDIR}/opkg.conf
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 64f85c2..d126132 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "file://run-postinsts \
            file://run-postinsts.init \
            file://run-postinsts.service"
 
+S = "${WORKDIR}"
+
 inherit allarch systemd update-rc.d
 
 INITSCRIPT_NAME = "run-postinsts"
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb b/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
index 0e04100..c78f888 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
@@ -9,6 +9,8 @@ PR = "r3"
 
 SRC_URI = "file://securetty"
 
+S = "${WORKDIR}"
+
 # Since SERIAL_CONSOLES is likely to be set from the machine configuration
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 549c7c8..5420b7d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,6 +7,8 @@ PR = "r33"
 
 SRC_URI = "file://xorg.conf"
 
+S = "${WORKDIR}"
+
 CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 7031ba1..db670cf 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -4,8 +4,11 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
 SRC_URI = "file://modutils.sh \
 	   file://PD.patch"
+
 PR = "r7"
 
+S = "${WORKDIR}"
+
 INITSCRIPT_NAME = "modutils.sh"
 INITSCRIPT_PARAMS = "start 05 S ."
 
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
index fff3620..aa1b0b6 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -6,6 +6,8 @@ PR = "r3"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+S = "${WORKDIR}"
+
 do_install() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
index 7443811..bc1b0a4 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+S = "${WORKDIR}"
+
 do_install () {
     mkdir -p ${D}${bindir}
     install -m 0755 ${WORKDIR}/ptest-runner ${D}${bindir}
-- 
1.9.1


