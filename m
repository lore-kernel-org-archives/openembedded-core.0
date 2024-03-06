Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7F4C54E66
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15015.1709739729657876828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IiJcuE2+;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a449c5411e1so720351166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739728; x=1710344528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1qoz9bpyxKmcRsTSaEH1Um2HownYknVp1XZ5yRE/Ns=;
        b=IiJcuE2+jJxVmQKF217vTVTPNnJer4zmP1C4ezenSDjSPs6NYJCDbY4Qy2tLxqoDB7
         xjoRrufzPN/FGLh1g0uiqfbe6/TH3fxkCRMWKJCLOKddH2WPQOJbM0ZjVogE3zCW5oSm
         VWzhBr5J22LkU3XgvCWrtp82RjurNmDZWB0ue0iRqYxswGoiHsoPoSQHhPZ0wdxnktAK
         VMhbnU/JflZxyGSzNxMFMKQO85qhuN5qONUle5HZJ2HTLAmNkb1nDwCGb5QsnDs4scaj
         BBcIk9pXTs3Uo+bk51nabXSUZGQMDPFx4Ink+Qk3TeODU0mupqbUKC1UWNopTzIDMy+3
         mhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739728; x=1710344528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1qoz9bpyxKmcRsTSaEH1Um2HownYknVp1XZ5yRE/Ns=;
        b=E5swYAEBVQFM8K52ORNl/XevgNjN5ILRmcWU2YDAY2wYllrmANTVYV26DoG2capFKe
         8Skeuw5QknZ1NBEXkF3tWd0caCZRlEnzgGjys9SrwuEfkHJviaHE1VPD6FsobD47AZSU
         w9Gcg2ENS1hCDK0R88zWmzCtR+FCui4u4DmtEih593YBPFV3ukolZX28zVCzxYQ9oJ1y
         v/aa7vFt59zWkEyYPrevgOWw+SU4fHqEMPpEGQ9vx0g0kTlACI/Sq6OVhlWOMwrYczXh
         c7E+L9y1NrBdBmclsstDfgkh8kdRqtn8xOvAWVkMmquhpQHbdFb4ro4MpRgekFpPiDaa
         3Wmg==
X-Gm-Message-State: AOJu0YwprslMkXMp1iKU5ClB6uMeoGjBl9z4g4rf5ZGYK++JTnu0zFps
	CsH5gB9oKVsgc7QTN6XqKmGKYKqNNo3Ir5d0MufBKzhjlDPHOBvDu4b3WztA
X-Google-Smtp-Source: AGHT+IFiSXCye8g5bSBBhVuXOv/QfE0FqaIRlO1wH6QKvAx6WfmUZcvVgGh9DFkB8ss82oNnRbt8LQ==
X-Received: by 2002:a17:906:11ce:b0:a44:1b86:49d5 with SMTP id o14-20020a17090611ce00b00a441b8649d5mr10042301eja.67.1709739728141;
        Wed, 06 Mar 2024 07:42:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/47] libbsd: upgrade 0.11.8 -> 0.12.1
Date: Wed,  6 Mar 2024 16:41:19 +0100
Message-Id: <20240306154151.3741709-15-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196698

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libbsd/{libbsd_0.11.8.bb => libbsd_0.12.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.11.8.bb => libbsd_0.12.1.bb} (91%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.8.bb b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
similarity index 91%
rename from meta/recipes-support/libbsd/libbsd_0.11.8.bb
rename to meta/recipes-support/libbsd/libbsd_0.12.1.bb
index 17049c8c280..161dc6df43e 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.8.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
@@ -33,12 +33,12 @@ LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=befe09fada57bdcf7f7c12f51081b08f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b087a0981a1fcad42efbba6d4925a0f"
 SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "55fdfa2696fb4d55a592fa9ad14a9df897c7b0008ddb3b30c419914841f85f33"
+SRC_URI[sha256sum] = "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aedd66d830f6db6996a"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


