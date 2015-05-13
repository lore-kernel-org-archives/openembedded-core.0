Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3233873F4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 21:51:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2015 14:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,422,1427785200"; d="scan'208";a="709831070"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2015 14:51:26 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 13 May 2015 14:51:26 -0700
Received: from localhost.localdomain (10.218.98.23) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 13 May 2015 14:51:25 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 18:51:09 -0300
Message-ID: <1431553871-23972-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.98.23]
Subject: [PATCH V5 1/3] dbus: split tools package.
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
X-List-Received-Date: Wed, 13 May 2015 21:51:25 -0000
Content-Type: text/plain

From: Gustavo Sverzut Barbieri <gustavo.barbieri@intel.com>

Most tools are not required if one is launching a simple daemon.
The user will be able to exclude dbus-tool and save some space in his
build

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 meta/recipes-core/dbus/dbus.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index fb5d017..58dd728 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -39,7 +39,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-tools"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -47,6 +47,7 @@ OLDPKGNAME_class-nativesdk = ""
 # for compatibility
 RPROVIDES_${PN} = "${OLDPKGNAME}"
 RREPLACES_${PN} += "${OLDPKGNAME}"
+RRECOMMENDS_${PN}_class-native = ""
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
@@ -64,6 +65,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
+FILES_${PN}-tools += "${bindir}/dbus-uuidgen \
+                      ${bindir}/dbus-cleanup-sockets \
+                      ${bindir}/dbus-monitor \
+                      ${bindir}/dbus-launch \
+                      ${bindir}/dbus-run-session"
+RRECOMMENDS_${PN} = "${PN}-tools"
 
 pkg_postinst_dbus() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
-- 
2.4.0


