Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CF9C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:31:00 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.7896.1720690250386406367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 02:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aKWQxvue;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso6724291fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720690247; x=1721295047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6MFe2nLFOQm97uLWqVdvp0npJOgDLiFwOlBTWDKVyY=;
        b=aKWQxvuehAUNZqx6akVIKW8G7OJ1q0N392aym+BUSu6oUa3N8s2VX6naYkUsDrSJZh
         lb4ikwQngOmfW5ZsTWGSjDThAwaH8w70pPQ7IA+sTSj5Ze6/Suv6pKHpvi3os91FpFQ9
         kG95uJ7RmiPrA6thpwqtxAGMuoKvY5l59x6sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720690247; x=1721295047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6MFe2nLFOQm97uLWqVdvp0npJOgDLiFwOlBTWDKVyY=;
        b=eUs5WQIxkt59htPSmz8e7E6eHYov2Aq74ptzzPFECcGxWxzilTQ9To6LKB9jRivxe8
         fu1RPj7dv/eTvfu0CxJo2s/8LYQQJZ/YFtqKxUK2C+XnNQ57dvAo84R1nZiZPtC5FUo/
         tnHeX1hS+3DJjaf+Ark9VpNkDYErMsGKu5yfFcschTuiQ6gp336owzJ/pAyAssnmR4at
         0NECmvQxeFtwyv6s1xoYY9fmxdrxC1r4dR5+eEnzbGkTC8OFfuka/oQU+HTUCPvHG+nu
         DIX6XnOOyI4rD/xHkKFlKB9CLNCrkn8OI9jy8cbEdR8bWfWQ0w1VkeeOLZU45n/DyL5M
         /33Q==
X-Gm-Message-State: AOJu0YxQBX5p9B2o6hUTmcNwv6MAqz8YQN7w2eO2Sunre0GJ5e/VEKfG
	vLUrfHC38jfTvY+a/J6TVss+CD2Mqvn5vWglxoMiHRfwO5XDC3lA2j64BhkJRcKR2m/UhsyF9cE
	a
X-Google-Smtp-Source: AGHT+IHyDm/N+2Bm2sPzLvgyM54O81Sl498H7sbWptMUNzWDJ2DbdvuF5T9/OTifGcB5yBiNVDMGJw==
X-Received: by 2002:a05:6512:ea2:b0:52d:b1c9:34e with SMTP id 2adb3069b0e04-52eb99942c8mr5430573e87.21.1720690246807;
        Thu, 11 Jul 2024 02:30:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e0b19sm107647135e9.2.2024.07.11.02.30.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:30:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distro/include: Add yocto-space-optimize, disabling debugging for large components
Date: Thu, 11 Jul 2024 10:30:45 +0100
Message-ID: <20240711093045.1166613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201771

Add an include file to allow turning off the debug compiler options
for a small set of recipes to reduce build on disk footprint and
package/sstate sizes.

This is currently applied to llvm, qemu and openssl target recipes.

The llvm-staticdev package takes up around 1.3GB alone. These three
changes lead to a reduction in TMPDIR size for a world build from
240GB to 199GB, also removing some very large sstate objects.

There is more that could and should be done but this does illustrate
one way to speed up and reduce build size in a focused way whilst we
ideally look into other approaches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/conf/distro/include/yocto-space-optimize.inc

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
new file mode 100644
index 00000000000..ffc121e440a
--- /dev/null
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -0,0 +1,3 @@
+DEBUG_FLAGS:remove:pn-llvm = "-g"
+DEBUG_FLAGS:remove:pn-qemu = "-g"
+DEBUG_FLAGS:remove:pn-openssl = "-g"

