Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CDBC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155286.1783358232270936755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hl9uMhcC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so16136895e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358230; x=1783963030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ8/+Lfbs/dZp8z4vs2JL/IBru1H/WY0/juHsVy3F5s=;
        b=Hl9uMhcCmJhKGuID9xFVetlPhaqNZCIgY7j8h4afdixmoHxwl6JVM/FuJWmf8Lx++q
         C79sDgZu1PvoxHaSm7xiK7aR2CySGzxbk7cPe+NK3/zEBkGpoEswBbkZC6K62wHTZxHR
         QZKKnVxr/r/6BcA81j/7NNRls7Tca14oV+1S+O0/vszmuZAnP71SFjeaVJxsQ8WPr6wY
         /Pw68uD2nTgp3bnNUv9XAopdaMgliIOMSbYw3kBfyq9E4Gpn6U4mhq2zd0RQRrOwGtJt
         n1wh7xweHZZi0bUn5Zig2p3emaz9dpKGLaYcFJcwBT7uH7gGzHO8kZmN6qXzxt13cO8w
         9ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358230; x=1783963030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ8/+Lfbs/dZp8z4vs2JL/IBru1H/WY0/juHsVy3F5s=;
        b=EqVMAZt3Te+kepBEUd/qwK8mM300edjA5R7ArxglQL6hvrysrPEOM6GH3xmR5X3wNU
         jzuxTcbApTeHD9S/PYI1iTkyq5hTUA+uNEnuo/azPamGR7nmuGNts7EPLeIlLBTJKhvx
         5k5snOsswXw9Ylx2S7SYQWuLi36YwaevS70WbrJDXNHTplWvC22bOkeiJpDxGOwPh/bd
         1fDznzJfqv/TaNjzGoZM7uNshJULcYydQupO7DqNW+r5V4FNzRQsn0DzCtDUjtp8aTrc
         XMXsK8+a+gPlfyDyDG1hs+VL18fTjDmGT+nby6dLt2Ci3p+pkLidnn+M0fnw9Y8HDD98
         ybpw==
X-Gm-Message-State: AOJu0YxjJKHHe3OCdR4OlWFKNDl/ihneeQr+5Mpa//F7Trsg5kwC786t
	Np1xbz/b6cIHPhwM8si1t7MWNeIKTo6+3tkfXqCO64gBhjEv01ydGdPPXseEwg==
X-Gm-Gg: AfdE7cn3rn4a6wah/Kek8txzVGVKX5ZdUM692LKWI4MBHcMNp/4vJqgUUg3eyx0+MRv
	9aJ6cMHScUGX6HpbESm2VTOvEIUATcS2XuuGI0TewZnJkYljDYinHujc+YreAwPIpcRAl0O8Psa
	KhtAMCwr9EhNAqw8BKAqOn/KQfWlzx2gyyWNEr0XV2756jomjCuYzBFLJga4FoaILFzggY4LcR9
	x7jmSqRiXjHqqWD8wMjcfRgetgzjbYVdctMfOGTthRk3s7/Hr0RfxIgQcqapjNVspLonr1x2Mwb
	FRXJn8oD2IgukMHTu4q2lMQGxam5NHgk7NYS92ZYfyKcz/uwnGqeZhNv1Iey62VyDpof1oL439s
	UGY4R3TVWf+YB/53RWf4lWsxbA5KRJxznD4ILAbvtmzUhJ8RLvs9IIHDHJHbY1Q5Tp4wPxBvZ6W
	wvsJ1hWsYzs8dg3RJ/TVThCEAzIA+lN3rACeBKEOa5XlvkUr9zKpUEmT1Oacs=
X-Received: by 2002:a05:600c:3153:b0:493:de4b:de17 with SMTP id 5b1f17b1804b1-493df06b036mr18102685e9.14.1783358230256;
        Mon, 06 Jul 2026 10:17:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/45] barebox-tools: upgrade 2026.06.0 -> 2026.06.1
Date: Mon,  6 Jul 2026 19:16:21 +0200
Message-ID: <20260706171701.70536-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240293

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 6467ed3653..2a42c0a266 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.06.0"
+PV = "2026.06.1"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "521b427efe4d5199641fd6440ed77226fed3ba7088ee2f6361b510187f700f09"
+SRC_URI[sha256sum] = "8752b3752819ec4aaf848a1d06df05242a64954525fb15b6cf07b3c3dd7ebd7f"
-- 
2.47.3


