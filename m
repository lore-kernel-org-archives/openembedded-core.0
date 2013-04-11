Received: from mail-wg0-f50.google.com ([74.125.82.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQKft-0000jo-GD
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:48:39 +0200
Received: by mail-wg0-f50.google.com with SMTP id k13so1886152wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=xdzEMtdvpKBhIsHtJ0tmeICJIJieYr4pALxT+IbCGRw=;
	b=W/CSvgZpPbaM5EIgoQH2jkgisl3OjbqTfomJaUfQ48/iBimmlukAiHkkSaDc294Ifd
	Vt3IKI/a091Uo8rh/zSqv0bAzpWsdNAIouH5eIXPS0qUyehxqWNgtVbZzvLeScNUAMfj
	BnCKxdYS7b7y4zNa+iHGmneCh8nSr/inr4OBkJ9zl8tmjKfbYYhGG5/2CZeDqcvrVd8Z
	LqQrxdPkTPQEDlxC9puejHxs+T4EVRSz6oNk8fBAkme6UCi5Z+onsv3MkAxyRm4Mc6fk
	4vAcwxx2Px7j84fbbvnbbJR4PIwSVISkhGOtiqEPplcNSFdl7GAW2g1viAhRUbCcl8B/
	3gxw==
X-Received: by 10.194.104.168 with SMTP id gf8mr11978703wjb.58.1365697874497; 
	Thu, 11 Apr 2013 09:31:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm4179375wie.0.2013.04.11.09.31.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 09:31:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 17:28:25 +0100
Message-Id: <80826a2b32102b9e56f47d7d8be043ca462cf737.1365697555.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365697555.git.ross.burton@intel.com>
References: <cover.1365697555.git.ross.burton@intel.com>
In-Reply-To: <cover.1365697555.git.ross.burton@intel.com>
References: <cover.1365697555.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkJvDG0joUffvjhHwnIYrrcEPc78F1KHZpXrfFKPnL2wFeZ9lDY4QAeDaqSbal0WZwHUVqi
Subject: [PATCH 1/2] systemd: move the binaries to /sbin/systemd
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
X-List-Received-Date: Thu, 11 Apr 2013 16:48:39 -0000

As with udev, placing binaries in /lib breaks our current multilib
implementation.  Change the rootlibexecdir to /sbin/systemd so that binaries
don't move in multilib situations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd/init   |   14 ++++-----
 meta/recipes-core/systemd/systemd_199.bb |   46 +++++++++++-------------------
 2 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index 0ddd043..32a474d 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -15,7 +15,7 @@ export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
-[ -x /lib/systemd/systemd-udevd ] || exit 1
+[ -x @UDEVD@ ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
@@ -71,15 +71,15 @@ case "$1" in
 
     # trigger the sorted events
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-    /lib/systemd/systemd-udevd -d
+    @UDEVD@ -d
 
-    /usr/bin/udevadm control --env=STARTUP=1
+    udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
-            /usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
-            (/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
+            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            (udevadm settle --timeout=3; udevadm control --env=STARTUP=)&
     else
-            /usr/bin/udevadm trigger --action=add
-            /usr/bin/udevadm settle
+            udevadm trigger --action=add
+            udevadm settle
     fi
     ;;
   stop)
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 3ee1283..76c5973 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -57,8 +57,6 @@ CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
-                 --sbindir=${base_sbindir} \
-                 --libexecdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --enable-xz \
                  --disable-manpages \
@@ -82,6 +80,9 @@ do_configure_prepend() {
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
 }
 
+EXTRA_OEMAKE = "rootlibexecdir=${base_sbindir}/systemd \
+                udevlibexecdir=${base_sbindir}/udev"
+
 do_install() {
 	autotools_do_install
 	install -d ${D}/${base_sbindir}
@@ -89,8 +90,8 @@ do_install() {
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
 	# provide support for initramfs
-	ln -s ${systemd_unitdir}/systemd ${D}/init
-	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
+	ln -s ${base_sbindir}/systemd/systemd ${D}/init
+	ln -s ${base_sbindir}/systemd/systemd-udevd ${D}/${base_sbindir}/udev/udevd
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
@@ -108,6 +109,7 @@ do_install() {
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+		sed -i s%@UDEVD@%${base_sbindir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 }
 
@@ -145,6 +147,9 @@ CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/user.conf"
 
 FILES_${PN} = " ${base_bindir}/* \
+                ${base_sbindir}/systemd \
+                ${base_sbindir}/systemd/system-generators \
+                ${base_sbindir}/udev \
                 ${datadir}/bash-completion \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -178,14 +183,13 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
                 ${localstatedir} \
-                ${libexecdir} \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${base_sbindir}/systemd/.debug ${base_sbindir}/systemd/system-generators/.debug ${base_sbindir}/udev/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus"
@@ -196,35 +200,17 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
+PACKAGES =+ "udev-dbg udev-hwdb udev udev-consolekit udev-utils"
 
-FILES_udev-dbg += "/lib/udev/.debug"
+FILES_udev-dbg += "${base_sbindir}/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
-               ${base_libdir}/systemd/systemd-udevd \
-               /lib/udev/accelerometer \
-               /lib/udev/ata_id \
-               /lib/udev/cdrom_id \
-               /lib/udev/collect \
-               /lib/udev/findkeyboards \
-               /lib/udev/keyboard-force-release.sh \
-               /lib/udev/keymap \
-               /lib/udev/mtd_probe \
-               /lib/udev/scsi_id \
-               /lib/udev/v4l_id \
-               /lib/udev/keymaps \
-               /lib/udev/rules.d/4*.rules \
-               /lib/udev/rules.d/5*.rules \
-               /lib/udev/rules.d/6*.rules \
-               /lib/udev/rules.d/70-power-switch.rules \
-               /lib/udev/rules.d/75*.rules \
-               /lib/udev/rules.d/78*.rules \
-               /lib/udev/rules.d/8*.rules \
-               /lib/udev/rules.d/95*.rules \
+               ${base_sbindir}/systemd/systemd-udevd \
+               ${base_sbindir}/udev \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
@@ -236,7 +222,7 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
 
-FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
+FILES_udev-hwdb = "${base_sbindir}/udev/hwdb.d"
 
 INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME_udev = "systemd-udevd"
@@ -253,7 +239,7 @@ python __anonymous() {
 
 ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff"
 
-ALTERNATIVE_TARGET[init] = "${systemd_unitdir}/systemd"
+ALTERNATIVE_TARGET[init] = "${base_sbindir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
 ALTERNATIVE_PRIORITY[init] ?= "300"
 
-- 
1.7.10.4



