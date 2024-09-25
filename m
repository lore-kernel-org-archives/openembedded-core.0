Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94F2CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:35:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.9083.1727246132737621018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLveGPN8;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so4058071a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727246132; x=1727850932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fK4EjZTODXPNQJCcwWQMR3CEcj7VOsGjK6Bq2BE2l/M=;
        b=FLveGPN8dz8K1Pji9cEi/LhQMs9OxLRKMsgG3vvkayl7ixudws2WYXK21MLyr9c/Em
         l0Sq7IP1gBjnhEo3B1tQbqKOLdi5JUOEPK5Do/0QOgPMNWsXr9M0ciXbztW0r3mPZDMK
         URbm7P0ltVnBGcNeHKzOrXDeuur6RXYE1x62ca6eePoppOWhrY1KQfF3xqzobGkbUWbl
         SNYmsTmjVrN/JZuyWwlxk37b9Dh9i4tOMCdFNhaFUD5hookBsNyXas3Et7gAVBJ1ZwCy
         5/fqtFQkC/uMWlqkjZ9VA4tvoAX511twfWSr8PGhv1wBo4XLhtuhTcMg2yXgjkdfyliM
         9uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246132; x=1727850932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK4EjZTODXPNQJCcwWQMR3CEcj7VOsGjK6Bq2BE2l/M=;
        b=Z6/NgYnm6qgZ/onDL3/9KkYYYswvUX+qmbjngG67aV7x4k+9Qo4Whe2l4ADxn7LA4G
         q3Zf12WsS2RXKiuLwb2wqLXG9Sa1DshLDoMZeGxPNvaI0HKQ34croucdUVKuutf5QASO
         fvtVhrAdwBzN6L/v424B2LINYQ9ZRjzcoK/PiBG6UaS0bwIcVy95PbQQ+ztJIJM+L4hY
         uSWrx9t0A28WxZvfoVdrhuSQWihDid2p/WFco/87WTEZPrr0TIK8CnkF6sSCW5B+0l3E
         dtU0fXUQ9D8U8Alzuefjx783hk4gDhjUyry5w1ehGn/gZAgaMvqlkIzgWPDzgsOp6QP1
         fuAw==
X-Gm-Message-State: AOJu0YwZWKbXJyPApQt2KYvKFRNKHC2CIwi1oVUn+g7d3eUIYlsY2SuY
	5M881M0dvjPEdnuxN/Fs4YzYehBfoPaDdNOphHGzHpkgD/XwMTt4qARdxTbJ
X-Google-Smtp-Source: AGHT+IEi2II2kUejbsKFHuRlDb2IH1PF9nAZ5/KmjhfGcy4YvF+jlPVRWatv0sRrnnoUfYvd5/em3Q==
X-Received: by 2002:a05:6a20:d80d:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1d4d4ac686cmr2470560637.26.1727246131926;
        Tue, 24 Sep 2024 23:35:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e239b43sm701681a91.38.2024.09.24.23.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:35:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3] systemd-boot: Enable on RISCV
Date: Tue, 24 Sep 2024 23:35:27 -0700
Message-ID: <20240925063527.3154248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204891

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
---
v2: Add riscv to working arches instead of opening all up
v3: Correct regexp for riscv match

 meta/recipes-core/systemd/systemd-boot_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
index 9a6d8e9d6e3..4f477b877a9 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.5.bb
@@ -49,7 +49,7 @@ RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
-COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
 do_install() {
 

