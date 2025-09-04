Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD04FCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:15:17 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.32437.1756962914803960985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9Hb8R0Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so347981a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962914; x=1757567714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvuJumT3wA6/dn+mUwB7bFx9HdS27KfZlBRVqvoWlHU=;
        b=d9Hb8R0YK0CZjE7cos+80MbNHGeidu0dyHXI8G7g0691QwZpsRGM5+Hq/UC5q8FqPJ
         mVp6PimOI2o0rIXb5HqYMb6MW3PCHqyVlfKgfbJqz8yF8lGF9RjWewxAxUHveMsBjDfT
         p+muR1Uk6PzGyJUIr9MTO5QKNKJLRBhz64mdToGKc8c2YxZxjaqiBESSpnLdd9d2O0OH
         YBBR/BtuoLh999UuTvoDpimuIPgnIxlggh/ybIiiVoYRB29BI0NngW+pE9b9YqwYFTMO
         6br8bWdRXrifGwOk+rwo01ZF2RXl1IzO/j1qstXaPjq6hqTNun7sTou66zbLWH0vkjMQ
         mn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962914; x=1757567714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvuJumT3wA6/dn+mUwB7bFx9HdS27KfZlBRVqvoWlHU=;
        b=B8NhsJEznehA52+skjtQbCDi9bRH40ZqAzTYD8Hn3q+0n9bZHk+dXfICztxzj/XQqV
         k/36n52TnqhDLe/rziRrlhMmRydFJ6w7nF+8a/Wi9mvo5WUKcwXcxe8ocZhKiGpPo+rh
         jPD4MptxrRagnYRZfIz/l7OALU4nvvY/sDrdAg9mE3JB3jjQEqFog6iGHycwVL7+Mznm
         klLvvOCMnLGPxIN7RNwBHgcHK58ZIGLL7kbQyRi1aAI+WpdL+UYWIIzT7CUX3eOVRZF8
         vLAkwAkthQgOW7lrRucSU8ZVNJgxlN3iIn9K6JSbIDu3zSPHP8P+eyuwbSMX8qYXvoPa
         8zjw==
X-Gm-Message-State: AOJu0YylWr8fpI8gx/unsNOhimbtZvS2voERk+HJPRSo0T9TAMMk7mX5
	eOgucexmzFoI5cXBjDT8fXD0FoCKN+9q0pkXTXAktfpf8biQwUSErJuGwxrAV9nu
X-Gm-Gg: ASbGncu8ehyIb0q0iTyzjpetnTUt46FvB50xaJz9IJ849GF8dc9uUvWbpMdqaEymECm
	9LOTorZYQdtp9WoKXB8GM51EMA916cbf1shAudsasYjTK7HO4jQXUz5W9z8nk1ANdNm7fhzboNU
	WV9qsSh/4XNZKnIN9IWMiXD/17lBmU/uAyGKbIyLMCIg+65ntxLBavdnDs9SGXlfTCIddggwYad
	eohEpNfOD3cCjtaT88lpq3MPwsHUdt7PkolO0+1irJwqbe+kkf5f33paIzXqjsgh16nkrPhaXt+
	a9mocHswQyAYToHIi2Xf4WPjB+QvkLxn2yGpiE6XSc37/3AaanJ6Ev94WYSbOyyoA8YzVL1ZXNN
	kiJocI6kAnPdgUU6EjE1GI+wIjQ+iw3nT8HCkxY9eLpdFxKbLNeBtUGwIiEiWEirLIXQaK+/iVA
	xDgsOxAIX/nxraUoGRTEJEN9lp2Hgrs5ORq3JrpLZ+pObtws8pLNw=
X-Google-Smtp-Source: AGHT+IFsK/93474hEvCtKqZ2a/f2wKDXAEqSPTGxoFvuQma5ibssO0WB1R9F2U033VjPMIqn4LKfZg==
X-Received: by 2002:a17:90b:54c5:b0:329:8160:437a with SMTP id 98e67ed59e1d1-3298160446amr22434001a91.24.1756962913919;
        Wed, 03 Sep 2025 22:15:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93317f0sm18756121a91.6.2025.09.03.22.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:15:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] grub,grub-efi: Always use BFD linker with clang
Date: Wed,  3 Sep 2025 22:15:09 -0700
Message-ID: <20250904051509.798465-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904051509.798465-1-raj.khem@gmail.com>
References: <20250904051509.798465-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222899

LLD 21+ is erroring on text address being lower than the default
segment address for binaries. Erroring during configure e.g.

cannot link at address 0x2000

With LLD 21, -Ttext,<addr> only moves the .text section
it does not change the image base and LLD 21 errors out
if any section VMA is below the image base and the segment (image)
base still defaults to 0x400000 when using LLD, hence the error

LLD support in Grub needs to be done properly, it will need
to adjust how linker options are constructed in configure. We
default to use BFD linker always when using clang for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: No change

 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ffa04e415d3..dd1587acd6e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -71,6 +71,7 @@ CFLAGS:remove = "-O2"
 # CFLAGS += -mno-mmx -mno-sse
 # So also remove -mfpmath=sse from TUNE_CCARGS
 TUNE_CCARGS:remove = "-mfpmath=sse"
+TUNE_CCARGS:append:toolchain-clang = " -fuse-ld=bfd -Wno-error=unused-command-line-argument"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \

