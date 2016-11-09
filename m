Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 33856700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 17:39:37 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AVBQAZXiNY/5tjdVtdHgYMgy8BAQEBAR9Yf7cOgg+CCBkQiBBAEwECAQEBAQEBAWIohTMBgX6IYAEJoQuSPIQfAYdShj6JboIAC4MJBZoxhjiKFwKCO4c+hh0CkT8gAjNjDwqCZAxHG4FePTQBhSwrgg8BAQE
X-IPAS-Result: A2AVBQAZXiNY/5tjdVtdHgYMgy8BAQEBAR9Yf7cOgg+CCBkQiBBAEwECAQEBAQEBAWIohTMBgX6IYAEJoQuSPIQfAYdShj6JboIAC4MJBZoxhjiKFwKCO4c+hh0CkT8gAjNjDwqCZAxHG4FePTQBhSwrgg8BAQE
X-IronPort-AV: E=Sophos;i="5.31,614,1473112800"; d="scan'208";a="192835505"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 09 Nov 2016 18:39:38 +0100
Received: from [192.168.10.140] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim)
	id 1c4WqY-0007aZ-4w for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 18:39:38 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 18:39:35 +0100
Message-Id: <1478713175-11446-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Move the recommends on ca-certificates from epiphany to webkitgtk.
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
X-List-Received-Date: Wed, 09 Nov 2016 17:39:38 -0000

 * The webkitgtk package should recommend the ca-certificates one,
   because any program usign webkit (and not only epiphany) would
   expect that the CAs certificates are available and that https
   validation works as expected.

 * For example, webkitgtk includes a MiniBrowser program that would
   fail to proper verify https sites if the ca-certificate package
   is not installed

 * Instead of making each one of the webkitgtk consumers care about
   the certificate package, do this in webkit itself.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.22.1.bb | 3 +--
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb   | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
index 3c63d33..2a9d200 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "WebKit based web browser for GNOME"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr \
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even
@@ -20,4 +20,3 @@ do_configure_prepend() {
 
 FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
-RRECOMMENDS_${PN} = "ca-certificates"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
index d6d9c14..39197bc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
@@ -90,6 +90,8 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
+RRECOMMENDS_${PN} += "ca-certificates"
+
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.1.4


