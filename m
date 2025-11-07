Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEFCCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1144.1762556783320336883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lL0nkOKJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so216442a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556782; x=1763161582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=697pTWrzF/GJkmzrh8Vwe/3efvUhh9ru/Otr6GOdT4M=;
        b=lL0nkOKJcK+hdQARVtgInSi5/RZ04/C1ykR8MJ/yikoVV4uQ9S26UgLl6F8j2Y2gSg
         DGbisk2wrCHzWLyNnTmZoGhk2EqLycHWAdE4CJN0Dyhbr9Lo4qFgShKq7JgHXzLXdGTF
         csQiSV9UPwLg34Nc0MQdWqMITtdTBSgKkJBMetBbwjwQkELxNx6Uy9T6k+l2NI3ywsOM
         /5ngsX2j+cZfak+f/AR4NlhclC9hG+g6kjL407ClS3LfA0dhZ2DOZuJ0iVe/lEWAsP4K
         MQZBBNun9/PK6i/DnFpqihUCatGwKV+nkWVxpOR409RgeIF/ImJebQdjsUG4t1m4BF+P
         kBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556782; x=1763161582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=697pTWrzF/GJkmzrh8Vwe/3efvUhh9ru/Otr6GOdT4M=;
        b=J3L5wKPrZqK1k8/EBAWTvSeLkksf4/ieUq2pq3ZomORStF1TyV48DR5iWrllk83XzG
         sbuOqihrN88KMbH0jANwAzOnrfMN3XAo0DGLmbCPR1A7y93dfCHEGU866j+gvtEcp6v6
         p4ZyaHpz1AgtmjxUtCL0p4tlp1UTuTSU2BfHL3paoZY+JChpqZPQVf2K1jnVz6vurxsD
         cbx5ylbTj2RK19+E5vpHIprTz7ogmW52AXhHT4nfTlUufbrGmNvpJZPCbM1H+vGkR9Ha
         QgxUqgj/C3qE4/G6Feeg5ntQpSuCBg8rEeuPw9XIw8X0nRpyT0cmsr4b+J840IWXc6Qi
         qeiA==
X-Gm-Message-State: AOJu0YxZ3saRuUfURGSNtJokfGIs66Vt+3Aa0RpwrlYLjUPLaxWOLbA7
	oZxAqHHa8yFxAeCft8AbMy2jPnuqDH6oAEwQONPP1vb5sNgMvqVFaAWo3z7fvBfq3pA=
X-Gm-Gg: ASbGnctwEQhw+f0qDWPjxMM43ov8pFXvDheSkYn1WPnXvNuwrgBOW6vhV0XwySOzIyf
	hD8Pny5Vg49a9Hq856GAOLPKHVGgtd0hmwRyz03Jx1T3oiRX0Rd8PXdBOfdyxUMYW9iCaHRp0wM
	k4ccFwKadkXYHVm7y/8CasoJCxVA7U39Y5U10DndXwsSEWQn8WEDH45OXlyBm2Ev8FMyRPei2WE
	LBay+GyJ9QkmQaFzaIMs7xWx3e41gXUs6DwYTqx5VmuqPuYPqBhbnyCr/45bMM1PEc/aVxHsef/
	bFkPmbL/QuMGy6YumpGbzlSuULuw9lC/9A0wXtumgME8tcVWUq07MyJb0r34qRNtZl8jOzI/Xbf
	cOAS6FgVEFipjAj1yw4slDftiYH1XO9445MY4HhS3bg83vvVLqHpvjSpoJnbj1HqiVu4IW+P+Ot
	ZlBkHstlc4UKVoN8cBxCCJGozDaFHbawIFnfp4D0xhLjvyDjVDLh8cQoOj5rliAw==
X-Google-Smtp-Source: AGHT+IHcdl9806UMrwglMZG1aHqmPvLQdf+VQbSzgAu5DJFQssa/NquKlpP8teax8wZVRRDqtY75+w==
X-Received: by 2002:a17:90b:2788:b0:341:719b:768e with SMTP id 98e67ed59e1d1-3436cb7b675mr788281a91.2.1762556782417;
        Fri, 07 Nov 2025 15:06:22 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] compiler-rt: Always build c runtime (crt) files
Date: Fri,  7 Nov 2025 15:06:14 -0800
Message-ID: <20251107230617.364804-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107230617.364804-1-raj.khem@gmail.com>
References: <20251107230617.364804-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226070

Makes llvm runtime provide another step towards providing
platform C/C++ runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index f42f17e9ba6..b849b64515a 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -41,7 +41,7 @@ UNWINDLIB:class-target = "--unwindlib=libgcc"
 COMPILER_RT:class-target = "-rtlib=libgcc"
 LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "crt"
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
 PACKAGECONFIG[profile] = "-DCOMPILER_RT_BUILD_PROFILE=ON,-DCOMPILER_RT_BUILD_PROFILE=OFF"
 # Context Profiling, might need to enable 'profile' too

