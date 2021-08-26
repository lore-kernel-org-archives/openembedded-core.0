Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.28032.1629970935316096331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:54154 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJBth-0000N1-1V
	for openembedded-core@lists.openembedded.org; Thu, 26 Aug 2021 05:42:14 -0400
Date: Thu, 26 Aug 2021 05:42:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: '${systemd_unitdir}/system' => '${systemd_system_unitdir}'
Message-ID: <4ed11f57-109-77a8-82be-c566f0e4be81@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

Repo-wide replacement to use newer variable to represent systemd
system unitdir directory.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  lightly tested by building a core-image-minimal for aarch64 and
seeing no complaints.


diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c5746eba13..7fe9e3d8c8 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -218,8 +218,8 @@ postinst_enable_logging () {
 # Modify systemd default target
 #
 set_systemd_default_target () {
-	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ]; then
-		ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
+	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ]; then
+		ln -sf ${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
 	fi
 }

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4ea5adb9f4..b0dd625539 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -253,7 +253,7 @@ class Rootfs(object, metaclass=ABCMeta):
         # Remove the run-postinsts package if no delayed postinsts are found
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
-            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unitdir}/system/run-postinsts.service")):
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
                 self.pm.remove(["run-postinsts"])

         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index f48e519088..d39828e1cd 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -32,7 +32,7 @@ do_install:append () {
 	install -d ${D}${sysconfdir}/acpi
 	install -d ${D}${sysconfdir}/acpi/events

-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/acpid.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/acpid.service
 }
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 5368abfda6..da17e5a235 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -73,10 +73,10 @@ do_install() {
 	sed -e 's,/usr/sbin,${sbindir},g; s,/etc,${sysconfdir},g;' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/apmd
 	chmod 755 ${D}${sysconfdir}/init.d/apmd

-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apmd.service
+		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/apmd.service
 }

 PACKAGES =+ "libapm apm"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 934044d5da..cd0489e846 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -67,7 +67,7 @@ EXTRA_OECONF = "--with-avahi-priv-access-group=adm \

 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
-EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
+EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_system_unitdir}/','--without-systemdsystemunitdir',d)}"

 do_configure:prepend() {
     # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
diff --git a/meta/recipes-connectivity/bind/bind_9.16.20.bb b/meta/recipes-connectivity/bind/bind_9.16.20.bb
index f7d0416858..ddf323fb9c 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.20.bb
@@ -77,11 +77,11 @@ do_install:append() {
 	# Install systemd related files
 	install -d ${D}${sbindir}
 	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/named.service
+	       ${D}${systemd_system_unitdir}/named.service

 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 856bb9ee17..342a512f45 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -36,7 +36,7 @@ PACKAGECONFIG ??= "wispr iptables client\
 # local.conf or distro config
 # PACKAGECONFIG:append:pn-connman = " openvpn vpnc l2tp pptp"

-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5, bluez5"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
@@ -173,13 +173,13 @@ VPN technogies are implemented using plug-ins."
 FILES:${PN}-vpn += "${sbindir}/connman-vpnd \
                     ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
                     ${datadir}/dbus-1/system-services/net.connman.vpn.service \
-                    ${systemd_unitdir}/system/connman-vpn.service"
+                    ${systemd_system_unitdir}/connman-vpn.service"

 SUMMARY:${PN}-wait-online = "A program that will return once ConnMan has connected to a network"
 DESCRIPTION:${PN}-wait-online = "A service that can be enabled so that \
 the system waits until a network connection is established."
 FILES:${PN}-wait-online += "${sbindir}/connmand-wait-online \
-                            ${systemd_unitdir}/system/connman-wait-online.service"
+                            ${systemd_system_unitdir}/connman-wait-online.service"

 SUMMARY:${PN}-plugin-vpn-openvpn = "An OpenVPN plugin for ConnMan VPN"
 DESCRIPTION:${PN}-plugin-vpn-openvpn = "The ConnMan OpenVPN plugin uses openvpn client \
diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
index 4e9a367d96..dbad8c8728 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
@@ -48,8 +48,8 @@ USERADD_PARAM:${PN} = "--system -d ${localstatedir}/lib/${BPN} -M -s /bin/false

 do_install:append () {
     # install systemd unit files
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_unitdir}/system
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_system_unitdir}

     chmod 700 ${D}${localstatedir}/lib/${BPN}
     chown dhcpcd:dhcpcd ${D}${localstatedir}/lib/${BPN}
diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index d55cf6a377..b6cc1d6ced 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig systemd update-rc.d

 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"

 EXTRA_OECONF += "--enable-tools"

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
index 495ce4e542..84f1f445bd 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
@@ -85,7 +85,7 @@ FILES:${PN}-client = "${sbindir}/*statd \
 		      ${sysconfdir}/nfs-utils.conf \
 		      ${sysconfdir}/nfsmount.conf \
 		      ${sysconfdir}/init.d/nfscommon \
-		      ${systemd_unitdir}/system/nfs-statd.service"
+		      ${systemd_system_unitdir}/nfs-statd.service"
 RDEPENDS:${PN}-client = "${PN}-mount rpcbind"

 FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
@@ -119,18 +119,18 @@ do_install:append () {
 	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
 	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}

-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
-		${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
-		install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
-		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
+		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
+		install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
+		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
 	fi

 	# kernel code as of 3.8 hard-codes this path as a default
diff --git a/meta/recipes-connectivity/ofono/ofono_1.32.bb b/meta/recipes-connectivity/ofono/ofono_1.32.bb
index c3db52d944..61424c7469 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.32.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.32.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/,--with-systemdunitdir="
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"

 EXTRA_OECONF += "--enable-test --enable-external-ell"
diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
index c4a08f71d6..8eb366b5cb 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
@@ -126,15 +126,15 @@ do_install:append () {
 	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly

-	install -d ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
 		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
-		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}/*.service

 	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
 		${D}${sysconfdir}/init.d/sshd
@@ -152,7 +152,7 @@ ALLOW_EMPTY:${PN} = "1"
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES:${PN}-scp = "${bindir}/scp.${BPN}"
 FILES:${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
-FILES:${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
+FILES:${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
 FILES:${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES:${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
 FILES:${PN}-sftp = "${bindir}/sftp"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 6e5cfc8f91..344f8bc3b4 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -60,10 +60,10 @@ do_install:append () {
 	install -m 0755 ${WORKDIR}/pap ${D}${sysconfdir}/chatscripts
 	install -m 0755 ${WORKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
 	install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/ppp@.service
+	       ${D}${systemd_system_unitdir}/ppp@.service
 	rm -rf ${D}/${mandir}/man8/man8
 	chmod u+s ${D}${sbindir}/pppd
 }
@@ -74,7 +74,7 @@ do_install:append:libc-musl () {

 CONFFILES:${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
-FILES:${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
+FILES:${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_system_unitdir}/ppp@.service"
 FILES:${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
 FILES:${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/*pppoe.so"
 FILES:${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 309bb4aea5..33b1495bb2 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -100,8 +100,8 @@ do_install () {
 	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services

 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -d ${D}/${systemd_unitdir}/system
-		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
+		install -d ${D}/${systemd_system_unitdir}
+		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_system_unitdir}
 	fi

 	install -d ${D}/etc/default/volatiles
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d85e2a3d7a..808c3dc700 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -24,7 +24,7 @@ EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"

 FILES:${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES:${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
+FILES:${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_system_unitdir}/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES:${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES:${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES:${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
@@ -317,17 +317,17 @@ do_install () {

 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
-			install -d ${D}${systemd_unitdir}/system
+			install -d ${D}${systemd_system_unitdir}
 			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-			> ${D}${systemd_unitdir}/system/busybox-klogd.service
+			> ${D}${systemd_system_unitdir}/busybox-klogd.service
 		fi

 		if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
-			install -d ${D}${systemd_unitdir}/system
+			install -d ${D}${systemd_system_unitdir}
 			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-			> ${D}${systemd_unitdir}/system/busybox-syslog.service
-			if  [ ! -e ${D}${systemd_unitdir}/system/busybox-klogd.service ] ; then
-				sed -i '/klog/d' ${D}${systemd_unitdir}/system/busybox-syslog.service
+			> ${D}${systemd_system_unitdir}/busybox-syslog.service
+			if  [ ! -e ${D}${systemd_system_unitdir}/busybox-klogd.service ] ; then
+				sed -i '/klog/d' ${D}${systemd_system_unitdir}/busybox-syslog.service
 			fi
 			if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
 				install -d ${D}${sysconfdir}/default
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index f2a490c473..78f9f9adbd 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -97,14 +97,14 @@ do_install() {
 	fi

 	# deal with systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
-		${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdir}/*.service
 }

 inherit update-alternatives
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index e25561d9b9..601dedb9fa 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -42,7 +42,7 @@ FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
 FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
-FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
+FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
 FILES:${PN}-mtrace = "${bindir}/mtrace"
 FILES:tzcode = "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
@@ -107,8 +107,8 @@ do_install() {
 	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
 	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}/nscd.conf

-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_system_unitdir}/

 	# The dynamic loader will have been installed into
 	# ${base_libdir}. However, if that isn't going to end up being
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index e9789c4ce0..1be7ece79d 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -109,9 +109,9 @@ do_install:append() {
 	fi

 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 644 ${WORKDIR}/psplash-start.service ${D}/${systemd_unitdir}/system
-		install -m 644 ${WORKDIR}/psplash-systemd.service ${D}/${systemd_unitdir}/system
+		install -d ${D}${systemd_system_unitdir}
+		install -m 644 ${WORKDIR}/psplash-start.service ${D}/${systemd_system_unitdir}
+		install -m 644 ${WORKDIR}/psplash-systemd.service ${D}/${systemd_system_unitdir}
 	fi

 	install -d ${D}${bindir}
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index f7505f1eb8..55ebf99117 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -38,7 +38,7 @@ pkg_postinst:${PN} () {
 	fi

 	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system/$i.service -o -e $D${systemd_unitdir}/system/$i.service ] ; then
+		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system/$i.service -o -e $D${systemd_system_unitdir}/$i.service ] ; then
 			echo -n "$i: "
 			systemctl $OPTS mask $i.service
 		fi
diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 61ce7939d3..53af7c616a 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 do_install() {
 	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_system_unitdir}.conf.d/00-${PN}.conf

         if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true', 'false', d)}; then
 		install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
@@ -30,7 +30,7 @@ do_install() {

 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install:append:qemuall() {
-	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
+	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_system_unitdir}.conf.d/01-${PN}.conf
 }

 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -38,6 +38,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILES:${PN} = "\
     ${systemd_unitdir}/journald.conf.d/ \
     ${systemd_unitdir}/logind.conf.d/ \
-    ${systemd_unitdir}/system.conf.d/ \
+    ${systemd_system_unitdir}.conf.d/ \
     ${systemd_unitdir}/network/ \
 "
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 92d35ebcf7..7ca951cdbd 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -19,11 +19,11 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
-		install -d ${D}${systemd_unitdir}/system/
+		install -d ${D}${systemd_system_unitdir}/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_unitdir}/system/serial-getty@.service
-		sed -i -e "s/\@TERM\@/${SERIAL_TERM}/g" ${D}${systemd_unitdir}/system/serial-getty@.service
+		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/
+		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_system_unitdir}/serial-getty@.service
+		sed -i -e "s/\@TERM\@/${SERIAL_TERM}/g" ${D}${systemd_system_unitdir}/serial-getty@.service

 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
@@ -31,14 +31,14 @@ do_install() {
 			ttydev=`echo $entry | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
 			if [ "$baudrate" = "$default_baudrate" ] ; then
 				# enable the service
-				ln -sf ${systemd_unitdir}/system/serial-getty@.service \
+				ln -sf ${systemd_system_unitdir}/serial-getty@.service \
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttydev.service
 			else
 				# install custom service file for the non-default baudrate
-				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
-				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
+				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
+				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
 				# enable the service
-				ln -sf ${systemd_unitdir}/system/serial-getty$baudrate@.service \
+				ln -sf ${systemd_system_unitdir}/serial-getty$baudrate@.service \
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baudrate@$ttydev.service
 			fi
 		done
@@ -46,7 +46,7 @@ do_install() {
 }

 # This is a machine specific file
-FILES:${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
+FILES:${PN} = "${systemd_system_unitdir}/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"

 ALLOW_EMPTY:${PN} = "1"
diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
index a6759c7a35..ab55b6fabc 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -239,7 +239,7 @@ do_install() {
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
-		rm ${D}${systemd_unitdir}/system/serial-getty* -f
+		rm ${D}${systemd_system_unitdir}/serial-getty* -f
 	fi

 	# Provide support for initramfs
@@ -258,7 +258,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
-		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_system_unitdir}d-sysv-install
 	fi

 	chown root:systemd-journal ${D}/${localstatedir}/log/journal
@@ -269,19 +269,19 @@ do_install() {
 	# journal-remote creates this at start
 	rm -rf ${D}/${localstatedir}/log/journal/remote

-	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
-	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
-	install -d ${D}${systemd_unitdir}/system/poweroff.target.wants
-	install -d ${D}${systemd_unitdir}/system/reboot.target.wants
-	install -d ${D}${systemd_unitdir}/system/rescue.target.wants
+	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
+	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
+	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
+	install -d ${D}${systemd_system_unitdir}/reboot.target.wants
+	install -d ${D}${systemd_system_unitdir}/rescue.target.wants

 	# Create symlinks for systemd-update-utmp-runlevel.service
 	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)}; then
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/graphical.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/multi-user.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/poweroff.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/reboot.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/graphical.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/multi-user.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/poweroff.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/reboot.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/rescue.target.wants/systemd-update-utmp-runlevel.service
 	fi

 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
@@ -314,8 +314,8 @@ do_install() {
 	# If polkit is not available and a fallback was requested, install a drop-in that allows networkd to
 	# request hostname changes via DBUS without elevating its privileges
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'true', 'false', d)}; then
-		install -d ${D}${systemd_unitdir}/system/systemd-hostnamed.service.d/
-		install -m 0644 ${WORKDIR}/00-hostnamed-network-user.conf ${D}${systemd_unitdir}/system/systemd-hostnamed.service.d/
+		install -d ${D}${systemd_system_unitdir}/systemd-hostnamed.service.d/
+		install -m 0644 ${WORKDIR}/00-hostnamed-network-user.conf ${D}${systemd_system_unitdir}/systemd-hostnamed.service.d/
 		install -d ${D}${datadir}/dbus-1/system.d/
 		install -m 0644 ${WORKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/dbus-1/system.d/
 	fi
@@ -329,7 +329,7 @@ do_install() {

 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
-	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
+	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_system_unitdir}-preset/99-default.preset

 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
@@ -404,8 +404,8 @@ RDEPENDS:${PN}-initramfs = "${PN}"
 FILES:${PN}-gui = "${bindir}/systemadm"

 FILES:${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+                              ${systemd_system_unitdir}/systemd-vconsole-setup.service \
+                              ${systemd_system_unitdir}/sysinit.target.wants/systemd-vconsole-setup.service"

 RDEPENDS:${PN}-kernel-install += "bash"
 FILES:${PN}-kernel-install = "${bindir}/kernel-install \
@@ -420,8 +420,8 @@ FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${exec_prefix}/lib/binfmt.d \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
-                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
-                      ${systemd_unitdir}/system/systemd-binfmt.service"
+                      ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_system_unitdir}/systemd-binfmt.service"
 RRECOMMENDS:${PN}-binfmt = "kernel-module-binfmt-misc"

 RRECOMMENDS:${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
@@ -510,31 +510,31 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-sysext \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
-                        ${systemd_unitdir}/system/systemd-ask-password-console.path \
-                        ${systemd_unitdir}/system/systemd-ask-password-console.service \
-                        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
-                        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
-                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
-                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-wall.path \
-                        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-console.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-console.service \
+                        ${systemd_system_unitdir}/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-wall.service \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
-                        ${systemd_unitdir}/system/systemd-bus-proxyd.service \
-                        ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
+                        ${systemd_system_unitdir}/systemd-bus-proxyd.service \
+                        ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
                         ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
-                        ${systemd_unitdir}/system/systemd-hibernate.service \
-                        ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
-                        ${systemd_unitdir}/system/systemd-suspend.service \
-                        ${systemd_unitdir}/system/sleep.target \
+                        ${systemd_system_unitdir}/systemd-hibernate.service \
+                        ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
+                        ${systemd_system_unitdir}/systemd-suspend.service \
+                        ${systemd_system_unitdir}/sleep.target \
                         ${rootlibexecdir}/systemd/systemd-initctl \
-                        ${systemd_unitdir}/system/systemd-initctl.service \
-                        ${systemd_unitdir}/system/systemd-initctl.socket \
-                        ${systemd_unitdir}/system/sockets.target.wants/systemd-initctl.socket \
+                        ${systemd_system_unitdir}/systemd-initctl.service \
+                        ${systemd_system_unitdir}/systemd-initctl.socket \
+                        ${systemd_system_unitdir}/sockets.target.wants/systemd-initctl.socket \
                         ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
@@ -691,14 +691,14 @@ FILES:udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/README \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
-               ${systemd_unitdir}/system/*udev* \
-               ${systemd_unitdir}/system/*.wants/*udev* \
+               ${systemd_system_unitdir}/*udev* \
+               ${systemd_system_unitdir}/*.wants/*udev* \
                ${base_bindir}/systemd-hwdb \
                ${base_bindir}/udevadm \
                ${base_sbindir}/udevadm \
                ${libexecdir}/${MLPREFIX}udevadm \
                ${datadir}/bash-completion/completions/udevadm \
-               ${systemd_unitdir}/system/systemd-hwdb-update.service \
+               ${systemd_system_unitdir}/systemd-hwdb-update.service \
               "

 FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index b693c24c4c..d5c5538cd7 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -35,7 +35,7 @@ def volatile_systemd_services(d):

 SYSTEMD_SERVICE:${PN} = "${@volatile_systemd_services(d)}"

-FILES:${PN} += "${systemd_unitdir}/system/*.service ${servicedir}"
+FILES:${PN} += "${systemd_system_unitdir}/*.service ${servicedir}"

 do_compile () {
     while read spec mountpoint; do
@@ -67,9 +67,9 @@ do_install () {
     install -d ${D}${servicedir}
     install -m 0755 mount-copybind ${D}${base_sbindir}/

-    install -d ${D}${systemd_unitdir}/system
+    install -d ${D}${systemd_system_unitdir}
     for service in ${SYSTEMD_SERVICE:${PN}}; do
-        install -m 0644 $service ${D}${systemd_unitdir}/system/
+        install -m 0644 $service ${D}${systemd_system_unitdir}/
     done

     # Suppress attempts to process some tmpfiles that are not temporary.
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index b1d359ec38..974faa3b3f 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -129,7 +129,7 @@ do_install () {
     export DESTDIR="${D}"
     export LIBDIR="${base_libdir}"
     export PKGLIBDIR="${base_libdir}/bootchart"
-    export SYSTEMD_UNIT_DIR="${systemd_unitdir}/system"
+    export SYSTEMD_UNIT_DIR="${systemd_system_unitdir}"

     oe_runmake install
     install -d ${D}${sysconfdir}/init.d
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index d4fc0356e6..7adf8a8ff6 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -52,9 +52,9 @@ do_install() {
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
+    install -d ${D}${systemd_system_unitdir}/
+    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/distcc.service
 }

 FILES:${PN}-server = "${sysconfdir} \
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index deddf11f4f..db353d607b 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -33,13 +33,13 @@ do_install() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/run-postinsts.init ${D}${sysconfdir}/init.d/run-postinsts

-	install -d ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_system_unitdir}/

 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
                -e 's:#BASE_BINDIR#:${base_bindir}:g' \
                -e 's:#LOCALSTATEDIR#:${localstatedir}:g' \
                ${D}${sbindir}/run-postinsts \
-               ${D}${systemd_unitdir}/system/run-postinsts.service
+               ${D}${systemd_system_unitdir}/run-postinsts.service
 }
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index fd6f17b656..30dbbcc05c 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -38,7 +38,7 @@ do_configure:prepend() {
     rm -f ${S}/m4/intltool.m4
 }

-FILES:${PN} += "${systemd_unitdir}/systemd-bootchart"
+FILES:${PN} += "${systemd_system_unitdir}d-bootchart"

 EXTRA_OECONF = " --with-rootprefix=${root_prefix} \
                  --with-rootlibdir=${base_libdir}"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index c186db6814..4ff309dd80 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -56,8 +56,8 @@ do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/tcf-agent.service
 }

diff --git a/meta/recipes-extended/at/at_3.2.2.bb b/meta/recipes-extended/at/at_3.2.2.bb
index efe569479b..14b9dace2a 100644
--- a/meta/recipes-extended/at/at_3.2.2.bb
+++ b/meta/recipes-extended/at/at_3.2.2.bb
@@ -65,9 +65,9 @@ do_install () {
 	install -m 0755    ${WORKDIR}/atd.init		${D}${sysconfdir}/init.d/atd

 	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/atd.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/atd.service

 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
diff --git a/meta/recipes-extended/cronie/cronie_1.5.7.bb b/meta/recipes-extended/cronie/cronie_1.5.7.bb
index 2cbae591b0..72a45089fd 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.7.bb
@@ -50,11 +50,11 @@ do_install:append () {
 	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond

 	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/crond.service
+	       ${D}${systemd_system_unitdir}/crond.service

 	# below are necessary for a complete cron environment
 	install -d ${D}${localstatedir}/spool/cron
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index 2e8d9032e4..f5a6cb6a4a 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
 PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
-PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_unitdir}/system,,systemd"
+PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
 PACKAGECONFIG[tftpd] = "-DBUILD_TFTPD=true, -DBUILD_TFTPD=false,"
 PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
@@ -62,7 +62,7 @@ FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
 FILES:${PN}-tftpd = "${base_bindir}/tftpd ${sysconfdir}/xinetd.d/tftp"
-FILES:${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_unitdir}/system/rarpd@.service"
+FILES:${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_system_unitdir}/rarpd@.service"
 FILES:${PN}-rdisc = "${base_sbindir}/rdisc"
 FILES:${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index f74016f834..8cb3a9a18c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -58,12 +58,12 @@ do_install:append() {
 	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}/lighttpd
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html

-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${S}/doc/systemd/lighttpd.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${S}/doc/systemd/lighttpd.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@BASE_BINDIR@,${base_bindir},g' \
-		${D}${systemd_unitdir}/system/lighttpd.service
+		${D}${systemd_system_unitdir}/lighttpd.service
 	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
 	ln -sf ${localstatedir}/log ${D}/www/logs
 	ln -sf ${localstatedir}/tmp ${D}/www/var
diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
index b068af95d8..f97974abb8 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -23,7 +23,7 @@ USE_NLS:libc-musl = "no"

 inherit gettext pkgconfig autotools systemd

-EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
+EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"

 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 062797afe6..35535aef86 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -44,7 +44,7 @@ CFLAGS:append:powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS:append:mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS:append:mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'

-EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_unitdir}/system \
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
                 BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev"'

 DEBUG_OPTIMIZATION:append = " -Wno-error"
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index e58214d55a..344faa37a4 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -35,7 +35,7 @@ USERADD_PARAM:${PN} = "--system --no-create-home --home-dir / \
                        --shell /bin/false --user-group rpc"

 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/, \
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/, \
                           --without-systemdsystemunitdir, \
                           systemd \
 "
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 14c6f07784..8345c1e3d1 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -51,9 +51,9 @@ do_install() {
 		# Unless both cron and systemd are enabled, install our own
 		# systemd unit file. Otherwise the package will install one.
 	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron systemd', 'false', 'true', d)}; then
-			install -d ${D}${systemd_unitdir}/system
-			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+			install -d ${D}${systemd_system_unitdir}
+			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_system_unitdir}
+			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_system_unitdir}/sysstat.service
 	        fi
 	fi
 }
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index e6ef5cf8b9..82ef2a585b 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -41,11 +41,11 @@ do_install:append() {
        install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"

        # Install systemd unit files
-       install -d ${D}${systemd_unitdir}/system
-       install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
+       install -d ${D}${systemd_system_unitdir}
+       install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_system_unitdir}
        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
               -e 's,@SBINDIR@,${sbindir},g' \
-              ${D}${systemd_unitdir}/system/xinetd.service
+              ${D}${systemd_system_unitdir}/xinetd.service
 }

 RDEPENDS:${PN} += "perl"
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index fecf926fb3..e02da0c358 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -44,7 +44,7 @@ do_install() {
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
-		${D}${systemd_unitdir}/system/weston.service
+		${D}${systemd_system_unitdir}/weston.service
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 3f20ad4fc7..573ab7b93d 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -52,9 +52,9 @@ do_install() {
     sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/default/xserver-nodm

     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/xserver-nodm.service.in ${D}${systemd_unitdir}/system/xserver-nodm.service
-        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_unitdir}/system/xserver-nodm.service
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/xserver-nodm.service.in ${D}${systemd_system_unitdir}/xserver-nodm.service
+        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_system_unitdir}/xserver-nodm.service
     fi

     if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
index d12ad4e6fe..95ff5e6ef8 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
@@ -54,8 +54,8 @@ do_install:append () {

         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
                 install -D -m 0755 ${WORKDIR}/kdump ${D}${libexecdir}/kdump-helper
-                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_unitdir}/system/kdump.service
-                sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_unitdir}/system/kdump.service
+                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_system_unitdir}/kdump.service
+                sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_system_unitdir}/kdump.service
         fi
 }

@@ -69,7 +69,7 @@ FILES:kdump = "${sbindir}/kdump \
                ${sysconfdir}/sysconfig/kdump.conf \
                ${sysconfdir}/init.d/kdump \
                ${libexecdir}/kdump-helper \
-               ${systemd_unitdir}/system/kdump.service \
+               ${systemd_system_unitdir}/kdump.service \
 "

 FILES:vmcore-dmesg = "${sbindir}/vmcore-dmesg"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
index dc2e1f3248..ba26c15cdd 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
@@ -64,8 +64,8 @@ PRIVATE_LIBS:${PN}-ptest = "libfoo.so"

 do_install:append () {
     # install systemd unit file
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/lttng-sessiond.service ${D}${systemd_unitdir}/system
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/lttng-sessiond.service ${D}${systemd_system_unitdir}
 }

 do_install_ptest () {
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 8161a448c8..8f0de5f0f0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -35,7 +35,7 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'distutils3-base
 PACKAGES =+ "${PN}-exporter"
 FILES:${PN}-exporter = "${sysconfdir}/stap-exporter/* \
                         ${sysconfdir}/sysconfig/stap-exporter \
-                        ${systemd_unitdir}/system/stap-exporter.service \
+                        ${systemd_system_unitdir}/stap-exporter.service \
                         ${sbindir}/stap-exporter"
 RDEPENDS:${PN}-exporter = "${PN} python3-core python3-netclient"
 SYSTEMD_SERVICE:${PN}-exporter = "stap-exporter.service"
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 3d28ba2a24..95ce97ef34 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd polkit', d

 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="

 FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
