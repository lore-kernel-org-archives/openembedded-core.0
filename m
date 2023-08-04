Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8139C001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:03:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2479.1691168584031653651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dq0QsSZ0;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bba04b9df3so20020235ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691168583; x=1691773383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKu5NTTVd5xdPIzfpJPsdnLi2ez+B6EEVdOoe/6d9+0=;
        b=Dq0QsSZ0FIOEgtRVt7tPvloHb6sZGxWT8poiF39ZUmhoQ4+gXr/rKFUV5H42V8t/4S
         3jwlWvjcyOU0ZQ31hVEraIVRXUTBnpKn3vTzAoXWIba9uET0GqmplgHNxCx+NxQrBwoD
         rGRe2uK2a2cM7IZ5enLCuVVESdBbzvCLNZdBG+ajSCUZ9xCQMfmX9H4/DIUlgwXpfpvA
         Aqiy3bJMgMOxBinPiu7Bf+Vk7vuvjjfYq45NzAOvwx66w/O/FAmZzkSZroy/KWBpLwTW
         wNMkBWKO+6met/st5a0N5sKWRCmrxmh+wEDF4j3/FfQnNb6cGgz8WbmJjoms6glhBK6o
         PVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168583; x=1691773383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKu5NTTVd5xdPIzfpJPsdnLi2ez+B6EEVdOoe/6d9+0=;
        b=WCLuCy/kg7GaFNKeqdjS8CQV7OCSsasFY6GjVYTpPFA8d32z6AWjf7qKFpV8PzSN/c
         6MY6kP271I/ohcs7Gyewo1uheRvWkBP3rMocoKKQeSF1QtueraORtXPn3oTpIQ5xThj+
         kq+hfRaOzyWlEMz+yvdVVahX62pZH3T3QR2MN+QGGsB05zfN1issE4YxsxLM/UZ3RZ18
         CC5CqoeStmUz1qMOmlgCtWEuYF0t0uUVJQReSSMMqaN0WFod6lyEVTYoKjdoHwKtiOVI
         YqFT7P4kopNBiaCStSEYm1IsPx1kyiQwsDvw8XQQcGvMRUo5vx0fRVKJ68MR5jxAFKVX
         bnrA==
X-Gm-Message-State: AOJu0YxjLWzFLydR7iwXBgZrLZaEeGQ4sFkCr1gpy5t/uarI6UZKL4uo
	T5BeBHOJK92u3AVQ8Cej7K+NEdHVFY9kGQ==
X-Google-Smtp-Source: AGHT+IEpT2ai0kXCmPrqGbN+8XcM020nPbby5Uiz0mSezZSgefJzguL8v5awZnnEIt6h7zfp6ortAg==
X-Received: by 2002:a17:903:110c:b0:1b8:10a:d925 with SMTP id n12-20020a170903110c00b001b8010ad925mr2836254plh.5.1691168583157;
        Fri, 04 Aug 2023 10:03:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001b50cbc0b4fsm1997876ply.111.2023.08.04.10.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:03:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 5/6] glibc: Drop --enable-tunables
Date: Fri,  4 Aug 2023 10:02:54 -0700
Message-ID: <20230804170255.2784609-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804170255.2784609-1-raj.khem@gmail.com>
References: <20230804170255.2784609-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185536

Its removed and is implicit default in 2.38+ [1]

[1] https://mail.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase

 meta/recipes-core/glibc/glibc_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 94bff8f4486..c02730bcb58 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -70,7 +70,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-clocale=gnu \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
-                --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --disable-crypt \
-- 
2.41.0


