Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C87DC54EDA
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4739.1747808405144686369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pifm6s+F;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c27df0daso3146617b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808404; x=1748413204; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUWUDRDuFfm3WJE+yMaro3yS3zgyRGuc+b4KONw/gG8=;
        b=Pifm6s+FYiDKIH0Q2m8gUbe7MjunEbuBkBZpMtJ52zxaUE+izCz9dTosgJsa9vjsHe
         KJHYczOqdCaecvtxLOBL448l7NJ53sBozdnzwxVrbmBfZ9CeWI11E3kPshJOrVJYVEQt
         bq8OBy8WkcLYJM5TvIR3qwElD95gsACYhNZAgIrtv+eg9ZdGn6YxPXFnlmkzCPP499A3
         jLADg5QLfYYuHDGRv1ahFE11L0tq9m+iVJpOihwDTPb54Jv8GLbFLz7IihKyTbIhKSyl
         BJGjOIopch+LyrVDfb62e3DtorFkSWHpIk8d1ZswDC17M6CQ0EoA2VHQoaluislPAo5L
         FDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808404; x=1748413204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUWUDRDuFfm3WJE+yMaro3yS3zgyRGuc+b4KONw/gG8=;
        b=fuF0ahSydHTL0Uv06BIAMVa8O0UjcW0zjUqNV+akfqfUehjpedSlEsPLrLQjR1/+23
         vdZNgZ+N/uNLwo/z5arzkcMCJ+/covUn9JpgUlR+US3eQHGqDj+Mq95wg6f+CluFMvov
         Fgki925Re40BSXuebohQlNziRttsdveFkwf0dL4VD3LPgZhmBFfxANxvPUCs0X+16vyG
         j6UySrz4XuNwINVSJFMVbOO5d2wOTrwyEl59Wxyr4YRCpWJMUhCFc0l4g2FXzljrdbT7
         r2Ub9t24ndLRoWj3D/953TbJA1AY5ShCFCBuh4Kq0XoIw8g9ekstpTl/yyW23+171kJW
         UpQw==
X-Gm-Message-State: AOJu0Yw03wOg9wX9S/EKPycgO7rj1OtKAomUD1EhCfG82V3m6ef4E3D5
	AIsqyWkR9dQJojKT1s5BNanisrh0dv1zBpAZgBs84Pe0t1/PSYMljQyxI/NXiOXQ
X-Gm-Gg: ASbGnctOQtsR+RDy/+TukXeun7RQIisDjC6eEkWCSPuMoxpEQvjxVuXdWMIMBw2iJ3W
	T6rLgss9/8lyyDs5n2wbeHOfnlAyd1BP9KUN14CBKt9MTrSRFSKabs55nao0uY+9yi+VoqLHbk/
	/7+8o7Jb3e4jX6MrbEz8QwAxm+6QWTxE/pX8jbjIvAb2sImlJjNn5cpvXqoCer6LgSivjiwwloL
	ZWbJk4uDnuwoR2Ur2o1jqwhjvTmKq3fnNRc3yZTPSJzUjLukjIWpdHCVUiQERBBIZnT9UBdIpuM
	wOo0DCfJwHeFNTQ2um0KwBEd0bkFAmfrlwY5FUVmXyI=
X-Google-Smtp-Source: AGHT+IHQjuKGGZrwTeXn6es4tAW0NyxbM6cDvKUhKICd2dnaJNzVHkCxXm+uJ7kpOyxA4L568Mjtog==
X-Received: by 2002:a05:6a00:398f:b0:741:b3e2:635b with SMTP id d2e1a72fcca58-742a98de416mr31048823b3a.24.1747808404311;
        Tue, 20 May 2025 23:20:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:52 -0700
Subject: [PATCH v2 16/28] glibc: Always use GCC toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-16-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216984

Glibc is not yet buildable with non-gcc compilers e.g. clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index e048f75c5d743977151eccbc151b6c0726407067..fb62a4af94ae5ec5ee0e07dc2b953521af534a62 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -23,3 +23,5 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
 PV = "2.41+git"
+
+TOOLCHAIN = "gcc"

-- 
2.49.0


