Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E6FC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:51:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.54661.1742223060064043300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dfgWYIGD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9BAF442A8;
	Mon, 17 Mar 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742223058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tABdphCjSh+QDAqRKCM+r7Dp9MSyl5Kj3L7gmzimAbI=;
	b=dfgWYIGD+l7Tlg2qncNN7egHt/HbcFIGW3KmV7jNXdiAl7ylBWL78EUujE/pGkPY2zUI5P
	8KikJK0KTUKwRazbb7KOaLxiBPyNTbNOE5io9O07R0BBFYVQ6hO8okrUrgrqrjwAOau3HL
	Pda5oBZLtrySy4ZciIIFjjuvJTaKv/HWFkV/UhSWK3nRIwRsm6Jua1QNE7rwWRdR7f0YC5
	xjL/TpNcJIY2RQkKLe/wUN8OPMvnp/uz4bApJQRQsrDnonRCkfu00DmE5nSfBS1SZXDQkh
	gt0+afna3LO9qscNljsr7dksTVP/TNc3ZcWIpwCMH5f+02hhUj9V2rfzYhkiGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 15:49:16 +0100
Subject: [PATCH] native: follow BUILD_* definitions for OBJCOPY, OBJDUMP
 and READELF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-native-toolchain-utils-v1-1-4db473a2e669@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGs22GcC/x2MWwqAIBAArxL73YJZ0eMq0YfVWguhoSZBePekz
 4GZecGTY/IwFi84iuzZmgxVWcB6KLMT8pYZpJCtqKsOjQocCYO1ZxbY4B349Khls2yD6gfSK+T
 4cqT5+cfTnNIH2+z8E2gAAAA=
X-Change-ID: 20250317-native-toolchain-utils-f24bd9a89efc
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5hdWZ+0bk/iFE6igRHpHOj6MbL1u5EhCKJaF/ZYNGUc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2DbRys0eUIY1b5d4KPZ4nuY/cwXBlGXlWT0Dq
 MfRZhLq7amJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9g20QAKCRDRgEFAKaOo
 Npc8EAC2Qo8g72RaAj/ckdDwxWRT9Im08p/Aq+4hvBQS5ReCzdgfXXhEAQc8HIORn/IqS/0ayu4
 bj51MP33pWidzpym4cJdLjXJQ+vCS+VFAlE+6f2WZQo+g6osIVS5s7dvPEzyXYYvw7o3uLCEVoU
 B6lpIisTvlwvNphfpRdFHGOE8pN4Bd12RUk2VqcQBI55gnsMpFhVhFnTA2mluYjPZ8CNmG2l0wq
 nOqphq2KBrT0AQVrr5etyct1SIkWOJbtGHmLA0kUFXTyU5wgr6wh+VmlWgeiAup0nXUNYOv0ydK
 lsyab+uVk9iBQDrLdsvn4nENLgohEyq/JwZqva2GHEwGTBVQeA3phsXreyFiWjSK37GBvYR1J1z
 nxQkFXmgYlHoHbCpxPA8Zp6ZMTWENAU37AbD0RFouCuOZbHzsPz32lfuGHDt1KH4rv1phvAmfTs
 Kh8xwTo6JF7T1GlHzYQ8V6O/eVYwmVmL3nW5wcIPTZ2yTxG6kv3L1nXO7/EFITLqWPPLtcObYCw
 AkVLB5VYh8MffyyvMNa5dNhgbNWSNHYjRik1hl2WtzNfaQuROyqwOiOuF480OP/hhn7fq8kYYbK
 KDL98GFXyQM4Iiec2ksO2boQKwGcxggQGTr3zrOYSJqo4n6eYu2Bdo/LNzWKFdRgI7Ry2DmAFyP
 Ly64HQWpseVkdYw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeljeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieejledtieeuteffveetleeuffeivdffjefgteehgfehleeiteehieeuieekueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrp
 hgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213105

Set the host OBJCOPY, OBJDUMP, and READELF variables to be derived from
their corresponding BUILD_* definitions. This makes the native class
match the build-gcc.inc file 1 to 1, as these were the only missing.
Currently these variables get their definitions from gcc.inc, which uses
HOST_PREFIX, and that works because the native class sets HOST_PREFIX to
BUILD_PREFIX, but this doesn't seem correct.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-recipe/native.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 1d9432138e..febb4b6001 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -64,6 +64,9 @@ export AS = "${BUILD_AS}"
 export RANLIB = "${BUILD_RANLIB}"
 export STRIP = "${BUILD_STRIP}"
 export NM = "${BUILD_NM}"
+export OBJCOPY = "${BUILD_OBJCOPY}"
+export OBJDUMP = "${BUILD_OBJDUMP}"
+export READELF = "${BUILD_READELF}"
 
 # Path prefixes
 base_prefix = "${STAGING_DIR_NATIVE}"

---
base-commit: 5299816c59ea01905cfb73c72421bb8f11149426
change-id: 20250317-native-toolchain-utils-f24bd9a89efc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


