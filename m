Return-Path: <victor.hansen@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF0AC282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.15682.1741365420994265187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=dPF2qEDr;
 spf=pass (domain: remarkable.no, ip: 209.85.208.176, mailfrom: victor.hansen@remarkable.no)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30beef77634so9578731fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1741365419; x=1741970219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/TvFZev2uJtqYhggRmMF9G9legDpFofEjg1ekO4VJI=;
        b=dPF2qEDrOIo9dj4Yahc2RK5FlfDXMiBs4NzIgFDDaDorrXY/kItDjSiV0y3rFFybD5
         XK559iiJp1DGVtHfG0oJXduo+ZMsOX72EwnKle+pAbu1u9NPZ2OF06KHigUvA1M1h+oj
         ENxDjSplJGj/FhF8fc3wIfxKhMCdP6F1q76YC6YPS13S/6qCSiPd4eCUu1uRtikUBizM
         ZE6PZVHNmSq+jKOlMT+ApobexM35ot2ttgimu1xmtZkj0XiCY+2pPAfujuUjlI5nzhlU
         G4PuPaYWMIFrftZxqWDLnA9LA77uJyo9MeeE7qB73U0NtSnmFSNmGGzekbJiMYyXthhw
         aifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365419; x=1741970219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/TvFZev2uJtqYhggRmMF9G9legDpFofEjg1ekO4VJI=;
        b=Vm2jTFkJOQ/96CqJ0Ok2KseWaP42Hor0kG9WYDLz8sFF5sgGprjeLMvbYX8T+p+Jzs
         QbnKt5SXgJr7CqqNh5OWsb51rCySL9cefCkW/LDUJYe7xZLjI2wIUL1UfoB+Kl43ZwoZ
         BGOvMGbFUjwofKAkfnV+Ev2Km0dOL/8O1MWZiFugFUfS+0F4QbfVGU5QLhY+Q7QUBM8r
         NYszZR1poo1qD057oZFZjrV2YEXSktvV9GyLr/iJGXKu/Rujk8Ue9yuM3khUm4bVp3NL
         R3mcF0efkxwHCsq6ujbITizYtYIZg8es/JUHUzNbglRiLjEj7x3y9D2uXsGOmGvBzLku
         RFHg==
X-Gm-Message-State: AOJu0YxEfZbUUg6UgC2kunl91hdBrRWhB+m+Sm9khuRGjWo0ktZ1VHU9
	UlBWJWUb7vwHsN8l1gaUgzCyPXmxeYDyfsNBaFWAd/32GEDQHcguFy0HMWAsKFWOgpzPuRnFs4+
	nwXk=
X-Gm-Gg: ASbGncvrw1+lAObVKck/0BXJ+QfsqW3ItUMCf8YqoA8MIu+k0sC9HQbnjs90na69C1B
	x+G3+p/Ywcw2OSNPolRltU/HvMR0J3s8yvPJKp8VKowAUOs9Zzo0AVQ1B6dUj5d3AbwjclQJFIK
	kdO4lqWnrYB49EZ3wMNLWh14Eh4LR5kqGk8rQm1HOqL0zLbJIskeLcufJYdDNHCFvdBef8b9Z4a
	jWoJ/1V5676GwgasOtDshOyVK/3FNmSJbzI8YX3EN937PYdngNw5hAy0SuJQFC6fLaLoBfP78xg
	91YvDh7Gkag7xAr75LM64865qGVQoCUdfIc3RFU9FqClTbYkLfD34qSXNknovYgxtxbJ52s=
X-Google-Smtp-Source: AGHT+IEI9uI11gpULrvNShgoEvEbStQqCtxAOCSOQWsiQtzZnTJmTiYndyMxWqiyF9bK+ia4qxx4ww==
X-Received: by 2002:a05:651c:1546:b0:308:efa4:d277 with SMTP id 38308e7fff4ca-30bf451a693mr16574071fa.15.1741365418927;
        Fri, 07 Mar 2025 08:36:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:799:c96:7901:5b3f:c02c:b0ae:4afc])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfb656dbbsm1132681fa.50.2025.03.07.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:36:58 -0800 (PST)
From: victor.hansen@remarkable.no
To: openembedded-core@lists.openembedded.org
Cc: "Victor J. Hansen" <victor.hansen@remarkable.no>
Subject: [PATCH] cmake.bbclass: remove whitespace
Date: Fri,  7 Mar 2025 17:36:37 +0100
Message-ID: <20250307163636.823918-2-victor.hansen@remarkable.no>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 16:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212457

From: "Victor J. Hansen" <victor.hansen@remarkable.no>

Signed-off-by: Victor J. Hansen <victor.hansen@remarkable.no>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e79f8a7435..b342deb671 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -170,7 +170,7 @@ OECMAKE_ARGS = "\
     -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
     -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \

