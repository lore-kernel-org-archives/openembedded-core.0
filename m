Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F47E69196
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87817.1766434114510526510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SU4I+VOj;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so3886524a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434113; x=1767038913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLHyt0Nvg1beBII53BaiKJIoojy2K4gH9my1MOAwIC8=;
        b=SU4I+VOja+RFYSMOnYuyUGoq7ZhLUe77oiRtE0JiAMx+pgQs+/CiCK1+ykJgm5Alrr
         /OUNy1QFb9kXoIkE0hwG5K3+utvuhhboBVHR5Srqh8b5kU715eMJH/UQ7C4v97kZSIdB
         CXncLEVo+iW8NpwhKxsBnDXmpbssixAV6zT1U6sCSBw7sK+rJDSYvwYhw7InJOOVOWFa
         QEjRhK61zJJJ4gz6+pFnWuKtIJwuUff0mhGtxnr1W4rjzN0G5ELduVHWVcj2n5V3+pBg
         WAVkWfpSRH2mPVYpXEd0dVfA2NBcFWrs0Dfos+8gkPrtFF0k/lQU3jOUz/DZCDjWY2iW
         L8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434113; x=1767038913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLHyt0Nvg1beBII53BaiKJIoojy2K4gH9my1MOAwIC8=;
        b=rqQIQFWnifxD2uBwm8SdlomenEM0GJujPRF/vM64GIk1m1FArHcDfbs4oDUDooJ2gV
         Iv/MN3LYXns/9ruMJzf3l7SfLgpsSyb/+ZZj8vPIhH+4uR0AdDhEYJkUxmkOkiZ978RD
         fbKsTFyXzmmGKc6rvARS6+xOVCFZd+qQVl/Y+xjf22+Z0xYng3SeEBBW9S83dBEkM17s
         6Lr1WD63V6sSG9tIJeOuzkThQipG9mqhYcwXzIhPP1DxmtgTsW0niSj0u9t3oLPAQdj5
         u+P1u8Xm+vKAOR7rBJ71Cu7XDSgXoxzjzaNx5PY+PJeQpOnWvlRpwjsEwFEwPjg22opp
         67mg==
X-Gm-Message-State: AOJu0YyQ3tQVTgUQP25mC2OlCR3xeh0cKMi8OhlV8L5PJaBteRwLKVsn
	Gtera2Zblm12a30nZEZwBdfIMvygwovqxb3kAjXvDB1tal5NR5K6b8kgsPqBQA==
X-Gm-Gg: AY/fxX63kX+KpW3X2TmYZRR/lUMkEvNlP6b/n3VRqLTSgQCMlV3HEE0tU8o80iRJM1u
	1arP2gUnF/SMctZtTswgsycPUmiJQDcj3w8r39UECjmR50IzbQwRWSkQBklbltMz0txnriTgs/y
	8FRxUa7Bb8mRicSP8TZHmTXOKNMGPTQlgoKUuV9+AuDWfRSIdSug6EQTnGlXAXOyo8uT8A93bya
	1+sMYQKgU/r0WwuVT9ySWSrO0xmdr+JRgb2chtPRTsvrwTCBa/5a+Bjm8QzXP3j9G9bF7tc3JNH
	+dRZXTEBG5tIAejf4T1fdBd2GkOYlyGcP3my9oi3+zAWQzxHLt7ncsDScG72jmT2dja831sUSfq
	uPZ+fO7hVC+8/n39uPoproANKtbgGtkGcfYLsaogaiCXpwFu4/rvbIKBHndgI4pHUzmTqocMBxT
	ca30Twf030xSPgEdqUhYkgC4SK56fz/USAAFkHcebJucjJI1E=
X-Google-Smtp-Source: AGHT+IE4Ot1taIugSd9kcyKHkPwcw5dkn1wbKYg0bvkECzaGSuPfZIGSrBbPbITLx62jG1X4KnftGw==
X-Received: by 2002:a17:906:fe41:b0:b76:f57f:a2c3 with SMTP id a640c23a62f3a-b8036f343ecmr1269764566b.12.1766434112754;
        Mon, 22 Dec 2025 12:08:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 068/114] python3-poetry-core: upgrade 2.1.3 -> 2.2.1
Date: Mon, 22 Dec 2025 21:06:50 +0100
Message-ID: <20251222200739.2278706-68-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228393

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
index 12c4751de8..45af8768e9 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "0522a015477ed622c89aad56a477a57813cace0c8e7ff2a2906b7ef4a2e296a4"
+SRC_URI[sha256sum] = "97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5"
 
 inherit python_poetry_core pypi
 
-- 
2.47.3


