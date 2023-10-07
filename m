Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACE2E95A73
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:52 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.27686.1696717547874584992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RZWdKJWf;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.49, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so2470824fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717547; x=1697322347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XL9k6JUaqNgwMnR43XCNJtWQUgAFagzeaIdrCMJNjnM=;
        b=RZWdKJWfu7xpQztZ1CL99EBkULqVuy5Cl1B02YTLEz0XeQMohDZ0n9bhGsrM+06ntO
         +sySYIklztiz7NAtyK06yJ/XAOvRWr3w0NaH2RskP1QYwkmynP6IzufyDL1JXy0N3/P7
         ZR4BtKN6AQREeq1TZUy0Stq7RLVHr70yjsNnRJaAh6S9LgCTdJLOwbkd4U44tzceRObK
         WvxkGNc8CkzSAPwdjSKs2kFv6tGp4TqpUTDz9rrfvs0nFn6sh5kSCIJLz0lAq2zYBtq6
         WDi8NddaZf56KpAZKxRlkE6JYckGHaBH8KIiUHy/yMu3im2oaC2FMDvTLdRf1q8XTL5T
         u9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717547; x=1697322347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL9k6JUaqNgwMnR43XCNJtWQUgAFagzeaIdrCMJNjnM=;
        b=aKMN+CPP3IxsUq70Th4MKJof+Xx2+NgAQNq4lCQFG3YQfOXLJYSKT1cDupJjTwz/mr
         +aquZap5nLlF5fCU6Ne4in9wLK0K6B0AAG+n11oCRNPVEalDVYjWWKo1yqI4XlvLk8lK
         F+jre1oY9pN0zXLjbiydm1LiFFYhAFAmW09VugwdtGBj4mdzuPTNpLN7WRoy3IBR3lnH
         49VvKnghrRfIC0RFrRJbFAem0H4lTAvpgoOf2HVHKJnCmEA8/RtZXhUw9pCFVYn7W/wf
         sw0y74K1EP1k41r9dlL9rSMouojYa2eWh4XXZ9nvqf2ZL/3f95mOC7dxQSD3N16onrrl
         tHlA==
X-Gm-Message-State: AOJu0YyNJvyOpawMHMAeVy9UKBDdu4jzRIT5AEbbzux9nthDA1vBk0KZ
	1MOhNtxa6xMP6RNVda8z3NkC9Q786mvwYgf63z4=
X-Google-Smtp-Source: AGHT+IEmwI1M82wybpkOVFPS7VCJtzMo3AWQ7fzUmx5QG6buI3i48rnQnuKXrltj2Q7WCzopC3c5vw==
X-Received: by 2002:a05:6870:b294:b0:1b0:43b6:e13b with SMTP id c20-20020a056870b29400b001b043b6e13bmr13763657oao.54.1696717546876;
        Sat, 07 Oct 2023 15:25:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/19] gcc: depend on zstd
Date: Sat,  7 Oct 2023 12:25:08 -1000
Message-Id: <fdabb7a54bb994d3680c410c8a46eed30e23ec47.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188813

From: Sean Nyekjaer <sean@geanix.com>

Add zstd LTO support for target and nativesdk compiler.

This also brings gcc into sync with gcc-cross.

% x86_64-oe-linux-gcc -v
[...]
Supported LTO compression algorithms: zlib zstd
gcc version 12.2.0 (GCC)
% x86_64-oesdk-linux-gcc -v
[...]
Supported LTO compression algorithms: zlib
gcc version 12.2.0 (GCC)

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-12.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-12.3.inc b/meta/recipes-devtools/gcc/gcc-12.3.inc
index 5655b6f46d..0518b1db4e 100644
--- a/meta/recipes-devtools/gcc/gcc-12.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -10,7 +10,7 @@ BINV = "12.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
-DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
+DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-- 
2.34.1


