Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9742C02192
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:09:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8294.1738138158648563952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icU/1cvK;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3863703258fso227852f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138157; x=1738742957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuKQ9GNg44GhoJVArD3IXlYK+s20ZN0MIShn8cDnNdg=;
        b=icU/1cvKIEnDS4L4eAwrPy8sQIfRBnTKQDWcl59IQP9FVNrYvPKHYEStTn8kNE+1nG
         YWxFxaWu/0SFMYzBMHXFPLA+p5lpPKW3xcDvlCSga9ovLn99lClfKrkaeQpPu8sSKdjP
         LUYC/smRuum7FOFkHFonxR8GCpuWVdahcMGvAempG4mj+9FfaYWE8V6wi6sKRKw3x5o8
         /YGluAYACzfPpdqRCUiO5Pa2+HNb4VtDZlooQMKNc+69gSRpnnSeDdQYPVcSEVPy3zkJ
         ocgw6QliTSq9PBi4xWMT3geuAvtfV+nVCsbZdpxRP+Un8CodJKnJUQ2NC3F9dN/LfwvD
         MFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138157; x=1738742957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuKQ9GNg44GhoJVArD3IXlYK+s20ZN0MIShn8cDnNdg=;
        b=s2R3VIhiaHI7ooiC7RYvqmAXwWLN71Q+D5h3BaSEpHBBBfgY0W65BAqhvwmOQ1mHMK
         csXlQaMAk2VXLgrOaPS3Yc4yfleIk+NhOOyUpztTBHXf97YJJuhV2+WfP5DXfxvlD6Pa
         5EFT+jjsCihUObJUV+TDrcMNsWrj6qjjsaQQ0OPRnuQAhLnDjgAUFSJO3PNYTHsgRcqm
         UdEaMVIkvIFpkt24EuZiDIPkPk+kSTPWqq3rQuDEzJxXEki5IzYWSTlncO108w3l6Avz
         KIA9nLZMjPfDbKiQUmEGJo658lQypRBxsJy5QjwSPrHnTxEijB6hURY59V1+p2tSOmMI
         +eDg==
X-Gm-Message-State: AOJu0YyfcvNwz0ktjvHDFRA8p2ucPnFuXx2CbMZXhq9KcltPgKc339Lq
	/6biK2L92+KCzy2R8J3HygKjenwBNKQU43/5i0PgO/Y8KA0NjiUji65rig==
X-Gm-Gg: ASbGnct+BGDlXRCxYoWRF82kX7UZq3eJffUmRqjMtH01bJDXtT8QgnQJUsF1vw7PD9N
	U9B3AUxnWK69s1Jxo4UofBeSKo9iFoApM8m1pHNrsq/HLcV2XiVp+nUvj5x5drPzCIoH0IvIcXn
	j8MYMIgGtAIKMbdPS7oICZYvySyJ2oJnmLFWd2ILXsXSc77E1sb7PERURKNReAqAkWGxROM8AH/
	3EP+tRd+R2qFZUFJ5fRhfaaOhexUTki2Vhjxo7cdK8P7IHPVA+trbwjvYOQ5N0bOhVTTTR9nOgg
	LERp5qnm1HohrjdxPsBYj7OobAZMmudsb9J707WJQqJZ4g==
X-Google-Smtp-Source: AGHT+IH3ZabkZk2f1bEDWHYB4AmEedmv+iASWP1faifRJA40zpbuQCeqwPnjbhDIZ0iOWI53M+7tng==
X-Received: by 2002:a05:6000:1447:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-38c50fe00f6mr1849250f8f.1.1738138156697;
        Wed, 29 Jan 2025 00:09:16 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188fd0sm16618394f8f.58.2025.01.29.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:09:16 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH 1/3] cargo.bbclass: Allow using --offline instead of --frozen
Date: Wed, 29 Jan 2025 09:09:00 +0100
Message-ID: <20250129080902.1863054-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210347

Some rust packages complain about the --frozen flag:

| error: the lock file .../Cargo.lock needs to be updated but --frozen was passed to prevent this
| If you want to try to generate the lock file without accessing the network, remove the --frozen flag and use --offline instead.

Add a CARGO_USE_OFFLINE_FLAG = 0/1 flag to allow using --offline
instead of --frozen for such cases.

Use 0 by default to keep using --frozen as the default flag.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index b583f84bdf..fe5ce9b023 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -37,7 +37,10 @@ BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
 # and will require an up to date Cargo.lock file.
 # This force the package being built to already ship a Cargo.lock, in the end
 # this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
+# Sometimes --freeze fails because Cargo.lock needs to be modified
+# without version changes. --offline can be used instead.
+CARGO_USE_OFFLINE_FLAG ??= "0"
+CARGO_BUILD_FLAGS = "-v ${@ '--frozen' if d.getVar('CARGO_USE_OFFLINE_FLAG') == '0' else '--offline'} --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-- 
2.48.1


