Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE3BCCD184
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.877.1759510086819807479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t/wqNdz9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28e7cd34047so23800045ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510086; x=1760114886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hv+jY1Ym1ag5QQrtQ6NZSBNJ7uq7hT0UeDH1iV6u08o=;
        b=t/wqNdz9pSS081dfRFJaxXImLs4eVdzg4QICajvIPjl8UTKNuV2dwGHemit8BLyq9j
         VDlpflOhfztxZTguALkcP/M2GP7c/JvJinuqKqZigWLgdTzVr9LLMj/reJc/1dTI5dET
         z1PEfBZIXEcnRbVsikL08O6Hbd+pUEX119RI7qhZwdL/Pw+qfac59/qE+sj+j0d/Jv8v
         qQNJ6Iw00DcSv5CMFSr4IL3LMi8TV6MHIHYyozemK4m/b/fH2SHP8r81J1isUCN8aF6+
         Ylgt4mcsCqEXtg7hj0aPDjQTuvTqH7EMlnnW1UHWq+xuVDLswPUUBEFlm9JsBTHZpVhF
         Z47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510086; x=1760114886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv+jY1Ym1ag5QQrtQ6NZSBNJ7uq7hT0UeDH1iV6u08o=;
        b=mjpzdiUxbh1x0Qau8fw3nduHbHNvGvQEyKj/J9ZCHmTbPoYqj28di+btDN+pbCuZOZ
         WJN/GiYhLe3fK6+kHCXx/3W6iFfr1PtYUBl9o0DlnirehQ8D2Ijvv6R160r4SKD/Vkqa
         fBNIKtdxPKCpdRPSBU3vKhT2oScB55bf+v9ZPys8Z+vEgMJ6WXxDsOajXe5DwYa1UoXc
         PKJlNadfAI4Enu+XPaHvBK/Q4XIoUl7AaPjvmH9+XStKo8G3dtViySKgvihxq4IyjVR3
         iXHaPfMVhFdWUNr5Y7evO/6YwjvpS4ksnLbIrZhcGpjAWOSUzrdFjdo2hCjdE7F9Hmx/
         AbDQ==
X-Gm-Message-State: AOJu0YwloWZ1vrTwHNL6xnecy8h0IUDG7wpJGLxWHPIDlhk/e717cJjw
	k6eNyoz5ogZjXxXoRmstngMVOInNhlyVr9XW4l5SQoOhMcgIJf9xKnSBQumBH1BnWzhhndGSbO1
	06Xys
X-Gm-Gg: ASbGncvjqpQD6ecN6o6+CB3Ha8zrBRHtrsBdBFprhiLNTdmMsyTiUNNeOKJPoWjvCLG
	fTsWIffL3EQ0T9Tm0WpJxinSRZ88V2gQv+w5LT6OpnFV5s2mC3GSTLexxT9kJNStn3GvNy6n1Sr
	7K/oA/63MxpreyS33JfmyPI6WatrWS29XrtuBZF2FZ1tKuhhMMH/FBMnP3SYL+O8X6BMk19ym1o
	DsobJLFqAAbFwL0wT40aM7qZEIOJO7sZxb0KqaiXmtary+73b2fcJN5k2UXNJeBShnDvVRuvY7p
	3eSaJIOIHsWMAWfFwtluSNy4q7YPqJMmv+mbtgj9Ngm+gHR/iKE2phGFM0oYhhl3aj8EgbVw6ET
	4Cvf0KiwEbl9j18UsGyKPihqgfj2AxihkHogNog==
X-Google-Smtp-Source: AGHT+IGi30rRMLfw+fNfH6Cc0EBeY7Kd/kkHKPZ2tSs47nrgnn7XlMETmN9FgkCOzoiCdnFXtVcTGA==
X-Received: by 2002:a17:902:d60d:b0:271:5bde:697e with SMTP id d9443c01a7336-28e9a51325fmr45693465ad.3.1759510086076;
        Fri, 03 Oct 2025 09:48:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] expect: Revert "expect-native: fix do_compile failure with gcc-14"
Date: Fri,  3 Oct 2025 09:47:49 -0700
Message-ID: <4ea89ba363228aa5e16412f85644608f4c645d5f.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224405

From: Adrian Freihofer <adrian.freihofer@siemens.com>

In the meantime there is a cleaner fix on the master branch and we also
need to back-port more patches to support gcc-15 as well.

This reverts commit 8bfdb53247c917559e7813c2e1bd2f6eb13c811d which is
not in the master branch as a preparation for cherry-picking the newer
fixes from there.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 158e7af030..174b35ec73 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -85,4 +85,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # http://errors.yoctoproject.org/Errors/Details/766950/
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS:append = " -Wno-error=incompatible-pointer-types"
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


