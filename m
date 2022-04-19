Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE084C43217
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1101.1650383144765119068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3300C13D5
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5C363F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemux86-64: disable legacy i8042 (AT keyboard,
 PS/2 mouse)
Date: Tue, 19 Apr 2022 16:45:41 +0100
Message-Id: <20220419154541.1219702-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419154541.1219702-1-ross.burton@arm.com>
References: <20220419154541.1219702-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164631

These devices are historical, modern Linux will just use the USB
devices, and occasionally the init of these devices fails:

  atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
  psmouse serio1: Failed to reset mouse on isa0060/serio1: -5

Explicitly add a USB keyboard to go with the USB tablet, and disable the
i8042 entirely.

[ YOCTO #14718 ]
[ YOCTO #14743 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/m=
achine/include/x86/qemuboot-x86.inc
index b7b6428e44c..3953679366d 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -1,14 +1,13 @@
 # For runqemu
 IMAGE_CLASSES +=3D "qemuboot"
 QB_SMP =3D "-smp 4"
-QB_CPU:x86 =3D "-cpu IvyBridge -machine q35"
-QB_CPU_KVM:x86 =3D "-cpu IvyBridge -machine q35"
+QB_CPU:x86 =3D "-cpu IvyBridge -machine q35,i8042=3Doff"
+QB_CPU_KVM:x86 =3D "-cpu IvyBridge -machine q35,i8042=3Doff"
=20
-QB_CPU:x86-64 =3D "-cpu IvyBridge -machine q35"
-QB_CPU_KVM:x86-64 =3D "-cpu IvyBridge -machine q35"
+QB_CPU:x86-64 =3D "-cpu IvyBridge -machine q35,i8042=3Doff"
+QB_CPU_KVM:x86-64 =3D "-cpu IvyBridge -machine q35,i8042=3Doff"
=20
 QB_AUDIO_DRV =3D "alsa"
 QB_AUDIO_OPT =3D "-device AC97"
 QB_KERNEL_CMDLINE_APPEND =3D "oprofile.timer=3D1 tsc=3Dreliable no_timer=
_check rcupdate.rcu_expedited=3D1"
-QB_OPT_APPEND =3D "-usb -device usb-tablet"
-
+QB_OPT_APPEND =3D "-usb -device usb-tablet -usb -device usb-kbd"
--=20
2.25.1


