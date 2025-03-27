Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D78C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:32:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.843.1743093165445259683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnHiDQ6+;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2243803b776so40095275ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093165; x=1743697965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k73K4uP12HVtCqVYymGvKU6lThlJIv0MtLrhRLY0yFo=;
        b=UnHiDQ6+o5dgjs1X6JrI7wqrAP821PwTaldbPe724rD4xWxbXzqx6PEnSv7QnjbQPJ
         6v+tO7uUrsZAOeoToW4J2plcT4r/XxrnJjzFBzsS5UUKAMsh4t2NSQgEaWJe2CGo/QnB
         MlpFVDr2ZHGtgPxhDkQoY0clshbW2JALFhfSSbswcTRxAQFQCMYqxpUx4fS9WSHysBBz
         hS4aFigxM1/0LQ3t5ErFq3td5RsOhySbiiOUN778GewDekJkJxRd5bkTcB+sCjSq1dNX
         T0oTwObQII6EAIFF0fws4tHQR5jEV5LA+HvINlKWnz6UiNITfQzrpOQOMkSCdb9X/aij
         Kjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093165; x=1743697965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k73K4uP12HVtCqVYymGvKU6lThlJIv0MtLrhRLY0yFo=;
        b=VYkswIOEIQTjcia1ix/lopl07B+G8teLqK/daHnYrAza2IxPlK2YJC4g07GhtXJpDn
         AlkpCtbaX3rx0hzeJgat57ccL6Mvv/QX7moa6DTr4JN4Y56XLMn4E/w1oEwRnEpS/5/T
         5HfZ40F55r6XEw/iRIQLWMOBJmxipjqN0d1Kylr9E8cA/kJut8CVnvxjVhvIAeylFuxM
         t76kET27GmesG3wWnaBMS+j0pDt2CKbT/ubcPfW2CxWAt5AUAgIZ53TK4VxYs/EALIDW
         c/urxRt7eY3WvZbgetWOnmjxLMO3O0h8lHugbBj15nxCF+KnXcWkB1QoWBSCgTQ3ibTK
         eYPQ==
X-Gm-Message-State: AOJu0Yy6GrIbtSBll6jPrrqECuFstYZWB15PKXNsBPaJ+Gz629IX0vhw
	NP1lrFvTMWPrNeYGiVKnQHOpf5EftWsyRIMfZAqQi7Cnp9qjT7jrl1bM3lEP
X-Gm-Gg: ASbGncvXanqJ2UMp7J8aVGEKLyM5E7evXM3d5EKYHm0QclClHfRzjP91q6BBdBKrEs3
	LxQ2mEDGPgRHshp+rIo7UHaftNSEP/jd7MWSgT2GYwhFZLKU+SHMKIVkSsGya0DDPvAEjowJvDI
	mT4uAf7ZKGbSQHxxIsahbY2o092c9iNhhefQ2v/uebB6TJBQHF8R1w4KHTP5rcY3p/pju4MSHxQ
	icSEfNhYyWv/db79gNIaykJk4ZzRwvABsE6y909wu1gGmCbvvLTCR6jk/j0FNw1sdSNZnW2XSSy
	j2IIF8rwPZNKUEsg7d9qceF2EKHUaRNc+kYp
X-Google-Smtp-Source: AGHT+IEB0iF/pJbsSWjD4VyIYdLqMPJNeFo2wJ2RaEDbkw2FcPT/4pybfViYqXTPxQ7dzZ+FYyJayg==
X-Received: by 2002:a05:6a20:3d20:b0:1ee:dded:e5b with SMTP id adf61e73a8af0-1fea2ea8f66mr6839250637.24.1743093164385;
        Thu, 27 Mar 2025 09:32:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67f48fsm92953a12.9.2025.03.27.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:32:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] man-db: Do not delete chatset.alias
Date: Thu, 27 Mar 2025 09:32:38 -0700
Message-ID: <20250327163238.442756-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327163238.442756-1-raj.khem@gmail.com>
References: <20250327163238.442756-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213765

charset.alias is not generated anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 750263f99ed..a0ce2150f9b 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -43,10 +43,6 @@ do_install() {
 	fi
 }
 
-do_install:append:libc-musl() {
-        rm -f ${D}${libdir}/charset.alias
-}
-
 FILES:${PN} += "${prefix}/lib/tmpfiles.d"
 
 FILES:${PN}-dev += "${libdir}/man-db/libman.so ${libdir}/${BPN}/libmandb.so"

