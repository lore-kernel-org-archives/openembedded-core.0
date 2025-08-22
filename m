Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8EECA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 07:40:52 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.4565.1755848444445222076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 00:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eA4hmY9l;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61c13619cacso1558593a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755848443; x=1756453243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt8ZwQV9m9Vb7RbHZtMqjC+GDKvzi9D1HkLNFDWxeNw=;
        b=eA4hmY9lfCssU6L1Ion8BSam2mf2Kb1WAADZUNemQHED+v2V25uLLRO2S37JrXzNgA
         XivxviiQSGDZQ4doFAMtIYd2mr/UEv6TlAzKntGcmYqOYh+95fWQxejgw/kPTeBAtaGB
         ZLGsDbg49fshSeJhYUGuOmEZXBAjrorQwg1n83p78ruw79ezfQNxtXNdUNs8cYdCRXbz
         ZD7buRIkJeVjhyeFjgQZ32pMvHOGfla2w4UzJpesFXZPCAChvw8m7SYYZ+CYElzGQoyc
         u/dxV9z4U3FrlNoeQSoGTs5GzZmhnfq1NIvD+bjRFw4vy73JWI0IfIX0MfbG7fAP/6I2
         lQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848443; x=1756453243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xt8ZwQV9m9Vb7RbHZtMqjC+GDKvzi9D1HkLNFDWxeNw=;
        b=bjAAe+WJ1pAEuZUC1GL/ZPa5IfAu71GVB1KhUt3kD8sMmwmikuuo5kRtlWpD+1yeT2
         ubMa5fHRGARH0DlrtYwlntAMplkanVT1v7/M+xFcKpfMNS9fb2/p+hzh3moyAQG+P9YF
         U8/p95Ou6/f4yRikGAD2lqRX8iKo/l3aUJYWY46qVoZh2iHJPSQwj0eGwtjEojaqYbFE
         P+5Tltkmt/WLpvGdlNcqnyNFAHK85pFcJN+nEeAX58QgvDD0xYGWEYTMoBcdf+ceop0P
         gHQbQvcSRPRPGO712WwQjZpiKqAxDv0tyg54cWanVHC4nk/qSQNCs7kjGi8riReX1KCY
         UfmA==
X-Gm-Message-State: AOJu0YyG9oJJV3skbpFEs6SEkpnxU90WLzu37341AdzoGcerNzjKqoGy
	mDlrfX8yx4fr6I0T4aAC86ckRFAVjLSch76crUTSEHoHsDfstHuHYPRK7tDtAQ==
X-Gm-Gg: ASbGnctYK+t9mSkkhEZsfGsEZZnAua3p3ASsOmGPE43qcn22mdXdWH8YO4FDZctUNYS
	/HzTAXoXbQyjOHlqtDrI5QIKvbfhJU2DVbSEW8WSNdnBanWFkSQYwx7ne1s6SyyLUgmsVIcT4jw
	1l1WZdnBKMIMGXM/i8pyw/un2CncU0vpoB2/g1eObAJ6irXTlt/gRKaQ9LCzuLMhVxYKx+Lbtgs
	n4zPw68OSqtqfFUOYe4UZOPUbxVhzn/gwBOjf/kG2Rvb+ZELnNa/GCGoFuNjDhlZLO/gJj09L8K
	VqYSS3n1t8N4yCKnZM3eVYnpp/0MvdFT97ocfdq+dGxjus3J/8jNFbsMr+vruXtT0wzQaGy/GgQ
	tLwQSHFTriAkaWuJptgB6cDux3Q==
X-Google-Smtp-Source: AGHT+IGHtMSn7CayjV3vejxNPhI4BV/PYXyhB8qRjTzFxFfymN3Itokd+ohAM+jE4sPICfOZtvLxNw==
X-Received: by 2002:a05:6402:1e93:b0:61c:26f1:8340 with SMTP id 4fb4d7f45d1cf-61c26f1871emr133008a12.32.1755848442603;
        Fri, 22 Aug 2025 00:40:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-61c25b5d77fsm137545a12.49.2025.08.22.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:40:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] cpio: Pin to use C17 std
Date: Fri, 22 Aug 2025 09:40:36 +0200
Message-ID: <20250822074036.999442-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222310

From: Khem Raj <raj.khem@gmail.com>

Fixes build with GCC-15 which is defaulting to C23

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 95f82cdf3a..a5c9b76da2 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,9 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then

