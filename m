Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B68FC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2966.1742372205838062756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTZytJxa;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso25737355ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372205; x=1742977005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=TTZytJxa+FepNdPSaRtJraWjhyj4ib1osjK8Sw6UQiaq5JQgV/G8SU3evu2LsLOBYV
         Kbq8ATEAo/Z3PUGj2DEO5HTnY+xcBWJkIl1IydP5W8gS/sJ1F6z29x001EtoNUDNOjBX
         cdBLhvQHTXQQzTwXqoEe7aDU0NGEoYOgU1Aq0cz/wWneEan3m2cWOmpv9XDdWji/3bEu
         GgTdpU5zUSGlIXITt7avaE6xEzbwmwNIb5Am4VIc8xxa5gOE6XVGPa/oKFS7XCCDNzZC
         uzkA/418pT20emdCjxPUEu26GjYiElTfd8L/Jfa2aoghJpEghNkf20mgFvuO46TD8TK1
         FZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372205; x=1742977005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=vNOhEu0CmWBdMtaLd2akoCw1H58+QTB8P7rxq8pijlqAdzmcwNbK3dnihmyCXOAu/D
         D5Xxw3jfhLTMb4n6QAuRa8S0m1iU3I984GLViGTSU8/wJ0UPhiPm+tw8I5lFmeZWhVxq
         3ULMYr/60pS8BbmtOC1S+uAIQNvZX7BEavTwpSgKCJX6qyh20chtrl75nf2cyscRTeRs
         QP683C5WGpnIsXHM9bxhXY+7un5kH0MzRU0p/QSB7E4zmBTAzAYeBug4d3ZbSj7lWEmR
         GaGq+CqIaG7J1p5/IGmSoQ/Drm70Wua0ccz5mfB3jJLzQHS0FR2hBZhWAEQunKiIrn9+
         MPqQ==
X-Gm-Message-State: AOJu0Yw6bo2XUcFjBEqEg+qoGEcFEqQJrJpe6ILK4orJIdZbtop4I7DK
	XMkQC1G4XMCJQWdS1XwkCTcCAMRdJk9ON7L5KqjLd18Jxlhd+6virR1E3f3Z
X-Gm-Gg: ASbGncs76Iv5hmS1jnCAXASDuhbXOfwOUx38TwqFT5062YN9SPDMWAONaTVsP1Qh7A7
	BGoKYMga5VwJGBEbAo5xSJx1O7sgpMz8snz6IU+qs8aMVWb/7tYYTSQyFObOfdWbjIXhtda9tuJ
	1pcgbyQjZid2rCRYPUyFAHd27JglBMHy1NWO3NGAxz8/hKvEx1SAl1puKtYQ7gCJ9wRAzqQKgpJ
	NK34WqtmQgurWOc+wIK/Jx0E894naO3wGJpkDOkDP3YV86jfy8OLrjTufM7JMZj+CNsbGpr7zpt
	e6KfMqsMO23SqjnOM13XgAZk5XoKkq2mKJ04
X-Google-Smtp-Source: AGHT+IGrDFHm8dKZn0UQrwjSDTcii/YrHJBAlRaJcN2bMUpNdMhzcGP+9Hd5MR0qMfkFcVztafucbw==
X-Received: by 2002:a05:6a21:b91:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-1fbeb6a04fbmr2912620637.17.1742372205077;
        Wed, 19 Mar 2025 01:16:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 25/25] ncurses: Pin to C17 standard
Date: Wed, 19 Mar 2025 01:16:06 -0700
Message-ID: <20250319081610.3536475-38-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213304

Newer snapshots of ncurses have the fixes but they are many needed to get
C23 going. Until next release lets stick with C17 even while GCC 15 switches
to C23 defaults.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f93550cf99..1e9ec38ceac 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -28,6 +28,9 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is not detected automatically
 CPPFLAGS += "-D_GNU_SOURCE"
 
+# Check if we still need it when next release (6.6) happens
+CFLAGS += "-std=gnu17"
+
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
 

