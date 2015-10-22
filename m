Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id E9730770A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:00:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 61EF8600FED
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Oct 2015 16:00:27 +0200
Message-Id: <11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
Subject: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Thu, 22 Oct 2015 14:00:42 -0000

Add PACKAGECONFIG for systemd, enable it when systemd is enabled
in DISTRO_FEATURES. Pass the correct path to systemd units,
ensure they're installed into the package.

Drop custom systemd unit files, use those shipped by the upstream
instead.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-extended/cups/cups.inc          | 14 +++-----------
 meta/recipes-extended/cups/cups/cups.path    |  8 --------
 meta/recipes-extended/cups/cups/cups.service | 10 ----------
 meta/recipes-extended/cups/cups/cups.socket  |  8 --------
 4 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/cups.path
 delete mode 100644 meta/recipes-extended/cups/cups/cups.service
 delete mode 100644 meta/recipes-extended/cups/cups/cups.socket

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2c34da9..ac2abf5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -7,9 +7,6 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
-           file://cups.socket \
-           file://cups.path \
-           file://cups.service \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
@@ -21,13 +18,15 @@ inherit autotools-brokensep binconfig useradd systemd
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system lpadmin"
 
-SYSTEMD_SERVICE_${PN} = "cups.socket cups.path cups.service"
+SYSTEMD_SERVICE_${PN} = "org.cups.cupsd.socket org.cups.cupsd.path org.cups.cupsd.service org.cups.cups-lpd.socket org.cups.cups-lpd@.service"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
@@ -75,13 +74,6 @@ do_install () {
 	    rm -rf ${D}${sysconfdir}/init.d/
 	    rm -rf ${D}${sysconfdir}/rc*
 	fi
-
-	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.socket ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.path ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/cups.service
 }
 
 python do_package_append() {
diff --git a/meta/recipes-extended/cups/cups/cups.path b/meta/recipes-extended/cups/cups/cups.path
deleted file mode 100644
index de8cc57..0000000
--- a/meta/recipes-extended/cups/cups/cups.path
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=CUPS Printer Service Spool
-
-[Path]
-PathExistsGlob=/var/spool/cups/d*
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-extended/cups/cups/cups.service b/meta/recipes-extended/cups/cups/cups.service
deleted file mode 100644
index 7d3e839..0000000
--- a/meta/recipes-extended/cups/cups/cups.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=CUPS Printing Service
-
-[Service]
-ExecStart=@SBINDIR@/cupsd -f
-PrivateTmp=true
-
-[Install]
-Also=cups.socket cups.path
-WantedBy=printer.target
diff --git a/meta/recipes-extended/cups/cups/cups.socket b/meta/recipes-extended/cups/cups/cups.socket
deleted file mode 100644
index 3314870..0000000
--- a/meta/recipes-extended/cups/cups/cups.socket
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=CUPS Printing Service Sockets
-
-[Socket]
-ListenStream=/var/run/cups/cups.sock
-
-[Install]
-WantedBy=sockets.target
-- 
2.1.4


