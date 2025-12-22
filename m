Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D3EE6ADE4
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:57 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87714.1766434132816529347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cxRII+I2;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so2111890a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434131; x=1767038931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEGWsgWjtJll4EdQmjU4HTUVOtCnVYxsrVhbHe7P1VY=;
        b=cxRII+I2ZZ1ZnUHiuGaj+MKTscoL6RSYi3HCezGQUg4HcMYwwBeBlUXSD9FBZVohKl
         Bn17tWocfL701VBRsRU1uU1mi9WyF70LJrlTNFRSDYVQPJQMskPJqFPauUKnStANQZgW
         VpluSY4R4X/ya55IYSkl7FT7QUGgIKK42txynoo87TQeRR51Wx0a/Bd5SRsXsWJoU8uI
         UaWLVF9D/8PkcxWQxlq99kJNhFvBnsVEYoIkN+j9NzkO7Z4fjJquJOc/zZyHr+RL9gFR
         ngVjsM2/4Qfbi/0akO9g03ukV/MF0D38OvpxTMVVbDsrev59Ff5Pki087od7nHOgXrox
         7xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434131; x=1767038931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEGWsgWjtJll4EdQmjU4HTUVOtCnVYxsrVhbHe7P1VY=;
        b=fCOIeXJyYzozvM3RkUztOjmITAmziErSh+h0twLvg3V3S6ulS/YtV+w3VINkVAocYK
         xgrlaSdqim57JGaWhbRuIW31fqFKexrM6VbJE2UdOC5TgDdOX4eFkZmPB/vKl8UdNvFP
         iidpGPE/UwmCREwwGwHhYged4mIGQfN00o1/g2quzI2tS/YDH5iNM/x0Tnqn778cbxm5
         K0RVcWIa11K50Q/cq1i0yn6GYRge7egOqe901ZAFTghg7xsdJi5IY3XC3Fkx7oLg8vPF
         wF5IuEFLbpafnpkbRjT/Bum4FLv9xIHl4NKt8yGQmBzalgU0ad3uHdJl2xc4DEIa7E4E
         aWxA==
X-Gm-Message-State: AOJu0YxnWrS4STDy8NM0m8nHZiqtjY4XWKIXa23j3oFvXmz8EhmTjpIU
	s7gj6oV1qSOI3HPN+3MWFESyL42NLMaTMStY5EQvlzHEsZCEo2OyxRBZ9CfrEQ==
X-Gm-Gg: AY/fxX7957dDxQdDsqp1uFe+O7PSNidkerW5ArmJYVfQGQLZYX2Bc/YSsMaOy0OiClJ
	W24lUOkDazanvpyb4OuL/y/ihmwZmUPPJMmUG8PnXJCYjWE9sgdiP615fMFi3SfVkNeLjZ1n8e/
	Bhz8QWeK7gtHQ2pgg+ONCAhnI1K4OGgdL7os6KU5EwZTgoknsUNsh2Y1XUDMlDM+Jxe2TSZrjbc
	Oxr8D1Kd2JNy9bBKuT+fA2wNwbjME4p9lsuu2y4UoYEgn0sMBt6QgxQc7coQpMXhXTTVE0MVDMC
	mJbgxJ3AghqkQfwbhdE0GWzW3o1zJTP3R5wDEYamK8/qnYDzZ0v/0C5MbOktTK59+/WcgLtx4Ir
	c8nXvo8Dxccwh9T+t/Uevv2chF2ClMd1vprrTouoSWssYfV856RP1D7Cfz4QNOoxnX3TDh/fNJQ
	UnVLr75Y3K/cwGTyen181G4S7cufozaiT1Lx03jzmUKGJp5YdFF/pAZpwoQQ==
X-Google-Smtp-Source: AGHT+IEKbMJaK+bwfYCCVajFqXvmt8fZsLIY0sEnja82l7AFSs/JhdbBOIIbt97ChFesJtII2AROcA==
X-Received: by 2002:a17:906:aa05:b0:b73:37aa:87c0 with SMTP id a640c23a62f3a-b80205decbemr1084809966b.23.1766434131076;
        Mon, 22 Dec 2025 12:08:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 096/114] spirv-llvm-translator: upgrade 21.1.2 -> 21.1.3
Date: Mon, 22 Dec 2025 21:07:18 +0100
Message-ID: <20251222200739.2278706-96-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228421

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...lvm-translator_21.1.2.bb => spirv-llvm-translator_21.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.2.bb => spirv-llvm-translator_21.1.3.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
index 763afbd608..f8a7b8f32e 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a37544fc0bb90b4e8b8d755580119c018891dfa4"
+SRCREV = "a79c852b36785588032a2dd7c39aa15ec4d24b20"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
-- 
2.47.3


