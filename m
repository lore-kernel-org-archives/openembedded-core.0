Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D63C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 16:50:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.50.1711126203985260871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 09:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92100FEC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 09:50:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 091403F67D
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 09:50:02 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/qemuboot: add depends on qemu-system-native and qemu-helper-native
Date: Fri, 22 Mar 2024 16:49:59 +0000
Message-Id: <20240322164959.3704691-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 16:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197447

From: Ross Burton <ross.burton@arm.com>

Any image that inherits qemuboot must also add image dependencies on
qemu-system-native and qemu-helper-native, otherwise the image won't
be able to be booted.

Currently this is done by conf/machine/include/qemu.inc, but not every
machine that uses qemuboot includes that file.

Move the EXTRA_IMAGEDEPENDS from qemu.inc into qemuboot.bbclass, so that
the dependencies don't have to be duplicated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/qemuboot.bbclass | 2 ++
 meta/conf/machine/include/qemu.inc   | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/q=
emuboot.bbclass
index 4a563b8cccd..895fd38d684 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -185,3 +185,5 @@ python do_write_qemuboot_conf() {
            os.remove(qemuboot_link)
         os.symlink(os.path.basename(qemuboot), qemuboot_link)
 }
+
+EXTRA_IMAGEDEPENDS +=3D "qemu-system-native qemu-helper-native:do_addto_=
recipe_sysroot"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
index 14feb867906..bb7aec76750 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -23,8 +23,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
=20
-EXTRA_IMAGEDEPENDS +=3D "qemu-system-native qemu-helper-native:do_addto_=
recipe_sysroot"
-
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES:append:pn-linux-yocto =3D " features/nfsd/nfsd-enable.sc=
c"
 KERNEL_FEATURES:append:pn-linux-yocto-rt =3D " features/nfsd/nfsd-enable=
.scc"
--=20
2.34.1


