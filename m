Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD2DC02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 17:59:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.697.1738259948997331500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 09:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41697497
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 09:59:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3234A3F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 09:59:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd: use getty generators by default
Date: Thu, 30 Jan 2025 17:59:01 +0000
Message-ID: <20250130175901.938043-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250130175901.938043-1-ross.burton@arm.com>
References: <20250130175901.938043-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 17:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210466

systemd can automatically create getty service units at boot time by
probing the hardware: if will check for a list of known hypervisor
consoles and also spawn a getty on every active console.

However in a historical attempt to change as little behaviour as
possible, we disabled this and instead wrote hard-coded units at build
time that respect the SERIAL_CONSOLES variable.

This variable may be acceptable for fixed known platforms, but is not
usable for generic machines. The genericarm64 machine for example lists
a number of potential consoles:

- ttyAMA0: physical ARM PL011 uarts
- hvc0: hypervisor virtual console
- ttyS0-2: physical uarts

We have to list multiple ttyS? names because different platforms use
different devices: specifically on the BeaglePlay the Linux console is
ttyS2, with S0 and S1 being the uarts connecting the expansion port.

However, it's not ideal to randomly open ports and hope for the best:
with kernel 6.7 onwards a power management/tty bug results in system
hangs if a getty is sitting on ttyS1 (see #15704).

A better solution is to just use the getty generator in systemd: this
will automatically spawn gettys on any hypervisor consoles found and all
of the consoles that Linux is aware of. On the BeaglePlay this means
it puts a getty on just ttyS2, as expected.

The fixed configuration recipe is still present for people who wish to
have absolute control by simply disabling the serial-getty-generator
PACKAGECONFIG.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-co=
re/systemd/systemd_257.1.bb
index cdf72a50157..f464b979b07 100644
--- a/meta/recipes-core/systemd/systemd_257.1.bb
+++ b/meta/recipes-core/systemd/systemd_257.1.bb
@@ -92,6 +92,7 @@ PACKAGECONFIG ??=3D " \
     quotacheck \
     randomseed \
     resolved \
+    serial-getty-generator \
     set-time-epoch \
     sysusers \
     timedated \
@@ -126,7 +127,7 @@ TARGET_CC_ARCH:append:libc-musl =3D " -D__UAPI_DEF_ET=
HHDR=3D0 -D_LARGEFILE64_SOURCE"
=20
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
-# systemd-serialgetty.bb - not enabled by default.
+# systemd-serialgetty.bb
 PACKAGECONFIG[serial-getty-generator] =3D ""
=20
 PACKAGECONFIG[acl] =3D "-Dacl=3Denabled,-Dacl=3Ddisabled,acl"
@@ -287,8 +288,10 @@ do_install() {
 		fi
 	fi
 	install -d ${D}/${base_sbindir}
+
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'fal=
se', 'true', d)}; then
-		# Provided by a separate recipe
+		# Remove the serial-getty generator and instead use explicit services
+		# created by the systemd-serialgetty recipe
 		rm ${D}${systemd_system_unitdir}/serial-getty* -f
 	fi
=20
--=20
2.43.0


