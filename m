Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TunJE-0003fR-3I
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 17:54:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2013 08:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="271813787"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2013 08:39:31 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 18:39:29 +0200
Message-Id: <1358181569-30628-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox.inc: have the busybox-syslog postinstall run on host
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
X-List-Received-Date: Mon, 14 Jan 2013 16:55:06 -0000

update-rc.d fails when executing the postinstall on host. That's because
'syslog' is renamed to 'syslog.busybox' and a 'syslog' link to it is made
instead. However, on host, the link is not valid and update-rc.d will
complain that the file does not exist. On target, this does not happen.

So, this patch will have update-rc.d create the necessary links to
syslog.busybox instead. Technically, the behavior is unchanged and
syslogd will be started as usual. The only change will be the links in
rcX.d directories:

Instead of: S20syslog -> ../init.d/syslog
we will have: S20syslog.busybox -> ../init.d/syslog.busybox

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/busybox/busybox.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972e7d0..c70ba62 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -25,7 +25,7 @@ FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
-INITSCRIPT_NAME_${PN}-syslog = "syslog"
+INITSCRIPT_NAME_${PN}-syslog = "syslog.${BPN}"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
-- 
1.7.9.5



