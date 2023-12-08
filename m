Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0790C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 17:31:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.42190.1702056688887210826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 09:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LRUdKpLx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-332d5c852a0so2450462f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702056687; x=1702661487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxrrpwr+nHr6VP53vPaky2caMRdh58nlJk7RVrRm7RE=;
        b=LRUdKpLxrUWLz0kixo/IvET0+HbvNM6erAru4S0Ksqjt6PkS92Guj64wBkmzq6lOxq
         vcOCiBsn7mFuiQxOlFXmHMXS1FNKLeCNvo/rhWnsz7xhPbxoRPtYtWL7maalxEAu4FtJ
         g2n0GTOFXKHy0/CYQnwyrVZuBUFoCvs2ba98k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702056687; x=1702661487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxrrpwr+nHr6VP53vPaky2caMRdh58nlJk7RVrRm7RE=;
        b=GmMBT3nZjhJHqa+yGXvp4igJIysymbDktNr8K8t016m1nO1nSKw+7swaE3PyTLCF0p
         jXxR6qwguZOv0GHVLI2Kbzei9DKW5xULdXPjzH7SIgpwB9/6hlYkp9NWGrSe38sNMVtf
         ymVD/aWJrL7Y91/fP9AvIk8rsDJM9Amm5lUVv1ZqjIzxH/Ioy4p3aF0+MiNvoB6MmoCM
         X9ItHXC7nVYNgFyrzVCht8zM1uOBma+udi7nF1wUj+rDCoJ4AXTZn04sBfH322vuVGEX
         Dj+pKCeWXyJ8qoDQ4RMzatKt+b3xqb6+pH5Z6XP7pEJCiedR/mK2SHh/v8b+0CZH0X/k
         YxjQ==
X-Gm-Message-State: AOJu0YzLSpeaCbPKdEJwJRJql7JkkGYQBi0yHdwXsOMlminBvBTVkmg+
	FDe8t6XJoI7IxZ9cQ2e5eBC6EygNT/TS1gxsPPU=
X-Google-Smtp-Source: AGHT+IFbZlBR3bJiyP8fBWxJpaxE9pkEUt3kFvGqOXzXWhCn2hGoWfwdBADqBcLfQouUALkoNUkm+A==
X-Received: by 2002:a5d:6946:0:b0:333:2fd2:5d1d with SMTP id r6-20020a5d6946000000b003332fd25d1dmr217785wrw.79.1702056686804;
        Fri, 08 Dec 2023 09:31:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d548e000000b003333fbb68c7sm2423718wrv.112.2023.12.08.09.31.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 09:31:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to pull in syncfs probe fix
Date: Fri,  8 Dec 2023 17:31:25 +0000
Message-Id: <20231208173125.2044092-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 17:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192082

Pulls in the changes:

Eilís 'pidge' Ní Fhlannagáin (1):
      subports: Add _GNU_SOURCE for syncfs probe

Richard Purdie (1):
      SECURITY.md: Add file

Wu Zhenyu (1):
      pseudo.1: Fix a typo

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4a894ebdd0b..699cab11c66 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
+SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.39.2


