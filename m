Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB529C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:44:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.19068.1708091075882378870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VEOc36LL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso12070275e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708091074; x=1708695874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iEXMJn7pcBxEldYkakvRx9ehvIIxR1YFWkD9HBTD+UQ=;
        b=VEOc36LLWsNkZkEQa92MEn1dT9ZBoP1eFlq9Y/Dmwqr0cTpCNSKX97yA68vaAaINI0
         8/KHEJDIsqQZS578vPpLHG4chxBVzUmPiAIaKTZX9ARc6Gx5n3XsUD3RlLYuTdkPIkY9
         bBHFLHfMpgEzFy7mciOBbSXyYhuWjn7xcwUKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091074; x=1708695874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEXMJn7pcBxEldYkakvRx9ehvIIxR1YFWkD9HBTD+UQ=;
        b=sjfumVKviCxv3WHSlUK5dTPXwHY/gpDW4P1Urwfc8K4Kpj6KanctU9KM1KKyIHBMum
         QYGTj5pEivvtvWUfaWSolDxYLYn4Dh0DNFYnnD9wddTUFKYrve/9+c7NYvq2/N5GlNbH
         BfZnvXbk9+8ech09LjSDxnOr2rf9wek+QHgRTr/290ftxpuwzzsE8pyfEbAyU+cWz9x8
         Y2r+4gpvS9Frd8s5e2iQZZ2iwpWW7NxVnRO9ePiv26S5R1gC53oMiaRD4tBD9oFmlK93
         sigaKaftY3x6BBN7/5qZfveVRqHkqzS1B9p72JjJKECj/JfxII12EFXAOfVco93yGAB1
         z8dg==
X-Gm-Message-State: AOJu0YwCGZ5YBsEkGE/v5OEphsfGSaz1MTupAlZhP5K7Zl924w1sNhBr
	VtYDISwkAKBqEzOGH3w5KCCXAfyp0CD7YeJx/7zKgkO6UxW+Z+oouOUZuVMcSyheh5lpT7f7fJ/
	T
X-Google-Smtp-Source: AGHT+IG2waJc6OeQn0dki2ECjhI5ck7ahJg10aSC6QDoKXjk/gxjOtN82zSrVa88qy1TycSaJ6JpOg==
X-Received: by 2002:a05:600c:4708:b0:410:ebdf:73af with SMTP id v8-20020a05600c470800b00410ebdf73afmr6492736wmo.7.1708091073993;
        Fri, 16 Feb 2024 05:44:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd13:6695:6348:c567])
        by smtp.gmail.com with ESMTPSA id u4-20020adfcb04000000b0033d24eab9c3sm509455wrh.76.2024.02.16.05.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:44:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: Pass in prefix mapping variables to the compiler
Date: Fri, 16 Feb 2024 13:44:32 +0000
Message-Id: <20240216134432.127544-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 13:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195767

Avoid:

u-boot-1_2024.01-r0 do_package_qa: QA Issue: File /boot/u-boot-qemuriscv64-2024.01-r0.elf in package u-boot contains reference to TMPDIR [buildpaths]

by ensuring the compiler has the prefix mapping options passed in to it
to correctly remap the source paths and avoid the warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b3482dcef31..79f84b0672e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,7 +9,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kerne
 
 DEPENDS += "swig-native"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
-- 
2.40.1


