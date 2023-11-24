Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200FFC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:43:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.138509.1700836987924613272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOGaOVPU;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so1216166f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 06:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700836986; x=1701441786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdUgyD30g8/tXLaN5wjAcHwXVmfwlOTZ/xa1VsxGhuE=;
        b=UOGaOVPUW59/MNY+19UT91t6S8M7ji7yhHQqlZdo2qDElVHD1irzyq6yybSfvRPQLA
         wNm4d4XlV+clLFEVz9TSTgQ5o9KyIjFJ+nS2TXOXKRiuJl7gXl5tsB4SVjtl4l8A08hb
         0jJCLnYddtFCTdy1WuUVac7wE+8TxlfRNKxmt/eQgF8gp0ZuJOd/Ec5ciICKPIvLzL4K
         Oc9elOHtcc8eZ8951zO9zSGiIcbesQu+KnyjGiey0Jw0aYOSs4+5A7Ysry9wnFz9F1cV
         qe6lAT+2if/B5u3Yk3Uy8CzeyreY0zIfQBl18FwTwx4UVmgRQNIA+CoixTYrTa5QymCJ
         74Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836986; x=1701441786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdUgyD30g8/tXLaN5wjAcHwXVmfwlOTZ/xa1VsxGhuE=;
        b=BgBpSb9qXF5VVh6BYwkoutWiit6n33CsyEkIockfO9rBa/0VwKX0JxbAdsvoGaEEAS
         goi+ULKWsBzRfO0+VGha1veYfTyU4YhZC1gy4ELm9Rwglvrn70CNgXK+6kqH56LFzXmp
         Zz26s+IMr44Ci3W75T9GxcbBKQKIvltmLkJrKh2rfiR5bW90D+3/EBW06uNrd34SDvFK
         BdmEDxJi21l/74TOWsY3TzOyjIxarP/E2MmwnyKEFytjX7cMspkenIDfnCm6AjVWTZFZ
         qncKGx18EBijWJCOPbOKrSpzxE2jyWt+Oik4Qkm4LYJ46TqoeC4d4A7bGUAspG9SnWnh
         isaw==
X-Gm-Message-State: AOJu0YxxmCeX07qqgfUF3HcMDWEeg0V2wxGLcitKn6hKYnrhoSksWPx/
	jYiULMH7H/fMFzNKlvaCiM3DUh1Cj3w=
X-Google-Smtp-Source: AGHT+IFrZpjexazGig4N+ZtG9TLLAhBPyOD5afyx3rOlWHjnKYB9+685Y9IMu4IPrEb2h1xXIyIirw==
X-Received: by 2002:adf:fa0a:0:b0:332:c3d2:623c with SMTP id m10-20020adffa0a000000b00332c3d2623cmr2993765wrr.1.1700836985915;
        Fri, 24 Nov 2023 06:43:05 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:c45d:d5a9:301f:4fd6])
        by smtp.gmail.com with ESMTPSA id c9-20020adfef49000000b00331698cb263sm4507602wrp.103.2023.11.24.06.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:43:05 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] rust: Drop TARGET_VENDOR export
Date: Fri, 24 Nov 2023 14:42:53 +0000
Message-Id: <20231124144253.14955-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231124144253.14955-1-alex.kiernan@gmail.com>
References: <20231124144253.14955-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191204

This was used by crossbeam_atomic.patch, but that patch was removed as
part of the 1.69.0 upgrade.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust-source.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 4a720e645bf4..7a0790f6b62c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,8 +12,5 @@ SRC_URI[rust.sha256sum] = "bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843b
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
-# Used by crossbeam_atomic.patch
-export TARGET_VENDOR
-
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
-- 
2.39.0


