Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDfJO-0007TW-EW
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 19:13:03 +0100
Received: by mail-wg0-f49.google.com with SMTP id 15so1405553wgd.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 09:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=fzvtXQrMYsd82uAYC5CHWeCIiVACciOwQh05DSPoWcc=;
	b=bKLt/e3Iu+5H29S1A24TSWcSRA6K+oY4PPGRwrI5AfGXfScwwrLhTeNTYmNvaINYHx
	pAia+vqMdnA2cPPGvAs3oqEsfj4sRpc2YRCd9CSIc0cipadZJB2hnmDsHLZEyb74n8y9
	5WVSZVyQj4aPdgKXMlBE2z5bJbvy25qX3uKCswtobd1OYCwAd8DBTpzTpYu/G5wJR+Rp
	Wm5rUUHXZHugi3mLK4ObgLPq2mrQQQsDBcIjlS6pOPWyj/cop6bjY0yMzOJe8waJt14k
	Pgy1HiBD/0UZRSO9yiIari3JCWZ/3gnvcFumwB6yUvzoP/O9vllbF8GFs7ie62bbVo/u
	vENA==
X-Received: by 10.180.80.35 with SMTP id o3mr35644068wix.9.1362678989963;
	Thu, 07 Mar 2013 09:56:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm14475828wij.2.2013.03.07.09.56.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 09:56:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2013 17:54:00 +0000
Message-Id: <1362678841-12200-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnKlrkhddzPP9RzKBFBmYWh9ZqHIgQZ+DEqkpscKyhqOiKhFtsCCR7VCuruzNAB/zsHSgzM
Subject: [PATCH] consolekit: make policykit an option, and disable by default
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
X-List-Received-Date: Thu, 07 Mar 2013 18:13:04 -0000

Make PolicyKit usage a PACKAGECONFIG option, and disable it by default.  Also
migrate pam to use PACKAGECONFIG, and add systemd too.

ConsoleKit doesn't currently have an option to force this on or off, so rely on
a build-dependency for now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.5.bb |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index e510c45..f6a554f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -8,12 +8,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-POLKIT = "polkit"
-POLKIT_libc-uclibc = ""
-POLKITCONF = ""
-POLKITCONF_libc-uclibc = "--disable-policykit"
-
-DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} virtual/libx11"
+DEPENDS = "glib-2.0 dbus virtual/libx11"
 RDEPENDS_${PN} += "base-files"
 
 inherit gnome
@@ -25,9 +20,13 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
-               "
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
+# No option to turn it on or off, so rely on the build dependency for now.
+PACKAGECONFIG[policykit] = ",,polkit"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
 
 FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
@@ -37,4 +36,3 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 PACKAGES =+ "pam-plugin-ck-connector"
 FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
-
-- 
1.7.10.4



