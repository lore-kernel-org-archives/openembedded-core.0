Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788EEE6ADD9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87820.1766434118308894956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVz+uP27;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7636c96b9aso749368166b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434117; x=1767038917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pffuNWpbcvJb9zxJnR+1docX0rHX3yyxId+oPMSBl/M=;
        b=IVz+uP27fYfvJwP2BOUiiGhrbUw0k1Q6liowpJjdqCf2uvmd/Ue/W6gUWO0eK81ymd
         wYEWM+L1Cl9bU9SuWlbc/UzXJgdfAGxu0WZijb2s2JgKlBrCMub1ujHH3yI4LnmvXYyY
         05XPfl/j7DVf/eYGlcQbYJ/8gK9x09hKOBrgX4BrRD/U8b838N3U/VBRZllK9Pywt79J
         t+hi5+aNGMvcMSKWZQnpS4Q8UDAMLPOO6h3ug4rkhTSpkjZkSJpywQFJBi3ABg1qyHH+
         n8SY/rhy2xLgob26TLiaWkXkEZ/U9cuI1qHP2X/ZTyaRFQ71MOxwMzVQXdbf8DDleNvT
         z+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434117; x=1767038917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pffuNWpbcvJb9zxJnR+1docX0rHX3yyxId+oPMSBl/M=;
        b=Z3vXdd8eLfV7Nab62og44qcHTDWUwwnxKpWCoFjhz/I7TT3FeEbHiXtqu9RWHnUbCK
         hCmt+It3vqhDZZNMUlSUIDGZYA3xCMfy6sx4Cl5sya+x64iln3PM9Eu9DvOJGBi4LhNP
         J5zU66+Ut6Eepy2A8GwVy9MwpsAoKJ2AiStFOmWgg7vSjAWUb+eguRp2sS5fg94/ik+O
         v4pzL5d/ArRbosa/U2MlTgmLkoz90lhQVOcCbx4v341BXOXGhhd7IpYzp/aEmW+DxIZM
         7r54cwQx/bawVowOXCGaV8pPUboyI3YEuwJ3FRFEBAAW4dJ5NkmwqniA9I7+FMxwOpjM
         cqyQ==
X-Gm-Message-State: AOJu0YygU6+6hjvIVhqrSdCa/id6rjhmdtxGQScnX+aDBiDq9l9VcFIZ
	4WKzRWSUJnVMod31biO14zWMz7TVX59vin+vACKSP6G57H+Xq7V5vFOKrEeeOw==
X-Gm-Gg: AY/fxX7arAVPe56Ez1RheA7+IF4hdekUHsYxEIRgcEt/wjjbRbL9v7TIA+FcWrJHWjD
	ynaGwdOgupGpSBHdLWIwarjNvrIoqzf4YFPMSX7YHULTNpX6w8Wx0GvWsSrra9kk/+3b2EAVBBU
	ktYLbIy80a/udZhpPFB/bqa3xrI7eI+RGrU3Y8gqkcUJqh6RqjsK81VD5yZero7xxM6uPfvvDgo
	MhOWzu0D2rSJIl5IqixtKWzHIgVFQlausQMjw049SsI3qRTg+AvfjDbCVVspW+VxnSmJTc/d5tR
	tg9rlMV8IsjWT7i3QgkMEmVgd8JZNt0U48n3vxrV0gJHCkMWHoU+g5MwQ4WT3C9mc7ZoTNPzIKs
	rUEF0BOGwHI5cLLPO+WQislZXw2m2S7waUEjZ6FHQ07/4/SQVV+RO1eeEsSgVb1sOJ8Z3nOCACi
	RWHlzE7oBEClvJiS4SieYfZo4LJ73fIh6FrsT8HVDF5COCdU4=
X-Google-Smtp-Source: AGHT+IHbocwJLqtl6KFgEKtosM+jpu2+tJZMzFNY/C8WQPQFtl4CgEgi3nbzFwEpHOxV9VRbveorGQ==
X-Received: by 2002:a17:907:7f07:b0:b72:6d3e:848f with SMTP id a640c23a62f3a-b8036f60a9bmr1126205766b.19.1766434116612;
        Mon, 22 Dec 2025 12:08:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 074/114] python3-pytest: upgrade 8.4.2 -> 9.0.2
Date: Mon, 22 Dec 2025 21:06:56 +0100
Message-ID: <20251222200739.2278706-74-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228399

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pytest_8.4.2.bb => python3-pytest_9.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.4.2.bb => python3-pytest_9.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.4.2.bb
rename to meta/recipes-devtools/python/python3-pytest_9.0.2.bb
index d85033cd1f..007db2e732 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "86c0d0b93306b961d58d62a4db4879f27fe25513d4b969df351abdddb3c30e01"
+SRC_URI[sha256sum] = "75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3


