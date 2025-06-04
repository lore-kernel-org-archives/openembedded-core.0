Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBC3C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 20:06:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.26499.1749067594510534254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 13:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ASkwus4c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so1533245e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749067592; x=1749672392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cppCkG3GMJUcqyhsk83tfI/8avKVjaj19GCTdZk2HCQ=;
        b=ASkwus4cOjyg6KZNsCVuaabA3EkvqT11GMq0oTpOnVVZyC5lqigOQiT9HBU7r/RPdU
         gsX09BQEYVkZFRYkqK+0V4JDG/wOOVjxO40+5H3YGZnds5S7szPDPObXlzOjxu2FQka1
         DL1SOOL10OjVLH6JnNhgzQYSnhHMPaJUGnYHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067592; x=1749672392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cppCkG3GMJUcqyhsk83tfI/8avKVjaj19GCTdZk2HCQ=;
        b=Y6t5NwK0g1pJpXnlmNK4UT5LRW0Sc3dxP5FPU7eBiBoE4FeDuDdyHB1e5yMWoRtxQX
         +ui/YMAEu1VgoKBfSlE3n4nTL7ZewbSQxwe+E9waDCsk7qwDZu8UP7XLVUpmZBDqkvgj
         OYblRqQPBf+SvMlKy1VmcIQlRNl3hq2rjBno1GZup98ZsBncM2nMIU8VeX6ixnTx44Ux
         YotBEnkKpR43e47YmO7pWTr0H3+fWoc48GrZBSOMwEYLxoRT6ts0wdfQVo9r8Ge4PBB4
         zXcaIwbLzogTkOD3d5ZKFvgqa/G39cYd98nWVye0/oAaem+QCR736aw3Hf8Blf/D2K2v
         sKOg==
X-Gm-Message-State: AOJu0YxE68J8/vJaon7V42hZwmqKL0hQRqcR8Rx2Zj19qcdSdvA7OUfA
	DXsGbtc01JURfbMtLMrVlulmWJg7fyMKSLlFm/mlAXd5miHRKjfjwpGeGTC8NDO/58qEJArsbDG
	Udpmg+ZI=
X-Gm-Gg: ASbGncv1tuOBr7SxQOTpvVq5POKsoyZP7Ig/gqjOwQeBAd0qRXrLyQgTRzGq5dz75vI
	9/h4M0qznkDuyQznYrRT19laV7ZpI+u0wNZPZJC4fKTlqlpNzfrNlsCE8AO1CVTIkYd4XxK58xl
	VF68HG2wz0d4m7gCj2apPKPPCgZjzYUlWDIvrdgVehizuM2nUgDaqlik5y9WT3EYnHWLYjfGAtd
	0G/c0YWCiZFgbDzPJHzSK1tSIBclClTKPVMyqLZd3SJjPeK7pnZ3kbkPFO+EKmRF8OGYM1TtR2I
	J3PsIbaQ0iDUfh1p4jpHJzGrjA9v6cVje087TW/kfa5/EmrAOnk4k7pTSIeEEaiA6wY8E8ylEG8
	1Ch4l
X-Google-Smtp-Source: AGHT+IEQ+tu/fftOi9czKbh9qFhdAgRSlZAZ+H7l4rBZfYaISrdvuili/TkiPzLaQgrmbvae6k8/Vw==
X-Received: by 2002:a05:600c:8b27:b0:450:d37d:3584 with SMTP id 5b1f17b1804b1-451f0f31013mr41184845e9.13.1749067592292;
        Wed, 04 Jun 2025 13:06:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cefesm1360215e9.21.2025.06.04.13.06.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:06:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] barebox: Add missing depndency on lz4-native
Date: Wed,  4 Jun 2025 21:06:30 +0100
Message-ID: <20250604200630.3899333-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 20:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217964

| /bin/sh: 1: lz4: not found
| make[4]: *** [scripts/Makefile.lib:413: common/boards/qemu-virt/fitimage-pubkey.dtb.z] Error 1
| make[3]: *** [tmp/work/qemuarm64-poky-linux/barebox/2025.04.0/barebox-2025.04.0/scripts/Makefile.build:293: common/boards/qemu-virt] Error 2

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/barebox.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 200ba08326a..a562dce1690 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -12,7 +12,7 @@ PROVIDES += "virtual/bootloader"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS += "bison-native flex-native"
+DEPENDS += "bison-native flex-native lz4-native"
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"

