Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B88C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.31420.1750195259432250870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KsuDjZfu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748435ce7cdso5284728b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195259; x=1750800059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q1G1hunavYzFZ2EnsmNhTxSQpof6nHE82P4BafI0zc=;
        b=KsuDjZfu+58INSsfpOhqlxooegh2UcqVhb9U4ZGUTNNP9nh4tu7KAOdCl+9Zqlz5iU
         8wht9sq/FzKV41C5OnRtOoyF8A3YBIgwlFGgFD0dGkA4Bdl8AvqnCLH+yPfsvGOOIpuT
         lYhvN2kboOdtIV3a5aTuYBbvpQl0j9UWuoJCFB8skOwkKz+G6rzIDiQDkBTMmJ2NTpWE
         zVT6KbzoqNAB/u0Iqyn9Dl4czWljShB1XTCyyIkZVVhnovvvrE12TS6WN5DJXJJ7/8ir
         Isfrkn8BjAHXtVrILtkciCfEgdiBYxFj5TuLwy11i5jQlepEFARGrflqSJdfeNI05geg
         aBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195259; x=1750800059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q1G1hunavYzFZ2EnsmNhTxSQpof6nHE82P4BafI0zc=;
        b=JkAundWMjPDNcili8FANt8y+8KwRgL8H89WdGd2hz83NvRJeVqHm2AICoJ3PJnLX77
         6l5s+KtAFzX/r4RUHhHAgc+uKpt611OzsPY7pY4fAjd3PVXsl88prw84UVSSdWYmvc1+
         wnhvpK3Ak3vk4T9HVfYh49fXlVDAASlLVOTwXMhc9kxDQWjrNLiEbA03nBVWplVQsPxp
         yl2AxbCJmh4qNegzo9WFVrwDP8bMRrZkW2WwSoK3QQJMkGM/O0b+AD2FrTsD50hYZ2LB
         80trh9B7nNUaRPUh6+h6r5UJqGMfClpJkT/CXO8HxuSUKyx/2Uw+15uMoImut31+39/g
         U8Xg==
X-Gm-Message-State: AOJu0Yyd6oC/yvarhmPrTwvIWyEXAEMcc7ZjfF/kq3uRdrdPWUEo4fFB
	XuThcmBGVs94MBYJ6ckcrkXiaF5kPbffchETflxndjEoSE9GZfbXkLYnUyvB6N0gBEI9IVy6Ds1
	Gdkqd
X-Gm-Gg: ASbGncsfJ57rH9AQTtk1xAvwA1Har3QIiz/lrpZhOHKvjVyu2hzErgivxngL/gWEFcV
	Qyses5w5gWIVMEgIVzocGgrHDRs7fA3nztv5NS0YanauCpV+M0P3SyxRKOhV3R28bn8nanl7B/X
	9LXpZdArsrUQpsjVUGn0CxGqkPWlD4bIKrQ8TbIEPOO3rHTMbzy9/OBhUMs5uVE1YyMx9rXD54a
	B9lMkwMiTG3gFmUAR78fjYLqOopGoiU2Jn0kyQXcHX2NRm/UWx+IDGMZHan4tf6RpwI6+w0o2TM
	x38bWMQXo9H0bHPvDuJ7MizXOv2aKm6UAbhhK0ZiOWHcrSmB/kbK2VMSyvt4HaQp
X-Google-Smtp-Source: AGHT+IFTOurVf76M9P2x8I/P9QNYZeWFgnyv4m/yQSBrWmXge5Fr8W8VR4U43ZzgjE3Az5rIYlzPwQ==
X-Received: by 2002:a05:6a00:4646:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-7489ce314f7mr20660604b3a.7.1750195258690;
        Tue, 17 Jun 2025 14:20:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/27] babeltrace/libatomic-ops: correct the SRC_URI
Date: Tue, 17 Jun 2025 14:20:13 -0700
Message-ID: <94d24ff01573dc1d65078c92150dc252b3e9b145.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218933

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URIs are not available and need to update.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb             | 2 +-
 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 8e2fe4164d..0e93207139 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=https;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
 SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index fad92df507..69d8a266f6 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
-SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
+SRC_URI = "https://github.com/bdwgc/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
-- 
2.43.0


