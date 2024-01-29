Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98606C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 10:07:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11118.1706522824594075715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 02:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hklt8+iI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C7C160014;
	Mon, 29 Jan 2024 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706522822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PrhAwpQlY+C3oPtMDAr5uXnyKUaXFSm/H/Z6JWVlvnY=;
	b=hklt8+iIj5hiC95KD3sh47zQJmi+EiubleewOeqVZXbbnVEw0FxwFcQhGfeIbJ5jaTaczz
	TFjTYGcBDCT04LTLwJF7W+IJzP/4wPguAIII5Geu7dGPI3ssy/KZDgAsJyP4OHP3QlWV8V
	Je1JyWY8goHYVzoQ7ZwtoekarK2dj5HCQpvKk/oV7wWUA5KNnX2MeEvi/8OS78UQVB8klJ
	JxlUlDywYOQ+/gG3k8AfZPeDpN26BP7vY9s4h3CTGGuor2vprb4KeGk/TLa6QwzkuXIDb7
	fj1b/psQ3TfCsKkJjs168/Iu+puktr2NYXx6oDqzCmlf8OkLNnaiTWV1woJglw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: skip ldflags QA
Date: Mon, 29 Jan 2024 11:06:59 +0100
Message-ID: <20240129100659.107901-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194454

From: Thomas Perrot <thomas.perrot@bootlin.com>

Quiet the following GNU_HASH error:
ERROR: opensbi-1.4-r0 do_package_qa: QA Issue: File /share/opensbi/lp64/generic/firmware/fw_dynamic.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /share/opensbi/lp64/generic/firmware/fw_payload.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

[YOCTO #15370] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15370

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.4.bb b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
index fd18c03cfbc4..e36ada081428 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
@@ -43,3 +43,5 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP:${PN} = "ldflags"
-- 
2.43.0


