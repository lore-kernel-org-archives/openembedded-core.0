Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWn5l-0007pk-3W
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 14:22:04 +0200
Received: by mail-wg0-f45.google.com with SMTP id l18so3635984wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=OJrcAYlAcqkU/TlShkc1A6zHVQyk3w2f61sZiPmDSL0=;
	b=g6aGal/PTUieXkgJ9S7K1/p2NbRhkL2nvydTogeZ/G3YkEndYZ6o27UkHOQSRvroFb
	x9U5SY1YjClMSmLVhTA5W3RpFhyIRPtjt67EQSBl/gQhkTEeS+KBAC/NhZrrmh9HUg3T
	dQ1bFOhTp+YkIeNQ5Hb/l4SycJFLcdeuCz5QB6lwS9T38e3uZe6bsRBsLHEemIkwprZV
	U9ftVttCkSz3ewRnVIpMI6Q5HDUR6Hp/MMtezRKYM7xF3YYYMzhd/xpA+wSr7O6hHIHu
	ts8B4VU2G/5sB8/dRuRKdT6HwKgnbQrs67iOrzKCj3DvVmf4sI/U7/30R7PQHS+tveb+
	OW5g==
X-Received: by 10.194.71.103 with SMTP id t7mr9884061wju.38.1367237050140;
	Mon, 29 Apr 2013 05:04:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dj7sm19751410wib.6.2013.04.29.05.04.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:04:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 12:57:15 +0100
Message-Id: <1367236635-27036-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367236635-27036-1-git-send-email-ross.burton@intel.com>
References: <1367236635-27036-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnG0tLWDCvhp+S4OFOI715P3Msn3xLELUNzkSYRnuKPDVEXM3jr8TWyCdNK7UogL8LP+9mg
Subject: [PATCH 2/2] neard: add systemd unit file
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
X-List-Received-Date: Mon, 29 Apr 2013 12:22:07 -0000

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
index 2c4acb3..1442d00 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -7,6 +7,7 @@ DEPENDS = "dbus glib-2.0 libnl"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
            file://neard.in \
+	file://neard.service.in \
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



