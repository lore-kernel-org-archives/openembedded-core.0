Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A348C369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.1107.1745559812141047983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cZASF880;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1509710b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559811; x=1746164611; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=cZASF880QZqLn3ctChpWmVzBSb+J0k7fxLb1Q6PpyEBzhw+i2+LtICvGcYtxahg8S+
         IuOanBWpso2qljIs9yfc520/ad1u5WGj3d98Fy6ZV9qDUqnP2w2jUbQo9mRP/NL5VzAE
         cxlkn1Uzdtx08OHQ5c/T8+x203nkIeGZ0nTuYa0mYufTLvIul5Cc+ESXx8BJublRyB/i
         il2hdXf8VlMVqTAU3p21hf7rJZTSsgVXDj6cp3hBUJs92vXM2efftHyf8QgV96RoxoZu
         7PdCYl0I3+pdzDcNha9RLYfbAdaLfqBA5Puhp0Q4fvnctb3gHu+nAgzQADg0WznbwfAG
         xMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559811; x=1746164611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=MSDSxvtFgONu8v73A4g7KjGFMncgTkHqQCeDPw0o+Y2vdR4JtEuwrJ1I29bwH/SJ/6
         8AshPMWleGwa/vNqfo8IgNd7fhHGcgSSC+80ZbMssiibw2HxEZcS3rcSIAZU4LnDPOa/
         h2NUYXrA7uAy40+FjQlRV5tgKherGr5UB/eBHk08YaeS+Tzq5IMQNfCaH9qI4jIGLTn3
         7MTk/6QgW2A9GkiP8408oQgZUrHG6Xtn6P/VehPlcpLU239VORWrnDAQtt5ceB41P1E5
         LMUg9wLtsDWTz9VAUPSgk7gpdvy/cQ01YkZP+Rkss+3MUWpAg01VGp7IVki8RRonFx6+
         CfEg==
X-Gm-Message-State: AOJu0Yw1zfGP8igpPKVke2gKOS3lxiAQTRl4J0/DKCAdgMQAp/cGC5sq
	ylPLOGYHJE1i4ZeAldMCkBrTPlkAA90lSvNj8R2Wr4pWHNHEVYrR
X-Gm-Gg: ASbGnctmHapKM4QkmDWbw+VCCx+f7nJWr+sV5FAwtvUDp9wu4VLZ+4HGLXpaXu1yNJg
	akcfekySpofL2cwaH5jjDK2cUkd3mu0DyHdMt8qAfvT7hxColk1fvZwDbl8GAiryItbJfbzR7ov
	6Ka5sfRoGLz24UAj85X0ppqEftgK0UWOrQLhoehYrD3Y9XEjYXpy2i29JfOprPufY9VkNGFPvRH
	Lfbcb8WME7dMZWNgBrqAPW6Irq9PrxqpO0CSScvwvUzjXJOZc4kiOWj4JwsrJsQSmaToyo4ayHf
	kZ2TrA+c1M5TyW8r05UDZfluwiSs1EAh
X-Google-Smtp-Source: AGHT+IHPy+KChhDWUNPTC64bvTDcEGsUCc41AusuyikmAkgOvd5U7FC0NIUeC0Mt2Tf6ZDHVMisrVQ==
X-Received: by 2002:a05:6a00:3d0c:b0:736:491b:536d with SMTP id d2e1a72fcca58-73fd8f4d01bmr1272946b3a.20.1745559811517;
        Thu, 24 Apr 2025 22:43:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:23 -0700
Subject: [PATCH v2 2/7] toolchain/clang: Remove duplicate RANLIB setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-2-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215417

Its already assigned couple of lines above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/toolchain/clang.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index 40bfba2fd4febec0d7316a51b10fccda3363c43f..0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -7,7 +7,6 @@ CCLD = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 RANLIB = "${HOST_PREFIX}llvm-ranlib"
 AR = "${HOST_PREFIX}llvm-ar"
 AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-RANLIB = "${HOST_PREFIX}gcc-ranlib"
 STRIP = "${HOST_PREFIX}llvm-strip"
 OBJCOPY = "${HOST_PREFIX}llvm-objcopy"
 OBJDUMP = "${HOST_PREFIX}llvm-objdump"

-- 
2.49.0


