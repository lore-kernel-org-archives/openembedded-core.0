Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D51C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.13810.1699451223427594666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ltMr+sYn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc3bb32b5dso62256885ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451222; x=1700056022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oioJgKmIboNtqkY/N4aGUdts1MnY0RQ0GV32VaEHMik=;
        b=ltMr+sYnLIRVBu61aJR/YBGP4t/RnEeS1DrV4tVVC0bIXBibimkzJ5RqPdKR9CE2uc
         5D/1jQ9Ur/1lClFBL8dxjgyT93uBp3isykwTdXJUfm8ER+Yb9zB2WIKY4CPKvFvcFGiX
         9MyVY+efxX7y0bsT0FKRS0Mr+L+2wERil1METhtZ1fNpxc+4nEOFjmmVIfSt1CpYhSqS
         28vQB66ZZat3/z9mkh2zyZwhZBt93Ock5uc2sp2jLypaeTKCqg5TthPLZq2FKQ9Qdz+z
         eJe2dWW0lVzv29EWQMQ8gD8PSSsuYL2tFmA068JHOLh2j6Exs3L7iAx4p0GO0vbmR82/
         vMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451222; x=1700056022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oioJgKmIboNtqkY/N4aGUdts1MnY0RQ0GV32VaEHMik=;
        b=jXGz85G6QGesvYT0uid9MrGqHzfjhcV6bxFllnrZHICjSMO2oi9faeVZqKNpPtjGjY
         MBbxdHDuw0IxqbFmvwiKGaF0Lsd750QoVkcYRwbZSRBtMvzS0aIqOcmtSzyTY22ikbTr
         j/anKigC8eYIMcIZ80dYEQaHpiVxhxJJzdGNVTt+oyLMweE4uIMN7L7629AXvZd3Khgn
         T4bQyCW/h/179YcjhX9d/ru41XkDkueC4WzxNaUD/SbXIegimIFQ2/nPjQVA+83QBW1p
         6CwJ6hz+nGuLrHrd2dSNebxXDtRRngxDKfHfU7nrcpliy+DLequ7W15qJKigR0yezB+a
         TuUw==
X-Gm-Message-State: AOJu0Yxp4G9tQ6p28jBL6RXtOw7VOrN39PwPikSHfK0TbNF/eqln6MoQ
	L9h+o1QRr+RNVsaLWACaDDqSvPElC3dfIAU+MKPLEg==
X-Google-Smtp-Source: AGHT+IGPYwDUVo+27Wf+dQk2OiOkyHY8NR8RR6OpZWkUEJFFbWsOXwHyAMz5wNo+9v8dliWAoRIx8Q==
X-Received: by 2002:a17:902:8c83:b0:1ca:3c63:d5d3 with SMTP id t3-20020a1709028c8300b001ca3c63d5d3mr1948580plo.2.1699451222565;
        Wed, 08 Nov 2023 05:47:02 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/10] pixman: ignore CVE-2023-37769
Date: Wed,  8 Nov 2023 03:46:44 -1000
Message-Id: <3625bed6d7432091bfb144314b8ef979b5246e4c.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190329

From: Ross Burton <ross.burton@arm.com>

This issue relates to a floating point exception in stress-test, which
is an unlikely security exploit at the best of times, but the test is
not installed so isn't relevant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a36d62a06be6cce1a438f8f2178eb60aad6b7267)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index 98df6dab21..8a93f8c0fe 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -41,3 +41,5 @@ EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","","
 EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2023-37769] = "not-applicable-config: stress-test is an uninstalled test"
-- 
2.34.1


