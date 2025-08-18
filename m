Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6D5CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 14:39:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.77030.1755527973095042710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 07:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CH3TnBiF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb61f6044so710526266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755527971; x=1756132771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSVASLGXVeyQtFFX+hKAKgoEx4pQZpi+cw+YEQkrPFY=;
        b=CH3TnBiFUl6NlaZt8+l8+cDgp0W1v1AjVsdhfb0bH/Kk8NaJYHjMLl4rwnTpXz9aJ5
         UelfHRuXkU4z9cxg2NxE19Tcxr0Anqpd31BioKJcwKBDYpsUGwG+/68+318/kfTcvQvG
         xGZik0myEqQ9Cq98ODP52ILSdHeZ/fVKkUFgsI5z3VLkO0ciDMYZsHnJq5KH75kw+ft5
         8dI8QpA5i8nToimlkmID7W8EoBmVv7U0wBzD+/bwh2FfOsrdCtf9iUe0u+PkEawDyh8s
         NqUX7AwKkk05Oq/VyKX3dbZ5ZiU01NPKD21KrRjcW4U1J/ofMNCTGDroZhWAXvlaaPL0
         ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527971; x=1756132771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSVASLGXVeyQtFFX+hKAKgoEx4pQZpi+cw+YEQkrPFY=;
        b=U3OPn6gStm2J+ic1Hvf0scr3l0tkLFuyW/au5odi3lVjkYdmXqwviBkLM9uQxRv5Ck
         gYZbD7LYgQYhu9/YTSy3xo20MofWESxPG2CeMasgfxOhCH5QFX1aqvywF8WmuzRv+vWB
         bfdRWQ4qchnrSsjspccWXbkyZ97XhYnnAwYVJCwDqu6lZVdUROz1bVTBD2EVFY6FLPJi
         LWCT94vCIZK1yD6t++COdeyo9g0nJ1VH4sQx4LepB8OOKYXMxQH76s8qrMuvuY9lgZxg
         LcfkvQBMA2o8EZOqMSjQrwWToHmIro8mAm5WmYoSULGc0facFa+P9089fCBxGPT5y46n
         lz3g==
X-Gm-Message-State: AOJu0YxVYicUAIBM1/ZJfX3zQa3fwtdaDNAF74riuQ0K9mWrh2Hpf8Ys
	qNcSfiodGT8gqNxLjZERjsHC1INBeiz5tuABqzFpMQ4aats0atv7Z3DJAAUsDA==
X-Gm-Gg: ASbGncu7W7VxERoeTX+AVnS9mOo2nVpD9O/DMbtbsrcIYHoDurL8sX1Z/RuIznC5mjN
	P6wNduEH6KMnzhUQJffIGxMiTGVELGfJYY1LKrzTnKD2JH89mRCflA5GkAmeEBRa1beXV3fE6OO
	P+BDwW5XdntIMrbmkTGrTx2ZxIYTHw1Z0t+GGJFn6tOa5UZio0sxeWW/lS7+tyngKkfc8ba/w0n
	FGO+qzBdcnP7Hri5kaj9NO34pqLEkzX0Pm0s2RJn/cTGXhictuXyuvrdr0v8fnkahC6iTAcft8G
	h4KvyfPszBhw4YxK6tzNGVESknDDpeNZHB3H/jzCooIxqP85BqgvsrXmD3EePTx3jxJxvb+C+Xp
	56AnlTvy1dBMbET4EzGUh+SdnA2p3LVWRtx75ekt+jNEp7YWzARWmp5IW
X-Google-Smtp-Source: AGHT+IGnbweXBuPU+aezo65xYtbdqzG+FusWW315Fq10j96n7ALulP+hDj2E+6wQLerKDq/94D3C+Q==
X-Received: by 2002:a17:907:2da3:b0:ae6:c334:af3a with SMTP id a640c23a62f3a-afcbd5cbffbmr1811224266b.6.1755527971346;
        Mon, 18 Aug 2025 07:39:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afcdcfce50dsm829557266b.71.2025.08.18.07.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:39:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 2/2] bash: use -std=gnu17 also for native CFLAGS
Date: Mon, 18 Aug 2025 16:39:23 +0200
Message-ID: <20250818143923.908157-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818143923.908157-1-martin.jansa@gmail.com>
References: <20250818143923.908157-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 14:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222039

From: Martin Jansa <martin.jansa@gmail.com>

* fixes builds on host with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/853016/

../../bash-5.2.37/builtins/mkbuiltins.c:268:29: error: too many arguments to function ‘xmalloc’; expected 0, have 1
  268 |           error_directory = xmalloc (2 + strlen (argv[arg_index]));
      |                             ^~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 9f02ea17b5..2c0645cbd9 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -21,5 +21,8 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CFLAGS += "-std=gnu17"
+# mkbuiltins.c is built with native toolchain and needs gnu17 as well:
+# http://errors.yoctoproject.org/Errors/Details/853016/
+BUILD_CFLAGS += "-std=gnu17"
 
 BBCLASSEXTEND = "nativesdk"

