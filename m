Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1USBV3-0003j5-5b
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 21:25:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3GJ7B8x028348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Apr 2013 21:07:12 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1USBDj-0008Ft-Hf; Tue, 16 Apr 2013 21:07:11 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 21:07:09 +0200
Message-Id: <1366139229-31703-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9325
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] Revert "systemd: move the binaries to /sbin/systemd"
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
X-List-Received-Date: Tue, 16 Apr 2013 19:25:15 -0000

This reverts commit d612ca261d12e89e96675c24d9d7456319179720.

This commit causes a lot of mess because keymaps and udev rules are
now located below /sbin/udev.  There are still a lot of places on oe
(and in systemd.bb itself) which refer to the classical /lib/udev
directory (--> 'git grep /lib/udev') and there is an unknown number of
packages whose upstream tarball places udev rules/keymaps in this
directory.

This commit tries to fix one script in one package but breaks systems
silently.  As the 1.4 release is near, possible enhancements of this
patch can not be tested in time anymore and it is better to revert it
completely.

Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-core/systemd/systemd/init   | 14 +++++-----
 meta/recipes-core/systemd/systemd_199.bb | 46 +++++++++++++++++++++-----------
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index 32a474d..0ddd043 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -15,7 +15,7 @@ export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
-[ -x @UDEVD@ ] || exit 1
+[ -x /lib/systemd/systemd-udevd ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
@@ -71,15 +71,15 @@ case "$1" in
 
     # trigger the sorted events
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-    @UDEVD@ -d
+    /lib/systemd/systemd-udevd -d
 
-    udevadm control --env=STARTUP=1
+    /usr/bin/udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
-            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
-            (udevadm settle --timeout=3; udevadm control --env=STARTUP=)&
+            /usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            (/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
     else
-            udevadm trigger --action=add
-            udevadm settle
+            /usr/bin/udevadm trigger --action=add
+            /usr/bin/udevadm settle
     fi
     ;;
   stop)
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 9f2a254..da6e57b 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -56,6 +56,8 @@ CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --enable-xz \
                  --disable-manpages \
@@ -79,9 +81,6 @@ do_configure_prepend() {
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
 }
 
-EXTRA_OEMAKE = "rootlibexecdir=${base_sbindir}/systemd \
-                udevlibexecdir=${base_sbindir}/udev"
-
 do_install() {
 	autotools_do_install
 	install -d ${D}/${base_sbindir}
@@ -89,8 +88,8 @@ do_install() {
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
 	# provide support for initramfs
-	ln -s ${base_sbindir}/systemd/systemd ${D}/init
-	ln -s ${base_sbindir}/systemd/systemd-udevd ${D}/${base_sbindir}/udev/udevd
+	ln -s ${systemd_unitdir}/systemd ${D}/init
+	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
@@ -108,7 +107,6 @@ do_install() {
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-		sed -i s%@UDEVD@%${base_sbindir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 }
 
@@ -146,9 +144,6 @@ CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/user.conf"
 
 FILES_${PN} = " ${base_bindir}/* \
-                ${base_sbindir}/systemd \
-                ${base_sbindir}/systemd/system-generators \
-                ${base_sbindir}/udev \
                 ${datadir}/bash-completion \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -182,13 +177,14 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
                 ${localstatedir} \
+                ${libexecdir} \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${base_sbindir}/systemd/.debug ${base_sbindir}/systemd/system-generators/.debug ${base_sbindir}/udev/.debug"
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus util-linux-mount"
@@ -199,17 +195,35 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev-hwdb udev udev-consolekit udev-utils"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
 
-FILES_udev-dbg += "${base_sbindir}/udev/.debug"
+FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
-               ${base_sbindir}/systemd/systemd-udevd \
-               ${base_sbindir}/udev \
+               ${base_libdir}/systemd/systemd-udevd \
+               /lib/udev/accelerometer \
+               /lib/udev/ata_id \
+               /lib/udev/cdrom_id \
+               /lib/udev/collect \
+               /lib/udev/findkeyboards \
+               /lib/udev/keyboard-force-release.sh \
+               /lib/udev/keymap \
+               /lib/udev/mtd_probe \
+               /lib/udev/scsi_id \
+               /lib/udev/v4l_id \
+               /lib/udev/keymaps \
+               /lib/udev/rules.d/4*.rules \
+               /lib/udev/rules.d/5*.rules \
+               /lib/udev/rules.d/6*.rules \
+               /lib/udev/rules.d/70-power-switch.rules \
+               /lib/udev/rules.d/75*.rules \
+               /lib/udev/rules.d/78*.rules \
+               /lib/udev/rules.d/8*.rules \
+               /lib/udev/rules.d/95*.rules \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
@@ -221,7 +235,7 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
 
-FILES_udev-hwdb = "${base_sbindir}/udev/hwdb.d"
+FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
 
 INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME_udev = "systemd-udevd"
@@ -238,7 +252,7 @@ python __anonymous() {
 
 ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff"
 
-ALTERNATIVE_TARGET[init] = "${base_sbindir}/systemd/systemd"
+ALTERNATIVE_TARGET[init] = "${systemd_unitdir}/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
 ALTERNATIVE_PRIORITY[init] ?= "300"
 
-- 
1.8.1.4



