Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB57CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:12:55 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.3565.1755799972598731413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQeaTsnd;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4716fa7706so864604a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755799972; x=1756404772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyE+ihWmvU4d5ld6jAPhwcK7RAK3Oxs1oBLVxkkyblg=;
        b=LQeaTsndVdfhmDQySAei+CeP9g9St+JdavRRnDoIbJqfyMekFhn04sQ1jVop9iTis3
         7rcNlpMVqke241A3gUj9+DzWcyx3kRC9P4r7JV+HY5P3rTFoFjavYAAawq6w9m6KPjl1
         1GURyNeUBCRaCD8cP3CrXLOdWSxAWCAmbwL7FumaKxNJXiaSmaC0OCyGF9EFB1c5jHS6
         zIrMvCYo17Ra6BgyKldO5z6O0kay/jh/DPCxYtR5j42EsLJiD/I7St7rrzseoiTLs1S+
         CpSeMx+pxLO0BUgshdKviVzo0n2uYIWWRWvAH0DsfuRzsdLNKBvd6ou3aVAvdoBIhBW5
         1z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755799972; x=1756404772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyE+ihWmvU4d5ld6jAPhwcK7RAK3Oxs1oBLVxkkyblg=;
        b=DFgJsORDX2/ehec4LeEwPeF+6B1yQVM4AecLiHxr62N99eOTmdfAQUtPa5UA6n+nFq
         X9h75FXHv9ZLorfkFvMl3jM4HD4sG1iyNoEje2QlCSvkL/hQP6r9n544zOPe73Fy1QWs
         sKCqH2vfBjJuRMtoYGtVAIlGG6P/1YQq5EisJ3oYp7EAvyGlwQa1I1Rglm7pAZjw8Anj
         VFFCbBfSNeW1Vt+Msa4pQa4snkLLGxM6bFH4R/wxUQNMXgYxc5Iv6yl2njTmejkxNydm
         Vd9mdPHRzJJb8Xq06YT5CvAI+gYZkxwUx6yEclj1N07EOthVAUbBGBhJ7bcJpah02zxd
         k9DQ==
X-Gm-Message-State: AOJu0YyS/ZXN6RxnxIcl7XPA5pPOOE1J9W4IFvK9zaefGjaZAmqfnW/e
	Ddu+Nzx92U8afgzFQ2/6N9LhnfGR36J8ASXHdDTA3SdjeEEwt9ZnOBgbeBZIvBSV
X-Gm-Gg: ASbGncseypiqv41I9J1SISXphzdkjgTR146fbxhUR7q16L4P64+yn9l0dr63F1HyDE/
	PrGYUTD3JMYutg+ZOqm+Jl3Ve+HR6drNb7CdlHAkCw23qIm39iiF0Nkl62gVJqKDgKnapJthtN7
	BH10qJcRxKL5UHUEzyK+YwpheJ5NYz8Fm7CwtLNlPJEPG9UF5BuGIxJTPR7uOhhDu5WtK2lq/Jh
	5LZAHzIDY1qIWvmxohqcyLdkD0/YZZ5Y6BNydksF64q6iY0YgeZ8ruqyKWmTnMvtYvjJKGcm8Tl
	o0ww6uI35Z+OJyNO/byI+PHAACCK1INhOTCCCusxnSxYVYQlF9ptBRuAFJIceWEUgL/N41VaU45
	djivVpuAXKB3eJE2lfFZrlA==
X-Google-Smtp-Source: AGHT+IE1zPb7D3T6keBDfeAzDNDRpD8YwZK6kRk3qR9ESy6Pbr/ZLIvPEwXWR1+TDp8rlNRqFw4JCA==
X-Received: by 2002:a17:902:e5d2:b0:240:3f43:25f with SMTP id d9443c01a7336-2462ee8debfmr3741905ad.23.1755799971573;
        Thu, 21 Aug 2025 11:12:51 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245f2820f48sm52375285ad.149.2025.08.21.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:12:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] findutils: Use C locale to run ptests
Date: Thu, 21 Aug 2025 11:12:46 -0700
Message-ID: <20250821181246.3413165-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821181246.3413165-1-raj.khem@gmail.com>
References: <20250821181246.3413165-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 18:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222279

Ensure consistent locale setting, since we are not
using make environemnt to run the tests like
upstream does. The test scripts are run explicitly

This fixes a problem with musl ptest runs where the
locale-driven quoting ends up using C.UTF-8 quotes
in gnulib’s quotearg() end up with curly quotes
instead of ASCII quote character which is expected
and result is reported as failure even though numbers
are matching.

Fixes:

-find: invalid group name or GID argument to -group: '4294967296'
+find: invalid group name or GID argument to -group: ‘4294967296’

FAIL: tests/find/user-group-max.sh

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/findutils/findutils/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/recipes-extended/findutils/findutils/run-ptest
index 0c9af47efdb..afe004b01a9 100644
--- a/meta/recipes-extended/findutils/findutils/run-ptest
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -13,6 +13,9 @@ export built_programs="find xargs locate updatedb"
 # this gets substituted by sed during build
 export VERSION="__run_ptest_version__"
 
+# Force ASCII quotes so exp vs err comparisons are stable across locales.
+export LC_ALL=C
+
 for f in tests/*/*.sh; do
 	bash $f ;
 	case $? in

