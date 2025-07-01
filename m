Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9AFC8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:18:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.8580.1751404728338617436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ID9FNNmn;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7494999de5cso4787427b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751404727; x=1752009527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=ID9FNNmnCi+4v0oU6A2pdnbH84Wl60JvvgzrP8eBUe3H8g1gQX2r65aVamgD74Ojya
         buhKyF8DmnvL+432hJL4Cj96sJaRyP7dHHs47TCo7FlqPre/MTcLTyapzTl0/6/fJQ4K
         T6YpTpF2e7Lro+8F02Qq0xnW9yBiL0tv32m1LYrlgZux+duIxP82Qku5asR6LPyAD7tm
         TR/O1fvQPHh2K7bjCNkRwoBiId4QbE16PpW6DUqllBl01GDuhydfxywfNqZQfL9ugmzp
         SXZwlUsNQLBRs5nanh8UzZKihcr5I/vOzRrBMG3mHdRcvz+jX9TLgAw+aawZ+NxuN5XD
         FpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751404727; x=1752009527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=MvSbgXMZIexBoXLM72YwLd4400GFc0XV2h6F+FUMKElDOOS9sflEw2wAz/5WAteJTP
         cKcc7RjY5zXjXHQGx7gZRGAFq5uBDCCYPrdackAtUJ/hpO/6JJzD3C0aJjrEQh+kDBpK
         djjCzA79dp/NRCQCN+l9er/MDsDa9zn5ehGMij1arZUpqiqhVlqt/XshyTzKr4z2qNap
         bNet9JNJmqoIpvGvTSiAhXrIDSXvCAPA2wNPtPucwQ1gVQ4DR/AOv46e8PDrcWd3Xuw3
         0CK1EoGq2GtS1LhZd0A0Xs5bsc0Qzhx+iywY4BjCfaR1BUy+owB05FWEJ47GRZ8e1YWe
         PrLg==
X-Gm-Message-State: AOJu0YxD0sk6+tmlnh4YdsnOm5DA9qkusft2jYRKk8ZOzV2uzPKGVUuJ
	5Y54RoqpWimcY9FcA2gOzH6EVG4lm8mOoxj8u+uxCAb5kYpDQTXLtvP3EkMeiRrm
X-Gm-Gg: ASbGncsbtl6y4pmX5MP8Aqq3IZiyvtIj4+RZj2OinJ0+mZjvWexjdS8oFOavnbkg1gt
	EgF0Pv8KrzYLmLg62XkQcUbSQ+/QJNmfhqOaCCD6mhTFbwoBTrTgKeUjgG48DbeTjCMXTlnXYmO
	wWVJgAmNiJC+KPmoLtUXekFZOp0mVD5zNqZEh4lQq4ReEaI+OueKp/9APOENyai++gyK5ByYurY
	cgyBepOSaD2fi7ezu+eywKigDveu6GaMBwl76q+KvoptNjwBEegx8F4wHZzz07ZZz8Ga8OCQ/XS
	tuaMzVwz6gz/QPN/8yXtlZqrCk+te+4ERl+GZgHTOPZnOF7N3hpSTw==
X-Google-Smtp-Source: AGHT+IFp5bupg5BvG3Tcct5k1LSOapNTE7gG50dNtha4o5eswCRlA6W41oK/spGlPLnHVGO71k4Yww==
X-Received: by 2002:a05:6a00:1ca3:b0:74b:b11:edd5 with SMTP id d2e1a72fcca58-74b50e6991bmr552460b3a.3.1751404727335;
        Tue, 01 Jul 2025 14:18:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm12116095b3a.158.2025.07.01.14.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:18:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/4] base.bbclass: Deferred inherit native toolchain class
Date: Tue,  1 Jul 2025 14:18:41 -0700
Message-ID: <20250701211843.3960784-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701211843.3960784-1-raj.khem@gmail.com>
References: <20250701211843.3960784-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219726

use TOOLCHAIN_NATIVE variable for selecting native compiler

Default it to PREFERRED_TOOLCHAIN_NATIVE, a recipe which wants
to enforce a toolchain can do so with

for cross toolchains ( e.g. target, nativesdk )

TOOLCHAIN = "gcc"

For native

TOOLCHAIN_NATIVE = "gcc"

This helps build native recipe with clang as native compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..6be1f5c2df2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -30,8 +30,9 @@ PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
 PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
+TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 
-inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

