Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728B1C36000
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4281.1742272747159255543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgBEdHh2;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22435603572so82037145ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272746; x=1742877546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=AgBEdHh2XroZIoKKfxNgIKF6TEGepgF/GJBIUcBJXfpeRyvXQEn42dYuu4BJk0E4yL
         BGe0SG0jNFJu46ZnGzZPTfKqf+tLcOagE00LgNe8Tng3c7ws+29EE9TSBfa6rxN56KtZ
         MfyuISposwXmJPWIncHwr8rEziobnpNq2h/Jm0a69S/UkHGyI9gWTILQXHSlp5GTL9oc
         oB4DZtOk7Tt1su1rd+mYtsvzDkedu/wB7JEPTQc6SsLtmCyXnxkpELpHErJ87f1957B+
         Updd0NQCodfs8+wCvf9bX18GvuBG+F67dI1eQhfZdrexDB3YNYhE1MU71734yMcdasWq
         lAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272746; x=1742877546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=ZcTWpAwls5/hVwHVLW2KhuEIh9tpEJHdSTY9lD+nEIJFednZfxZ4dxwWEcFxW4lAGz
         2l47ZyoRdg/a7/V4ihXvZA8U3FMaiEB0wrbZmQSTsJnoxffHC7s2dPsgXBRuxRCXh+2L
         Vzj7a9qtC3Fai5sh369F5RVfjArzdqVXiUL0Kll3BXcotNhV07apcer3hISxM5jCrPqi
         WVB5qPWXnuL5BwVANOPgqZ7dTfo0dxVMTM4i+P5L3CAPyQsJJbkbJLxVf6kc6EA9Kzrn
         Byjvq4xsgg7OWWZyfVMUfcuqRrLF8qK+d/BGJkbwpdEYjasE2qy6T33/IR7a5ToHahsf
         rkgA==
X-Gm-Message-State: AOJu0Yyx3c6lDZ5zl4z7iY9fAxmzJii6QkHl8Z4B9Ye5Z7RFl9QcMEO7
	5NkWxG//htVAWzBDZwYTrqF8ZVRQ3UyJ1A5BFYJ7RYUPrhZtuejo4gcEj/oN
X-Gm-Gg: ASbGncul+5fO3jJ1wBTM4ZCU2VcFhYl2Wlzx7hdH2jim4m45oYya1V3DeOF4+IXqq8N
	vlZM0U+9lt31IQeRzbKXTj52jXcbj8rG5gN/HRZQMqP+2B+STX4WiO4T0ScxJgrSh45g2tYhVKF
	m+PDgKDo52v8Ffn6Mitt9gfW06k34q3xBBr34PNEtlKDKXyh2PO/a3jAVx1uMZTFu9AxW6vIXle
	YlTFfJQbGAbbrUtmJfgLmOTJOCnQNwZTOuoFcKaJsZA5SgtXPcGLcf0Z4qqA4l+TAQrZvBBII4k
	YO3RPYyC1eB/1UhOwyfkZd49QeCwZsy551rsOJOHaBF32lo=
X-Google-Smtp-Source: AGHT+IFDLTGvZrVuslHQubC37WZTLTzxzsyuZhRwfeRoMboK2UxYCm2bQR4UrU/nZRV8/oXIWZTXAA==
X-Received: by 2002:a17:902:f707:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-225e0af57c7mr189338935ad.32.1742272746395;
        Mon, 17 Mar 2025 21:39:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 19/24] cpio: Pin to use C17 std
Date: Mon, 17 Mar 2025 21:38:39 -0700
Message-ID: <20250318043846.2422141-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213153

Fixes build with GCC-15 which is defaulting to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index bfaf5c31c37..b081bd53db5 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,8 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then

