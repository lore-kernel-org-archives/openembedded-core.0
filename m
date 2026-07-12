Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FB2C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.948.1783881815694907799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=QL2YoNhl;
 spf=pass (domain: underview.tech, ip: 209.85.128.171, mailfrom: vince@underview.tech)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ea9f974ebso1251947b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881815; x=1784486615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=QL2YoNhl8LV0aKju0PSCdnvkMAvxdDWKI9L8wMgpJLZS1p+//kCWUgTi1c4byXgNpL
         aIByYxKrmlJbm6F+sDVa4cNeVuz65f5cHxpqanNFJK2W/F3EFcPF0Dbg1J1biR7ZUyuu
         hSuX6bEDHAQwNKM6D/9tJ4M1jVA+eVw5SJAxUG6bChxQPISAgHDtu8Ucuvo20K6MQGiK
         FEo0SypiEczktr8wZKJdXmB0G2v7iYOWHuiwjI5vbngHWCNoK0Ki8GULeRx6DD1wkWaF
         MkvtkeFwKYPnFO7z9gT0FW9p5i8OXq91cxs9mFVpN0aax5Kb3Rtouu0FZdZBDnj/9/cw
         0Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881815; x=1784486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=htmJrTkL/KtfNv3tqTrf58LGyxImN1NpNF615Z8Dn1vFblCwZarwO2tjjJ5YsulF6D
         L2QxQbSivUkzxBj2ML46TCXBi/acljiJ0kz0x+flOTo1oqaJ8zOy0bPNgjzMKRhsta+M
         TdHonYu0YQ58A5eAsChjAN3pUdSsdiiNqT9RWd2LjxOJKYPncisFDonlEeNDdF3xuyBt
         PfmnJEa9PdG5Bxob1n0nz5lT0F81QLV+zfHxUoCpjyVvYhq390BpHecVmp0b+CcCcZpE
         726oqMjTcpXan1o4bWG7xtgCX17Qs/N+YthMMbkZUMZDmXy+W+IENq+t2/Drj3XN5gBI
         nkcQ==
X-Gm-Message-State: AOJu0YzAKSBa1KY2Kcv95fo4HNhdUhWFvwiHzbS/6BgS/HMOBfZM7GPT
	F311KC9e+3L8tthGShCWca0D1aT8398sgYdnWYjoK3oXnsiVkx5Km/Aj1MyMEB0ULFGktL1Rlov
	azV5zdVk=
X-Gm-Gg: AfdE7cmCIcgjRSQiGupWVfM1zuFusrg8tMGalGpkSq8zent9HICLUiNkU3ElIsIXX7d
	aCcoxyIvz4J+EwXx8k5EmECebFCoq5rk9bmeT9qHQVcSMMzPNsrAIZak+glq6nXAnvGr1k6khZi
	fR9UcOeWB+SjGTcnHXXFX6r/eUaDU9sKZZAAHsRdLi8QGc2wo2wtnXdeZU8irucJe4Gi7qbdjzL
	E3Q77+RoxuuYPjnyMPKXCJVNO+Y8xcam4kH8NhxQqwukV/+kpibW/uwphSWK3ypdVJ1hhzCwC3f
	CmbIcLDt4RPcHtdpq6XVY5fZVDMZREQ/ncftawnwwtSedvr3QZLbcjl5U+i/zQWWLwRfctXUeod
	syXT9Rx/SDqnHIWE7XU4vbU1LX9oNIInrmG0Tw6B1/0cC1I1UATSN9xBYPDs8LbV5mF97XhUePs
	KwEYc4gc4pq6fsq1FCK+HUgp6N
X-Received: by 2002:a05:690e:4814:b0:664:b979:5d78 with SMTP id 956f58d0204a3-667d7ac493fmr3292924d50.26.1783881814651;
        Sun, 12 Jul 2026 11:43:34 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 20/27] parted: rename kernel prefix
Date: Sun, 12 Jul 2026 14:43:00 -0400
Message-ID: <20260712184307.3259642-20-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240810

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/parted/parted_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.7.bb
index a669919dd7..4215cbf4a7 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -52,7 +52,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-scsi-debug ${KERNEL_PACKAGE_NAME}-module-loop ${KERNEL_PACKAGE_NAME}-module-vfat"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.43.0


