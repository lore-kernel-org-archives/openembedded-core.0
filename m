Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B193B73259
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:10:03 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 7424C3FD3C0;
	Mon,  8 Feb 2016 11:10:02 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>
Date: Mon,  8 Feb 2016 11:09:38 +0100
Message-Id: <1454926183-22439-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/6] systemd: move bash completion into separate package
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
X-List-Received-Date: Mon, 08 Feb 2016 10:10:06 -0000

Add systemd-bash package that ships bash completion files

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index a110f0cdeaac7e46b5691a89aea237974e4114b3..8e3cb6047588b286df728ff28423e469d0b0745d 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -238,7 +238,7 @@ python populate_packages_prepend (){
 PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-bash ${PN}-zsh ${PN}-xorg-xinitrc"
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
@@ -271,6 +271,11 @@ FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
 
 FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
 
+FILES_${PN}-bash = " \
+                    ${datadir}/bash-completion \
+                    ${sysconfdir}/bash_completion.d/ \
+                    "
+
 FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
 
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
@@ -290,13 +295,11 @@ CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/user.conf"
 
 FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/bash-completion \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
                 ${datadir}/factory \
-                ${sysconfdir}/bash_completion.d/ \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
-- 
2.5.0


