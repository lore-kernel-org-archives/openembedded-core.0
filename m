Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E517EC83F19
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.10487.1693064351488962700
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MwFHS9R4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so1510086b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064350; x=1693669150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlTO/P4SQX9J6dMaUrCpnS+GjUIpQsckBIFsA/Erscw=;
        b=MwFHS9R4nb4y0yDgyXKBC+JkWp/4Ga1cuFdhSLziEFTNQGUBS6yPKmgrvwQoMn/ORb
         RgOv1OztwSmwB2mY14W3y8L4LlvAq3GVlzqjgC0iKEprFOt8kq+cBDa4BHamh2VOOWB3
         rtOeSneSw3VYSoFgxk1VFGi4VVU9O4kXPJh048BTaeQMHW47V8zlrYHipi0FVkC4S5Pd
         amx6OpEN8YHhFVseq3aF1a0VYACJsODRnKWhxfAbRCOj3kSgiDIk/CKY+Knx5wDWU2yh
         3oRd4uJ9GFEjCdR8ubkuTCIC3CEkf3lAJXAIN6YJe4BU935nN4Y3Ng2wMkf8OASflRpq
         SasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064350; x=1693669150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlTO/P4SQX9J6dMaUrCpnS+GjUIpQsckBIFsA/Erscw=;
        b=HPxUoFHKj8M152RCpZ6TNrsuFp9so0Z27zvtV8Ktg9SyZSKI/dvlgDmIIKDG3hyF3L
         8SW5V7M3AqVr8NNQdn85jJLyoV9RdmQUqqOm15FX/vK9zf6klD6OmSvTjsbLL/gaaDGK
         GcmOABgzxOWxQryh72pReHNMdtI6irz0jwwMbfH3q6qMappZhVAi8PSh2QZrdBeNqS1G
         PWRsOfoxFEpIJDW17BwauKkSaM3MZqWSiZzJGoGiIIAw75q2dNX1SWpr6iAJRk2RwnGM
         oTm09nmcFuY17fPawUUV4+nS7yecbLwPZ8RvltEpFrSsflH/p2+zcLZnf9xiD4mSgzma
         xIZQ==
X-Gm-Message-State: AOJu0Yw/e3zjGxIf4RjgnDESNCPc9lGhWlUDUuaX9fnsczzp17Es3vaV
	DsHMtiQDMLUMwNAUWswk90bjR4WzEXulTIQqV/0=
X-Google-Smtp-Source: AGHT+IFoW4899mOxa606+63DnxEmX9f/YHCu6QThgsF1bho1KYYbw2zLIWwn/2dSSZ6hH5ufyVZJ+g==
X-Received: by 2002:a05:6a00:850:b0:68b:a137:372b with SMTP id q16-20020a056a00085000b0068ba137372bmr15826572pfk.19.1693064350530;
        Sat, 26 Aug 2023 08:39:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/20] glibc: stable 2.37 branch updates
Date: Sat, 26 Aug 2023 05:38:38 -1000
Message-Id: <eef4f4502390d1e18770c604477dd63a1adcee6d.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186751

From: sanjana <sanjanasanju1608@gmail.com>

Below commits on glibc-2.37 stable branch are updated.

58f7431fd7 sparc: Fix la_symbind for bind-now
260d4b742b nptl: Fix tst-cancel30 on sparc64
3f4b4e2cdd elf: _dl_find_object may return 1 during early startup
0930ff8eb3 realloc: Limit chunk reuse to only growing requests
8dcb1a5181 hppa: xfail debug/tst-ssp-1 when have-ssp is yes

Signed-off-by: sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 69e637e810..ff2b2ade9d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "3593050c27dcf691f670fd3fa9d347c99351ed2f" 
+SRCREV_glibc ?= "58f7431fd77c0a6dd8df08d50c51ee3e7f09825f" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


