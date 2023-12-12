Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031A5C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:27:52 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2909.1702391267280450164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bzwTB7i1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce9e897aeaso4938359b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391266; x=1702996066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnkKXxRwN2raeG0yROR0Qgq98lJHhMqp4gcEHgmGwBg=;
        b=bzwTB7i14qs7bzoXUzebww6RkCrqAXpmKulW1Pg0QbX/NklAnp2igtv6nT3o2hpgv5
         kHDCWd/wrrlYaRiGtoCs2vjWOM5TO81635ldd6qLlzfCpoMK1IxqDU23d/aGpckkTwtu
         WncQvywKHz7EzPCNgEIM+JDePDdqr0Z9S5Mpw32jWrTRKihlDN+0Qki3T1TTBpVWgZpH
         lHJrhmvtT0DL7K5m0SbQJ+SEXxwccJX3M9VtNf7A4pnvcduISuk/LytubG4HURA7WuIR
         lbHavH88w3w/p3cbESBSmF0T2kd4NZCacasaxtfWG9uL7n1/t7jIfBEgc0Z5Af2zKe8w
         Vp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391266; x=1702996066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnkKXxRwN2raeG0yROR0Qgq98lJHhMqp4gcEHgmGwBg=;
        b=AVvlIrEr5XOW+IbQAX5woOoxW2oo51DVj74S7GV9LHxGGVcIHVopgtcauQOsb/1Pp2
         flf6BDZ/JPko4inT+5/1KNFG+W0/6NWjL08D6qgIdw0LuHjXLMt5OFzR157zTWUEUAG+
         UZPcDIcxroY6L4+174TjMD0+HiDMiZ1hVdXSFaYyT3TaPo71xXvgbgfWaMKzZUJ40yws
         +Cc6qiLGy/DznxnCH8Kdxcn9+D4I1/mp27Azmm6b64d8mmFmrRKgpqbupDGTguM+Yg1b
         GuwB4MrtOOuZTXhf6YuRnr4hUCExUkqqZ1/NPTZ1DF2JED+y7XOyS3cIVP818HWBUEsQ
         M3zw==
X-Gm-Message-State: AOJu0YzCjN286AJ3ntPqazkvu9wn4FnKR7j5REJR/exmKCvbI/zOWfkz
	bGKeudd+V4GAhfGcuMC/zIlpJTUE3R/XqP04G8c=
X-Google-Smtp-Source: AGHT+IFTo5Ud55E3IwU+GlZ9Wjwbvy2SHUQvryINr7Aa7HkftlQFrgsZaQFtNqtu6aAB4bHJvxlCPA==
X-Received: by 2002:a05:6a00:2d9d:b0:6cd:d639:b353 with SMTP id fb29-20020a056a002d9d00b006cdd639b353mr7296748pfb.18.1702391266002;
        Tue, 12 Dec 2023 06:27:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/29] libnewt: upgrade 0.52.23 -> 0.52.24
Date: Tue, 12 Dec 2023 04:27:08 -1000
Message-Id: <da5850d11abe2e523b72500fbd304d5db041a9f1.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- add support for python3.13
- fix compiler warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3d97fe3848d68159c4b7119b0906c8388ce54a9a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb} (94%)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.23.bb b/meta/recipes-extended/newt/libnewt_0.52.24.bb
similarity index 94%
rename from meta/recipes-extended/newt/libnewt_0.52.23.bb
rename to meta/recipes-extended/newt/libnewt_0.52.24.bb
index cd3731cf74..1e39a1c5ca 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.23.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.24.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://0001-detect-gold-as-GNU-linker-too.patch \
            "
 
-SRC_URI[sha256sum] = "caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a"
+SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.34.1


