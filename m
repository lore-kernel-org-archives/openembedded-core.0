Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90439C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 15:22:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27740.1683904929285209381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A32D75;
	Fri, 12 May 2023 08:22:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B5493F663;
	Fri, 12 May 2023 08:22:08 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][mickledore] machine/qemuarm*: don't explicitly set vmalloc
Date: Fri, 12 May 2023 16:22:05 +0100
Message-Id: <20230512152205.4049890-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 15:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181187

From: Ross Burton <ross.burton@arm.com>

In 5c6064 the qemuarm* machines gained vmalloc=3D256, because in testing
Bruce was seeing problems when the vmalloc area was too big for the
memory size of the machine (eg 256MB).

The intention was for the area to be very small, but 256 bytes is too
small and the kernel sets a minimal vmalloc area of 16MiB:

[    0.000000] vmalloc area is too small, limiting to 16MiB

However, a 16MiB area is too small and results in pages of messages when
you try and use the system:

[  242.822481] vmap allocation for size 4100096 failed: use vmalloc=3D<si=
ze> to increase size

There have been a number of changes since this commit, remove the
explicit vmalloc argument and use the default.  I've tested that the
system still boots locally.

[1] early_vmalloc(), https://elixir.bootlin.com/linux/latest/source/arch/=
arm/mm/mmu.c#L1170

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/qemuarm.conf   | 2 --
 meta/conf/machine/qemuarmv5.conf | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
index c5234231e2e..aa9ce882035 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,8 +17,6 @@ QB_SYSTEM_NAME =3D "qemu-system-arm"
 QB_MACHINE =3D "-machine virt,highmem=3Doff"
 QB_CPU =3D "-cpu cortex-a15"
 QB_SMP ?=3D "-smp 4"
-# Standard Serial console
-QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
 # For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
 QB_GRAPHICS =3D "-device virtio-gpu-pci"
 QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarm=
v5.conf
index 6e59e42c3ab..ef1b4ece230 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -12,7 +12,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;ttyAMA1"
 # For runqemu
 QB_SYSTEM_NAME =3D "qemu-system-arm"
 QB_MACHINE =3D "-machine versatilepb"
-QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
 QB_GRAPHICS =3D "-device virtio-gpu-pci"
 QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB =3D "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-y=
octo', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
--=20
2.34.1


