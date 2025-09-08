Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51080CAC587
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:07:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.5887.1757365621838319733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1wxAy1p;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso3096486a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757365621; x=1757970421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOhPVyfLD3q+qavrJhiihpU7Nmw5iGVRTRd9fatKuXE=;
        b=h1wxAy1pGbOqX6/FxRAzb3MOabWGMfHPNR1BLLw6PL11u/OEbezf+0xYp5+3K0DtuA
         tXFYyY7tG74FqrY10RR/sOExq/5aKoddDPoOZXvzk6/SfAzQStEnaq+PdJTdhWPHuep0
         uazOtobVYG309AlL+KnhD7Jd9RztWFM7GcbAiHZMAAzGN+pm2dwxGISaOy+J8VVwUs4p
         uhxfsZP20wxCf1bazRB/1ggNsDsx/1AB2VbpjzMH39D8gKiIKJ7/03wJ15AVWkaaCBrU
         aJmi7Pc9Tz90GEWMJzze8NXPS5agt/fJVmToyU6ZJW0+Pv0TEXAvw2wh5njKojBbyjH0
         erpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365621; x=1757970421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOhPVyfLD3q+qavrJhiihpU7Nmw5iGVRTRd9fatKuXE=;
        b=MoFLcO/SDAsBu4zayM2eRnPD8dwvjtH7XYeZy+L+hNvFPZyo7nM0+yGZt3KGdFkDFm
         wQazWQbdi+RJ9ykdJYk6IabFbLcD88s4G561Q7+4egCu7rFNbvLlAHdMfxhP93mWmvNw
         tT0Zx4VMtZGwndCVWlYVLVxFcygSx8o4QqKnK8i/VhXr+Ku8+iMm82Wt3bt3JaS1Eopk
         V4c0xffDfUwtnD2Fk1vaSmgjfZZZKtLc63sA1nintvaQevcANCpAODG4njIVqKSUV6A4
         IKMkzFztT++yYlSIzBCV88gRODwZ8DX/821wR2ee1WBzUda10Y7L+ozvl3ChhoEmVjmg
         E7YQ==
X-Gm-Message-State: AOJu0YwUGze0bIikLhTt5tfoFW+CYMY9Rvzw7XgQUcF8vMFYe1B91YZj
	cLMWJmwJdGw8RAeHetA5oHyKaadnF57RdTgeZPb16FAtATSqc1nx2464Ivj0BUSM
X-Gm-Gg: ASbGncvzXsNuPlg+KYvsm2202sJy+3unaaI2avrf3uidpwQe5UCnCalBo1b3r9/psjL
	Wcg/DdYFAK99LNrerAPBPKFmf15B3y/rXGN9CB0GlaDUypSC6qtFgEBvleEBqC1W3gnc1orx/Un
	7f1kYa5AgzCS4niNq7tOjBy1Vh1TXo5/0bby0HfMG3Q562tH25b2KE6QfItwFt/ztaQkCiBU2pH
	owGsOv2grTMBxYib8Pp2tD46X25T56haVQAZe0s7tPZ06kDyS6pKkzhkK5FyyjIp0n9LDbnxm7b
	wt7BKPP9MUndHPOY6p2yWnqJSHdGJKDYTIppeiuhD9P0l8RrbKRm9Y1QYv/kn3ZRIdALx2R9Y4s
	5yDSSubrY9Sieht+j7QqyhDep22ClQaKtNzIbv900Dc/zRTi3uNlDxY18ffOjIUWE3G8UjB1yQy
	EsVoeahYFO9iEPT+krT/SSsW7yzbUyIR4d/ql8d3HF
X-Google-Smtp-Source: AGHT+IFGRZnUdpivgPvz5pNVWfLu7KH+ml8HumYAIJchBA/XEWSLvE1UwJWpO1hRdGr53Sagumzd6w==
X-Received: by 2002:a17:90b:3952:b0:32b:4c51:629d with SMTP id 98e67ed59e1d1-32d43f15003mr11846256a91.9.1757365620833;
        Mon, 08 Sep 2025 14:07:00 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bdbef7f2csm9982888a91.27.2025.09.08.14.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:07:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V4 2/3] grub,grub-efi: Always use BFD linker with clang
Date: Mon,  8 Sep 2025 14:06:56 -0700
Message-ID: <20250908210657.2959408-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908210657.2959408-1-raj.khem@gmail.com>
References: <20250908210657.2959408-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 21:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223081

LLD 21+ is erroring on text address being lower than the default
segment address for binaries. Erroring during configure e.g.

cannot link at address 0x2000

With LLD 21, -Ttext,<addr> only moves the .text section
it does not change the image base and LLD 21 errors out
if any section VMA is below the image base and the segment (image)
base still defaults to 0x400000 when using LLD, hence the error

LLD support in Grub needs to be done properly, it will need
to adjust how linker options are constructed in configure. We
default to use BFD linker always when using clang for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: No change
v4: No change
   
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ffa04e415d3..dd1587acd6e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -71,6 +71,7 @@ CFLAGS:remove = "-O2"
 # CFLAGS += -mno-mmx -mno-sse
 # So also remove -mfpmath=sse from TUNE_CCARGS
 TUNE_CCARGS:remove = "-mfpmath=sse"
+TUNE_CCARGS:append:toolchain-clang = " -fuse-ld=bfd -Wno-error=unused-command-line-argument"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \

