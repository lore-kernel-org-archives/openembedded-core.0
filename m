Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186E9CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1224.1762529258567940184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62FF61516
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3AA23F694
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] target-sdk-provides-dummy: provide packagegroup-core-boot
Date: Fri,  7 Nov 2025 15:27:29 +0000
Message-ID: <20251107152730.1774081-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107152730.1774081-1-ross.burton@arm.com>
References: <20251107152730.1774081-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226058

Add packagegroup-core-boot to the provides of the dummy package that is
installed into the target sysroot of SDKs, because packages that are
part of the core boot process are not needed in SDKs.

Specifically, this means we don't install the init system into the
target sysroot:

Changes to sdk/poky-glibc-x86_64-core-image-base-cortexa57-qemuarm64/core=
-image-base/target (installed-package-names.txt):
  busybox-dbg was removed
  busybox-syslog was removed
  e2fsprogs-dbg was removed
  e2fsprogs-dev was removed
  e2fsprogs-doc was removed
  e2fsprogs-e2fsck was removed
  e2fsprogs-src was removed
  kbd was removed
  kbd-consolefonts was removed
  kbd-dbg was removed
  kbd-dev was removed
  kbd-doc was removed
  kbd-keymaps was removed
  kbd-keymaps-pine was removed
  kbd-src was removed
  kernel-module-sch-fq-codel-6.16.11-yocto-standard was removed
  libcom-err2 was removed
  libe2p2 was removed
  libext2fs2 was removed
  libnss-myhostname2 was removed
  libnss-resolve2 was removed
  libnss-systemd2 was removed
  libseccomp was removed
  libseccomp-dbg was removed
  libseccomp-dev was removed
  libseccomp-doc was removed
  libseccomp-src was removed
  libss2 was removed
  libsystemd-shared was removed
  netbase was removed
  netbase-dbg was removed
  netbase-dev was removed
  os-release was removed
  os-release-dbg was removed
  os-release-dev was removed
  packagegroup-core-boot was removed
  packagegroup-core-boot-dbg was removed
  packagegroup-core-boot-dev was removed
  pam-plugin-namespace was removed
  pam-plugin-umask was removed
  shared-mime-info-data was removed
  systemd was removed
  systemd-conf was removed
  systemd-conf-dbg was removed
  systemd-conf-dev was removed
  systemd-extra-utils was removed
  systemd-mime was removed
  systemd-networkd was removed
  systemd-serialgetty was removed
  systemd-serialgetty-dbg was removed
  systemd-serialgetty-dev was removed
  systemd-udev-rules was removed
  systemd-vconsole-setup was removed
  tar was removed
  tar-dbg was removed
  tar-dev was removed
  tar-doc was removed
  tar-src was removed
  udev was removed
  udev-hwdb was removed
  util-linux-agetty was removed
  util-linux-fsck was removed
  util-linux-mkswap was removed
  util-linux-mount was removed
  util-linux-swapoff was removed
  util-linux-swapon was removed
  util-linux-swaponoff was removed
  util-linux-umount was removed
  volatile-binds was removed
  volatile-binds-dbg was removed
  volatile-binds-dev was removed

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/r=
ecipes-core/meta/target-sdk-provides-dummy.bb
index 849407cca57..e90bd2ab9e9 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -1,6 +1,7 @@
 DUMMYARCH =3D "sdk-provides-dummy-target"
=20
 DUMMYPROVIDES_PACKAGES =3D "\
+    packagegroup-core-boot \
     busybox \
     busybox-dev \
     busybox-src \
--=20
2.43.0


