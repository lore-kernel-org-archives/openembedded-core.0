Received: from mail-wg0-f48.google.com ([74.125.82.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWonO-0001BM-01
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:11:11 +0200
Received: by mail-wg0-f48.google.com with SMTP id f11so3605266wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 06:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Ez6FlOajB32EJS+0AHKRiN1sA9jXo9VlVjwZdx3Cys4=;
	b=AcbD5oDzH1zSsa7HforF7mVjYhSBHhQd0UFOSx53r9ANmQwCNtqj2s1iu5Kzw2S4HJ
	h9dTSl1RClX8WGBvWwOsiUyVS9seFzYbnm06TJXwCbsUMgR3oVurKUJSaBeBJ4aJGGH0
	Jv1DcWLFHTdxZ9AcCrhNpK1NMJ5IyFjOhd+SoXJL2VR+n8XX0GZbBAUiFBt3as3lm9lg
	KWR+j1ophYpBw7MbuEaWgxmS60ed58NmA/RsT5a9yWdE4sVFjmg51TNqa5SbMR2NEsRv
	CORFr4dm+2BldGzBZ/75ENdktTG9vhFxa0MHCD9c8QRlZSqg38eFsZuOrYKTihfNONKE
	QFww==
X-Received: by 10.194.58.163 with SMTP id s3mr73656555wjq.6.1367243247455;
	Mon, 29 Apr 2013 06:47:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ge7sm22406247wib.6.2013.04.29.06.47.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 06:47:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:44:29 +0100
Message-Id: <1367243069-22821-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmGqlowhH7r831KC9YS0WTQ6HpOeNv5u7GIBnIuATsxpCzGqt8ASASHcUSuy/rE3aJG9ftC
Subject: [PATCH][V2] neard: add systemd unit file
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
X-List-Received-Date: Mon, 29 Apr 2013 14:12:10 -0000

Add a systemd unit file, and respect the sysvinit feature when installing the
init script.

(thanks to Jukka Rissanen for the unit file)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../neard/neard/neard.service.in                   |   13 +++++++++
 meta/recipes-connectivity/neard/neard_0.9.bb       |   28 +++++++++++++-------
 2 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard/neard.service.in

diff --git a/meta/recipes-connectivity/neard/neard/neard.service.in b/meta/recipes-connectivity/neard/neard/neard.service.in
new file mode 100644
index 0000000..90e5302
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/neard.service.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=NFC service
+After=syslog.target
+
+[Service]
+Type=dbus
+BusName=org.neard
+Restart=on-failure
+ExecStart=@installpath@/neard -n
+StandardOutput=null
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
index 2c4acb3..dc43f7e 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -7,6 +7,7 @@ DEPENDS = "dbus glib-2.0 libnl"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
            file://neard.in \
+           file://neard.service.in \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
@@ -18,7 +19,7 @@ SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
 PV = "0.10+git${SRCPV}"
 PR = "r0"
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig systemd update-rc.d
 
 EXTRA_OECONF += "--enable-tools"
 
@@ -28,15 +29,20 @@ do_install() {
 
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
-	# start/stop
-	install -d ${D}${sysconfdir}/init.d/
-
-	sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
-		> ${D}${sysconfdir}/init.d/neard
-
-	chmod 0755 ${D}${sysconfdir}/init.d/neard
-
-	#test files
+	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d/
+		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		  > ${D}${sysconfdir}/init.d/neard
+		chmod 0755 ${D}${sysconfdir}/init.d/neard
+	fi
+
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
+		  > ${D}${systemd_unitdir}/system/neard.service
+	fi
+
+	# Install the tests for neard-tests
 	install -d ${D}${libdir}/neard
 	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
 	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
@@ -59,3 +65,5 @@ RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
 
 INITSCRIPT_NAME = "neard"
 INITSCRIPT_PARAMS = "defaults 64"
+
+SYSTEMD_SERVICE_${PN} = "neard.service"
-- 
1.7.10.4



