Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3641C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:58:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.55660.1749463132622000564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SbujRCfT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453066fad06so9339895e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463131; x=1750067931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7egqJ9tj461vB/u5hA3KwKKdPWWMcOhaU0MEjGwGrA=;
        b=SbujRCfTm6O0i0GXp5vDqB9gNIFLQdjumhsOrpr1prJ1/mgYtIHe6GRKBt4m8NJgr8
         gn76eHN0eWMh+RIQClbOxQo0WCsfGgzSafeeVNBHd9Kk2639hII2utArHGewIf+7To64
         ssxBEYNyrNFh/RSLyjMwuge+/oGrwbYolUwDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463131; x=1750067931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7egqJ9tj461vB/u5hA3KwKKdPWWMcOhaU0MEjGwGrA=;
        b=imyRkJnKIBQZBQb5fSe96pnMWkgfNV7QK0aUhEa1HWPSZIwNHLE31CQmHiObhGORuT
         QkzSwZKVXJogMEdxR/QGjM3veFlCRkyhy95OfVpoSkfa+jJm2JHsj/9YmHcR0X9c8101
         WdUIMhxWQSkOL9bpclKDK5jpbn+4ebbv4kr8GbW/TJ3OjS2yCF/tbJEQgnbSWJgRmfoS
         V74gGYKPXAjXaDIAn9dDpcraEbBFBuOXU2Dz5eKAh0KTWF5MuVvnpNkCTyGXGqDnx3Ht
         Ch1Ff//l/wuPFOE18r9g4qkJNFIohzqED68cdk8jTw0d6Zki5ky+0FQmwObLYAN+jqHh
         f2+A==
X-Gm-Message-State: AOJu0YyPJKDapo4hEjoyXs//C7i2u0pqeqguCgyP5eg6/BRrLo7u0j7Q
	f9UZK2mddAXqBlWUtcLvClW4TI4sFYZhy1YkffVMg0zVTufk6eeqolCsH0lU/zg5GZjZuNfofb9
	4dP7URnE=
X-Gm-Gg: ASbGncuRTvIVbKiTZk1/CKp0/x8BVVoEMtfqps2F27RXPcLE9pDdSkSlTBA4fQRDfTg
	OxXY8etKJ7uuWl3Gs8WQv6UAPfC/jF+bwUqWEC4iLPyqDVUmsG1OmPCnLo3Hy+SBAMvmpDOW0pg
	Eb5d1UbZwJ7yILdFANxwIaxnlLoy5jDDnhDuV8rDA8n3yE3G38jxavsHk28DLuHa8V4YpwHOyLe
	eZ/NLFayQ/2aGvzpMtT2Pv5e5mECZYIfuihMZCkSE8lpT3FFPWz5U8HAPk3vtYQNHf2Sk7n1ZvA
	taLjZhm+BuSPBG5hJJEpMZ+iBxqnl8aFdJtpXwQTQ/6mGodVbZ56vifSwFnFZLUiyZH1xPIMDv4
	iW18A
X-Google-Smtp-Source: AGHT+IGhBYjwX2MyeL6OZ8dAKOg6+K40cFE5X6MvrjIcpOmSb1c/eH2jAasDD7r8Usn0Zcku2W5IZA==
X-Received: by 2002:a05:6000:1ac7:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3a531cb9ed0mr10176733f8f.53.1749463130573;
        Mon, 09 Jun 2025 02:58:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b60fsm108406455e9.40.2025.06.09.02.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:58:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] ghostscript: Use TARGET_CFLAGS to pass compiler options
Date: Mon,  9 Jun 2025 10:58:44 +0100
Message-ID: <20250609095846.937759-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
References: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218253

Passing compiler options via CC is error prone when we allow toolchain
selection. Use TARGET_CFLAGS instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 8f132d55c69..cd7087721f1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -48,7 +48,7 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
-CC += "-std=gnu17"
+TARGET_CFLAGS += "-std=gnu17"
 
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig

