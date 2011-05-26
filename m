Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPWTx-0003Sg-Qo
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 11:03:53 +0200
Received: by wwb17 with SMTP id 17so401965wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 02:00:47 -0700 (PDT)
Received: by 10.217.2.202 with SMTP id p52mr562369wes.28.1306400447407;
	Thu, 26 May 2011 02:00:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a1sm237480wek.46.2011.05.26.02.00.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 02:00:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 11:00:39 +0200
Message-Id: <1306400440-10173-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1306400440-10173-1-git-send-email-koen@dominion.thruhere.net>
References: <1306400440-10173-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] qemu-config: add runtime dep on dbus-x11
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
X-List-Received-Date: Thu, 26 May 2011 09:03:53 -0000

dbus-launch moved into the dbus-x11 packages, so we need to drag it in.

Also reorder fields to better fit with the styleguide

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index e74f2da..f91875e 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -3,8 +3,9 @@ DESCRIPTION = "Adds scripts to use distcc on the host system under qemu"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-RDEPENDS_${PN} = "distcc task-core-nfs-server oprofileui-server rsync bash"
-PR = "r19"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
+
+PR = "r20"
 
 SRC_URI = "file://distcc.sh \
            file://anjuta-remote-run \
@@ -15,9 +16,6 @@ SRC_URI = "file://distcc.sh \
 
 S = "${WORKDIR}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
-PACKAGE_ARCH = "all"
-
 do_install() {
     install -d ${D}${sysconfdir}/profile.d
 
@@ -34,6 +32,9 @@ do_install() {
     install qemu-autostart ${D}/etc/init.d/
 }
 
+RDEPENDS_${PN} = "distcc dbus-x11 task-core-nfs-server oprofileui-server rsync bash"
+PACKAGE_ARCH = "all"
+
 inherit update-rc.d
 
 INITSCRIPT_NAME = "qemu-autostart"
-- 
1.6.6.1



