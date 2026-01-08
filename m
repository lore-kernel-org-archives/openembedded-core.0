Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F60FCF6ABE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:13:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3542.1767867177246485231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mFTk38l9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F7684E41FF1
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 10:12:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5A7606B6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 10:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15036103C8810;
	Thu,  8 Jan 2026 11:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767867174; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=T22aU7IDvc+tNe2srzSxZtvch3alGZZ+yNufZQHBAkw=;
	b=mFTk38l9eLaQ3bZ8TFw7BglsLTZZP4m0a+6pID/1Oewk+M1QaVGll/qTJVB3sdKalRaQRO
	5h+R/C7Iake1TnwKeg8o4a01tZbnNFi4EDUnQPYlhAurYha7PezXFerLwByYheRSYFvNPV
	oYj8JFjC/i2+cnjHIvEhHfD7iHOQbjhdyZz0jut9qtHr/ojP2KWg14t7QQDCZb0FmYmYBI
	p0TiUnrJt4U7GiQTWRqKsQjoIqMzOXaMNswvSUkD/oPIQEl6fJGn5QMSh/UuHTjoFg+V7r
	PCy5Kyrz7OR/g/9rARH0G6wST8LXVMRHz2tefUC6Wu0hEg/Llxmy7w5HFBMiGw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v3] opensbi: bump to 1.8
Date: Thu,  8 Jan 2026 11:12:46 +0100
Message-ID: <20260108101246.58329-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 10:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229054

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

Additionally, enable PMP support on QEMU using RV32A, as PMP is
disabled by default, which causes the hart isolation configuration
to fail [1].

[1] https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

---
    Changes in v3:
    - Fix commit message
    Changes in v2:
    - Enable PMP support on Qemu with rva23
    - Include tag=3Dv${PV} in the SRC_URI
    - Link to v1: https://lists.openembedded.org/g/openembedded-core/mess=
age/228935
---
 meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
 meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} (96=
%)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index b755d32c9d1a..bac376ce5a80 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
 # qemuboot options
 QB_SMP ?=3D "-smp 4"
 QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
-QB_CPU:riscv64 ?=3D "-cpu rva23s64"
+QB_CPU:riscv64 ?=3D "-cpu rva23s64,pmp=3Dtrue"
 QB_MACHINE =3D "-machine virt"
 QB_DEFAULT_BIOS =3D "fw_jump.elf"
 QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.bb
similarity index 96%
rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
index a460062e9398..5352c01d6693 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
@@ -8,8 +8,8 @@ require opensbi-payloads.inc
=20
 inherit deploy
=20
-SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
-SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
+SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
=20
 TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
=20
--=20
2.52.0


