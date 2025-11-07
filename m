Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A93CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:13:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6820.1762503213899482703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ie37+Wtj;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso410439b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 00:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503213; x=1763108013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4mqdmB5h5BOHfrTFbD/7An7s+Ep1lzYStEAGzJ0YBM=;
        b=Ie37+WtjTSjsP/vQJ6/nvAw+3lj/MY3XOAL8PQ/5lcrikGTbOUruvLJRv7YKeQlOS3
         bHsXUD7Wh6DLx4aVCERmqCCZ3lANoAum5iG21m0Ahq8Z0w64OcfUQcZgyvIlIhVzIYTt
         CWAPMYSSFl38eC1yk7BK0sMa7YbGEfCnF7O8yIjbeUOKPXYPyLGp4a9j4UobrmNHU/6U
         FeePRtiP3+7b8fOdFcUUWqqEAWFBG9XQcqyUdVplU1NcMM4GI5CSQ/+Jd14uWaTCFvYb
         LfN14MXO0UZqZ0Rd6U4xpm/xveUfdBV1JSYQdPHkFqmXxWSUWYK/xRawAP8qnsiWn2mB
         NTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503213; x=1763108013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4mqdmB5h5BOHfrTFbD/7An7s+Ep1lzYStEAGzJ0YBM=;
        b=Dtrrg4IK0S1ZyOXoJ8bMsDheK7K8+jefWc/Mg0FL+eXREAv7J+QjMzM2aWBlSLlWib
         DO3xsgvLRU0j8EVMqURGKS5fYD/E0B4flUXvBGRxs/q7DrRrLg8G+hkREsolIIG3m1hv
         G+l7u8ysCNaZ6wD1eWRjU+Mbg777EacwcbTRvtB+Y44ToKgYIOKF6tKISMkwtnaQ3okm
         XoInFN8RrB0IDqArgr9w0Q46Btm8WFzpGZ9vc3lnMMTGL+FlgJuPlF3oKKq4zNeivpXJ
         w1aZ83noLix8XboO8i2LX3ZVSe5RRYDQ4zuNetSqNyvAuiJ1UX0CivLaDOcbS6IBUDxy
         aE6w==
X-Gm-Message-State: AOJu0Yw1KvMkD45LcAaaQYy/CJeX6yJFdwu7MX7dAF3RfCCo+2Y42ja9
	lKmi5oMR5KrLCCB+hTjuNk+K+iB3xKLuqNcVQvaG+2l2XhtqSBuds9zqPWcJVg==
X-Gm-Gg: ASbGncsXZ/DBayV3X1uGl6nJCK7H3gOC2uQXkiSowxulq2x1nvtrjg9bj4UDFiWXxwq
	jDyQP0rKzF9xTyx9iNOsX3y8AXRi+X1GUF3XEJjKibFkiTSY2vco3Gvf/aUvsxC3nR39p7Ywf13
	ZkGhXIiCdvVqrKzQgBPhOg4OVwwdgoHpJcYZ8cJInlW6QC7vAQfLQikC1Ba4MAhw8YMuiDcF1E2
	moDTt2smuEO8yz3eccJfN4sQdJ1KYJNdRYwcRyqAhaCt/Qncvq3GnEViWFYgEwTt2Z1L7AUbYz5
	mTC3U2kficUFPN73uMMSikU5AmKiIjq+JwTky2rbLThBOPpNfOZKX6M4px4Zzh0ALFKNGPyYEDP
	7QJti63CRk7tl27MdemBxjupcI45ddzKQMYo9WO5phxyEK05TzBf8kIk7szn4fyd979CfsVSnNU
	Sa2rgdwZ38LWK5UkNkUuB+J8it
X-Google-Smtp-Source: AGHT+IESeECQKtW4p9ITlRGAhkPA802dAujbCWad+Z8JQuJXqr9cVdWydxT3oI+Txpj1qYyYp6nbIg==
X-Received: by 2002:a05:6a21:99a4:b0:343:72ff:af80 with SMTP id adf61e73a8af0-3522ab71042mr3705716637.58.1762503213070;
        Fri, 07 Nov 2025 00:13:33 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c801d1sm1043010a12.7.2025.11.07.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:13:32 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/3] kmscube: upgrade to latest revision
Date: Fri,  7 Nov 2025 21:13:22 +1300
Message-ID: <20251107081323.4111387-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107081323.4111387-1-ankur.tyagi85@gmail.com>
References: <20251107081323.4111387-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226019

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Fix NUL truncation in initialisation string

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 243728b115..59bf1c8b40 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "2c1f2646c5e58d11b279b610a8509116c02b067b"
+SRCREV = "f60e50e887d3c49e91ac9b06d8199b36152632fa"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 

