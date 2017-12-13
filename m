Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D85057874E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 18:06:27 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 285355C3A6A;
	Wed, 13 Dec 2017 19:00:26 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 19:06:24 +0100
Message-Id: <20171213180624.30839-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513188026; bh=p2i8iR5QUWL2OykjlHeR0OYl/C44BxXYAwbzvxi5iqk=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=GqgqhrHNL7e897YM0jZm3BBLTDr0nNW6S0a6H2S4kp/OeYZl0hwNmq8msSTD2cati5W2fxk81xLvHLY9uPABUuxmGct4i3mNYFUvcQCpH97EcKzECjbnl7VdfaJ3uAvQ/1ToRmdKA22RV8/hEPtRmQW1uEVDg4Wu3vCdU97DkBo=
Cc: Stefan Agner <stefan.agner@toradex.com>, muhammad_shakeel@mentor.com
Subject: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Wed, 13 Dec 2017 18:06:28 -0000

From: Stefan Agner <stefan.agner@toradex.com>

OpenEmbedded has a built-in mechanism to run postinst scripts offline
at build time or, if necessary, on first boot (delayed execution). If
the latter is the case and systemd is in use, two services end up
doing the same thing:
- opkg-configure.service starts "opkg configure" which in turn parses
  /var/lib/opkg/status and runs the postinst scripts stored in
  /var/lib/opkg/info/.
- run-postinsts.service starts "/usr/sbin/run-postinsts" which runs
  postinst scripts stored in /etc/ipk-postinsts/. Those scripts get
  prepared by meta/lib/oe/rootfs.py (see also _save_postinsts of the
  OpkgRootfs class)

This can be seen when using a distro using ipk and systemd, then
installing opkg-keyrings and enable package management. The resulting
rootfs has both services and will run opkg-keyrings.postinst twice.

Moreover, because the two services have similar dependency, they
typically get executed almost at the same time:
  Dec 13 14:47:25 colibri-imx6 systemd[1]: Starting Opkg first boot configure...
  ...
  Dec 13 14:47:25 colibri-imx6 systemd[1]: Starting Run pending postinsts...

This leads to executions of the same postinst scripts racing with each
other! In practise update-alternative has been proven to be suspectable
to such races.

Get rid of the opkg service to avoid dupplicate postinst execution.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-devtools/opkg/opkg/opkg-configure.service | 17 -----------------
 meta/recipes-devtools/opkg/opkg_0.3.5.bb               | 13 -------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.service

diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
deleted file mode 100644
index 432c3ddc28..0000000000
--- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
+++ /dev/null
@@ -1,17 +0,0 @@
-[Unit]
-Description=Opkg first boot configure
-DefaultDependencies=no
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
-Before=sysinit.target
-
-[Service]
-Type=oneshot
-EnvironmentFile=-@SYSCONFDIR@/default/postinst
-ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure; fi"
-ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable opkg-configure.service
-StandardOutput=syslog
-RemainAfterExit=No
-
-[Install]
-WantedBy=basic.target
-WantedBy=sysinit.target
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.5.bb b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
index 3e511b6bb6..fb36e8b866 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
@@ -22,8 +22,6 @@ SRC_URI[sha256sum] = "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d
 
 inherit autotools pkgconfig systemd
 
-SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
-
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
 
@@ -46,16 +44,6 @@ do_install_append () {
 
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/opkg-configure.service
-	fi
 }
 
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
@@ -68,7 +56,6 @@ RPROVIDES_${PN} = "opkg-collateral"
 PACKAGES =+ "libopkg"
 
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
-FILES_${PN} += "${systemd_unitdir}/system/"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.13.6


