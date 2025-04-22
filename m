Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C437DC369D1
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 19:01:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48363.1745348460053082060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 12:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C989152B;
	Tue, 22 Apr 2025 12:00:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8BAF3F5A1;
	Tue, 22 Apr 2025 12:00:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	bill.mills@linaro.org
Subject: [PATCH RFC walnascar 1/3] systemd: enable getty generator by default
Date: Tue, 22 Apr 2025 20:00:51 +0100
Message-ID: <20250422190053.3244331-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 19:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215242

Until recently, even when the getty generator was disabled in the
systemd recipe it was actually still active.  This was because the old
behaviour was to delete the serial-getty template unit if the generator
was disabled, but the systemd-serialgetty package shipped then shipped
the same files so the generator continued to run.  This was a bug in the
original commit[1] so this behaviour has been present since 2016.

My recent fixes[2] changed this: if the getty generator was disabled
then the generator itself is deleted. This makes the actual behaviour
match the intention, but the consequence was to demonstrate that some
modern platforms were relying on this unexpected behaviour: specifically
the genericarm64 BSP which intends to support a number of virtual and
physical boards with a number of serial console ports that are not
really suitable to be hardcoded into SERIAL_CONSOLES:

- ttyS0
- ttyAMA0 (AMBA PL011 uart)
- ttyS2 (BeagleBone Play, S0 and S1 are internal)
- hvc0 (KVM)
- ttyPS1 (AMD KV260)
- And most likely more

Restore the existing behaviour by explicitly enabling the serial getty
generator: this means that systemd will automatically bring up a getty
on the first serial console it finds.

In the future we should extend some level of dynamic console-finding to
sysvinit-based systems by searching for a console device in inittab, but
for now this reverts the unintentional regression.

[1] oe-core 2a8d0df47c9 ("systemd: make systemd-serialgetty optional")
[2] oe-core 2beb3170af6 ("systemd: if getty generator is disabled remove
    the generator, not the units")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-co=
re/systemd/systemd_257.4.bb
index 64fb8fe69ac..f90308f0db0 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -92,6 +92,7 @@ PACKAGECONFIG ??=3D " \
     quotacheck \
     randomseed \
     resolved \
+    serial-getty-generator \
     set-time-epoch \
     sysusers \
     timedated \
--=20
2.43.0


