Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6BCC7EE39
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.78.1685068174234047285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=dYUkcADM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-25376483f66so290172a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068173; x=1687660173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CnDIDblaaai06IYBWngN85t0xWtWgp17a+FWHrropg=;
        b=dYUkcADMJ9GvmE4KyU8QhwF7SNTZqRiUj2vCe0BQaT8xRMeTy9oSXmLfVeQuI3ZHoF
         A+fSObj9EAlPcm74lJINAvGgDka4Uc6W401ztUJCBKAOS+C9B8tZ5ihc9IwjAUs+cB+D
         5JFbIwHUf2LoS87my9EyWuDCwNdCY2A/ptGV7gDu6vFi9GBATD2ZKyQNuRv4x2V141xh
         7eMNNG5e5QxBZOoi5DNgJ/UutmNfUpKn2VS5HUSlyRhUQvXbTk4YXmciK0H0T/n++m6h
         nn4+wmBHkPQ492cI/1hSNOzGPjCEChRTIit1snWqC1EtS6985GGL1RDcZkR4kHlbQKSp
         5fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068173; x=1687660173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CnDIDblaaai06IYBWngN85t0xWtWgp17a+FWHrropg=;
        b=NGsO9AdfzSpVezU6aFUCmMExjgqCms6MGZ3XPgxPFd1Ubt5dj2yzxFvL7QfCLj24km
         5z5WbN3AfFVKnVJuy0HZ0gFiCeLOKtlKKcNSMtgUnJRM9fDiOya7vWFd+wt1Lf6E8l81
         cw+/hr7hdKvWsHy1F1witjZvIXmzSmPO26VyxAGJDMm4Iu7sG1G/819ggiM4q4QmDA5T
         2XG9LgymPNzCsp7alhWV8bLrJQE19JQAWNU2zKhpapWcH2E2kPwnMyZ0YOfCR/V+re5c
         Ka8dp9kMAOCoptJqT5yEKPkSpuHLGOhmKI15fGWttKZRpvAschxJJkVkMkmZY8pnD3ZU
         k7XQ==
X-Gm-Message-State: AC+VfDy83u/t0wqVeN7pptPq7iWTOaonGYF6Q8KMvKMugaWMvTRRRvNB
	xeWPFFRVBvGg0NipQUPmxMjJNWjeBKu+4k7z8rk=
X-Google-Smtp-Source: ACHHUZ6tqb1pNXw4WyDde4eBrrbhsKB0a55VEI2EvHhprQ3yNqZeLiHVzBeGU48nvAIvaDda8XppfQ==
X-Received: by 2002:a17:902:c64b:b0:1ae:7421:82b8 with SMTP id s11-20020a170902c64b00b001ae742182b8mr877429pls.28.1685068173366;
        Thu, 25 May 2023 19:29:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/21] gcc-runtime: Use static dummy libstdc++
Date: Thu, 25 May 2023 16:28:54 -1000
Message-Id: <4ee9d5839669560ec10f23445fa8bbc03a4c5406.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181738

From: Khem Raj <raj.khem@gmail.com>

some standalone targets e.g. riscv64-elf disable shared linking for
baremetal ELF ABI in ld, therefore lets make it a static library

(From OE-Core rev: 3c6219dfcbcbde314648ba8cc54a90b32ea1c952)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 8074bf1025..d019b0790b 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
+	${CC} -x c /dev/null -c -o ${WORKDIR}/dummylib/dummylib.o
+	${AR} rcs ${WORKDIR}/dummylib/libstdc++.a ${WORKDIR}/dummylib/dummylib.o
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.34.1


