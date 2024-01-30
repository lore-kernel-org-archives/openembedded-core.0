Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E218BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 07:00:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.13164.1706597993985180105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 22:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=biRL/TQ8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 288131C0003;
	Tue, 30 Jan 2024 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706597992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JDSxyNyTQJzwjmWesi6a98O460uhHTRD9uRSiJF24Sc=;
	b=biRL/TQ82mGeQksiaTqV/+mLzddIQkXQ8M6S5cY2RRXdHsk30IUVYzDXh/9qdS2GQEnmbD
	Fx/xP7s0nFuD/mCZK5K+ZXq5aAYDEdcqbsGtzXjeABlEqXq93YBHy8PkksNVFiixDFdYyP
	Li2R8n8MR5DZtsli2vCYGiYBX+6R460IGFJOt6F/OaY5JOwctWEXZmllpC4hS3Mkd2dm6Y
	uOO4V8XWc15cFhlmmg2pKMDQHYw568MnYf7t75eAdULGtSfmDEYOdqoHGVeNOwrCN5ryBo
	ZcJ7ccMxu27pI2yezayJHFtKi1bN8ITSgs8+v5wM3K1TFaJ1wxTOeCjA4yFTJg==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: append LDFLAGS to TARGET_CC_ARCH
Date: Tue, 30 Jan 2024 07:59:44 +0100
Message-ID: <20240130065944.604651-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 07:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194486

From: Thomas Perrot <thomas.perrot@bootlin.com>

To solve the following GNU_HASH error:
ERROR: opensbi-1.4-r0 do_package_qa: QA Issue: File /share/opensbi/lp64/generic/firmware/fw_dynamic.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /share/opensbi/lp64/generic/firmware/fw_payload.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

[YOCTO #15370] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15370

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.4.bb b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
index fd18c03cfbc4..cf37a411766b 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=y CLANG_TARGET= "
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
-- 
2.43.0


