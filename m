Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0AE731FA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:10:06 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D672A3FC7F3;
	Mon,  8 Feb 2016 11:10:03 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>
Date: Mon,  8 Feb 2016 11:09:42 +0100
Message-Id: <1454926183-22439-6-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 5/6] systemd: move some tools into systemd-extra-utils package
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
X-List-Received-Date: Mon, 08 Feb 2016 10:10:07 -0000

This patch attempts to split some of the extra functionality delivered
by systemd utilities from the main package into a separate package. This
allows for trimming the size of a default systemd installation down to
~7MB with all configuration features disabled. The new
systemd-extra-utils package is added to RRECOMMENDS so that by default
it will get installed into the target image.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 74abe39761bfb22eb9ed442b26c0233394503453..40ed81a37e78c67bae13f7ee7018d85efa2f6b7d 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -288,6 +288,7 @@ PACKAGES =+ "\
     ${PN}-bash \
     ${PN}-zsh \
     ${PN}-xorg-xinitrc \
+    ${PN}-extra-utils \
 "
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
@@ -333,6 +334,51 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
+FILES_${PN}-extra-utils = "\
+                        ${base_bindir}/systemd-escape \
+                        ${base_bindir}/systemd-inhibit \
+                        ${bindir}/systemd-detect-virt \
+                        ${bindir}/systemd-path \
+                        ${bindir}/systemd-run \
+                        ${bindir}/systemd-cat \
+                        ${bindir}/systemd-delta \
+                        ${bindir}/systemd-cgls \
+                        ${bindir}/systemd-cgtop \
+                        ${bindir}/systemd-stdio-bridge \
+                        ${base_bindir}/systemd-ask-password \
+                        ${base_bindir}/systemd-tty-ask-password-agent \
+                        ${systemd_unitdir}/system/systemd-ask-password-console.path \
+                        ${systemd_unitdir}/system/systemd-ask-password-console.service \
+                        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
+                        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
+                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
+                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
+                        ${rootlibexecdir}/systemd/systemd-resolve-host \
+                        ${rootlibexecdir}/systemd/systemd-ac-power \
+                        ${rootlibexecdir}/systemd/systemd-activate \
+                        ${bindir}/systemd-nspawn \
+                        ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
+                        ${systemd_unitdir}/system/systemd-nspawn@.service \
+                        ${rootlibexecdir}/systemd/systemd-bus-proxyd \
+                        ${systemd_unitdir}/system/systemd-bus-proxyd.service \
+                        ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
+                        ${rootlibexecdir}/systemd/systemd-socket-proxyd \
+                        ${rootlibexecdir}/systemd/systemd-reply-password \
+                        ${rootlibexecdir}/systemd/systemd-sleep \
+                        ${rootlibexecdir}/systemd/system-sleep \
+                        ${systemd_unitdir}/system/systemd-hibernate.service \
+                        ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
+                        ${systemd_unitdir}/system/systemd-suspend.service \
+                        ${systemd_unitdir}/system/sleep.target \
+                        ${rootlibexecdir}/systemd/systemd-initctl \
+                        ${systemd_unitdir}/system/systemd-initctl.service \
+                        ${systemd_unitdir}/system/systemd-initctl.socket \
+                        ${systemd_unitdir}/system/sockets.target.wants/systemd-initctl.socket \
+                        ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
+                        ${rootlibexecdir}/systemd/systemd-cgroups-agent \
+"
+
 CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/coredump.conf \
                 ${sysconfdir}/systemd/journald.conf \
@@ -387,6 +433,7 @@ RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
+                      systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-- 
2.5.0


