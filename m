Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U1FC1-0004Vz-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 12:54:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Feb 2013 03:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="251370494"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2013 03:38:18 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:38:15 +0200
Message-Id: <1359718695-20720-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 11:54:27 -0000

By default the polkit will autodetect if systemd is available
and setup the configuraton accordingly, potentially
contaminating sstate.
In this patch systemd is explicitly enabled/disabled.
When enabled, polkit will use systemd for session tarcking,
otherwise it will use ConsoleKit.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 2c0aaca..ab2547b 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -7,8 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
 
 DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 
-PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PR = "r9"
 
-- 
1.7.9.5



