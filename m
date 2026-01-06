Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F891CEFD17
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 22:12:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1695.1767737552081726794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 14:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Zn1k7Fjh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D06DC4E41FB4
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 22:12:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B8A160739
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 22:12:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2089103C807E;
	Tue,  6 Jan 2026 23:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767737549; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=UZAFZIRH4apOZTmPMBujultQ+GSye9qNuEuZO+KQ/8U=;
	b=Zn1k7FjhdwncN4PgdZYIlhQbGbh7fYFXoQVJJL2ntH9LDyRqoukA3MCD0ZeAKbC7aDZAp0
	ntT/QHU/VK8OPBhFA3yfxW28TZqmkFv+wV4L6gJe/Ni2rcKTWfmYX9XgFN14szkuWN1bHj
	hym6cEAevurC9dPRNV8TUEVsQeXwVKd5GG7ROoPDNwjps1qiLv90ENKnxsEuxQQ9V4cWIU
	XfmWPig2iFulkOJEXP9U4fGowVzBz1KmnDHLSuh0TjwLZ5FxtWlIIXKOwhp1naI00HrWFs
	LSJlrBE453misLDpxoUgMHtzwW5ZBIwvO+q3PCLb7XTKqUImX7f6kOdhobckPg==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.8
Date: Tue,  6 Jan 2026 23:10:16 +0100
Message-ID: <20260106221016.3504565-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 22:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228935

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- Safe and reverse list iteration
- Stack protector support
- Allocate heap housekeeping nodes dynamically
- IPI device ratings
- Andes QiLai SoC support
- SpacemiT K1 SoC support
- ESWIN Computing EIC7700 SoC support
- Moved Ariane and Openpiton to generic platform
- SiFive CLINT v2 support
- Simple FDT based cache library
- SiFive PL2 cache controller driver
- SiFive Extensible Cache (EC) driver
- SiFive TMC0 based HSM driver
- SiFive SMC0 based system suspend driver
- MPXY RPMI mailbox driver for voltage service group
- MPXY RPMI mailbox driver for device power service group
- MPXY RPMI mailbox driver for performance service group
- HART protection abstraction

Overall, this release has various domain related improvements and
also adds multiple platform support.

Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64
profiles lack PMP entries, causing hart isolation configuration to fail [=
1].

[1] https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
 meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} (97=
%)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index b755d32c9d1a..45fcf36e62d9 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
 # qemuboot options
 QB_SMP ?=3D "-smp 4"
 QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
-QB_CPU:riscv64 ?=3D "-cpu rva23s64"
+QB_CPU:riscv64 ?=3D "-cpu rv64"
 QB_MACHINE =3D "-machine virt"
 QB_DEFAULT_BIOS =3D "fw_jump.elf"
 QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
index a460062e9398..f2d3e9f20082 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
@@ -8,7 +8,7 @@ require opensbi-payloads.inc
=20
 inherit deploy
=20
-SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
+SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
 SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
 TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
--=20
2.52.0


