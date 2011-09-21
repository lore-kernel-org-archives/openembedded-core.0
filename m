Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6I78-0006jd-Ev
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 10:25:06 +0200
Received: by fxi1 with SMTP id 1so1413580fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 01:19:48 -0700 (PDT)
Received: by 10.223.48.86 with SMTP id q22mr632385faf.127.1316593188324;
	Wed, 21 Sep 2011 01:19:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id c1sm3612851fab.15.2011.09.21.01.19.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 01:19:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 10:19:42 +0200
Message-Id: <1316593182-3009-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] procps 3.2.8: remove initscript
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 08:25:06 -0000

Sysctl is managed by other initscripts in the sysV world and by systemd itself in the systemd world, so drop it from the procps recipe.

This also fixes some style issues and a global FILES assignenment.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../procps/procps-3.2.8/procps.init                |    6 ----
 meta/recipes-extended/procps/procps_3.2.8.bb       |   27 ++++++--------------
 2 files changed, 8 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps.init

diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps.init b/meta/recipes-extended/procps/procps-3.2.8/procps.init
deleted file mode 100644
index 739dcf4..0000000
--- a/meta/recipes-extended/procps/procps-3.2.8/procps.init
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-SYSCTL_CONF="/etc/sysctl.conf"
-if [ -f "${SYSCTL_CONF}" ]; then
-	/sbin/sysctl -q -p "${SYSCTL_CONF}"
-fi
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index a38077e..d989955 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,11 +1,8 @@
 require procps.inc
 
-PR = "r2"
+PR = "r3"
 
-inherit update-rc.d update-alternatives
-
-INITSCRIPT_NAME = "procps.sh"
-INITSCRIPT_PARAMS = "start 30 S ."
+inherit update-alternatives
 
 ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
                      ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
@@ -13,22 +10,14 @@ ALTERNATIVE_PRIORITY = "90"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
-	    file://linux-limits.patch \
-	    file://sysctl.conf \
-	    file://procps.init \
-	    file://procps-3.2.8+gmake-3.82.patch \
-	    "
+            file://linux-limits.patch \
+            file://sysctl.conf \
+            file://procps-3.2.8+gmake-3.82.patch \
+           "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
 SRC_URI[sha256sum] = "11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535"
 
-FILES = "${bindir}/top.${BPN} ${base_bindir}/ps.${BPN} ${bindir}/uptime.${BPN} ${base_bindir}/kill.${BPN} \
-	 ${bindir}/free.${BPN} ${bindir}/w ${bindir}/watch ${bindir}/pgrep ${bindir}/pmap ${bindir}/pwdx \
-	 ${bindir}/snice ${bindir}/vmstat ${bindir}/slabtop ${bindir}/pkill ${bindir}/skill ${bindir}/tload \
-	 ${base_sbindir}/sysctl.${BPN}"
-
-CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
-
 EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
                 CPPFLAGS=-I${STAGING_INCDIR} \
                 LDFLAGS="${LDFLAGS}" \
@@ -39,6 +28,6 @@ EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
 do_install_append () {
 	install -d ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/procps.init ${D}${sysconfdir}/init.d/procps.sh
 }
+
+CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
-- 
1.6.6.1



