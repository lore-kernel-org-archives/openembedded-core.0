Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF7FC41513
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 13:39:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.83698.1717421982851229596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 06:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Frl4SgYz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421338c4c3bso21798785e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 06:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717421981; x=1718026781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6qwOQNpE9a65UcdeTt88uJCYzjd2pkPKvEh2V5CLwU=;
        b=Frl4SgYzAoEUWpvxQgiTwxr6+XuFZTq3ebKRWoEtwWM48/8+1b8EBeXFHhkYgeauoh
         nL5Mh1jTpE68AL/X1eh5uHvau66yq2wiw5DHuQv5Z8VSXvkRJmB3sjU9gUyMKYqSl1Yq
         L+XGt7fJPW7O0Jw8RivtiOfSaMs8bnUSoUrT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421981; x=1718026781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6qwOQNpE9a65UcdeTt88uJCYzjd2pkPKvEh2V5CLwU=;
        b=hdla7qLEigS6Fmz9BwNGZUtW6XIsY5+eOLk15KLM4Qkspo+Vh9Q9tEroSpBtH7I5u3
         DjfM5PBEZGWHeo3S8ZZG3N4jU2Mk+rTTfHOF+4oZvRACuqdwyu7IHO5At/S8w6RGpwnm
         GqZccpWGIWLg2e2dF+CfVD2tLMRYUcHoWnYyQEAV0U1U1ZXXRKx/Ny/IDwPBpcm+3UQu
         JYfV1utJuRm3ZpTHeg7+POWh2GkumaD8Ay/0n0tpQwX83/K2EcBQqOpqio6nTqPuIIVc
         O42LkpwVfbxgFISlTFDIVntvMRXZtwu9aHS79dO+ptzzHzqmjLMLCqgGBcE3eD4yBATL
         AK1Q==
X-Gm-Message-State: AOJu0Yx3nHgFINFhyXJGY/NIC/jiCkBlF76IDDozu0VdOfk5EAhxRfKU
	rXMlrbKWqDK0brpwlTFyvOLuyvWrtAx1WP8btF9PiG/BARTQqd7JjBLPjzwOv7AzE7Za+P8XGue
	v
X-Google-Smtp-Source: AGHT+IHdasa+5tgBTWxV1fPwkuPtDQIcUE7pMg8+c/qfgCBdbQF/FZ9bHot1+p7RWlRfhRi8l39YHQ==
X-Received: by 2002:a05:600c:4744:b0:420:98d:e101 with SMTP id 5b1f17b1804b1-4212e04a3aamr66795935e9.15.1717421981184;
        Mon, 03 Jun 2024 06:39:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a80:acf7:af1d:55dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a4cc0sm117581735e9.30.2024.06.03.06.39.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:39:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libtool-native: Drop obsolete systroot config
Date: Mon,  3 Jun 2024 14:39:37 +0100
Message-Id: <20240603133938.3552266-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240603133938.3552266-1-richard.purdie@linuxfoundation.org>
References: <20240603133938.3552266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 13:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200251

I can't see any reason this configure like for a sysroot is needed in
the native config and it doesn't make any sense. Drop it as
obsolete/unneeded.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-native_2.5.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
index 90c06f0ec3f..92f4b463032 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
@@ -4,8 +4,6 @@ DEPENDS = ""
 
 inherit native
 
-EXTRA_OECONF = " --with-sysroot=${STAGING_DIR_NATIVE}"
-
 do_configure:prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
 	# any upgrade

