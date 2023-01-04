Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ED6C54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9380.1672830371928987685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W7JwyjtA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id co23so32594636wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p4VZT1ispDmKhSlyKG8QcYQlWITwBqcUKu+DyP725I=;
        b=W7JwyjtAfRryoMU+FiV8fKDNCpiZQJsYUDYLRib/c8hEYjH+DEcokROvQhO9ryQKyt
         xYQ0aaVt4p3mUbPwrGEeJrpAFlF5jh3iOzvzQnq442w8QiFqGg6L4grGzkhiMQIV/CWq
         G4Xiyxesp1Tr55q65/AEWNZwcC5r8E3hN6E/oocgK97EkXX2O3BAAQHuqM4FXYSDWrMK
         IT8/KYYGzmuPKYSuZIcC/2Xm5DYI/ke3qTWyBNJdtv6FIP1YqE96N6vWQ79h8Y8vJrsT
         iQeLJTy8QJb5Qwz/raWBlE2N6UblseRailWYufL/Kcxa6QhN8lsSG0eWrRWIhaRknLca
         jxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p4VZT1ispDmKhSlyKG8QcYQlWITwBqcUKu+DyP725I=;
        b=2KXoyIJRxH/Hlm0Pbg53anInhJby86Ltq7h5ikw62MrlrW7l4+V8RldEY/uSkCaKHr
         DaXb3o7vgRM8pZAqBXDGOuGZDuo1pbwhtpn7RNuD4Pal/WiiJlCuiq4V1rqjNvC8yhAQ
         uYgpGA9GLehPlNo35Hh1axjqYZ9EcE1Rem2NAVGXiqZycMry2QSQ7Wl9j859LrlsrR7A
         ABEEpLG0NTGsK6cR0qtDeBOoK6BiOUsgKgYd2jBP+mIpkm0WUN0kPeMEwRqijXWOC/gA
         5RX4ejLKc7j2Mqn5B0eVV+och9VpU5g7BgusL9vBl1Y58si8MtoJDGi7wCHv/IqIVbzS
         Bp8w==
X-Gm-Message-State: AFqh2koFuBYDUMsWTcwfBe9VbDdv9nkd6v3WKVI6I2/Orx5TmJsSV8FZ
	QauMk0zHrvNgbg+bo0Ej6wN2bOPR1pY=
X-Google-Smtp-Source: AMrXdXuKApC2oxmUolj2w8Z9uDQwNI+zWuRQ8BvoHy8IaRf5ZdNkadtbb4koNSqntXSMocNlE2QTnw==
X-Received: by 2002:a5d:54ce:0:b0:242:8b69:cf2b with SMTP id x14-20020a5d54ce000000b002428b69cf2bmr27713469wrv.47.1672830370436;
        Wed, 04 Jan 2023 03:06:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/77] strace: upgrade 6.0 -> 6.1
Date: Wed,  4 Jan 2023 12:04:54 +0100
Message-Id: <20230104110548.2537259-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175408

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/{strace_6.0.bb => strace_6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.0.bb => strace_6.1.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.0.bb b/meta/recipes-devtools/strace/strace_6.1.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.0.bb
rename to meta/recipes-devtools/strace/strace_6.1.bb
index 7679235b01..ec5c10c80d 100644
--- a/meta/recipes-devtools/strace/strace_6.0.bb
+++ b/meta/recipes-devtools/strace/strace_6.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338"
+SRC_URI[sha256sum] = "2579e9cec37dbb786f6ea0bebd15f40dd561ef2bde2a2a2ecdce5963b01859fd"
 
 inherit autotools ptest
 
-- 
2.30.2


