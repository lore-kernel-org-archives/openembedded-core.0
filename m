Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 1E21674DB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 14:05:02 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 618125C1ACA;
	Tue, 15 May 2018 16:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526393102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=lxbj9cBqheBMXmxGg1N0C0DMKPRZh2+GKAEuv7Xkm+A=;
	b=i7XtTZEjVUsw7aik56kb59AYKc2ay44xY3YyMDqhlnYA0achlQE9gBlyjJ1TYD75xitqO7
	QwDsVRfw3CZxI+z05npS6C+uFAmoqSU+elehAnEB9iCWj+3La+2bPLymkBqfMpuaA1/MzF
	kixkPoj5eVbV1Yt0ZF4CqUTfpoP9NYM=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org, alexander.kanavin@linux.intel.com
Date: Tue, 15 May 2018 16:04:49 +0200
Message-Id: <20180515140451.60660-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180515140451.60660-1-stefan@agner.ch>
References: <20180515140451.60660-1-stefan@agner.ch>
X-Spamd-Result: default: False [-0.76 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	BAYES_HAM(-1.66)[92.89%]; RCPT_COUNT_FIVE(0.00)[5];
	MIME_GOOD(-0.10)[text/plain]; FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	MID_CONTAINS_FROM(1.00)[];
	ASN(0.00)[asn:6830, ipnet:46.140.0.0/17, country:AT];
	RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/3] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Tue, 15 May 2018 14:05:03 -0000

From: Stefan Agner <stefan.agner@toradex.com>

OpenEmbedded has a built-in mechanism to run postinst scripts offline
at build time or, if necessary, on first boot (delayed execution). If
the latter is the case and systemd is in use, two services end up
doing the same thing:
- opkg-configure.service starts "opkg configure" directly.
- run-postinsts.service starts "/usr/sbin/run-postinsts" which runs
  postinst scripts stored in /etc/ipk-postinsts/ or "opkg configure"
  if package management is installed.

Since the run-postinsts.service is also used in cases where no
package management is in use, it is the primary means of handling
postinsts.

Get rid of the opkg-configure.service to avoid duplicate opkg
configure execution.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-devtools/opkg/opkg/opkg-configure.service | 17 -----------------
 meta/recipes-devtools/opkg/opkg_0.3.6.bb               | 14 --------------
 2 files changed, 31 deletions(-)
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
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.6.bb b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
index 70f20af739..579b51166c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.6.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
@@ -12,7 +12,6 @@ DEPENDS = "libarchive"
 PE = "1"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
@@ -22,8 +21,6 @@ SRC_URI[sha256sum] = "f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf
 
 inherit autotools pkgconfig systemd
 
-SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
-
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
 
@@ -46,16 +43,6 @@ do_install_append () {
 
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
@@ -68,7 +55,6 @@ RPROVIDES_${PN} = "opkg-collateral"
 PACKAGES =+ "libopkg"
 
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
-FILES_${PN} += "${systemd_unitdir}/system/"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.13.6


