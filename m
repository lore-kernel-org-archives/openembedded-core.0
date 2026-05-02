Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF274CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9363.1777739394651304856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VAVMUkc5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1744433f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739392; x=1778344192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol2oAyNLO/8zt/uiam7qyTPeI0mxDrEbUISaq4qh5Fs=;
        b=VAVMUkc553/bNbwr1KHFPk5HSHGhE6nU734jHb5p/db76rn2zrmk0pzBlcWMWJbDxz
         PZtgb5YaczZqtptOcvwzCPgKZDXP6g/bwx24xRLw0xcII2Lz+Hlfzzq7GkvLWUE2meJT
         CrKEb1vIssJExIZBuWzZgy5w6e9w06m9QJC48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739392; x=1778344192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ol2oAyNLO/8zt/uiam7qyTPeI0mxDrEbUISaq4qh5Fs=;
        b=EhO/lazqlRTbn/ryMujyg863KzatDkI0Wm9ZNo4z2vAs5ZvRcuUU/5NtRmyj8C8BZT
         ILdKMw34Ha0vWFPZKT0kr/RKiMUFSKZY34oGLlLFwtTFhJALTLOPqDSvIcOO0f1PUET/
         KPxwHa3VM4dMN5WeGzu+NsYRtjFHbEufKrzxbkjIatZMOH2DVV4IkgamEuGThzHMZ7Np
         0aq6z+eAcVbefsXFzLgzfm6JLSBEkR5hJ2evvGyPL4omqyjT0xF0rwDnCUMqAGFHg8PX
         9NPaB9sLqzO3qzuwP1X5IIRsTSbYqZcq4HqmJyr+ViKG+2PVVE0zu42YBBF3b1t1Xi0H
         3BCw==
X-Gm-Message-State: AOJu0Yyli8Vk+OcQaLcuBrDSic/oWtWEDP52wGJtvfqGi9oN82d0adNI
	wksVO+bDxT4LAiptmTzfy3VJgnMWK2OaOzVkYhM9SYRwPeEo7bMIn1OFKELNTJT0kwy6PFQc5ow
	+jsfN1GgUJbc2ZzCPr0Jy0zDCv5Ltk58tuZi1nDs+pdrPA74ZuiJUXwr2TPR07jbNc6Ckc1gi/j
	5URofalPcgwYeXVTc=
X-Gm-Gg: AeBDietliRnSoOBbujIZXSYNSyq3O7THEYYUaE92AtT/oDqHOMHrzQOLx0yV+/oXzro
	mC/M/81O8diEmO0iA3SKjcpzIr+sFnihtMSnZ17RTZhwhyCGP8olCuoy6UAN82PPWmbnenLudzc
	+bAmHNF8mH+8J4pifnoj68b2x73w/wn/ztEakdFp6lrXWrhTh6NF9VlAmEva7giRBN+6HfrXdFS
	nxiHi2egooPStjpQ1o5dpla53rjJJRZrLttT6WlShq1SZTAqnKspo3z98gpH8iv0SKaH0P8tZtn
	5+aC9pMwW6YmGcsZG3x5aTL+tlNSAdKetJgMZjrf4D5y0VCvTXwhEdrbuUUtni3csX0hSzw+Pgf
	rNZsd2F4oKKdDFKWFVFb2lvQggLk+UFqiZVJcj5FNlYrSK3ZBQVOvA32Pmf67SiQLZnclMmnyX7
	pKNMCoa6ZXGLu59pXmo/4F8FcXnA5Aau06CYTTYTF7fEP0qJpvPSQJFHerX9dU8q4=
X-Received: by 2002:a05:6000:178b:b0:43f:e9f0:f1d4 with SMTP id ffacd0b85a97d-44bb4bee73amr5582690f8f.18.1777739392406;
        Sat, 02 May 2026 09:29:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/62] harfbuzz: upgrade 12.3.2 -> 14.2.0
Date: Sat,  2 May 2026 17:28:33 +0100
Message-ID: <20260502162929.1377831-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236322

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_14.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_14.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
index 6ce275acb59..7746e97950f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
+SRC_URI[sha256sum] = "94017020f96d025bb66ae91574e4cf334bcad23e8175a8a40565b3721bc2eaff"
 
 DEPENDS += "glib-2.0-native"
 

