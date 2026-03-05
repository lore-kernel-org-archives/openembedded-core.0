Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90560EEF331
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39962.1772700955934127759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SxZS1G8U;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480706554beso83931785e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700954; x=1773305754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEQ8P7loztNrtpMVfmUfpm+vptjFJq6U0yy1SCUWefk=;
        b=SxZS1G8U2jtfOFti6Mt8iG/i8v9iDf71MkFQSSgaqfyK38PCa1udpQa8Lipo2y2dN2
         xAgq8kVBphZAftDuX5mcQTeXVKtT9p0AWBZ7In7rKcV2c5ZVXWaEYAcU3PHfBLiQijj7
         gvtM1rSTRudPBGkXaEEE7vW8xrB5rrXUwp0ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700954; x=1773305754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EEQ8P7loztNrtpMVfmUfpm+vptjFJq6U0yy1SCUWefk=;
        b=ii2wFDUMMB9tkvz+IY9DXWKht5wS1PfDe7/2Dyvn5MTsUITEmyym7FGlhUr9DMeq34
         ONclakS1U6cgjv6nrzJtyewWvG4FNxwGCIVjsdakEmiDx4lqLqA1opSKYxCtX9ii/si6
         z7zHFmqdyli3WAN0pDaF+TbLeLTnfXrhavsT8htrAuISKyMcakmhGTHONMCBjGOM6tBy
         iYmvnBgNtujDwSt41EtZbYZoWnKVVJ4JiqFUhnHgDdHXPGIt540kcjBKI2/ccFpqLB9k
         PzgAdUuWxt9vBQ5RRbb+YzuLHEbWTJIc/DEcGISokjEwXtjFMMrxF/xOrt71/qEw75oz
         ImYA==
X-Gm-Message-State: AOJu0YwDqzUhwC1EZkYVRwimEsOOKIq0eA5l9FuDG6hO9lLfZsf0bW3T
	FYgoqZKWUnHNYefhyFTBIA9emJZ7qgLqDJdacrzWpXxu2Nz/6W60octfzWsxM9GROcuogXNy9jO
	L0lD8
X-Gm-Gg: ATEYQzxNNtZQzHM/mix3fEMKuJ0Hyf7R2jSmJgVsY96/5sjYiH9DgiX+/SIIxWtxMyy
	0wO+VRewhw+GYb6dwJbqB2ydmC9+4uSWUgVubOY9R8p3DaYBvYOEmbo77f0pxCDAJT5qdJbRfmx
	YcB/GxTqt/dlg7KhV9BQV57a1oSmsqkxSKF0k/8BUmDNkUtp+flAt8AkxDhp49T5rugp9TPUm9w
	F8I4+SBEYm9mqxF1qrQ6fT0Ckk/HAqwx5b7W1yL4acwHfv2Fn5MZDCuOIq4jBQux76w1TOdLhf3
	x4GZCXMhDQJdEJ8jnBj3A0KGgNDtZp7wM10FDjkaXxCuAvfW0Q3XrqjBvrvGKYSDZ+p+6doBMF2
	vw6ugT+Kwdlu4RcSqEiMfWp64JZ5zaMHnbsJHdh43t3Pfcmq575bhBYjvD44vJyY6/tDWIFJr3F
	urcL/noDHxiKPymNJSpvwZ4kLleOkbx8K/t0Olx0s6xy55QGIgbXwQXEm4cFTx9HnTjdZuZZ6WH
	RkFtzc53P1NgJi3+vd1MX8aZBlG
X-Received: by 2002:a05:600c:828d:b0:483:ad56:8d16 with SMTP id 5b1f17b1804b1-4851983a7fcmr80207825e9.6.1772700954058;
        Thu, 05 Mar 2026 00:55:54 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/12] b4-config: add send-prefixes for whinlatter
Date: Thu,  5 Mar 2026 09:55:00 +0100
Message-ID: <d65310d181c4bde71d7f6821b0c2bfb27acb3a3f.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232462

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531..82d6c756e5e 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = whinlatter

