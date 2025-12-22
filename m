Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66540E69178
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87784.1766434085071430166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwmyncr8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736ffc531fso770456066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434083; x=1767038883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ghMB9se3zf2AQJNNp/ljuXg6rbkPYmO62xRKZBrPFY=;
        b=jwmyncr8WgHS94nuG/XyCpQs+IRzVA73xz9YVyfWlOXgA2f524azW6aSncPL/KZMzj
         1T3n5mH9a3nYqNN0+ErvkMpT1Mzdu3XLWFuCMaOito43ToJcdKZk95ncJSI04+q9GbWU
         L8p/HYdWOvWYcTfB3cECYxnFVKtQEFJuNi2VerCCnuI2dzKBv/7LEqQhZYinCSkO5vj7
         pgvSvrHpp9LpQQoAAnNCJGlq/Sdz+2u973PeI1ZumpsYULTFtV1nJsC9Nyv2Slvw6DtW
         Qi8oYX7PW3fHv+g14StydF44XtoNQyFeL95xJlCkQ5CnRDaceOY2GIVuE3nTGfmACyRC
         okzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434083; x=1767038883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ghMB9se3zf2AQJNNp/ljuXg6rbkPYmO62xRKZBrPFY=;
        b=lDMzQ2OAKyZIfAO4TBT57HMKnayLB6bSZNCQNWQpi/8LHF4vyzA6vhm6hQlLkQDE/Z
         Hl28s1wi5owSWq2YQ+KlumuT6l5ufbGFsC+FgZcLibIIYjIiGT7SwfV/PIdPCE2VX6B/
         cDrOpTamiEMAW1CEXPWw5DkFlExDvV+6K3PF2ZiejexWH8gX54eu+Hg0hbUB0rcVoIYQ
         HKzRcxuQ3i/VrtJ6u55VSeu1pI5CaTplIyZ6K8y+VU2YkP22zNaDL7Eoy1pdv2BZyglz
         2T0WW+0pgisNegQvnJ5SUbPtRFMtjV/ZXNy/OWUSkzx485dTxwyuacFW/hkEEPxJnxuk
         Pd6g==
X-Gm-Message-State: AOJu0YzBcvjC9R1GDjrbAjsvwk+kk8bssD8qUXd8qsbcC3e9InN60ech
	rI62PjREUa0wB8r1oVZJJ/EyHSmjoYz27cFBXd0K4z4cswK9F+kIhmJN1Q8Fug==
X-Gm-Gg: AY/fxX6wjL/JyZ/O5dzj9qM9OU7s1stcBoEF7cn7IVr7XybL26tehpyLfUNpd9VJgiT
	tpcOCUPQcMsjtY4UK3CEU1kjlrFo5KnVE34HsYWXXGt7O15XpKXWB7SqTU/EuPjmvTuyVehEEcq
	bQxDfTql5BEomWM01fM3Q3RJhl0Q92LmEyfeLggFAqQnHYlX7zy4y33CplS5OJq38lPgFBo4Elh
	B88YE3U5WmD4tI8N4v1TB9A7gdt3Xwinxm/7e5tRXlmpUiJfpLv4jKuV3JNOKoiSoHgaUfZp67k
	h7ghM326lts5pTZIHO2gpToj2RcaXkg+DPnb6O0Kul8SENeTQhPEd4dixC9czfKlk48khLDa6ym
	qn4JGagt+MPC0SbcOOWc+kTqU0x4Pxbp0XklJwHlqD4LJ4eAzLorl+VYyktaM4ZuAUok3CJcKa0
	Ivs6cR13VgBP8VIcEA4l4fzDv+WLSMglcb8g9BkPaNIK/sXYY=
X-Google-Smtp-Source: AGHT+IFLxtECT/ws4yXCjZua5x1CMO+QEsM4VR6GyjFvrSdaEFpGU34nn6cUnTB/bzZMRMjodw6wGw==
X-Received: by 2002:a17:907:7f14:b0:b76:60ad:77f8 with SMTP id a640c23a62f3a-b803719d8c3mr1503390066b.48.1766434083398;
        Mon, 22 Dec 2025 12:08:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 024/114] iso-codes: upgrade 4.18.0 -> 4.19.0
Date: Mon, 22 Dec 2025 21:06:06 +0100
Message-ID: <20251222200739.2278706-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228349

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
index 1ee9f5a8f5..413c7991d6 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
+SRCREV = "0f3a862394265a31d8465fc5e627d6429bbd8394"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.47.3


