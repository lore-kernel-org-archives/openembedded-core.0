Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604B5C25B7A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.4767.1715060006156776876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTNeHVMr;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2b2b42b5126so2392117a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060005; x=1715664805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf2RGC5EPIY9bfFJVpF5LvWRtFcLDidwePRmKNMHgEg=;
        b=NTNeHVMrDGgRr87XPfUwIxW5IQvR6gmFp1RBuQuiITDjUcPZ8xXzZQ3V0L0WrgpCxj
         BhFdq22nq+Ld1VxTWmDm4i6pa9+6MHAq+pnPFuV9F7ChofGHo6MomNvmJshQZWkxC/PG
         KlNwG8oYcY+iLpZmchzv9Qcv3dIn8ChU6NwTbgplLtURHH6iBXDYlAkAB4QpWe2lyoSM
         WKRQCZKoRZLspwUnEeEfC49LrEELmPsedyymJT4/fT9APmfhI1BfZzjsbZS+c+1f3vDj
         ksshWT7VTJyLQmvGi7RKOH+UUcjd7ZhS74sdIdwISMkNuVC22dfshWmi4NAbzOcXyo3T
         +LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060005; x=1715664805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf2RGC5EPIY9bfFJVpF5LvWRtFcLDidwePRmKNMHgEg=;
        b=o1skHcCiOKj7sCsPDZwaz66I0RL+jOGSTekpddv2SyG6YoZQB3Br3Zod6ndqO8jThG
         HAN3XOQQfPlhat5t4IqsI0Jeqj0TXOtR0jbmRkdxIlU8ZFGtr/VqmGJoByuQ9oiyASfy
         SQxbxW3TFMHk+U2nMcMhcnnBxKIa5A9JFHfVPtf2eSpvA5ZBnOOOMfv0kARaDmPXYs0n
         xSiGyTga31YryutElvrrG9seQZSYn80QkMATm1SGR7cMNcHeCnlrDZncjkxsDvzn0psa
         o2PNCCdolHmnotGgI6O2Jn7pEZk9s/gpsRm9tUywaA4Yj9SvdkayP1XcOFC2nmjumybj
         Dw9g==
X-Gm-Message-State: AOJu0YzbqQ4Vaw1U+1b2d8LVTVl9B2jmQMIAZqoYfOckJgM4CfK8hpWu
	QqUEajFeHuxdEvi99HPM5UOElBlSF1DmeQ2eAO4YJlBwCSvCCL/RFuW8lU2w
X-Google-Smtp-Source: AGHT+IEAv2aLUfWg74C9CBtuFBfgoeA1ZlMVomS3KA4kesky+174Tf8C4ythV1VGcgfMd9T0skI1Mw==
X-Received: by 2002:a17:90a:d0c2:b0:2b1:a31e:9aba with SMTP id y2-20020a17090ad0c200b002b1a31e9abamr12864357pjw.38.1715060005393;
        Mon, 06 May 2024 22:33:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 03/11] libunwind: ignore various issues now fatal with gcc-14
Date: Mon,  6 May 2024 22:33:14 -0700
Message-ID: <20240507053320.1566814-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199072

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


