Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPZP9-0002Xh-1S
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:20:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="292357301"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2013 07:02:13 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 17:02:23 +0300
Message-Id: <1365516144-5157-2-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365516144-5157-1-git-send-email-radu.moisan@intel.com>
References: <1365516144-5157-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 1/2] systemd: use update-alternatives.bbclass
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
X-List-Received-Date: Tue, 09 Apr 2013 14:20:14 -0000

switch from using plain update-alternatives command to
update-alternatives.bbclass style

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |   36 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 2464b83..354e557 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -16,7 +16,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -251,21 +251,27 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-pkg_postinst_systemd () {
-update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
-update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
-}
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff"
 
-pkg_prerm_systemd () {
-update-alternatives --remove init ${systemd_unitdir}/systemd
-update-alternatives --remove halt ${base_bindir}/systemctl
-update-alternatives --remove reboot ${base_bindir}/systemctl
-update-alternatives --remove shutdown ${base_bindir}/systemctl
-update-alternatives --remove poweroff ${base_bindir}/systemctl
-}
+ALTERNATIVE_TARGET[init] = "${systemd_unitdir}/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
 
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-- 
1.7.9.5



