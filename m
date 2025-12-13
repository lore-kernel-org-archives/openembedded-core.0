Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F98D5AE76
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2905.1765620106918200277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BASX+YDw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29845b06dd2so24143405ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620106; x=1766224906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCRtQR8hJ2UBSZS86v8DpjZTfYXgHE8Yz3X1UAYseNY=;
        b=BASX+YDwUDcbrRNZibaezy1zOZTQ75Ac6QuXyPME2iE90ki0m1IcSrjxclpJF38rCy
         xg6CakKIX2mkAT7jXH0XfAYYhOVd3BPI1isDbQcj5Eopk0AJVHbiwoctPOvMH1OXqWCr
         TvlNUIS6HgCWnjPCtUuNR24NfhbBZm5AgXuQs6DLbBIy/jrkJW/0irXLX/leWhVELRiu
         8f5KohbzhXjvd211VSCbFzdG8KzVsuEBCu7fyLchMNucWzoBNjno1ePc5wflrviRpHAz
         RVsctDqwFDI2bCTgQEjsYXgZeCFrc4XvexjleTNY3iAprB+AE2SJ8WfksmBeq0cYaiVQ
         bUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620106; x=1766224906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCRtQR8hJ2UBSZS86v8DpjZTfYXgHE8Yz3X1UAYseNY=;
        b=EsyBpmpvjryjbotH4AeAdXwusqC+sOBjxR4b+5E5TwmkWRq566qZUK+hW2R3lR4bi7
         PVvNdqZWR0GIMTHKC7qTgmBosnOn+feFmbNbRaGrBzxSwCXlSloNOQvdBMiQHa9kRHfG
         1S7+do417Z+jJ98W2uAZr4m3XbjKA40KB8vEHndL8/TB5dWbsDYmCa6ZSGK5ndaYRkgV
         F4xkR3HRInftmFTiX5dZOnVvEgWOrE7ZSk3GlZ75yzLSloyqeaw2gICZ0CmXzE+3BZPT
         fzsqyzVPPJ4IXPl6ilVZV5I7l+DrIapzwcOBd3lR16ZYPqfooI5PqKEXgahWhHzMBil6
         /zKQ==
X-Gm-Message-State: AOJu0YyNT6y4vbgddAgrAuRRXV3x+tNImmw3GoHQRuEkHm8YgnbnFwqT
	3KeQ+AIKBxQxuQn5CXkkfMi0u+6sjWr1VsxyXTltZXERui6bgkaqDNTPMupyy93i
X-Gm-Gg: AY/fxX5wrPy458zddVSHbEUkUGQiG/uidpxaUgdJzgKSAPRyzCYauJKxTf7UhMIpUSF
	RXRdTwwhstdj91WlWhtTrwogQ86UxpB36kqew4HR3nNmsbAg3x/0SBmbn/Nbz3pyPscrRDg53cT
	0V4sgXkRikxMGg+xH74d4Gr3pQqBIPGke2yYNQITerCGoZ2FgaGs6zBzPB5yAHFCmdulGMNHP7e
	/R8EXJx2HPENsxZBtmABNcmWR6FMXY8JQRjOEHDnyS5bDeKT4CqtKGU9z30Slp2GBI6lQmSmXYW
	juJb13jSwSaAQKJsGWJBLZd2UqwRKm68EY+/0u74a5yqAokW4haB0F/LMoe8+VWUrj0ELTDinmo
	yX5QBlFVlZHbbXF4DlYzHkiegO0RSyqLqpCq5bBxxqogRj6re2Kh7C/KOhtOrpWDzHIUe+lEKuW
	LQ/H/6wKwyX4B85WKB+MzwbFc/vWIVowfjUt0=
X-Google-Smtp-Source: AGHT+IGwZ9DXDiXNGYO1R3aBtbaip33PaPmhUatiOENhuxnxGQtUqSmC1Vd1kisnYkVnHk24QqmY9w==
X-Received: by 2002:a17:902:f54b:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a08963c3fbmr24425775ad.45.1765620106159;
        Sat, 13 Dec 2025 02:01:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 46/67] compiler-rt: Always build c runtime (crt) files
Date: Sat, 13 Dec 2025 15:29:10 +0530
Message-ID: <20251213095931.2571498-46-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227664

From: Khem Raj <raj.khem@gmail.com>

Makes llvm runtime provide another step towards providing
platform C/C++ runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 56fe42abe21eb5a5f809abb9893d8f33dac8bc12)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index f42f17e9ba..b849b64515 100644
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

