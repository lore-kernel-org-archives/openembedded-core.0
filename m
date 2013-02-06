Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U34PT-0005qU-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 13:47:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2013 04:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="287317993"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2013 04:31:07 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 14:31:03 +0200
Message-Id: <1360153863-10600-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Wed, 06 Feb 2013 12:47:32 -0000

This fixes a service dependency issue;
While graphical.target is the default mode, systemd
will try to start display-manager.service which is not
available.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 48188ba..5e849b6 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -236,6 +236,7 @@ update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl
 update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
+update-alternatives --install ${systemd_unitdir}/system/default.target systemd-def-target ${systemd_unitdir}/system/multi-user.target 1
 }
 
 pkg_prerm_systemd () {
@@ -244,6 +245,7 @@ update-alternatives --remove halt ${base_bindir}/systemctl
 update-alternatives --remove reboot ${base_bindir}/systemctl
 update-alternatives --remove shutdown ${base_bindir}/systemctl
 update-alternatives --remove poweroff ${base_bindir}/systemctl
+update-alternatives --remove systemd-def-target ${systemd_unitdir}/system/multi-user.target
 }
 
 
@@ -253,3 +255,4 @@ python () {
     if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
 }
+
-- 
1.7.9.5



