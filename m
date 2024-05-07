Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7A3C25B10
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.1138.1715044501347910064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LfL6zOgW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2b273cbbdfdso1822448a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044500; x=1715649300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf2RGC5EPIY9bfFJVpF5LvWRtFcLDidwePRmKNMHgEg=;
        b=LfL6zOgWamP10aCo3vJtgw05oSIUtCfyufonhUg4XPtvQz8D90P5HTfYXYuRJytJoG
         2KqXWzz9T8F8lGwk6pOe2j2tSf+KwRBxv2VEBVoF/TUCsAZO3dMCN5f6GUgTEl6By4YS
         IxizmFlKasPRCsTMM5ZbF1Rfr1MUOAl2Rgs9B2vHVZKZVY2cYYOOpBB+mW9z4hMVxcip
         +T92XaiZlREW7HQBObx8gC9WXuKUpalO/ZbPQIzyVvbBOxEO7Ob28sDDLrwj1eYo49RM
         lTcvvyeZcU/hPXZgGYthN93PSjybLOxqcAZdW5WP4EA21Oo/p6qVqZ0YQ22raRJzEaqH
         svbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044500; x=1715649300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf2RGC5EPIY9bfFJVpF5LvWRtFcLDidwePRmKNMHgEg=;
        b=mxLrI93gJ2VyIqhocYWt0OyrDu/J1ieI6EccHJGwGCozeYP/eaSwxK+neea66UHhHc
         xjr11EmYqckHFceVF5eCS1A/5dBmhxCxtdfMK6KZydVhzTDf07OkGZ7EbBhZ6DEVm2vY
         bDvLMOnOujDpd0+D+5FK9iGzbr8EdOTnAInn/0X2opBobYZ5ENs0Kw0jRjwUnz0LZass
         HHwAwAANLgc5bXbGZmPfVLElagGZskhbmA4sjHLoNkhGNyieZbK5NcAlzS3NFw7oTxTT
         F4duKh46HfLEvtcZemymttHE4bmoYquW6zRfLFw4Ul1yPKfxuBWIhGS7F8JfTaNsJEch
         fueg==
X-Gm-Message-State: AOJu0YxFPN/qEpQzVzDvmlWJ7m5oeWN73CvDaGeVe6tCXa9yRodymw27
	WxD6rLRVjU2TVhGl0rIWHPZ892nB3j/unyajcTFBDmoV4mFYbFAGJstlcM35
X-Google-Smtp-Source: AGHT+IGG9shXSGFFo94pFtBrF0Lvyx5IdO37woUOqj7+g66L+7wrhs+2zcaJWtSX6qsE+RQFXwXDAg==
X-Received: by 2002:a17:90a:f289:b0:2b1:817d:982b with SMTP id fs9-20020a17090af28900b002b1817d982bmr9760979pjb.14.1715044500159;
        Mon, 06 May 2024 18:15:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:14:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 03/10] libunwind: ignore various issues now fatal with gcc-14
Date: Mon,  6 May 2024 18:14:48 -0700
Message-ID: <20240507011455.313230-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199050

From: Martin Jansa <martin.jansa@gmail.com>

http://gecko.lge.com:8000/Errors/Details/821679
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.6.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
index 3208785124a..c7b1604b611 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -40,3 +40,11 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Build/183144/
+# libunwind-1.6.2/include/tdep-aarch64/libunwind_i.h:123:47: error: passing argument 1 of '_ULaarch64_uc_addr' from incompatible pointer type [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit.c:348:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit.c:377:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit_local.c:51:9: error: assignment to 'ucontext_t *' from incompatible pointer type 'unw_context_t *' {aka 'unw_tdep_context_t *'} [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Gresume.c:37:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


