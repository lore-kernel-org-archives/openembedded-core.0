Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF67FC369D5
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.2857.1745634926744984475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJu0LXK4;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fd89d036so37926775ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634926; x=1746239726; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=hJu0LXK4hI7AzVsuLdetjPtPC7emPhz11/f/Tm42bRVwNgPwDDQLjIxn9mat08SbNW
         WTj14pQgPZoVnCyScICuTWhix971iPGYTTvl8v/zZGRRy/2DVnOS4fZFr5Nay5blpIFX
         821p2U4wYkCGr6if4th99WxxAhWaAPu/7Fh2GmdYoqhO4u/b9We7rvQ5HKVTBjD2otOI
         Jl/jK05xaJpzYyGAtC0Cd6yAQK61a0TnN9N6UalUPB/kFkpm1J1L3D7sUNtfc/PJb8kN
         3U9RASeDfddrLWYvg8AdPlZWmrHfdkQd0raY4//kFR28nQgAKukXDk4prFgEmaufDlWB
         UyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634926; x=1746239726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=acy6kQyG0wN0LfVq4FxQIKTCoamrnFr+37+QQYj+H76tBwOBjKL37/IGjiDJu3oc0W
         gAlltVT/5irwyw3zEycgXY9Nlwr9elr3mV74EJtfzpW09CIBz/atsKnysrlMpmhN4RkW
         4PxbSF3oemGk1cP02sFD2/BEiWJqT2NbeWSKDQw2nHavQOGDVic9x0secJcCPljGfUKP
         N/SYuUN6nec2nqCJDk2kppacgA8gQj6d44bd/OeknhDh94roQsXZyaQz5yRT2FIkp1EV
         lbo4sxwpLTRjOdZw5XyWHObUKIAaE0C6o5u7K6VkcBLlgK7XdlcL3DT5ZcWGa4m/p5dl
         wABw==
X-Gm-Message-State: AOJu0Yw/LEc1Rj6+QOh43Wa7LLoYi/yu5MsMRLaJik0Q755Zm8s/LNQ5
	4mT04xfbJynVvQ4hj3i8lrvq3g9zJCVwQUTuoTBsLY1ie8yHhqRcAqGyi+TF
X-Gm-Gg: ASbGncux4e3nUJmZbH4d3nPgag9OKoyPWzhrouzTkoWkt4U+RrDXM5uJk3O8kHUBnwA
	HnuTd+vMSZMvIqlHiV48U9Wuo5rXOpqw/iRqzF8irt0tgjx3Laf6qpAmGBGIaNal8OpFb/zZZph
	aEUVP5pPuVOzxdoTb5KTWZQoIOUQnVxigNXxOvEQO40M7ipuLfIkB+3KZ2eKLR9FonbiiQ7Q6hA
	vDgtpU0DHHZg5dYZDjpLqANf/yI7pfIKnB7R0l12/Cs9uj4oM1mzcJjkVb91wb5xRDASMYKy3e6
	KFws20PLLltZzg5omOwsw/SKCTLwksLC
X-Google-Smtp-Source: AGHT+IEEE3OsqZr5y9jUGaWG4mCDYl076D/kYT71EXM+F05ujzCbX2tHm4DnJpq8dnvq9/A+BXkJtA==
X-Received: by 2002:a17:902:f64a:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22dc69efa37mr21655825ad.7.1745634925956;
        Fri, 25 Apr 2025 19:35:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:06 -0700
Subject: [PATCH v3 04/10] multilib.conf: Add llvm-project-source recipe to
 NON_MULTILIB_RECIPES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-4-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215503

llvm sourcebase is large and like gcc, it reuses same source tree to
build all recipes using clang+llvm sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 0b32a62835cd34313eb244bf0d426c0ccfab26c6..86d1f8c144759712c22c15337f493bb75d63d618 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -25,4 +25,4 @@ APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--forc
 
 # These recipes don't need multilib variants, the ${BPN} PROVIDES/RPROVIDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"

-- 
2.49.0


