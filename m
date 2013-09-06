Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id D51556BEBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:44:17 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so1947658wes.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 07:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WqcOsgkweycMmFobRR3cLhVE8BObLNFjovANguyJ9lA=;
	b=Iv/sbNPNaOjLaDMTpZulhfddHND2vrdhL8f8YEJJeU4i/HeFbgJHaktbHY+1A10aFX
	kruVJPyEIDi3aYAb8lY1VgBgUL6zyvybDDm1Y55IwB6rxr7KqW1FW0Xj9kUlf9jmTVj5
	VsyllOeVcUkP9YaRH/KyMSoPApEIeMEYjyazOqVwyIFkvHVCxZRDP4L1jU3ia7Q5BktP
	HKLIiFuQX0SkTOFZc937A46Gn1SVj38PH96MpPlPLXl3hLu3jNsjMZMQMu7RB1ki7Cib
	r3rUvIijAGziAMRp1DehfIuCuosDs3Yjo3KRSDQnXCVWWLLWwFGc2MfSeetxyYuiGiB8
	qkpg==
X-Gm-Message-State: ALoCoQnpx6ziYT+IPhKPFhZfJeSY8bRI5m8sEZuizPN09DZRch5lwz5L+LM42jRqcBKlaIvquJFO
X-Received: by 10.194.235.138 with SMTP id um10mr2467360wjc.30.1378478658390; 
	Fri, 06 Sep 2013 07:44:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mb7sm4495788wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 07:44:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 15:44:14 +0100
Message-Id: <1378478654-1970-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Fri, 06 Sep 2013 14:44:18 -0000

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
 .../systemd/systemd/binfmt-install.patch           |   51 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |   17 +++++--
 2 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/binfmt-install.patch

diff --git a/meta/recipes-core/systemd/systemd/binfmt-install.patch b/meta/recipes-core/systemd/systemd/binfmt-install.patch
new file mode 100644
index 0000000..891c712
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/binfmt-install.patch
@@ -0,0 +1,51 @@
+Don't install dependency links at install time for the binfmt services, use
+[Install] blocks so that they get created when the service is enabled.
+
+Upstream-Status: Inappropriate(Makefile.am) / Submitted(units/)
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


