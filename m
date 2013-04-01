Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UMhKV-0005ej-SI
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 18:11:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Apr 2013 08:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,387,1363158000"; d="scan'208";a="221431144"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Apr 2013 08:53:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 18:54:37 +0300
Message-Id: <1364831677-5945-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] connman: added wired setup for systemd
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
X-List-Received-Date: Mon, 01 Apr 2013 16:11:32 -0000

Added support for correctly configuring
wired interface if systemd is the init system.

Fixes [YOCTO #4041].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 96ebc55..5d35bc2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -47,6 +47,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
+SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
 
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
@@ -57,6 +58,10 @@ USERADD_PARAM_${PN} = "--create-home \
 
 inherit autotools gtk-doc pkgconfig systemd update-rc.d useradd
 
+do_configure_append () {
+	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
+}
+
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
 # both this and the xuser patch can be dropped.
-- 
1.7.10.4



