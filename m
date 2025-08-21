Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03E4CA0FF0
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.2529.1755816215240961728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QX3HfBSV;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so3103051a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816214; x=1756421014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uInjuRVwLYme8iQVxgIXZoVu2/pi+UaHfMuBDJXN0W8=;
        b=QX3HfBSVBrJEaQnj4o0WAsZ5K6uBKm6q9WmO6ib0bSzSLQ6XUrE0JR0rLnxoVYDud9
         6zuOhE+8GF3JVGY38qaMI8ECc+upC+KAKGGFlSY3Lgy66WeuNqsMRVoB46mITpYsybyv
         EIb0ABmSiV88KKVWMzVqx8Kj7jTKrZ2h9hWdFynCHb4BwrYQxoQhpiXyh0zax6Fkz12x
         3g3evfb4MXq2C+OMP641royGY8Jgnia73Z8cgbpNuTE2lXFFbrj0cIfw0AUk8CLLqbEl
         py8zbzULlJzG3pTUXvEggZ23zdOwzrs9dweh0pS4LwPhv1hoDhx2vY7KrKmC3jHYuYUu
         2Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816214; x=1756421014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uInjuRVwLYme8iQVxgIXZoVu2/pi+UaHfMuBDJXN0W8=;
        b=iFFJUgtPK6HgvtiMPFhzK9b+kLzy9aw2VMuqtWBDGNvQTgMvb2PMjVVUfV+PfHgNjU
         +PUCcBvX0znJkIwb0pAaNjPOA0MbN1ojdqXjgQ3hMDoPVbKsUF4mdrNKvjTYGYkFZYZj
         UGHzaKbUJG4G8athICiWp2CqWIg11GXW97UsENcsOExfdPiRZlW0+Eno5DsE7SfxMoyb
         KPWjUj+FPCvIshmTAFN/8dC3C6lY1TErhn7SAWAIkO48FlUmUFIKOfklvRi8G86Ug7N+
         mRxX11BIqX+C2tLgA5EPBOaNUiLgo8ZWuDivwIbeWB9ufVtnREe6D4uin5MSJU+aiD1+
         BWhA==
X-Gm-Message-State: AOJu0Yx3kHjrQ9Frux4pyjA3NlkPAxLWuzF9xwwoc7G+qu/SyQzQeKeh
	QsO19Q5FvVLY5TQdO/21bkbtFDlJr+6XAKSLzqaMC6k46grSV/ZnKZZepdvWIA==
X-Gm-Gg: ASbGncs0cs38VefbfR3/mBefH3X8dhsMrBXbT9x9mTVKFSx6k3ExME3JY86SUrPPVNq
	XxDwEs/e2jTUtU+jW1Ke5LLfeO4acNe2wa0v1BltOy+HOulxtnJnRRMGv1Xf52xye/0y/yWuuiY
	homx9oKHB+7t0XSvtSpVwNAVIs4UQ3wBKFvS0x3kMVDVCH5NUaVd8DVdG1cJmHgrcZw5cwptXMn
	3U5ZTuzQPYq/AwxiNeg1mo1fbASKC5jIkverqnENGnI7p31ZWopYwipQtp7xlfEXT0yif+5Uz+9
	mmaXDtHqsgMdKSzkbFVC8awRTVmhPA8s0Yrb5pS0/QU/Zh9mlrpA9PRtht25hj7qTUrDIkGSiYi
	NUFSmBRbORUhuNgOYtzxo4dwgoJG85WEPNT9HqGBqdo2D2ewv39q71NWh
X-Google-Smtp-Source: AGHT+IH2u61i9hB7YDFpF3lYmxtL0RWPCfsTJTmhC882KiM8zsl9gFStTh8+Ex6poBnBUjdHPcQFEQ==
X-Received: by 2002:a17:907:7f2a:b0:af9:38ed:5b37 with SMTP id a640c23a62f3a-afe28ffbf6fmr60166666b.6.1755816213588;
        Thu, 21 Aug 2025 15:43:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afdf63c85efsm386194666b.10.2025.08.21.15.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:33 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 14/15] yocto-uninative: Update to 4.8 for GCC 15.1
Date: Fri, 22 Aug 2025 00:43:08 +0200
Message-ID: <20250821224314.1690103-14-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222299

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3d0f1fdccd..dabd604e8e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.7"
+UNINATIVE_VERSION = "4.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
-UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
-UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
+UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
+UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
+UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"

