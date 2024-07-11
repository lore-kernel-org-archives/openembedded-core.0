Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54929C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 23:42:07 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.5671.1720741326952845521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 16:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gu4sGkgl;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7044c085338so775136a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720741326; x=1721346126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv6DvrytM/uRmqgfa7s7FRJO3js//4NGztZV0B1KUzw=;
        b=gu4sGkglY7wTW7kKV8gXC+XnJiQjeV8x6MbIJAht64+oDVjJQ7yGZHQ+ZgJDrwU8WV
         AdjHb+wU06A/n5Sz23ODVKPcnGc6+1frVlZMbLpYLIkYCSlrYSnoFYThbUCjOaaAPy83
         gcFLRw5jMzOJ9SzndM85FGA2TXE5yL2x/gZAGid1q2do6d+QdSNQIOQSKKNFf9bBrIsB
         yvf22lFJQuHq+2xhzl0ussEQemhgMxMteCGBKRHLT71bgP4deIpqXMJfddLyTg3J8Q3d
         K5xFF2FKi1RvQS64leV6wpwgBQtiYbdi/DeaJr1YpMWB5OyALyOrqOFO0NBj8kTM8hlN
         B5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741326; x=1721346126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv6DvrytM/uRmqgfa7s7FRJO3js//4NGztZV0B1KUzw=;
        b=K2V2Pn9ScUHsie5q8Ae1N57eBaqGJ43NRFJulcCgQ3YpfQCU3FsrpI3eefa6fp9in1
         dwGZKca3eZUJINq1LaRmYYiWbl9pjtDTMCArCX/qb8ghkQ1g66HRCX4/diLUZZdP1fBP
         0sEVxCbhlSkxj8F2v/bPawS2EVQ+RVOFtEq/c7bcuUN67KFdTjix/yz5j8FCuKgTqW6Y
         7IK+ZlksYrE5OYiwzWaKggaQjt3IaQTLqRcmFqlYTrLmcz6nATVjeXdElo+6+xBWFGSf
         YkC7hM80m1kGDYzLeXDuDwY0fFnN9VDYhMNXCuexMnu7E4v5acLKChrZTl8UdWp8K+tZ
         6kRQ==
X-Gm-Message-State: AOJu0YzxE8ieVZYFbZO3J2yusydwblkJADAvxogXEMKtqZJpSr1xbxNl
	mY926FA9b3XHE+ZwmYv5WkpjeVo+5QVUr2gVu967i2ifvoBXYjZDm97dLu7Q
X-Google-Smtp-Source: AGHT+IFpsE4AT95UnskVLL92yzkZ14RySLFHZB3gLQXwaIU5n9BJ9GhJC+ocYYC24DmWKTbw46/6uQ==
X-Received: by 2002:a05:6870:d626:b0:25c:c42b:5349 with SMTP id 586e51a60fabf-25eaec582efmr8039458fac.59.1720741325701;
        Thu, 11 Jul 2024 16:42:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c49a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4397ece4sm6447116b3a.144.2024.07.11.16.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 16:42:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] mesa: Add packageconfig knob to control tegra gallium driver
Date: Thu, 11 Jul 2024 16:42:02 -0700
Message-ID: <20240711234203.3841594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 23:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201795

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d56def29163..c426e8fddd4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -199,6 +199,9 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
 PACKAGECONFIG[panfrost] = ""
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
+PACKAGECONFIG[tegra] = ""
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
+
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"

