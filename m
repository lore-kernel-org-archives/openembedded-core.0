Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410B0C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:35:25 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3514.1787931315700540920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BkeYoGU1;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: festevam@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7841b831381so226361137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931314; x=1788536114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pN48OZkbzvKzi8KEGKm0GB6aaC+exHkutmYdj/rVuSo=;
        b=BkeYoGU17/FxpHv9rW+s8Y9ysUR/J0FHSrKYelkeJosW5xdQbndgW+HH7ACuDQRh07
         /2MbbZvG1tnwtyXB+2MT2V6XWBY/Sn436LwFxX1U/ka6yqAjM50cKGJKD5uwDYPWRhYG
         hCLnEd5jzX97v6yrC5AMBui47YGHi+7VIaUgZ6OwVJ/wn2XtXpqn7XgkRGv9A+9F4GWK
         ue1yoHKJCTmsTyzVayFcpjgzqh0iOahX8jL/TdXAnbl3pai7V/owWQdrnAvsRWnXrcAi
         /S29qmz/XFmNATQb06wx0lK/lUAwUpq+MzeLA3MTcYAOfkdpUrsd0g7xWR7zoH9AMcmK
         Z12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931314; x=1788536114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pN48OZkbzvKzi8KEGKm0GB6aaC+exHkutmYdj/rVuSo=;
        b=baTB6j/rYkktoziWoW4Ea/TUSLVr2zNwHQH7MhUdEwXABhtFwoxL/MTLL3EXsUrz3I
         2KIDQghtC9jwvvEqSsyNJgWiTySxct6CkshPjqv1irnoEx0HIXLVzON3o9Yoi+95YcIy
         pUiBv+wdgo9oN2sM+hPUmTs5wzTLKR3ieUbskpPoV9XKvmZI1ObFv8DkFMwke5zC+Rsn
         Dqs4jmdr5dXlQhmRKjNAJasFqTlGB4NoJN/4KRULXE55k/ILvmp5Fjd5nh4T2rKtjdIc
         yUmTrX8mMmYaIgqDy+R77SynEGCeGOJRhghpzxSVxR6HsWn1a37TBbYsjODX1iUhkljT
         gSRQ==
X-Gm-Message-State: AFuF++lrbb13d5zS63HfYSLcnT5irheLW86rb6dKV2yUFwNIYPSjotTh
	8sJo0DPF8j7YiMixlnwmj+EqmAoFeUcS1ueai85im8ZD0PGj7lUmhCK94446uA==
X-Gm-Gg: AR+sD12DeuOR7Esk61b370KUvZ5R8/o8EcZf2XuRJIx6wVFpfvfKjR25xsmAgmavbNU
	CiODSpZGO0zRp+3ZAtrn8Gr6yx2+9RUqAJNMDIQJRe0GG4KT1IzMblWXqPxzrQ/bQEtzMgGjRs2
	/efZuuKyXsJqmZMd1FlbBccYdIuzYbk1rKIHf5ftuc3aKc3NVB1OIHA53PiAOtnf10KTM1DBJ/g
	2gN8tVqusqSKVbaipXUzakvrnu+IRQRAiYdBrYhbyFwgjj1+VgHvfPu+K0huicaBage7DJK8MZ1
	INHdYmvMJKvO5JjDxOETuroIe4qWPgwFzfV5v2cL4RWamY+qLx1Z5Mj95pLd5ubDNu7P5YfF1j9
	fCykEKTkdGDcI+hRR/u29IWiF4dXSYFcsoicOdWvL/ebLLA45xtCc3kOHwOCG+WvVaQlafL5bQX
	1WBHDW8gDt8oMyHdhPeLWXgn4rrgtZolLA7eb4iwmypuSyCbb+KRNiKxTnBeOZAgafmHojqBojr
	SWpVNWgDrG9+aZa3X998m/kdcNww/+kCrcHtw==
X-Received: by 2002:a05:6102:3ecf:b0:784:5883:9cc4 with SMTP id ada2fe7eead31-7859aab00d9mr2249978137.11.1787931314122;
        Fri, 28 Aug 2026 08:35:14 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a802:ffb2:89fd:8130:d331:ce62])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f5a2ce07sm1281254137.6.2026.08.28.08.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] u-boot: Update the HOMEPAGE entry
Date: Fri, 28 Aug 2026 12:34:56 -0300
Message-ID: <20260828153456.413321-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 15:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244553

The official U-Boot project URL has migrated to the
u-boot-project.org domain.

Change the HOMEPAGE entry accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Link to the project page (Quentin).

 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ba66abd56c..fd27dcf316 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+HOMEPAGE = "https://u-boot-project.org"
 DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
 ARM, MIPS and several other processors, which can be installed in a boot \
 ROM and used to initialize and test the hardware or to download and run \
-- 
2.43.0


