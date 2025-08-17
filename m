Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B82CA0EE9
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 22:58:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.62769.1755471506507825985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 15:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQPqCU/0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3bb2fb3a48aso1180054f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755471505; x=1756076305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCcg3IVObnHZeF9oqbJQkhNuPDy+Y7X+ckWzFkLtfJM=;
        b=CQPqCU/0aqsTcmFxmJWSwY1jvbBO5u9rZajjPo49annAClUSb29kFrAOW8KUDB4S5s
         +XiACOGkzUmIUCuGKzYPtYWdIutJWRXa/nlAeiXDiLTyw1dFkLbhpP4ugsR8ZNtVL3Bd
         L5zQXP+UGu4yC2YuxSSRqYRxtn2dZ/NosADcSpKWTi0qh9OndxClX19AlhJ96tFy1TPw
         CYWvO3qkB6tZXhbrE398Ysod0gxecLfnk1sH/o8LbGU6htLLYuPrZeSt8uNSv/Anc6Am
         fsQDZ9Hbw2msnAdbo8sCXZYYmAxd4ULVNsslSNYz5TTGElLRINgSfkIVzJhlLZ2gSCwu
         BYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755471505; x=1756076305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCcg3IVObnHZeF9oqbJQkhNuPDy+Y7X+ckWzFkLtfJM=;
        b=JPmbyTWdFWbRxTGr7D5bwwcA3NkFisWYJAO0g6ikAtqIqeN34kF6+zPqJqDkZYoJqh
         Ui+IxVTSlTfTbzk29BT2ntAt7U+eH7Ut4GODk5+Fnvsj1wGargkUxuD1u95crxHROBB9
         MZKFuhea2LXPkPr3bPbFFOWnfW1cO5Kj7274zUXpK2Ijiqn1eVftD/YC+JSgRz/FqU4o
         5rsQ9qbKYaP6ItpmdHP6zlmf+80WaPy/ykk1GO2zaYlw1LO7xryIP2C1XBrTJv9xEYkj
         VhiXUK7ypfxM+BGEeUU58IE0IEaWSCK8F1nuZ0TXLVpLeicHCdwF6x15C3MxvlhndjDh
         wAQA==
X-Gm-Message-State: AOJu0YzVq59V2ROaJJv8gD3jooBKHbroz4+6Pr0V8PH7TaLrvTb2i2US
	7EBTSMdG1357QLPy5xKu+sSPD0tEmOVqARRcVf98Ej0pyHXgWm3thTcrjq89Dw==
X-Gm-Gg: ASbGncsYbgW1bASLd8CoDJRrYC04Oyrr1XSkRa/Fc1GGb+iPnATVG7owgdjtfZ4qWjw
	sCCbV53BfSy04gi8BhhtWoREd4YcgeLpHfQDzm96dNtQfrZK9MrT46buJcENsrn0V9va8L6i+By
	Yf4ca/T6NpmcRsMImjTjNXX4D5vpXOn8gx0pzgxq8EN9zJGmjdpRuLoJfMxPqjuuFETapnyfEqB
	KNVKxWcajjtflun5zxEioS7yX8tN8Secj2l3kRkfAV90Ol+fFpq6PvhcATqPzT+dt4iakX2ifCT
	2urVxV94MCkF38qChyTXNpPfLw4/LadstdKdYtSWsA0HB0ukTondK9Kce4UF78iw2uLpLNsnY8y
	YB9YAsNvAB0Nr7APvc88jSKE3pw==
X-Google-Smtp-Source: AGHT+IGcSIQMRZytxh6vfXM6ypYvYxTnQ342HYYy62hDEsN9hklV9e4pze0viwCiY5YMnUu4qdLxqQ==
X-Received: by 2002:a05:6000:2406:b0:3b8:d893:524c with SMTP id ffacd0b85a97d-3bb6969a919mr6434066f8f.53.1755471504545;
        Sun, 17 Aug 2025 15:58:24 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb655e3773sm10647762f8f.30.2025.08.17.15.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:58:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] bash: use -std=gnu17 also for native CFLAGS
Date: Mon, 18 Aug 2025 00:58:16 +0200
Message-ID: <20250817225816.2089232-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250817225816.2089232-1-martin.jansa@gmail.com>
References: <20250817225816.2089232-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 22:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222029

From: Martin Jansa <martin.jansa@gmail.com>

* fixes builds on host with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/853016/

../../bash-5.2.37/builtins/mkbuiltins.c:268:29: error: too many arguments to function ‘xmalloc’; expected 0, have 1
  268 |           error_directory = xmalloc (2 + strlen (argv[arg_index]));
      |                             ^~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash_5.2.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 42ab02c440..7652e7d87a 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -23,5 +23,8 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CFLAGS += "-std=gnu17"
+# mkbuiltins.c is built with native toolchain and needs gnu17 as well:
+# http://errors.yoctoproject.org/Errors/Details/853016/
+BUILD_CFLAGS += "-std=gnu17"
 
 BBCLASSEXTEND = "nativesdk"

