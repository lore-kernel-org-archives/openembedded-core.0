Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPZWF-000398-RB
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:27:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315358572"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:09:34 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 17:09:44 +0300
Message-Id: <1365516584-5756-3-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365516584-5756-1-git-send-email-radu.moisan@intel.com>
References: <1365516584-5756-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 2/2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Tue, 09 Apr 2013 14:28:01 -0000

This fixes a service dependency issue;
When graphical.target is the default mode, systemd
will try to start display-manager.service which is not
available on some targets.

For xserver-nodm-init we would then have something like:
inherit update-alternatives
ALTERNATIVE_${PN} = "systemd-def-target"
ALTERNATIVE_TARGET[systemd-def-target] =
"${systemd_unitdir}/system/graphical.target"
ALTERNATIVE_LINK_NAME[systemd-def-target] =
"${systemd_unitdir}/system/default.target"
ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"

Fixes [Yocto #3816]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 354e557..bd5881b 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -251,7 +251,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff systemd-def-target"
 
 ALTERNATIVE_TARGET[init] = "${systemd_unitdir}/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -273,6 +273,10 @@ ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
 ALTERNATIVE_PRIORITY[poweroff] ?= "300"
 
+ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/multi-user.target"
+ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/system/default.target"
+ALTERNATIVE_PRIORITY[systemd-def-target] ?= "1"
+
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		exit 1
-- 
1.7.9.5



