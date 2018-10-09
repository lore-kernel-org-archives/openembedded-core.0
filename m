Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5971A745AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 07:39:13 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w997dEFv008120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 09:39:14 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w997dE93000447;
	Tue, 9 Oct 2018 09:39:14 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id BDF239550DC;
	Tue,  9 Oct 2018 09:39:13 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 09:38:46 +0200
Message-Id: <20181009073848.8492-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
References: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
Subject: [PATCH v2 1/3] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Tue, 09 Oct 2018 07:39:14 -0000

- remove OE runlevel script which conflicts with busybox's applet
- don't install empty directories

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc      | 4 +---
 meta/recipes-core/busybox/busybox/init.cfg | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e1fba4243a..7b427ab0f7 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -254,8 +254,7 @@ do_install () {
 			ln -sf busybox ${D}${base_bindir}/busybox.nosuid
 		fi
 	else
-		install -d ${D}${base_bindir} ${D}${base_sbindir}
-		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
+		install -d ${D}${base_bindir} ${D}${bindir} ${D}${libdir}
 		cat busybox.links | while read FILE; do
 			NAME=`basename "$FILE"`
 			install -m 0755 "0_lib/$NAME" "${D}$FILE.${BPN}"
@@ -316,7 +315,6 @@ do_install () {
         if grep "CONFIG_INIT=y" ${B}/.config; then
                 install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
                 install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
-                install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel
         fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
index 3c1fdd42b6..b69fe0ea9c 100644
--- a/meta/recipes-core/busybox/busybox/init.cfg
+++ b/meta/recipes-core/busybox/busybox/init.cfg
@@ -1,4 +1,5 @@
 CONFIG_INIT=y
+CONFIG_RUNLEVEL=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_HALT=y
 CONFIG_POWEROFF=y
-- 
2.11.0


