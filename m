Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UN0zu-0003fc-DP
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 15:11:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Apr 2013 05:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,393,1363158000"; d="scan'208";a="312345646"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2013 05:54:04 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 15:54:03 +0300
Message-Id: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Tue, 02 Apr 2013 13:11:35 -0000

This fixes a service dependency issue;
While graphical.target is the default mode, systemd
will try to start display-manager.service which is not
available.

For xserver-nodm-init we would then have something like:
inherit update-alternatives
ALTERNATIVE_${PN} = "systemd-def-target"
ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/graphical.target"
ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/system/default.target"
ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index ba1d133..bf1eb39 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -248,6 +248,7 @@ update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl
 update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
+update-alternatives --install ${systemd_unitdir}/system/default.target systemd-def-target ${systemd_unitdir}/system/multi-user.target 1
 }
 
 pkg_prerm_systemd () {
@@ -256,6 +257,7 @@ update-alternatives --remove halt ${base_bindir}/systemctl
 update-alternatives --remove reboot ${base_bindir}/systemctl
 update-alternatives --remove shutdown ${base_bindir}/systemctl
 update-alternatives --remove poweroff ${base_bindir}/systemctl
+update-alternatives --remove systemd-def-target ${systemd_unitdir}/system/multi-user.target
 }
 
 pkg_postinst_udev-hwdb () {
-- 
1.7.9.5



