Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B15C021AB
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 06:53:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.16699.1739948019484396714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 22:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiaY79H1;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2210d92292eso101445895ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 22:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739948018; x=1740552818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCp26VyHyZk1Awjj5JUptH8sg6RFBvxMqnYAP7a2Jn8=;
        b=BiaY79H1vcJzHANewCBioeJtPiayNfuaB21f12vO+zWaLBSKgnpGapltFEUQLp6jQQ
         65TOr2wGC1/C9Gp6pq+LiLM4sz8sTd6F6erWtsiEOhaehjg/4UkL5UwxmJlDjH6APB38
         dpfc1YZxFaRyUV/0Imiuvynqq4EZqE8w8YO/guW0oBjDzb5I979fa0MFyIGWwt9Rph3C
         s510tO7KSVTasKeggLDGspuLkh01PT2XjxfdiS8wRYEJDlbpvgAJyuozvSQNI18jofOq
         c+u1qTiESWlJSnTE9RTzDsOZLoG6+1FcnwuXhJ2+Uq2JS02MwMMDYmYaGQcfxUdSlRdd
         yriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739948018; x=1740552818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCp26VyHyZk1Awjj5JUptH8sg6RFBvxMqnYAP7a2Jn8=;
        b=MYlN7op6cUr1UjgZH7FXJRo1k//rFozlE2jN7lc1oUi5qt9y7Lo4twL6Lfidxle5+r
         NH7PET2CSHZfYFPrvhJv3q0CW3pKl7yX3bcvbKgrWpmb1+Kmk9wVSNPhkxB6L856LBeX
         Xe82OrMAPR52Vby1VsqhTrjvxQN/43n0w2NpJvKU7qWoVcGahgCJ9qWZyiY0/Xnbntb6
         i2D9U2ijCB8Hzutk1ZEFeYudLk40Fm5bkIAroGJfw57TC1sk7phANmG1m+mvctwSKFPI
         v1XxfWXFOdx9ELZl7rfczWPcU6BJx/w8uExGGnmssJFGFUbHZa3N6NVLBdRsZbrqfKAp
         r6Bw==
X-Gm-Message-State: AOJu0YwCHd9A4qk1M+G9WbyL0rilbvWV5O/JBk1pin5vuTfFtgMloL1v
	xW+vaq8+iMnbaciZcVL27h/svT8M53Jf+yZvO4ewqgFxz+XoQL/EVAI9gzWY
X-Gm-Gg: ASbGncs2ukXImHl6gsk6ACIAjTpiBv7m5UkX9vr6Xr2WsRwCfCdmJdfG1wdcrJ9z7bN
	5SHkEY0m53nuxd8kXBWE1+gbE5BnBcMzfwOwtOlQ+sN3b5C3cvurJIQtYI6hIOoPRtPYrgKNcAn
	6UZQ85FuKYdeiJ7h9jQoP8IHAgTqcZ5cFp4qFGDDZheWIl63JDguUPV1zkUGAQj0LTK1EFXfpv0
	yOQz6zv76yw4sZHS62h5Th8SYRAu3yUjPaNCCXJv/kZlR7FMs41qw8TwYUEfXukxtsnjuTS1hz1
	86O0EyU=
X-Google-Smtp-Source: AGHT+IGQ+bMkXnNRjxydWes2uCxb6Us9Hb/h5cJSlTaaaDqDMSeC8IN9TBtssGF1VSUg6yvbXUyejg==
X-Received: by 2002:a05:6a20:9381:b0:1ee:cf13:d4b5 with SMTP id adf61e73a8af0-1eed4fd3b9fmr3882394637.39.1739948018384;
        Tue, 18 Feb 2025 22:53:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm11204531b3a.30.2025.02.18.22.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 22:53:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] python3: Ignore locale2 tests on musl
Date: Tue, 18 Feb 2025 22:53:33 -0800
Message-ID: <20250219065335.1632645-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 06:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211664

These tests require additional locales not supported in musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 52fac76c00a..96478856b34 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -264,7 +264,7 @@ do_install:append:class-nativesdk () {
 }
 
 do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading"|' ${D}${PTEST_PATH}/run-ptest
+    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2"|' ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"

