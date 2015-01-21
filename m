Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 187ED60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:02:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 21 Jan 2015 11:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,443,1418112000"; d="scan'208";a="515596436"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2015 11:55:09 -0800
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:51 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX157.amr.corp.intel.com (10.22.240.23) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:51 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.144) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:50 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 18:00:58 -0200
Message-ID: <1421870458-9958-3-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.144]
Subject: [PATCH 2/2] dbus: split tools package.
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
X-List-Received-Date: Wed, 21 Jan 2015 20:02:09 -0000
Content-Type: text/plain

From: Gustavo Sverzut Barbieri <gustavo.barbieri@intel.com>

Most tools are not required if one is launching a simple daemon.
The user will be able to exclude dbus-tool and save  some space in his
build

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 meta/recipes-core/dbus/dbus.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index d38ba7e..8b14647 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -39,7 +39,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-tools"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -49,12 +49,7 @@ RPROVIDES_${PN} = "${OLDPKGNAME}"
 RREPLACES_${PN} += "${OLDPKGNAME}"
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
-               ${bindir}/dbus-uuidgen \
-               ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
-               ${bindir}/dbus-monitor \
-               ${bindir}/dbus-launch \
-               ${bindir}/dbus-run-session \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -64,6 +59,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
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
1.9.1


