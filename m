Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2FA614F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:12:45 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t61so4103091wes.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+wCN7npFW7r3ZBJ2QCYUJ1tDXBG4kexcpLKpdoVuERQ=;
	b=MIyrW2Ta5VJoTvNoT8y8dEU0vXX1warDI7xIqDMp1jREIYc8MwDLpsY2EmF2HEZN7J
	MyFUi3ooFJMIk4CLkAyJDQQtg2W0igXrtZofgwoUHHyzg/QYWgeVL5f9RQ0X7TuFvo9C
	KCG+5MC5Bagv7Ius8ZI2rop/ezghIFBkDhJuyBdXWmteB1zLWI0HlEPYu1bIa0tul6Al
	kxlMKaVqxoK1l532kwmrVdXqXxDGn7pgaD2bbvqHo4jm8/MXn2i3whEUP7X+kv97Jnh6
	a9Wxw9fQmZJxaVCWYHsjj3M/EZzjsmEEJC9ZAS9ApxJ1dh/4+IdTEzwvMGt/JNsEdFp0
	wq+w==
X-Gm-Message-State: ALoCoQlIOKJEVREYQqGaAZjAjtQBvNSmA6iQkQLe4wS9j2MFGNxaO8jxZvEs1XmcHQN/KnaZUrEk
X-Received: by 10.180.208.97 with SMTP id md1mr8229069wic.41.1378728766937;
	Mon, 09 Sep 2013 05:12:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm17272098wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 05:12:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 13:12:42 +0100
Message-Id: <1378728762-11206-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: split out systemd-binfmt as a separate package
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
X-List-Received-Date: Mon, 09 Sep 2013 12:12:47 -0000

If binfmt_misc was compiled as a module but isn't installed then systemd-binfmt
will put an automounter on /proc/sys/fs/binfmt_misc and when it attempts to
automount (e.g. when df is called) it can't find support for the filesystem, and
throws an error.

As binfmt_misc isn't commonly used, split this helper into it's own package, add
a dependency on kernel-module-binfmt-misc, and ensure the service gets started
when it's installed.

[ YOCTO #4863 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/binfmt-install.patch           |   56 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |   17 ++++--
 2 files changed, 69 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/binfmt-install.patch

diff --git a/meta/recipes-core/systemd/systemd/binfmt-install.patch b/meta/recipes-core/systemd/systemd/binfmt-install.patch
new file mode 100644
index 0000000..c2d5099
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/binfmt-install.patch
@@ -0,0 +1,56 @@
+Don't install dependency links at install time for the binfmt services, use
+[Install] blocks so that they get created when the service is enabled like a
+traditional service.
+
+The [Install] blocks were rejected upstream as they don't have a way to "enable"
+it on install without static symlinks which can't be disabled, only masked.  We
+however can do that in a postinst.
+
+Upstream-Status: Denied
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 7933de6..78acb6f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3133,10 +3133,6 @@ INSTALL_DIRS += \
+ 	$(prefix)/lib/binfmt.d \
+ 	$(sysconfdir)/binfmt.d
+ 
+-SYSINIT_TARGET_WANTS += \
+-	systemd-binfmt.service \
+-	proc-sys-fs-binfmt_misc.automount
+-
+ endif
+ 
+ EXTRA_DIST += \
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 6be3893..709adef 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
+@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
+ 
+ [Automount]
+ Where=/proc/sys/fs/binfmt_misc
++
++[Install]
++WantedBy=sysinit.target
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index 02dfe77..86d3481 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -11,6 +11,7 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
+ Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
+ DefaultDependencies=no
+ Conflicts=shutdown.target
++Wants=proc-sys-fs-binfmt_misc.automount
+ After=systemd-readahead-collect.service systemd-readahead-replay.service proc-sys-fs-binfmt_misc.automount
+ Before=sysinit.target shutdown.target
+ ConditionPathIsReadWrite=/proc/sys/
+@@ -24,3 +25,6 @@ ConditionDirectoryNotEmpty=|/run/binfmt.d
+ Type=oneshot
+ RemainAfterExit=yes
+ ExecStart=@rootlibexecdir@/systemd-binfmt
++
++[Install]
++WantedBy=sysinit.target
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 75bdc61..f31787d 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -15,11 +15,12 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-use-CAP_MKNOD-ConditionCapability.patch \
            file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
+           file://binfmt-install.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
@@ -119,7 +120,10 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros ${PN}-binfmt"
+
+SYSTEMD_PACKAGES = "${PN}-binfmt"
+SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -142,6 +146,13 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
 FILES_${PN}-rpm-macros = "${libdir}/rpm \
                          "
 
+FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
+                      ${exec_prefix}/lib/binfmt.d \
+                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_unitdir}/system/systemd-binfmt.service"
+RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
+
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
@@ -156,7 +167,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
                 ${sysconfdir}/bash_completion.d/ \
-                ${sysconfdir}/binfmt.d/ \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
@@ -178,7 +188,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${bindir}/kernel-install \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
-                ${exec_prefix}/lib/binfmt.d \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
                 ${localstatedir} \
-- 
1.7.10.4


