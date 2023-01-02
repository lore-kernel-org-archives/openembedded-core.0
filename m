Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F49C46467
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:47:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.49529.1672699675601254954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f1kIyGlB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id z10so27588145wrh.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG1RQiTfOIL/cN6/PQLrY3ZyovP0jIB6EHw6nHfEr/k=;
        b=f1kIyGlBKHj0F74Cr1DMupsIqNFw03SgTsuhJHhLtUJ2WOiD3OAxOKPSGTZ7U+9309
         Ef3vJdILBqt/o7+DAb1VYB33X0LgTHIy4qSAIta7Bkb+v9tajlspNUt7PTuymE2w0blI
         i4BShj+CNm93aKWaT8CQSIRXj8/i9z9gG/+XRqEJ4BrosBcHiA4q5DMIcxYSDLo2bsMp
         5LN3Kacpr6HbkmIK583eXiZZOq6nS9LKlWx+AbKq5lOX5unQv0Nxx23flbz0ZhWiORBN
         Dc3qC1ygIYQaXEgKcXODIo4oEFudeTgwAhDo294seF82RENsuRyAMNN+Cu9CHV25y+yl
         drDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG1RQiTfOIL/cN6/PQLrY3ZyovP0jIB6EHw6nHfEr/k=;
        b=5vq5K5Ll9ALGa+zHLj1gt231RhqJeeDzmfEYu6zbWc8/p1m9rkRZfArsiXrqQM0aXB
         GY8Vqm6Mluo8uy8wrXXGRt/Ylsksl2s89tIFrVXg3ESqnlsMA0gai8D3stegM5XXv9fh
         NlbCDrYbNQQa+tFmkFrv4sPKRJf/keblMRxWkQkSR7nkgWQlE4uO6WXtMlYBSSC/AByQ
         r67znJQKAyqYPpk6ev8ZstMUDdZ7ue7kfv6LtynSI7R1VH6Z3FfeWxEBrllPHAd8TNuj
         nhxzgIyMFPt2x6DCDd5s9yU/ypbnwCdBvUG7qWCWIOQYb+S8PEkrSfFSyjx1t5sc5D5Z
         yI6w==
X-Gm-Message-State: AFqh2kr2Fppz1CCf9IhQw4YZYKZFvSFS8ykBxmgbdTetAswHnZWiRTef
	VqcfOmTKSntIUZ04v0i24IpAYegcW8E=
X-Google-Smtp-Source: AMrXdXuxuXhELyuDCtQ+xDRF2+YBkB7MSTYFu9kRv7SfbaCCxvLI1h50XhQuvZjg8ce/fqBMKUbR+g==
X-Received: by 2002:a5d:56c1:0:b0:288:d139:3690 with SMTP id m1-20020a5d56c1000000b00288d1393690mr12614282wrw.67.1672699673867;
        Mon, 02 Jan 2023 14:47:53 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600001cc00b0027b35baf811sm23309782wrx.57.2023.01.02.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:47:53 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] default-distrovars: Include "c" in IMAGE_LINGUAS for glibc
Date: Mon,  2 Jan 2023 22:47:44 +0000
Message-Id: <20230102224744.287985-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102224744.287985-1-alex.kiernan@gmail.com>
References: <20230102224744.287985-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 22:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175329

glibc 2.35 introduced C.UTF-8, we should include this by default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/conf/distro/include/default-distrovars.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index abf48f79f08a..5324bd543d22 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -5,6 +5,8 @@ KERNEL_CONSOLE ?= "ttyS0"
 KEEPUIMAGE ??= "yes"
 
 IMAGE_LINGUAS ?= "en-us en-gb"
+IMAGE_LINGUAS:libc-glibc ?= "c en-us en-gb"
+
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
-- 
2.39.0


