Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2D1C32773
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.472.1660894079242672342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qq87GNqF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay12so1891889wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ydkj1i8Jj5lm/tqsr+isZHqL58GY1vxzg2zRoDFyA08=;
        b=qq87GNqFNq37O0f4w+5oDPDB+uAnx0cgJ1kZ7ZJH2bjiIiBTSpzNJAyKxUY8I8yOiV
         lpLocsXA/T8bWDHpMbix9aVOiQ2lsQso63pA7vZhfN/MZFmpu0n2/Vt1fiMZ5IjmtXzI
         4hbnzCjGiOyPLERoiYwJHny8wTgCYvs9QsFEiQZs6gl52qSwqBvnVyOaIixsbmtizEoe
         NfKLGERpEhYrrg7vuveTI3uyDN3EpcllMvh1d8vb6tm1P0NkCL53J7TNm/GQhK0Fx8Nc
         NuDdIJvNoKXnvWKcq/PCjTKtHRv+YTL3zKNd7V+R/WffjLd5gAw8gS+PPJJUIcIQ31cc
         Dmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ydkj1i8Jj5lm/tqsr+isZHqL58GY1vxzg2zRoDFyA08=;
        b=E3EFFW05pKpFDIiCRWTH5zArdPUJ5bfoRU/R69VOq/bTr4wU7JSTfOdRjPPPUnYk+Z
         EnAwnzGZJ1J7naYx5rJjX8ad6RtTQRO3E6Gmt724Pys49+NMl8DiLaCyd6zmjt4qahOT
         RUgJ1qaLcqFiPbuHbq9HprT30X3mXRdh9rOT95J5P54kKr53gapWiu99EBO8hb4V1Tfu
         DRWwsvJ3brWU2zks6lea/u/W1oVbl87wMDD7g9hILgWfM5GP13eJn4Cnrk+6WAkq7BUY
         UW7zC6hzVIgAGI1dxLXLEaicvc5ydebiTOn2/ZLvtdXIcN777MIAtLlatMvClyKDwtve
         LEOg==
X-Gm-Message-State: ACgBeo0e5r2WwiHNBKxPuyobuh0qsFyIrX8J1SRHtLWRocyLBM1pR6Wr
	Q6DLeN2+psTLqmdg/A1qTRNMJPHJ/zE=
X-Google-Smtp-Source: 
 AA6agR5KSR0IHS534vzz3nmdozy83K83p7FMZLAomrI+CD7Uda2li0xYYoUZyK8aHXKwIDHW6j+2eA==
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id
 f12-20020a05600c4e8c00b003a6011ecc08mr3880884wmq.198.1660894086460;
        Fri, 19 Aug 2022 00:28:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/42] mpg123: upgrade 1.30.1 -> 1.30.2
Date: Fri, 19 Aug 2022 09:27:08 +0200
Message-Id: <20220819072727.2236928-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169593

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.30.1.bb => mpg123_1.30.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.30.1.bb => mpg123_1.30.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb b/meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb
index 502d9d114c..f40bff1ff6 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.30.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1b20c9c751bea9be556749bd7f97cf580f52ed11f2540756e9af26ae036e4c59"
+SRC_URI[sha256sum] = "c7ea863756bb79daed7cba2942ad3b267a410f26d2dfbd9aaf84451ff28a05d7"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


