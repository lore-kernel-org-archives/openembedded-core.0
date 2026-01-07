Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD36CF6C17
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:33:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2439.1767778396508816030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=R29RED7l;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D2BFC1EC88
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 09:32:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76FF7606F8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 09:33:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE59B103C8709;
	Wed,  7 Jan 2026 10:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767778394; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ZQjeEL8poQSgERD8yvuAhUw+gs2iPpyAGv28EpXAd5Y=;
	b=R29RED7lVhszGcJA6U/6M/mnmmUkwsd9gDiZavuN9Zzfu4mTMiVKAht1jspQD0o9vmpu6j
	2OHxRRrhG6Mgo14x1SXvJXihWwGn5fhD3aJuorLPuuMzzfSK+i1oEcT9tj82/Kh3dkx3bO
	YZn9FKEyGAwJyt+sfbo20jMQcrK1tMWwnruEwjriwNJhpk69gxNw0QZoWURr2f5FGoom+s
	j7BglCs6DQK96AV/Rxv92tVCvQR+iXkvbYmo9hRkqG2FWcVwh64W1Xs4H5v9px9+A730Ps
	W85iTPwrFvGSu/MF67+UjIg+S95OcdB7v/zqM2BbtU8Qg6DJL+CEgi8eEuV7mw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v2] opensbi: bump to 1.8
Date: Wed,  7 Jan 2026 10:32:31 +0100
Message-ID: <20260107093231.59163-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228967

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
    Changes in v2:
    - Enable PMP support on Qemu with rva23
    - Include tag=3Dv${PV} in the SRC_URI
    - Link to v1: https://lists.openembedded.org/g/openembedded-core/mess=
age/228935
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


