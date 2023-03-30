Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1126FC761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:42:22 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.25608.1680183739669288497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eSCzEnJ9;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r11so76668185edd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680183738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCzVLHLWCbzyI5TVPHPbaIKMwMIZi6TPhQAlJq6v/FU=;
        b=eSCzEnJ9Xg87DZ03zNradaVuncz0sKqDWbHwSYcdJw69znpbk7PLa/s9/BXzz7E9LR
         LWi4R8r1rS7J3u+wdLJ8s+gyzgCoJQr6Ce+GLdJ/d/y35n/BM3NpcD+lAf2bF4PonTIN
         ZZFnIY0Y/kUYnFcfO7x6veitDU03EtTEMFTxjD1ywv7iUh8WOQoA7O2LeFFYdYsBMwr3
         ses6QXTTP+P28C1GYsRMUxEHz4k9aTeYBmUfrUWQeEMArIvLC7JLu7KVB65xokdND3Ey
         JZATktG77utceTBdQuQqb0pDomK99aDt/tvk7IXR8jQbNILSz6KU823mM36g/gfAkD0w
         Yw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCzVLHLWCbzyI5TVPHPbaIKMwMIZi6TPhQAlJq6v/FU=;
        b=H4zi3sNg1T+A0fInmPWrkCwvRd7sfPYAjfKUiJlrz2ZOhmZS+JcYG03tDXNewUH+i9
         gNo0b0KTNDwHpWuzxDSJNRyI7bdT7p92/QvSAOULEXn6F8V5rlJHOykDsFZp7N7u1U0V
         jSHUFp1D/vvvE5gus2Xn0BDBQ7zKyQpFRoI41WiG2mlfhvUury1z4Q9vL5/JN3vlinBe
         1/KzwQtd4jzrd/uCK3IeSoyE74jkfHf48UGeYGqbYciMgFfX6ffq+zl718CzPGgIkUdw
         y5bGx3WYWNu5uIVIc8wNvAFb4XMJ5G2UUy9g/bM8CVxs+Bl2KbSj2t90VzqYHpXnuc+n
         OIRg==
X-Gm-Message-State: AAQBX9eZ1+5CJTh3mPl2cM4P3NibFN2HJdm5TQNVSBKz50GPBizmAT7w
	04pTpE+6YIeFNckujvi+DsIFlSLEJXc=
X-Google-Smtp-Source: AKy350ZqUCa6i88YFxa+M2H6JVZWJNbVdECMqOhI36rxwYvH1LkXUtJrA6/mD8dLqZHsyI1SU9pQ8w==
X-Received: by 2002:a17:906:81d5:b0:93d:ae74:fa9e with SMTP id e21-20020a17090681d500b0093dae74fa9emr22989798ejx.7.1680183737593;
        Thu, 30 Mar 2023 06:42:17 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906b19100b0093fa8c2e877sm6547256ejy.80.2023.03.30.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:42:17 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/2] systemd: Allow native build
Date: Thu, 30 Mar 2023 15:42:13 +0200
Message-Id: <20230330134214.2772913-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179321

systemd-native is a dependency for libgudev-native, which
in turn is a dependency for libfprint-native, which is needed
to build libfprint.

The native systemctl binary is removed so it doesn't conflict
with the script from systemd-systemctl-native.

TODO? The new natively built systemctl binary may replace
the script in systemd-systemctl-native, as it supports
more options and works better than the script. For example,
the current script does not create the symlinks in
/etc/systemd/system for WantedBy= and RequiredBy= settings
and does not support systemctl set-default some.target.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-core/systemd/systemd_253.1.bb | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index 9c2b96d3c1..c73b5e05b3 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -6,6 +6,8 @@ PE = "1"
 
 DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
 
+BBCLASSEXTEND = "native"
+
 SECTION = "base/shell"
 
 inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
@@ -60,7 +62,7 @@ PAM_PLUGINS = " \
     pam-plugin-namespace \
 "
 
-PACKAGECONFIG ??= " \
+PACKAGECONFIG:class-target ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -197,7 +199,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
-PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
+PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,${@'systemd-compat-units update-rc.d' if d.getVar('PN') == d.getVar('BPN') else ''}"
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -211,7 +213,7 @@ PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
 PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
-PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
+PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${BPN}-vconsole-setup"
 PACKAGECONFIG[wheel-group] = "-Dwheel-group=true, -Dwheel-group=false"
 PACKAGECONFIG[xdg-autostart] = "-Dxdg-autostart=true,-Dxdg-autostart=false"
 # Verify keymaps on locale change
@@ -364,6 +366,12 @@ do_install() {
     fi
 }
 
+do_install:append:class-native () {
+    rm -f ${D}${bindir}/systemctl
+	ln -sf ..${base_bindir_native}/udevadm ${D}${base_sbindir}/udevadm
+	ln -sf ..${systemd_unitdir#${rootprefix}}/systemd-udevd ${D}${base_sbindir}/udevd
+}
+
 python populate_packages:prepend (){
     systemdlibdir = d.getVar("rootlibdir")
     do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
@@ -670,10 +678,10 @@ FILES:${PN} = " ${base_bindir}/* \
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
-RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS:${PN} += "volatile-binds"
+RDEPENDS:${PN}:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
+RDEPENDS:${PN}:class-target += "volatile-binds"
 
-RRECOMMENDS:${PN} += "systemd-extra-utils \
+RRECOMMENDS:${PN}:class-target += "systemd-extra-utils \
                       udev-hwdb \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
-- 
2.39.2


