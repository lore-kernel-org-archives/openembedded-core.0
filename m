Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD6EC2BD09
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.16478.1718787605035290595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X44mGZAJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42165f6645fso51427695e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787603; x=1719392403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPSx5lm2/niZ78B5QJ7kVWXD9fwVwcbaqhBv3BNfCZg=;
        b=X44mGZAJQyuL+u4yoYCBq/ffykz68+2REyXdy2Y809PAinTQ/5IfQf9XkWqdkEr+WJ
         EVYRBDVoGDXbLaxQoBz6oBdWJwaGeHzwza4XEWbi8PPCqzQFxpch8pBf+AqNu7Qhg7K+
         RTZpLL5bv8sO2aUDp/mWaBHdDvK3TFXU5e2/ubbXrK2Zp7GQuh73Mfqvobub/nCV5z1O
         zSj0zmtwt/0W73uBV6+cm63YLIiNoUQL60pC/1ldzFDBRNgoX8NFQIX873t3Q2S4N0vm
         zUu6MEgm27Rx9T5i9NlZAaAItkV7QsPn8rcNA1mAmhs1+r3CwKa5JJ26kD9Kb6xK4z8v
         Wj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787603; x=1719392403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPSx5lm2/niZ78B5QJ7kVWXD9fwVwcbaqhBv3BNfCZg=;
        b=GANFRmf10cY1mbKEBuFevqXPTHkyo4pn0z/GvpU8iFSM0dk7UY8Qj1nUVCuo5AtlOv
         4+vRwRKdigZvwiXImdcGa5rJfj3UvQCAJshXF7WC0iKrH2LeE2Gt9DoiLTvOqLcsDRBY
         qbsvarMogRwQt3LYs4KsHfwYlxTwhlVB+lp0ngyqQ0HG6mtt37NgE/kaEkwyFdVHfX2n
         sGP1FTsuWGaqzlkLYl0XbsGINuwSvrauOUg5uU9Yx2+8LxkJBXYjRUuT6pzUBxpAxr5z
         v9mYbsUAvxtSI1HwRidTOY8YEZUjr/1sH444k+2gFTj396Jdx8YhT0C+Nsv0D0e0dX38
         KWKA==
X-Gm-Message-State: AOJu0Yx8p+kaL7jUtfODWErlIGDwufW0K0bYTx/YCg7KUICr3LcaVUzS
	Vzvq3TpAjW9QX88oNtwy2rN6MaKPGgbRvgXRBG15RI5lrATcsz1rhfzgVQ==
X-Google-Smtp-Source: AGHT+IHr1O5d/snzFLksPY7/dq2HhLqZqTnj4z1MXx6AOgC0D6QRde9nrSamFC6e0q6AraegYsnMzA==
X-Received: by 2002:adf:a44e:0:b0:362:3cb8:cba with SMTP id ffacd0b85a97d-36319a852fbmr1294961f8f.67.1718787603149;
        Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/15] glib-networking: submit eagain.patch upstream
Date: Wed, 19 Jun 2024 10:59:46 +0200
Message-Id: <20240619085957.2787700-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200890

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b7..98ff4760716 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -12,7 +12,7 @@ FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
 
 The test should probably retry in this situation so test a patch which does this.
 
-Upstream-Status: Pending [testing to see if patch resolves the issue]
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/253]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
-- 
2.39.2


